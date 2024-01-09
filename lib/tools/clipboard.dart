import 'package:app/tools.dart';
import 'package:flutter/services.dart';

void copyTxt(String? txt, {bool showSuc = true}) async {
  await Clipboard.setData(ClipboardData(text: txt ?? ''));

  if(showSuc) {
    showToast('复制成功');
  }
}

extension XStringCopy on String? {
  void copy() => copyTxt(this);
}
