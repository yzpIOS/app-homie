import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/ui/message/input/ext/input_ext.dart';
import 'package:app/ui/message/input/ext/input_top_icon.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class InputTop$More extends InputTop$Icon {
  final List<ActionMixin> actions;

  InputTop$More({required this.actions, required super.inputCtrl}) : super(icon: '更多');

  final itemW = 60.0, txtH = 24.0;
  final count = 4;

  @override
  Widget get genPanel {
    final crossSpacing = (Get.width - (itemW * count)) / (count + 1);

    final delegate = XGridDelegate(
      crossAxisCount: count,
      mainAxisSpacing: 8,
      crossAxisSpacing: crossSpacing,
      fixedHeight: txtH,
    );

    return GridView.builder(
      padding: Pad(vertical: crossSpacing / 2, horizontal: crossSpacing),
      gridDelegate: delegate,
      itemCount: actions.length,
      itemBuilder: (_, i) => itemBuilder(actions[i]),
    );
  }

  Widget itemBuilder(ActionMixin action) {
    return Column(
      children: [
        Material(
          color: const Color(0xFFF5F5F5),
          borderRadius: AppBorderRadius.a6,
          clipBehavior: Clip.hardEdge,
          child: SizedBox(width: itemW, height: itemW, child: action.toTapView),
        ),
        Box(
          height: txtH,
          alignment: Alignment.center,
          child: XText(
            action.title,
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
