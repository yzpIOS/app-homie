import 'dart:collection';

import 'package:app/tools.dart';
import 'package:flutter/material.dart';

import 'package:app/widgets/table_view/view_item/impl/table_group.dart';

export 'view_item/impl/table_group.dart';
export 'view_item/impl/table_item.dart';

class TableView extends StatelessWidget {
  final DoubleLinkedQueue<ITableGroup> items;
  final Option<Widget>? divider;
  final double? itemExtent;

  TableView(Iterable<ITableGroup> items, {super.key, this.divider, this.itemExtent})
      : items = DoubleLinkedQueue.of(items);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    final _divider = (divider?.map<Widget?>((a) => a) ?? Some(context.read<TableCfg>().divider)) | null;

    items.forEachEntry((it) {
      final item = it.element;

      children.add(item);

      if (_divider != null && item.canDivider) {
        final next = it.nextEntry();

        if (next != null && next.element.canDivider) {
          children.add(_divider);
        }
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }
}

class TableCfg {
  final Widget? divider;
  final Color? itemColor;
  final double itemExtent;
  final PreferredSizeWidget? itemDivider;

  const TableCfg({
    required this.itemExtent,
    this.itemColor,
    this.itemDivider,
    this.divider,
  });
}
