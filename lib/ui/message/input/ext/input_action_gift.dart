import 'package:app/ui/message/input/ext/input_ext.dart';

mixin GiftSender implements MsgSender {
  void sendGift();
}

class InputAction$Gift extends InputExt<GiftSender> with ActionMixin {
  InputAction$Gift(super.inputCtrl);

  @override
  final String title = '礼物';

  @override
  void onTap() => $handle.sendGift();
}
