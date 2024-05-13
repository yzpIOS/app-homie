import 'package:flutter/material.dart';

extension XText on Widget {
  Widget toBtn({
    double? height = 45,
    Color? bg,
    double? width,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Color? splashColor,
    double? radius,
    BorderRadiusGeometry? borderRadius,
    List<Color>? colors,
    GestureTapCallback? onTap,
    bool autoSize = false,
    BoxBorder? border,
    LinearGradient? linearGradient,
  }) {
    return xFlatButton(height, bg,
        width: width,
        margin: margin,
        padding: padding,
        splashColor: splashColor ?? Colors.transparent,
        radius: radius,
        borderRadius: borderRadius,
        colors: colors,
        onTap: onTap,
        child: this,
        autoSize: autoSize,
        border: border,
        linearGradient: linearGradient);
  }

  Widget xFlatButton(
      double? height,
      Color? bg, {
        double? width,
        EdgeInsetsGeometry? margin,
        EdgeInsetsGeometry? padding,
        Color splashColor = Colors.transparent,
        double? radius = 100,
        BorderRadiusGeometry? borderRadius,
        List<Color>? colors,
        GestureTapCallback? onTap,
        AlignmentGeometry? alignment,
        Widget? child,
        bool autoSize = false,
        BoxBorder? border,
        LinearGradient? linearGradient,
      }) {
    final r = radius ?? 100;
    child = Container(
      constraints: autoSize
          ? const BoxConstraints(
        minHeight: 0,
        minWidth: 0,
      )
          : null,
      alignment: autoSize ? null : Alignment.center,
      height: height,
      padding: padding ?? const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: child,
    );
    if (onTap != null) {
      child = Material(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(r))),
        child: GestureDetector(
          // Container范围内都支持点击
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: child,
        ),
      );
    }
    return xTagView(height, bg,
        width: width,
        margin: margin,
        padding: EdgeInsets.zero,
        radius: radius,
        borderRadius: borderRadius,
        colors: colors,
        autoSize: autoSize,
        border: border,
        child: child,
        linearGradient: linearGradient);
  }

  Widget xTagView(
      double? height,
      Color? bg, {
        double? width,
        EdgeInsetsGeometry? margin,
        EdgeInsetsGeometry? padding,
        double? radius,
        BorderRadiusGeometry? borderRadius,
        List<Color>? colors,
        Widget? child,
        bool autoSize = false,
        BoxBorder? border,
        LinearGradient? linearGradient,
      }) {
    borderRadius = borderRadius ?? BorderRadius.all(Radius.circular(radius ?? 100));
    BoxDecoration boxDecoration = BoxDecoration(color: bg, borderRadius: borderRadius, border: border);
    if (colors != null || linearGradient != null) {
      boxDecoration = BoxDecoration(
        gradient: linearGradient ??
            LinearGradient(
              colors: colors!,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
        border: border,
        borderRadius: borderRadius,
      );
    }

    return Container(
      height: height,
      width: width,
      alignment: autoSize ? null : Alignment.center,
      constraints: autoSize
          ? const BoxConstraints(
        minHeight: 0,
        minWidth: 0,
      )
          : null,
      margin: margin ?? EdgeInsets.zero,
      padding: padding ?? EdgeInsets.zero,
      decoration: boxDecoration,
      child: child,
    );
  }
}


extension ArabicExtension on String {
  /// 判断是否包含阿拉伯语
  bool get hasArabicGlyphs {
    final codeUnits = this.codeUnits;
    for (int i = 0; i < codeUnits.length; i++) {
      final codeUnit = codeUnits[i];
      if (codeUnit >= 0x600 && codeUnit <= 0x6ff) return true;
      if (codeUnit >= 0x750 && codeUnit <= 0x77f) return true;
      if (codeUnit >= 0xfb50 && codeUnit <= 0xfc3f) return true;
      if (codeUnit >= 0xfe70 && codeUnit <= 0xfefc) return true;
    }
    return false;
  }
}

/// 文本超长显示省略号后部分空白的解决方法
extension EllipsisFixed on String {
  String get ellipsisFixed => hasArabicGlyphs ? this : Characters(this).join('\u{200B}');
}