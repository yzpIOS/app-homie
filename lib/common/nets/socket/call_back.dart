
import 'dart:async';
import 'package:protobuf/protobuf.dart';
///
/// 接收到数据
///
typedef OnReceiveData<T extends GeneratedMessage> = void Function(int cmd, T? data);

class CallBack<T extends GeneratedMessage> {

  static CallBack<T> create<T extends GeneratedMessage>(int cmd) {
    return CallBack(cmd: cmd, complete: Completer<T?>());
  }

  // 协议号
  int cmd;

  // 成功回调
  Completer<T?>? complete;

  OnReceiveData<T>? onCallBack;

  // 开始请求时间
  int starteTime = DateTime.now().second;

  CallBack({required this.cmd, this.complete, this.onCallBack});

  void response(int cmd, T? data) {
    try {
      complete?.complete(data);
    } catch(e) {
      complete?.completeError(e);
    }
  }

  void responseCallBack(int cmd, T? data) {
    try {
      onCallBack?.call(cmd, data);
    } catch(e) {
    }
  }
}