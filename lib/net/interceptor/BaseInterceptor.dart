import 'package:dio/dio.dart';

///
/// http基础栏截器
///
class BaseInterceptor extends InterceptorsWrapper{

  final Map<String, dynamic> _headers = <String, dynamic>{};

  ///
  /// 添加header, 会覆盖
  ///
  void addAndReplaceHeader(String? name, dynamic value) {
    if(name == null || value == null) {
      return;
    }
    _headers[name] = value;
  }

  ///
  /// 添加header，不会覆盖
  ///
  void addHeader(String? name, dynamic value) {
    if(_headers.containsKey(name) == true) {
      return;
    }
    addAndReplaceHeader(name, value);
  }

  ///
  /// 移除header
  ///
  void removeHeader(String? name) {
    if(name == null || !_headers.containsKey(name)) {
      return;
    }
    _headers.remove(name);
  }

  ///
  /// 添加header
  /// [headers] header数组
  ///
  void addHeaderMap(Map<dynamic, dynamic> headers) {
    headers.forEach((key, value) {
      addAndReplaceHeader(key, value);
    });
  }

  Map<String, dynamic> getHeaders() => _headers;
}
