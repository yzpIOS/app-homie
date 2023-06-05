import 'package:app/tools.dart';
import 'package:app/ui/message/input/ext/input_ext.dart';
import 'package:app/ui/message/input/ext/input_panel_emoji.dart';
import 'package:app/ui/message/input/input_ctrl.dart';

abstract class InputTop$Icon<Send extends MsgSender> extends InputExt<Send> with TopIconMixin, PanelMixin {
  @override
  final String icon;

  InputTop$Icon({required this.icon, required InputCtrl inputCtrl}) : super(inputCtrl);

  @override
  void onTap() {
    hideKeyboard(keepFocus: this is InputTop$Emoji);

    inputCtrl.panelRx(this);
  }
}
