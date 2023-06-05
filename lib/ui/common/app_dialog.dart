import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  final String? title;
  final Widget? content;
  final List<DialogAction>? actions;

  const AppDialog({super.key, this.title = '提示', this.content, this.actions});

  @override
  Widget build(BuildContext context) {
    Widget child = $BodyView();

    child = Box(
      width: 270,
      padding: const Pad(horizontal: 16, vertical: 14),
      child: child,
    );

    child = Material(
      color: Colors.white,
      borderRadius: AppBorderRadius.a12,
      textStyle: const TextStyle(fontSize: 14, color: Colors.black),
      child: child,
    );

    child = Align(
      alignment: Alignment.center,
      child: child,
    );

    child = MediaQuery.removeViewInsets(
      context: context,
      removeLeft: true,
      removeTop: true,
      removeRight: true,
      removeBottom: true,
      child: child,
    );

    child = AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOutCubic,
      child: child,
    );

    return child;
  }

  Widget $BodyView() {
    final _title = title;
    final _content = content;
    final _actions = actions;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_title != null)
          Box(
            height: 26,
            alignment: Alignment.center,
            child: XText(
              _title,
              style: const TextStyle(fontSize: 17, color: AppPalette.c3, fontWeight: fw$SemiBold),
            ),
          ),
        Spacing.h6,
        if (_content != null)
          Box(
            padding: const Pad(vertical: 14),
            child: _content,
          ),
        Spacing.h6,
        if (_actions != null && _actions.isNotEmpty)
          Row(
            children: _actions //
                .map<Widget>((it) => Expanded(child: it))
                .separator(Spacing.w16)
                .toList(growable: false),
          ),
      ],
    );
  }
}

abstract class DialogAction extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const DialogAction(this.title, this.onTap, {super.key});

  TextStyle get textStyle => const TextStyle(fontSize: 17, color: AppPalette.c3);

  BorderSide get side => BorderSide.none;

  Color get bgColor => Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor,
      textStyle: textStyle,
      clipBehavior: Clip.hardEdge,
      shape: XStadiumBorder(side: side),
      child: InkWell(
        onTap: onTap,
        child: Box(
          height: 44,
          alignment: Alignment.center,
          child: XText(title),
        ),
      ),
    );
  }
}

class OkDialogAction extends DialogAction {
  const OkDialogAction({super.key, String title = '确定', VoidCallback? onTap}) : super(title, onTap);

  @override
  TextStyle get textStyle => super.textStyle.copyWith(color: Colors.white);

  @override
  Color get bgColor => AppPalette.primary;
}

class CancelDialogAction extends DialogAction {
  CancelDialogAction({super.key, String title = '取消', VoidCallback? onTap})
      : super(
          title,
          onTap ?? () => Get.back(result: title),
        );

  @override
  BorderSide get side => const BorderSide(color: Color(0xFFEEEEEF));
}
