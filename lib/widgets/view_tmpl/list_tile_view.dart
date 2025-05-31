import 'package:app/widgets.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

mixin TileNetAvatar<T extends TileDataAdapter> implements LeadingView<T> {
  VoidCallback? get onAvatarClick => null;

  @override
  Widget $leading() {
    return InkWell(
      onTap: onAvatarClick,
      child: AvatarView(vm.leading, size: 50, isShowOnline: vm.isShowOnline),
    );
  }
}

mixin TileTitle<T extends TileDataAdapter> implements TitleView<T> {
  final titleStyle = const TextStyle();

  @override
  Widget $title() {
    return XText(vm.title, style: titleStyle);
  }
}

mixin TileSubtitle<T extends TileDataAdapter> implements SubtitleView<T> {
  @override
  Widget $subtitle() {
    return XText(
      vm.subtitle,
      style: const TextStyle(fontSize: 12, color: Color(0xFF999999)),
    );
  }
}

abstract class TileRadio<T extends TileDataAdapter> implements TrailingView<T>, ItemClickMixin {
  late bool _b;

  @override
  Widget $trailing() {
    return Obx(() {
      _b = isChecked;

      return IgnorePointer(
        child: Radio<bool>(value: _b, groupValue: true, onChanged: (_) {}),
      );
    });
  }

  @override
  VoidCallback get onTap => () => onToggle(!_b);

  bool get isChecked;

  void onToggle(bool b);
}

mixin TileCheckbox<T extends TileDataAdapter> implements TrailingView<T>, ItemClickMixin {
  @override
  Widget $trailing() {
    return Obx(() {
      return IgnorePointer(
        child: XCheckbox(value: checked(), onChanged: (_) {}),
      );
    });
  }

  @override
  VoidCallback? get onTap => () => onUpdate(!checked());

  bool checked();

  void onUpdate(bool b);
}

abstract class TileAction<T> implements TrailingView<T>, ItemClickMixin {
  abstract final VoidCallback? onAction;

  @override
  Widget $trailing() {
    final action = $action();

    return action != null //
        ? TextButton(onPressed: onAction, child: action)
        : Spacing.blank;
  }

  Widget? $action();
}

abstract class TileDataAdapter<T> extends DataAdapter<T> {
  TileDataAdapter(super.data);

  String? get leading;

  String get title;

  String get subtitle => throw UnimplementedError();

  dynamic get trailing => throw UnimplementedError();
}

class TileDataAdapter2 extends TileDataAdapter<Tuple2<String?, String>> {
  TileDataAdapter2({String? leading, required String title}) : super(Tuple2(leading, title));

  @override
  String? get leading => data.value1;

  @override
  String get title => data.value2;
}

class TileDataAdapter4 extends TileDataAdapter<Tuple4<String?, String, String, bool>> {
  TileDataAdapter4({String? leading, required String title, required String subtitle, bool isShowOnline = false})
      : super(Tuple4(leading, title, subtitle, isShowOnline));

  @override
  String? get leading => data.value1;

  @override
  String get title => data.value2;

  @override
  String get subtitle => data.value3;

  @override
  bool get isShowOnline => data.value4;
}

class TileView<T extends TileDataAdapter> extends BaseTile<T> with TileNetAvatar<T>, TileTitle<T> {
  TileView({
    super.key,
    required T data,
    super.onTapOver,
    super.onLongPressOver,
    super.onLongPress,
  }) : super(vm: data);

  @override
  VoidCallback? get onAvatarClick => null;
}

class CheckboxTileView<T extends TileDataAdapter> extends TileView<T> with TileCheckbox<T> {
  final ValueChanged<bool>? onChanged;
  final bool Function() _checked;

  CheckboxTileView({super.key, required super.data, required bool Function() checked, this.onChanged})
      : _checked = checked;

  @override
  bool checked() => _checked();

  @override
  void onUpdate(bool b) => onChanged?.call(b);
}
