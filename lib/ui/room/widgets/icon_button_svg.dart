import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/ui/room/widgets/icon_button.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class IconBtnSvg extends StatelessWidget {
  final String? icon;
  final double? size;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  const IconBtnSvg({super.key, this.icon, this.size, this.onTap, this.padding = Pad.zero});

  @override
  Widget build(BuildContext context) {
    final _icon = icon;

    return InkResponse(
      onTap: onTap,
      child: Padding(
        padding: padding * AppSize.scaleW,
        child: _icon == null
            ? SizedBox(width: size, height: size)
            : IconBtnDecor(
                child: SvgView(SVG.$('room/$_icon'), width: size, height: size),
              ),
      ),
    );
  }
}