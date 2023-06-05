import 'dart:ui';

import 'package:app/common/theme.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
PageRoute<T> GalleryRoute<T>(Widget child, {RouteSettings? settings, Duration duration = kThemeChangeDuration}) {
  return PageRouteBuilder<T>(
    settings: settings,
    opaque: false,
    barrierColor: Colors.transparent,
    pageBuilder: (_, __, ___) => child,
    transitionsBuilder: (_, animation, __, child) {
      final val = Curves.easeOutCubic.transform(animation.value);

      child = ColoredBox(
        color: AppPalette.barrier.withOpacity(val),
        child: child,
      );

      if (animation.status == AnimationStatus.reverse) return child;

      final sigma = 28 * val;

      child = BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: child,
      );

      return child;
    },
  );
}
