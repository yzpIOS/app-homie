import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/table_view/view_item/table_data_adapter.dart';
import 'package:app/widgets/table_view/view_item/table_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

mixin TableToggleMixin on IToggleView<ItemDataAdapter> {
  late final Rx<bool> _dataRx = _typeIf;

  Rx<bool> get _typeIf {
    final _tmp = isChecked;

    if (_tmp is Rx<bool>) {
      return _tmp;
    } else if (_tmp is RxBool) {
      return _tmp;
    } else if (_tmp is bool) {
      return RxBool(_tmp);
    } else {
      assert(false, _tmp);

      return RxBool(false);
    }
  }

  @override
  Widget $action() {
    final onUpdate = onChanged;

    return ObxValue<Rx<bool>>(
      (it) => $toggle(it(), onUpdate == null ? null : (b) => onUpdate(it(b))),
      _dataRx,
    );
  }

  void doToggle() => onChanged?.call(_dataRx.toggle()());
}

mixin TableSwitch implements IToggleView<ItemDataAdapter> {
  @override
  Widget $toggle(bool val, ValueBuilderUpdateCallback<bool>? onChanged) {
    return Transform.translate(
      offset: const Offset(8, 0), //修正控件的留白
      child: CupertinoSwitch(
        value: val,
        activeColor: AppPalette.primary,
        onChanged: onChanged == null ? null : (b) => onChanged(b == true),
      ),
    );
  }
}

mixin TableCheckbox implements IToggleView<ItemDataAdapter> {
  @override
  Widget $toggle(bool val, _) {
    return IgnorePointer(
      child: XCheckbox(value: val, onChanged: (_) {}),
    );
  }
}

abstract class TableRadio implements IToggleView<ItemDataAdapter> {
  @override
  Widget $toggle(bool val, _) {
    return IgnorePointer(
      child: Radio(value: val, groupValue: true, onChanged: (_) {}),
    );
  }
}
