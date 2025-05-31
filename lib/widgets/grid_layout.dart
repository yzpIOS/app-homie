import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class GridLayout extends StatelessWidget {
  final List<Widget> children;
  final int crossAxisCount;
  final double childAspectRatio;
  final double mainAxisSpacing, crossAxisSpacing;

  const GridLayout({
    super.key,
    required this.children,
    required this.crossAxisCount,
    this.childAspectRatio = 1,
    this.mainAxisSpacing = 0,
    this.crossAxisSpacing = 0,
  });

  static const _kCurve = Curves.easeOutCubic;
  static const _kDuration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) return const SizedBox.shrink();

    final lines = (children.length / crossAxisCount).ceil();

    return LayoutBuilder(builder: (_, constraints) {
      final itemWidth = (constraints.maxWidth - ((crossAxisCount - 1) * crossAxisSpacing)) / crossAxisCount;
      final itemHeight = itemWidth / childAspectRatio;

      return AnimatedContainer(
        width: constraints.maxWidth,
        height: (lines * itemHeight) + ((lines - 1) * mainAxisSpacing),
        curve: _kCurve,
        duration: _kDuration,
        child: Stack(
          children: children.mapIndexed((i, child) {
            final key = child.key;

            return AnimatedPositioned(
              key: key is GlobalKey ? null : key,
              top: i ~/ crossAxisCount * (itemHeight + mainAxisSpacing),
              left: i % crossAxisCount * (itemWidth + crossAxisSpacing),
              width: itemWidth,
              height: itemHeight,
              curve: _kCurve,
              duration: _kDuration,
              child: child,
            );
          }).toList(growable: false),
        ),
      );
    });
  }
}
