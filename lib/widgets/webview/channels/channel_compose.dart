
import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'base_bridge.dart';

class JsBridgeChannel {

  ///
  /// js对应的controller
  ///
  late WebViewController controller;

  ///
  /// js处理方法
  ///
  final List<BaseJsBridge> _jsbridges = <BaseJsBridge>[];

  JsBridgeChannel();

  ///
  /// 调用js方法
  /// 方法；back 返回上一级页面
  /// window.homieBridge.postMessage(JSON.stringify({"callBack":"handleClick3", "type":"back", "data": {"aa": "aa"}}))
  ///
  /// 方法；获取token
  /// window.homieBridge.postMessage(JSON.stringify({"callBack":"handleClick3", "type":"getUserInfo", "data": {"aa": "aa"}}))
  ///
  /// 方法；去充值界面
  /// window.homieBridge.postMessage(JSON.stringify({"callBack":"handleClick3", "type":"toCharge", "data": {"aa": "aa"}}))
  ///
  void call(BuildContext context, JavaScriptMessage message) async {
    try {
      var json = convert.jsonDecode(message.message);
      // 数据
      var data = json["data"] ?? "";
      // 回调
      var callBack = json["callBack"] ?? "";
      // 类型
      var type = json["type"] ?? "";
      // 类型
      var requestId = json["requestId"] ?? "";
      for(var item in _jsbridges) {
        item.controller = controller;
        try {
          var intercept = await item.callMethod(ComposeModel(
              type: type, data: data, requestId: requestId, callBack: callBack));
          if(intercept) {
            break;
          }
        } catch(e) {
          debugPrint(e.toString());
        }
      }
    } catch(e) {
      debugPrint(e.toString());
    }
  }

  ///
  /// 添加script
  ///
  void addJsBridge(BaseJsBridge jsBridge) {
    if(_jsbridges.contains(jsBridge)) {
      return;
    }
    _jsbridges.add(jsBridge);
  }
}
