import 'dart:io';

import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/voice_record_dialog.dart';
import 'package:app/ui/message/input/ext/input_ext.dart';
import 'package:app/ui/message/input/input_ctrl.dart';

mixin VoiceSender implements MsgSender {
  void sendVoice(Tuple2<File, Duration> data);
}

class InputTop$Voice extends InputExt<VoiceSender> with TopIconMixin {
  @override
  final String icon = '语音';

  InputTop$Voice({required InputCtrl inputCtrl}) : super(inputCtrl);

  @override
  void onTap() async {
    hideKeyboard();

    const dialog = VoiceRecordDialog();

    Get.showBottomSheet(dialog, isDismissible: false, safeAreaMinimum: AppSize.safeAreaMini) //
        .onType<Tuple2<File, Duration>>($handle.sendVoice);
  }
}
