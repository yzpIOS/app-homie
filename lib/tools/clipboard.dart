import 'package:app/tools.dart';
import 'package:flutter/services.dart';

void copyTxt(String? txt) async {
  await Clipboard.setData(ClipboardData(text: txt ?? ''));

  showToast('复制成功');
}

extension XStringCopy on String? {
  void copy() => copyTxt(this);
}
