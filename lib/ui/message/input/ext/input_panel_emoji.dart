import 'package:app/tools.dart';
import 'package:app/ui/common/emoji_view.dart';
import 'package:app/ui/message/input/ext/input_ext.dart';
import 'package:app/ui/message/input/ext/input_top_icon.dart';
import 'package:app/ui/message/input/ext/input_top_input.dart';
import 'package:app/widgets.dart';

mixin InputPanel$Emoji on InputExt$Input, PanelMixin {
  @override
  Widget get genPanel {
    return NotificationListener(
      onNotification: (_) => true,
      child: EmojiView(
        onSelect: editCtrl.join,
        // doBackspace: editCtrl.backspace,
        doSend: doSend,
      ),
    );
  }
}

class InputTop$Emoji extends InputTop$Icon<TxtSender> with InputExt$Input, InputPanel$Emoji {
  InputTop$Emoji({required super.inputCtrl}) : super(icon: '表情');
}
