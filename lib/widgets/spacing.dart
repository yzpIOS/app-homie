import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  final double? width;
  final double? height;
  final int? flex;

  const Spacing({super.key, this.width, this.height, this.flex = 1});

  @override
  Widget build(BuildContext context) {
    Widget widget = SizedBox(width: width, height: height);

    if (flex != null) {
      widget = Expanded(flex: flex!, child: widget);
    }

    return widget;
  }

  static const exp = Spacing();
  static const blank = SizedBox.shrink();

  static const w2 = _WSpacing(2);
  static const w4 = _WSpacing(4);
  static const w5 = _WSpacing(5);
  static const w6 = _WSpacing(6);
  static const w8 = _WSpacing(8);
  static const w10 = _WSpacing(10);
  static const w12 = _WSpacing(12);
  static const w16 = _WSpacing(16);
  static const w18 = _WSpacing(18);
  static const w20 = _WSpacing(20);
  static const w24 = _WSpacing(24);
  static const w30 = _WSpacing(30);
  static const w32 = _WSpacing(32);
  static const w36 = _WSpacing(36);
  static const w40 = _WSpacing(40);
  static const w70 = _WSpacing(70);

  static const h1 = _HSpacing(1);

  static const h2 = _HSpacing(2);
  static const h4 = _HSpacing(4);
  static const h6 = _HSpacing(6);
  static const h8 = _HSpacing(8);
  static const h10 = _HSpacing(10);
  static const h12 = _HSpacing(12);
  static const h14 = _HSpacing(14);
  static const h16 = _HSpacing(16);
  static const h18 = _HSpacing(18);
  static const h20 = _HSpacing(20);
  static const h22 = _HSpacing(22);
  static const h28 = _HSpacing(28);
  static const h30 = _HSpacing(30);
  static const h32 = _HSpacing(32);
  static const h36 = _HSpacing(36);
  static const h38 = _HSpacing(38);
  static const h40 = _HSpacing(40);
  static const h43 = _HSpacing(43);
  static const h50 = _HSpacing(50);
  static const h54 = _HSpacing(54);
  static const h70 = _HSpacing(70);
  static const h76 = _HSpacing(76);
  static const h96 = _HSpacing(96);
}

class _WSpacing extends Spacing {
  const _WSpacing(double width) : super(width: width, flex: null);

  _HSpacing operator *(double operand) => _HSpacing(width! * operand);
}

class _HSpacing extends Spacing {
  const _HSpacing(double height) : super(height: height, flex: null);

  _HSpacing operator *(double operand) => _HSpacing(height! * operand);
}
