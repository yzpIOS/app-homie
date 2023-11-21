
import 'dart:convert' as convert;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseJsBridge {

  late WebViewController controller;

  ///
  /// 原生方法
  ///
  Future<bool> callMethod(ComposeModel composeModel);

  ///
  /// 回调js方法
  ///
  void callJsMethod(ComposeModel param, {Map? result}) {
    try {
      // 返回数据
      Map response = {};
      response["requestId"] = param.requestId;
      response["data"] = result;
      response["reqParam"] = param.data;
      // 回调
      controller.runJavaScript("${param.callBack}(\'${convert.jsonEncode(response)}\')");
    } catch(e) {
      debugPrint(e.toString());
    }
  }
}

class ComposeModel {
  String type;

  Map data;

  String requestId;

  String callBack;

  ComposeModel({
    required this.type,
    required this.data,
    required this.requestId,
    required this.callBack,
  });

  T? getData<T>(String key) {
    if(!data.containsKey(key)) {
      return null;
    }
    return data[key];
  }
}