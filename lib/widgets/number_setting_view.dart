import 'dart:async';

import 'package:app/common/theme.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

typedef DoChange = FutureOr<bool> Function(int newVal, bool isOver);

class NumberSettingView extends StatefulWidget {
  final double size;
  final int initValue;
  final int minValue;
  final int maxValue;
  final Color? borderColor;
  final Color? btnBG;
  final Color? inputBG;
  final Color? textColor;
  final DoChange? doChange;

  const NumberSettingView({
    super.key,
    required this.initValue,
    this.minValue = 1,
    this.maxValue = 999,
    this.size = 32,
    this.borderColor,
    this.btnBG,
    this.inputBG,
    this.textColor,
    this.doChange,
  });

  @override
  State<NumberSettingView> createState() => _NumberSettingState();
}

class _NumberSettingState extends State<NumberSettingView> {
  late int value = widget.initValue;

  static const radius = AppRadius.r4;

  @override
  Widget build(BuildContext context) {
    final borderColor = widget.borderColor;

    final side = //
        borderColor == null //
            ? null
            : BorderSide(color: borderColor);

    final border = //
        side == null //
            ? null
            : Border.fromBorderSide(side);

    final leftRadius = //
        border == null //
            ? const BorderRadius.all(radius)
            : const BorderRadius.horizontal(left: radius);
    final rightRadius = //
        border == null //
            ? const BorderRadius.all(radius)
            : const BorderRadius.horizontal(right: radius);

    final numDecor = BoxDecoration(
      color: widget.inputBG,
      border: side == null ? null : Border(left: side, right: side),
    );

    Widget child = $ActionView(
      '+',
      radius: rightRadius,
      onTap: doAdd,
      onLongPress: () => doAdd(20),
    );

    if (value >= widget.minValue) {
      Widget numView = XText('$value');

      final size = widget.size;

      numView = Container(
        width: size * 1.6,
        height: size,
        decoration: numDecor,
        alignment: Alignment.center,
        child: numView,
      );

      child = Row(
        children: [
          $ActionView(
            '-',
            radius: leftRadius,
            onTap: doMinus,
            onLongPress: () => doMinus(20),
          ),
          numView,
          child,
        ],
      );
    }

    child = DefaultTextStyle.merge(
      style: TextStyle(fontSize: 14, color: widget.textColor),
      child: child,
    );

    if (border != null) {
      child = DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(
          border: border,
          borderRadius: const BorderRadius.all(radius),
        ),
        child: child,
      );
    }

    return child;
  }

  Widget $ActionView(String action, {BorderRadius? radius, VoidCallback? onTap, VoidCallback? onLongPress}) {
    final size = widget.size;

    Widget child = XText(action);

    child = Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      child: child,
    );

    child = InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: child,
    );

    child = Material(
      color: widget.btnBG,
      borderRadius: radius,
      clipBehavior: Clip.hardEdge,
      child: child,
    );

    return child;
  }

  void doMinus([int step = 1]) {
    final minVal = widget.minValue;
    final newVal = value - step;

    final isOver = newVal < minVal;

    if (isOver && step > 1) {
      onChange(minVal - 1, isOver);
    } else {
      onChange(newVal, isOver);
    }
  }

  void doAdd([int step = 1]) {
    final maxVal = widget.maxValue;
    final newVal = value + step;

    final isOver = newVal > maxVal;

    if (isOver && step > 1) {
      onChange(maxVal + 1, isOver);
    } else {
      onChange(newVal, isOver);
    }
  }

  void onChange(int newVal, bool isOver) async {
    final doChange = widget.doChange;

    if (newVal != value) {
      if (doChange == null) {
        if (isOver) {
          //TODO
        } else {
          setState(() => value = newVal);
        }
      } else if (await doChange(newVal, isOver)) {
        if (mounted) {
          setState(() => value = newVal);
        }
      }
    }
  }
}
