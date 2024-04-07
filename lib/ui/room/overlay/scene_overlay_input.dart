import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class SceneOverlayInput extends StatelessWidget {
  final ValueChanged<String> onItemClick;

  Pad padding;

  SceneOverlayInput({super.key, required this.onItemClick, this.padding = const Pad(all: 5)});

  @override
  Widget build(BuildContext context) {
    const _decor = ShapeDecoration(shape: XStadiumBorder(), color: AppPalette.room);

    Widget child = Container(
      height: 28,
      decoration: _decor,
      margin: padding,
      padding: const Pad(left: 10),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          const Expanded(
            child: XText(
              '输入新消息',
              overflow: TextOverflow.fade,
              style: TextStyle(fontSize: 12, color: AppPalette.cc),
            ),
          ),
          InkResponse(
            onTap: () => onItemClick('表情'),
            child: AbsorbPointer(
              child: Box(
                padding: const Pad(all: 5),
                child: SvgView(SVG.$('room/表情'), width: 18, height: 18),
              ),
            ),
          ),
        ],
      ),
    );

    child = OpacityButton(
      child: child,
      onTap: () => onItemClick('新消息'),
    );

    return child;
  }
}
