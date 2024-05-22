import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class IconBtn extends StatelessWidget {
  final String? icon;
  final double? size;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  const IconBtn({super.key, this.icon, this.size, this.onTap, this.padding = Pad.zero});

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
                child: Image.asset(IMG.format('room/mic/$_icon'), width: size, height: size),
              ),
      ),
    );
  }
}

class IconBtnDecor extends StatelessWidget {
  final Widget child;

  const IconBtnDecor({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(shape: BoxShape.circle, color: AppPalette.room),
      child: child,
    );
  }
}
