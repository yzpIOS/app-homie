import 'package:app/widgets.dart';
import 'package:get/state_manager.dart';

mixin IActionView<T> implements View<T> {
  Widget $action();
}

abstract class IToggleView<T> implements IActionView<T> {
  abstract final Object isChecked;
  abstract final ValueChanged<bool>? onChanged;

  Widget $toggle(bool val, ValueBuilderUpdateCallback<bool>? onChanged);
}

abstract class ITipsView<T> implements View<T> {
  Widget? $tips();
}
