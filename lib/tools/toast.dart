import 'dart:developer';

import 'package:oktoast/oktoast.dart' as oktoast;

void showToast(String msg, {bool back = false}) {
  debugger(when: msg == '服务异常');

  oktoast.showToast(msg);
}
