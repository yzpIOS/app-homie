import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

mixin View<DATA> {
  DATA get vm;
}

abstract class LeadingView<DATA> implements View<DATA> {
  Widget? $leading();
}

abstract class TitleView<DATA> implements View<DATA> {
  Widget $title();
}

abstract class SubtitleView<DATA> implements View<DATA> {
  Widget $subtitle();
}

abstract class TrailingView<DATA> implements View<DATA> {
  Widget $trailing();
}

typedef LongPressCallback = void Function(TapDownDetails? details);

mixin ItemClickMixin {
  VoidCallback? get onTap => null;

  VoidCallback? get onLongPress => null;

  Option<VoidCallback?>? get onTapOver => null;

  Option<VoidCallback?>? get onLongPressOver => null;

  Widget $TapWrap({required Widget child, Color? color = Colors.white}) {
    return Material(
      type: color == Colors.transparent ? MaterialType.transparency : MaterialType.canvas,
      color: color,
      child: InkWell(
        onTap: onTapOver?.getOrElse(() => onTap) ?? onTap,
        onLongPress: onLongPressOver?.getOrElse(() => onLongPress) ?? onLongPress,
        child: child,
      ),
    );
  }

  static void useInner() => Future.error('useDefault');
}

abstract class BaseTile<T extends DataAdapter> extends ViewAdapter<T>
    with ItemClickMixin
    implements LeadingView<T>, TitleView<T> {
  @override
  final Option<VoidCallback?>? onTapOver;
  @override
  final Option<VoidCallback?>? onLongPressOver;
  @override
  final VoidCallback? onLongPress;

  BaseTile({super.key, required T vm, this.onTapOver, this.onLongPressOver, this.onLongPress}) : super(vm);

  @override
  Widget build(BuildContext context) {
    final _subtitle = typeIf<SubtitleView<T>>()?.$subtitle();
    final _trailing = typeIf<TrailingView<T>>()?.$trailing();

    Widget title = $title();
    if (_subtitle != null) {
      title = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [title, _subtitle],
      );
    }

    return $TapWrap(
      child: Container(
        padding: const Pad(horizontal: 16),
        constraints: const BoxConstraints(minHeight: 60),
        child: Row(
          children: [
            $leading() ?? Spacing.blank,
            Spacing.w16,
            Expanded(child: title),
            if (_trailing != null) _trailing,
          ],
        ),
      ),
    );
  }
}
