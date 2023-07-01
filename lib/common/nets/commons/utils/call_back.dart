
import 'dart:async';
import 'dart:ffi';
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

  // 回调方法
  OnReceiveData<T>? onCallBack;
  // 回调方法对应的hashcode
  int? onCallBackHashCode;

  // 开始请求时间
  int starteTime = DateTime.now().millisecondsSinceEpoch;

  CallBack({required this.cmd, this.complete, this.onCallBack}) {
    onCallBackHashCode = onCallBack?.hashCode;
  }

  void response(int cmd, T? data) {
    try {
      complete?.complete(data);
    } catch(e) {
      complete?.completeError(e);
    }
  }

  void responseError() {
    try {
      complete?.completeError(Error());
    } catch(e) {
    }
  }

  ///
  /// 获取到future
  ///
  Future<T?>? getFuture() {
    return complete?.future;
  }

  ///
  /// 获取回调
  ///
  void responseCallBack(int cmd, T? data) {
    try {
      onCallBack?.call(cmd, data);
    } catch(e) {
    }
  }
}