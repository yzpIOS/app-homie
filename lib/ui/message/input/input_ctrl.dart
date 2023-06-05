import 'package:app/tools.dart';
import 'package:app/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:app/ui/message/input/ext/input_ext.dart';

class InputCtrl extends GetxController with GetDisposableMixin {
  final bool autofocus;
  final String? hint;
  final MsgSender sendHandle;

  InputCtrl(this.sendHandle, {this.autofocus = false, this.hint});

  final panelRx = Rxn<PanelMixin>();

  final focusNode = FocusNode();
  final editCtrl = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    bindWorker(
      ever(App.directionRx, (it) {
        switch (it) {
          case ScrollDirection.forward:
            hideKeyboard();
            panelRx.nil();
            break;
          case ScrollDirection.idle:
          case ScrollDirection.reverse:
            break;
        }
      }),
    );
  }

  @override
  @mustCallSuper
  void onClose() {
    focusNode.dispose();
    editCtrl.dispose();

    super.onClose();
  }
}
