import 'dart:ui';

import 'package:flutter/material.dart';

class BlurView extends StatelessWidget {
  final Widget child;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;

  const BlurView({super.key, required this.child, this.borderRadius, this.color = Colors.white54});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      clipBehavior: Clip.hardEdge,
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: child,
      ),
    );
  }
}
