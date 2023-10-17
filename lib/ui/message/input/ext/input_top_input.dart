import 'package:app/tools.dart';
import 'package:app/ui/message/input/ext/input_ext.dart';
import 'package:app/ui/message/input/input_ctrl.dart';
import 'package:app/widgets.dart';
import 'package:flutter/services.dart';

mixin TxtSender implements MsgSender {
  void sendTxt(String data);
}

mixin InputExt$Input<Send extends TxtSender> on InputExt<Send> {
  late final editCtrl = inputCtrl.editCtrl;
  late final focusNode = inputCtrl.focusNode;
  late final autofocus = inputCtrl.autofocus;
  late final hint = inputCtrl.hint;

  void doSend() {
    final text = editCtrl.text;

    // 语法糖, 用于调试
    if(openDebugView(text)) {
      editCtrl.clear();
      return;
    }

    if (isNotEmpty(text)) {
      $handle.sendTxt(text);
      editCtrl.clear();
    }

    //处理发送键会隐藏键盘的问题
    if (keyboardRx.isTrue) {
      focusNode.requestFocus();
    }
  }
}

class InputTop$Input extends InputExt<TxtSender> with InputExt$Input, TopMixin {
  InputTop$Input({required InputCtrl inputCtrl}) : super(inputCtrl);

  @override
  Widget get toTopView {
    return XInputView(
      height: 32,
      fontSize: 12,
      hintText: hint,
      controller: editCtrl,
      autofocus: autofocus,
      focusNode: focusNode,
      onSubmitted: (_) => doSend(),
      inputFormatters: [//输入文本过滤器
        //自定义的输入过滤器
        ChatTextInputFormatter.atText(),
        //只允许输入最大文本数
        LengthLimitingTextInputFormatter(ChatTextInputFormatter.chatTextMaxLength),
      ],
    );
  }
}
