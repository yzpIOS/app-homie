import 'dart:convert';
import 'dart:io';

import 'package:app/3rd/sentry/sentry.dart';
import 'package:app/event/event.dart';
import 'package:app/exception.dart';
import 'package:app/net/interceptor/curl_interceptor.dart';
import 'package:app/net/interceptor/log_interceptor.dart';
import 'package:app/net/pretty_dio_logger.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Http {
  late Dio _dio;

  final _cancel = <CancelToken>{};

  Http({required String baseUrl, List<Interceptor>? interceptors}) {
    final options = BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: const Duration(seconds: 8),
      sendTimeout: const Duration(seconds: 2),
      connectTimeout: const Duration(seconds: 8),
      // connectTimeout: const Duration(seconds: 2),
      contentType: Headers.jsonContentType,
    );

    _dio = Dio(options)
      ..transformer = _Transformer()
      ..interceptors.addAll(
        [
          if (interceptors != null && interceptors.isNotEmpty) ...interceptors,
          InterceptorsWrapper(
            onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
              final token = options.extra[HttpHeaders.authorizationHeader] ?? OAuthCtrl.token;

              // assert(
              //   () {
              //     xlog('TOKEN -> $token', type: LogType.HTTP);
              //
              //     return true;
              //   }(),
              // );

              final receiveTimeout = options.extra['RECEIVE_TIMEOUT'];

              if (receiveTimeout is Duration) {
                options.receiveTimeout = receiveTimeout;
              }

              if (isNotEmpty(token)) {
                options.headers['MetaChat-Session'] = token;
              }
              try {
                options.headers["version"] = Env.version;
              } catch(e) {
              }

              handler.next(options);
            },
          ),
          _logInterceptor,
          // // 打印日志
          // LoggerInterceptor.instace,
          // // curl
          CurlInterceptor.instace,
        ],
      );

    SentryHelp.add(_dio);
  }

  Future request(String method, String path, {JMap? ext, JMap? query, data, int tryTimes = 0}) async {
    await ConnState.ready;

    final token = CancelToken();

    try {
      Future<Response> doRequest() {
        _cancel.add(token);

        return _dio.request(
          path,
          data: data,
          queryParameters: query,
          options: Options(
            method: method,
            extra: ext,
          ),
          cancelToken: token,
        );
      }

      final response = await asyncTrack('HTTP请求[$path]', action: doRequest);

      if(response.statusCode != 200 && tryTimes > 0) {
        debugPrint("失败重试: httpCode = ${response.statusCode}, tryTimes = ${tryTimes}");
        return await request(method, path, ext: ext, query: query, data: data, tryTimes: tryTimes - 1);
      }

      return response.data;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        _cancel
          ..forEach((it) => it.cancel(401))
          ..clear();
      }

      if(tryTimes > 0) {
        debugPrint("失败重试: message = ${e}, tryTimes = ${tryTimes}");
        return request(method, path, ext: ext, query: query, data: data, tryTimes: tryTimes - 1);
      }

      _handleError(e);

      rethrow;
    } finally {
      _cancel.remove(token);
    }
  }

  Interceptor get _logInterceptor {
    return PrettyDioLogger(
      log: (msg, {required bool isError}) => xlog(msg, level: isError ? 3 : 0, type: LogType.HTTP),
    );
  }
}

void _handleError(DioError e) {
  switch (e.type) {
    case DioErrorType.connectionTimeout:
      throw const NetException('网络连接超时');
    case DioErrorType.sendTimeout:
      throw const NetException('网络请求超时');
    case DioErrorType.receiveTimeout:
      throw const NetException('服务响应超时');
    case DioErrorType.badResponse:
      final resp = e.response!;
      final status = resp.statusCode;

      final data = (resp.data as Object?).typeIf<Map>();

      switch (status) {
        case 400:
          throw LogicException(data?['code'] ?? -1, data?['msg'] ?? '网络错误');
        case 401:
          Bus.fire(NoAuthEvent(data?['msg']));

          throw const AuthException();
        case 500:
        case 502:
          break;
        case 12026:
          Bus.fire(NeedRealName(data?['msg']));

          throw const AuthException();
        default:
          xlog('未处理的网络请求状态【$status】', type: LogType.HTTP);
      }

      throw NetException('网络错误[$status]');
    case DioErrorType.cancel:
      xlog('请求取消', type: LogType.HTTP);

      throw const CanceledException();
    case DioErrorType.badCertificate:
    case DioErrorType.connectionError:
      throw const NetException('网络错误');
    case DioErrorType.unknown:
      if (e.error is SocketException) {
        errLog(e.error, e.stackTrace, type: LogType.HTTP);

        throw const NetException('网络错误');
      } else {
        //交给外面处理
      }
  }

}


// ignore: deprecated_member_use
class _Transformer extends DefaultTransformer {
  _Transformer() : super(jsonDecodeCallback: _transform);

  static dynamic _decode(String json, _) => jsonDecode(json);

  static Future<dynamic> _transform(String json) async {
    try {
      return //
          json.codeUnits.length < 50 * 1024 //
              ? jsonDecode(json)
              : await execTask1(arg1: json, fun1: _decode);
    } catch (_) {
      xlog('JSON解析失败 -> $json', type: LogType.HTTP);

      return null;
    }
  }
}
