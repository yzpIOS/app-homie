import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/table_view/view_item/impl/table_action.dart';
import 'package:app/widgets/table_view/view_item/impl/table_icon.dart';
import 'package:app/widgets/table_view/view_item/impl/table_tips.dart';
import 'package:app/widgets/table_view/view_item/impl/table_title.dart';
import 'package:app/widgets/table_view/view_item/table_data_adapter.dart';
import 'package:app/widgets/table_view/view_item/table_item.dart';
import 'package:flutter/material.dart';

abstract class TableItemView<T extends ItemDataAdapter> extends ViewAdapter<T>
    with ItemClickMixin
    implements TitleView<T> {
  TableItemView(super.vm, {super.key});

  @override
  Widget build(BuildContext context) {
    final icon = typeIf<LeadingView<T>>()?.$leading();
    final tips = typeIf<ITipsView<T>>()?.$tips();
    final action = typeIf<IActionView<T>>()?.$action();

    const space = Spacing.w10;

    Widget child = Row(
      children: [
        if (icon != null) ...[icon, space],
        Expanded(child: $title()),
        space,
        if (tips != null) tips,
        if (action != null) //
          action
        else if (onTap == null)
          Spacing.w20
        else if (onTap != null) //
          ...[Spacing.w2, const RightArrowIcon()],
      ],
    );

    child = Padding(
      padding: const Pad(horizontal: 10),
      child: child,
    );

    return RepaintBoundary(child: $TapWrap(child: child, color: Colors.transparent));
  }
}

class TableItem extends TableItemView<ItemDataAdapter> with TableIcon, TableTitle, TableTips {
  final String title;
  final String? icon;
  final String? tips;

  @override
  final VoidCallback? onTap;

  TableItem({super.key, required this.title, this.icon, this.tips, this.onTap})
      : super(ItemDataAdapter(title, icon, tips));
}

class TableItem$Action extends TableItem with IActionView<ItemDataAdapter> {
  final Widget action;

  TableItem$Action({super.key, required this.action, required super.title, super.icon, super.tips, super.onTap});

  @override
  Widget $action() => action;
}

class TableItem$Switch extends TableItem with TableSwitch, TableToggleMixin {
  @override
  final Object isChecked;
  @override
  final ValueChanged<bool>? onChanged;

  TableItem$Switch({
    super.key,
    required super.title,
    required this.isChecked,
    this.onChanged,
    super.icon,
    super.tips,
    super.onTap,
  }) : assert(isChecked is RxBool || isChecked is Rx<bool> || isChecked is bool);
}

class TableItem$Checkbox extends TableItem with TableCheckbox, TableToggleMixin {
  @override
  final Object isChecked;
  @override
  final ValueChanged<bool>? onChanged;

  TableItem$Checkbox({
    super.key,
    required super.title,
    required this.isChecked,
    this.onChanged,
  })  : assert(isChecked is RxBool || isChecked is Rx<bool> || isChecked is bool),
        super(icon: null, tips: null, onTap: null);

  @override
  VoidCallback get onTap => doToggle;
}

class TableItem$Select extends TableItem with IActionView<ItemDataAdapter> {
  final bool selected;

  TableItem$Select(
      {super.key, required this.selected, required super.title, super.icon, super.tips, VoidCallback? onSelect})
      : super(onTap: selected ? null : onSelect);

  @override
  Widget $action() {
    return IgnorePointer(
      child: Radio(value: selected, groupValue: true, onChanged: (_) {}),
    );
  }
}

class TableItem$Btn extends ViewAdapter<void> {
  final String title;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  const TableItem$Btn(
      {super.key, required this.title, this.textStyle, this.onTap, this.padding = const Pad(horizontal: 16)})
      : super(null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Box(
        padding: padding,
        alignment: Alignment.centerLeft,
        child: XText(title, style: textStyle),
      ),
    );
  }
}
