import 'dart:developer';

import 'package:app/env.dart';
import 'package:oktoast/oktoast.dart' as oktoast;

void showToast(String msg, {bool back = false}) {
  if(msg.isEmpty) {
    return;
  }

  // debugger(when: msg == '服务异常');

  oktoast.showToast(msg);
}



// 是否在排队播放toast中
bool isQueuing = false;
// 排队中的toast
List<String> queues = <String>[];

///
/// 显示toast
///
void showToastQueue(String toast) {
  if(Env.isRelease) {
    return;
  }
  if(isQueuing) {
    queues.add(toast);
    return;
  }
  // 正在排队中
  isQueuing = true;
  Future.delayed(const Duration(seconds: 5)).whenComplete(() {
    showToast(toast);
    // 没有排队
    isQueuing = false;
    // 下一个 toast
    if(queues.isNotEmpty) {
      showToastQueue(queues.removeAt(0));
    }
  });
}