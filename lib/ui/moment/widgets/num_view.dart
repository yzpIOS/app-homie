import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class NumView extends StatelessWidget {
  final String action;
  final String num;
  final ValueChanged<String>? onTap;

  const NumView({super.key, required this.action, required this.num, this.onTap});

  @override
  Widget build(BuildContext context) {
    Widget child = XRichText(
      TextSpan(
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: SvgView(SVG.$('moment/$action'), width: 24, height: 24),
          ),
          TextSpan(text: num),
        ],
      ),
      overflow: TextOverflow.visible,
      style: const TextStyle(fontSize: 12, color: AppPalette.c3),
    );

    child = Box(
      width: 24 + 24,
      height: 32,
      alignment: Alignment.centerLeft,
      child: child,
    );

    if (onTap != null) {
      child = InkWell(
        onTap: () => onTap!(action),
        child: child,
      );
    }

    return child;
  }
}
