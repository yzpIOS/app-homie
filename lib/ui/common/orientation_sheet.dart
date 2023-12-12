import 'dart:math';

import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class OrientationSheet extends StatelessWidget {
  final Widget sheet;
  final Decoration? decoration;
  final BoxConstraints? constraints;

  const OrientationSheet._({required this.sheet, this.constraints, this.decoration});

  static BoxConstraints get _boxConstraints {
    final width = AppSize.width;

    return BoxConstraints(
      minWidth: width,
      maxWidth: width,
      minHeight: width,
      maxHeight: Get.isLandscape ? width : max(AppSize.height * 0.5, width),
    );
  }

  static Future<T?> show<T extends Object?>({
    required Widget child,
    double? minHeight,
    BoxConstraints? constraints,
    Decoration? decoration = const ShapeDecoration(
      color: Colors.white,
      shape: XRectangleBorder(borderRadius: AppBorderRadius.t12),
    ),
    Color? barrierColor,
    bool barrierDismissible = true,
    SheetOrientation direction = SheetOrientation.bottom,
  }) {
    final sheet = OrientationSheet._(
      constraints: constraints ?? (minHeight?.let((it) => _boxConstraints.copyWith(minHeight: it)) ?? _boxConstraints),
      decoration: decoration,
      sheet: child,
    );

    final AlignmentGeometry alignment;
    final Tween<Offset> offsetTween;

    switch (direction) {
      case SheetOrientation.left:
        alignment = Alignment.centerLeft;
        offsetTween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        break;
      case SheetOrientation.right:
        alignment = Alignment.centerRight;
        offsetTween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        break;
      case SheetOrientation.bottom:
        alignment = Alignment.bottomCenter;
        offsetTween = Tween(begin: const Offset(0, 1), end: Offset.zero);
        break;
    }

    const dur = Duration(milliseconds: 200);

    final route = RawDialogRoute<T>(
      settings: child.toRouteSettings(),
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      pageBuilder: (_, __, ___) => sheet,
      transitionDuration: dur,
      transitionBuilder: (_, animation, __, child) {
        return Align(
          alignment: alignment,
          child: FractionalTranslation(
            translation: offsetTween.evaluate(animation),
            child: AbsorbPointer(
              absorbing: !animation.isCompleted,
              child: child,
            ),
          ),
        );
      },
    );

    return Get.push<T>(route).then((val) => Future.delayed(dur, () => val));
  }

  @override
  Widget build(BuildContext context) {
    Widget child = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeLeft: true,
      removeRight: true,
      removeBottom: true,
      child: sheet,
    );

    child = Material(
      type: MaterialType.transparency,
      clipBehavior: Clip.none,
      child: child,
    );

    if (decoration != null) {
      child = DecoratedBox(decoration: decoration!, child: child);
    }

    if (constraints != null) {
      child = ConstrainedBox(constraints: constraints!, child: child);
    }

    return child;
  }

  static Widget scaffold({required String title, required Widget body, TextStyle? textStyle, Widget? titleWidget}) {
    Widget child = titleWidget ?? DefaultTextStyle(
      style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$Medium),
      child: XText(title, style: textStyle),
    );

    child = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Box(
          height: 42,
          alignment: Alignment.center,
          child: child,
        ),
        const Divider(indent: 10, endIndent: 10, color: Color(0x80CCCCCC)),
        Flexible(child: body),
      ],
    );

    return child;
  }
}

enum SheetOrientation {
  left,
  right,
  bottom,
  ;
}

class SheetController {}
