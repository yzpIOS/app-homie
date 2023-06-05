import 'package:app/tools.dart';
import 'package:app/ui/message/input/input_ctrl.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

abstract class MsgSender {}

abstract class InputExt<SENDER extends MsgSender> {
  final InputCtrl inputCtrl;

  InputExt(this.inputCtrl);

  SENDER get $handle => inputCtrl.sendHandle as SENDER;
}

mixin TopMixin {
  Widget get toTopView;
}

mixin TopIconMixin implements TopMixin {
  @override
  Widget get toTopView {
    return SizedBox(
      width: 32,
      height: 32,
      child: InkResponse(
        onTap: onTap,
        child: Center(child: iconView),
      ),
    );
  }

  Widget get iconView {
    return SvgView(SVG.$('chat/$icon'), width: 32, height: 32);
  }

  String get icon;

  void onTap();
}

mixin PanelMixin {
  Widget get genPanel;
}

mixin ActionMixin {
  Widget get toTapView {
    return InkWell(
      onTap: onTap,
      child: Center(child: icon),
    );
  }

  Widget get icon => Image.asset(IMG.$('chat/$title'), scale: 3, fit: BoxFit.scaleDown);

  String get title;

  void onTap();
}
