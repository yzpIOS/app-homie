import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

abstract class ITableGroup extends StatelessWidget {
  const ITableGroup({super.key});

  bool get canDivider => false;
}

class TableGroupX extends ITableGroup {
  final Widget child;

  const TableGroupX({super.key, required this.child});

  @override
  Widget build(BuildContext context) => child;
}

class TableGroup extends ITableGroup {
  final String? label;
  final List<Widget> items;
  final TextStyle? textStyle;
  final Option<Color>? itemColor;
  final Option<PreferredSizeWidget>? divider;

  const TableGroup(this.items, {super.key, this.label, this.textStyle, this.divider, this.itemColor});

  @override
  final canDivider = true;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final cfg = context.read<TableCfg>();

        final _divider = (divider?.map<PreferredSizeWidget?>((a) => a) ?? Some(cfg.itemDivider)) | null;

        Widget child = _$ChildView(
          itemExtent: cfg.itemExtent,
          divider: _divider,
        );

        if (label != null) {
          child = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: XText(
                  label!,
                  style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$Medium),
                ),
              ),
              child,
            ],
          );
        }

        child = Material(
          color: (itemColor?.map<Color?>((a) => a) ?? Some(cfg.itemColor)) | null,
          textStyle: textStyle,
          child: child,
        );

        return child;
      },
    );
  }

  Widget _$ChildView({required double itemExtent, PreferredSizeWidget? divider}) {
    final children = <Widget>[];

    _addItem(children, itemExtent);

    if (divider != null) {
      _addDivider(children, divider, itemExtent);
    }

    return SizedBox(
      height: itemExtent * items.length,
      child: Stack(
        children: children,
      ),
    );
  }

  void _addItem(List<Widget> children, double itemExtent) {
    for (var i = 0; i < items.length; ++i) {
      final item = items[i];

      children.add(
        Positioned(
          top: itemExtent * i,
          left: 0,
          right: 0,
          height: itemExtent,
          child: item,
        ),
      );
    }
  }

  void _addDivider(List<Widget> children, PreferredSizeWidget divider, double itemExtent) {
    final count = children.length;
    final height = divider.preferredSize.height;

    for (var i = 1; i < count; ++i) {
      final y = itemExtent * i - height / 2;

      children.add(
        Positioned(top: y, left: 0, right: 0, height: height, child: divider),
      );
    }
  }
}
