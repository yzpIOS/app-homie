
import 'dart:async';
import 'package:protobuf/protobuf.dart';

class CallBack<T> {

  static CallBack<T> create<T>(int cmd) {
    return CallBack(cmd: cmd, complete: Completer<T?>());
  }

  // 协议号
  int cmd;

  // 成功回调
  Completer<T?> complete;

  // 开始请求时间
  int starteTime = DateTime.now().second;

  CallBack({required this.cmd, required this.complete});

  void response(int cmd, T? data) {
    try {
      complete.complete(data);
    } catch(e) {
      complete.completeError(e);
    }
  }
}