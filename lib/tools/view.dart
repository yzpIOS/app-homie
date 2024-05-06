import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:flutter/material.dart';
import 'package:synchronized/synchronized.dart';

extension XColor on Color {
  MaterialColor toMaterialColor() {
    final strengths = <double>[.05];

    final swatch = <int, Color>{};
    final int r = red, g = green, b = blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (var strength in strengths) {
      final double ds = 0.5 - strength;

      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(value, swatch);
  }

  /// 常规(如果使用自定义字体，则不需要设置字重了)
  TextStyle pt(double size, {FontWeight? fontWeight}) => TextStyle(
    color: this,
    fontSize: size,
    fontWeight: fontWeight,
  );

  /// 中等
  TextStyle ptM(double size) =>
      pt(size, fontWeight: FontWeight.w500);

  /// 加粗
  TextStyle ptB(double size) =>
      pt(size, fontWeight: FontWeight.bold);
}

extension XBuildContext on BuildContext {
  static final _lock = Lock(reentrant: true);

  Future<ModalRoute?> get route => endOfFrame(() => ModalRoute.of(this));

  Future Function() get safePop {
    Future? task;

    final tmp = route;

    return () => task ??= _lock.synchronized(
          () async {
            final route = await tmp;

            if (route != null && route.canPop) {
              Navigator.pop(this);
            } else {
              xlog('页面无效，Pop取消');
            }
          },
        );
  }

  Future Function() get closePage {
    Future? task;

    final tmp = route;

    return () => task ??= _lock.synchronized(
          () async {
            final route = await tmp;

            if (route != null && route.canPop) {
              bool b = false;

              bool predicate(Route it) {
                if (b) return true;

                b = route == it;

                return false;
              }

              Navigator.popUntil(this, predicate);
            } else {
              xlog('页面无效，Pop取消');
            }
          },
        );
  }

  T? args<T>() {
    final args = ModalRoute.of(this)?.settings.arguments;

    if (args is T) return args;

    return null;
  }
}

extension XWidget on Widget {
  Widget toSliver({EdgeInsetsGeometry? padding}) {
    Widget sliver = SliverToBoxAdapter(child: this);

    if (padding != null) {
      sliver = SliverPadding(padding: padding, sliver: sliver);
    }

    return sliver;
  }

  Overlay toOverlay() {
    return Overlay(
      initialEntries: [OverlayEntry(builder: (_) => this)],
    );
  }

  RouteSettings toRouteSettings() {
    return RouteSettings(name: '$runtimeType');
  }

  Widget horizonMargin({double left = 0, double right = 0}) {
    return Container(
      margin: EdgeInsets.only(left: left, right: right),
      child: this,
    );
  }

  Widget verticalMargin({double top = 0, double bottom = 0}) {
    return Container(
      margin: EdgeInsets.only(top: top, bottom: bottom),
      child: this,
    );
  }

  Widget margin({double left = 0, double right = 0, double top = 0, double bottom = 0}) {
    return Container(
      margin: EdgeInsets.only(left:left, right: right, top: top, bottom: bottom),
      child: this,
    );
  }
}

extension XDimension on num {
  int toPx() {
    return (AppSize.pixelRatio * this).floor();
  }
}
