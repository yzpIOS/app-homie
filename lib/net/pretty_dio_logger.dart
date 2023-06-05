import 'dart:convert';

import 'package:dio/dio.dart';

class PrettyDioLogger extends Interceptor {
  final void Function(String Function() msg, {required bool isError}) log;

  final JsonEncoder _encoder = const JsonEncoder.withIndent('\t');

  static const _width = 8;

  PrettyDioLogger({required this.log});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      _logOnRequest(options);
    } catch (e) {
      log(() => 'PrettyDioLogger: $e', isError: true);
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    try {
      _logOnError(err);
    } catch (e) {
      log(() => 'PrettyDioLogger: $e', isError: true);
    }

    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    try {
      _logOnResponse(response);
    } catch (e) {
      log(() => 'PrettyDioLogger: $e', isError: true);
    }

    super.onResponse(response, handler);
  }

  void _logOnRequest(RequestOptions options) {
    final uri = options.uri;
    final method = options.method;
    final query = options.queryParameters;

    final data = options.data;

    log(
      isError: false,
      () {
        final sb = StringBuffer();

        sb.writeln('===== Req =====');
        sb.writeln(uri);

        sb.write('Method'.padRight(_width));
        sb.write('-> ');
        sb.writeln(method);

        if (query.isNotEmpty) {
          sb.write('Query'.padRight(_width));
          sb.write('-> ');
          sb.writeln(_encoder.convert(query));
        }

        sb.write('Body'.padRight(_width));
        sb.writeln('-> ');
        sb.write(_encoder.convert(data));

        return sb.toString();
      },
    );
  }

  void _logOnError(DioError err) {
    final uri = err.requestOptions.uri;
    final resp = err.response;

    log(
      isError: true,
      () {
        final sb = StringBuffer();

        const width = 8;

        sb.writeln('===== Err =====');
        sb.writeln(uri);

        sb.write('Err'.padRight(width));
        sb.write('-> ');
        sb.writeln(err);

        if (resp != null) {
          sb.write('Code'.padRight(width));
          sb.write('-> ');
          sb.writeln(resp.statusCode);

          sb.write('Body'.padRight(width));
          sb.writeln('-> ');
          sb.write(_encoder.convert(resp.data));
        }

        return sb.toString();
      },
    );
  }

  void _logOnResponse(Response resp) {
    final uri = resp.requestOptions.uri;
    final data = resp.data;

    log(
      isError: false,
      () {
        final sb = StringBuffer();

        const width = 8;

        sb.writeln('===== Resp =====');
        sb.writeln(uri);

        sb.write('Body'.padRight(width));
        sb.writeln('-> ');
        sb.write(_encoder.convert(data));

        return sb.toString();
      },
    );
  }
}
