import 'package:app/tools.dart';

import 'package:app/ui/message/input/ext/input_ext.dart';

mixin CallSender implements MsgSender {
  void callVideo();

  void callVoice();
}

class InputAction$Call extends InputExt<CallSender> with ActionMixin {
  InputAction$Call(super.inputCtrl);

  @override
  final String title = '语音电话';

  @override
  void onTap() {
    Get.showActionSheet(const ['视频通话', '语音通话']).onNotNull((val) {
      switch (val) {
        case '视频通话':
          $handle.callVideo();
          break;
        case '语音通话':
          $handle.callVoice();
          break;
      }
    });
  }
}
