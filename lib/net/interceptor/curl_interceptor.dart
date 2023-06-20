import 'package:app/env.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert' as convert;

class CurlInterceptor extends Interceptor {
  static CurlInterceptor instace = CurlInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    // 打印curl
    formatCUrl(options);
  }

  void formatCUrl(RequestOptions request) {
    if(Env.isRelease) {
      return;
    }
    // curl
    var result = "curl -X";

    // 1、post get delete等
    result += " ${request.method}";

    // 2、request headers
    request.headers.forEach((key, value) {
      if(value != null) {
        result += " -H \"$key:$value\"";
      }
    });

    // 3、post请求
    var binaryData = request.data.toString();
    if(request.data != null && binaryData.isNotEmpty) {
      if(binaryData.length < 10000) {
        binaryData = convert.jsonEncode(request.data);
        result += " -d '$binaryData'";
      } else {
        result += " -d 'body is too large'";
      }
    }
    // request url
    var urlString = request.uri.toString();
    result += " \"$urlString\"";
    debugPrint(result);
  }

  ///
  /// 打印
  ///
  void printData(dynamic? data) {
    if(data == null) {
      return;
    }
    debugPrint(data);
  }
}
