import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class NineGrid extends StatelessWidget {
  final Iterable<Widget> cover;
  final double size;
  final double space;

  const NineGrid(this.cover, {super.key, required this.size, required this.space});

  @override
  Widget build(BuildContext context) {
    final count = cover.length;
    final itemW = (size - space) / 2;

    return Box(
      width: size,
      height: size,
      child: Stack(
        children: cover.take(4).mapIndexed((i, item) {
          final t = (space + itemW) * (i ~/ 2);
          final l = (space + itemW) * ((/*(count == 3 && i == 2) ? i + 1 :*/ i) % 2);

          final w = count == 1 ? size : itemW;
          final h = (count == 1 || count == 2 /*|| (count == 3 && i == 0)*/) ? size : itemW;

          return Positioned(top: t, left: l, width: w, height: h, child: item);
        }).toList(growable: false),
      ),
    );
  }
}
