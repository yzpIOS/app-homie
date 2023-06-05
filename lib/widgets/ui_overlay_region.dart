import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UiOverlayRegion extends StatelessWidget {
  final Widget child;
  final SystemUiOverlayStyle value;

  const UiOverlayRegion({super.key, required this.child, required this.value});

  factory UiOverlayRegion.light({required Widget child}) {
    return UiOverlayRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: child,
    );
  }

  factory UiOverlayRegion.dark({required Widget child}) {
    return UiOverlayRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(value: value, child: child);
  }
}
