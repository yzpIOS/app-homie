import 'package:app/widgets.dart';
import 'package:app/widgets/table_view/view_item/table_data_adapter.dart';
import 'package:flutter/material.dart';

mixin TableTitle implements TitleView<ItemDataAdapter> {
  final titleStyle = const TextStyle(fontSize: 16, color: Colors.black);

  @override
  Widget $title() {
    return XText(
      vm.title,
      style: titleStyle,
      overflow: TextOverflow.fade,
    );
  }
}
