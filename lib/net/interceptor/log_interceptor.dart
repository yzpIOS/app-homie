import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:app/net/interceptor/BaseInterceptor.dart';

class LoggerInterceptor extends BaseInterceptor {

  static LoggerInterceptor instace = LoggerInterceptor();

  /// Log printer; defaults print log to console.
  /// In flutter, you'd better use debugPrint.
  /// you can also write log in a file, for example:
  ///```dart
  ///  var file=File("./log.txt");
  ///  var sink=file.openWrite();
  ///  dio.interceptors.add(LogInterceptor(logPrint: sink.writeln));
  ///  ...
  ///  await sink.close();
  ///```
  void Function(String object, { int? wrapWidth })? logPrint;

  LoggerInterceptor() {
    ensureLogPrint();
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    try {
      logPrint?.call('*** Response ***');
      _printResponse(response);
    } catch(e) {
      debugPrint(e.toString());
    }
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    try {
      logPrint?.call('*** DioError ***:');
      logPrint?.call('uri: ${err.requestOptions.uri}');
      logPrint?.call('$err');
      if (err.response != null) {
        _printResponse(err.response!);
      }
      logPrint?.call('');
    } catch(e) {
      debugPrint(e.toString());
    }
    handler.next(err);
  }

  void _printResponse(Response response) {
    _printKV('uri', response.requestOptions.uri);
    logPrint?.call('Response Text:');
    _printAll(response.toString());
    logPrint?.call('');
  }

  void _printKV(String key, Object? v) {
    logPrint?.call('$key: $v');
  }

  void _printAll(msg) {
    msg.toString().split('\n').forEach((element) {
      logPrint?.call(element);
    });
  }

  void ensureLogPrint() {
    if(logPrint != null) {
      return;
    }
    logPrint = debugPrint;
  }
}
