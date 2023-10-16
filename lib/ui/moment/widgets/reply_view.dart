import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/emoji_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class ReplySheet extends StatefulWidget {
  final bool autofocus;
  final String? hintText;
  final TextEditingController controller;
  final int? maxLength;

  const ReplySheet._({required this.controller, required this.autofocus, this.hintText, this.maxLength});

  static Future<String?> show(
    TextEditingController controller, {
    bool autofocus = true,
    String? hintText = '…',
    Color? barrierColor,
    int? maxLength,
  }) {
    return Get.dialog(
      ReplySheet._(controller: controller, autofocus: autofocus, hintText: hintText, maxLength: maxLength,),
      name: '$ReplySheet',
      barrierColor: barrierColor,
      useSafeArea: false,
    );
  }

  @override
  State<ReplySheet> createState() => _ReplySheetState();
}

class _ReplySheetState extends State<ReplySheet> {
  late final controller = widget.controller;
  late var autofocus = widget.autofocus;
  late final hintText = widget.hintText;
  late final maxLength = widget.maxLength;

  @override
  Widget build(BuildContext context) {
    Widget child = Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 32,
            child: FormInputView(
              controller: controller,
              hint: hintText,
              autofocus: autofocus,
              suffixIcon: suffixIcon,
              onSubmitted: _doSub,
              maxLength: maxLength,
            ),
          ),
        ),
        Spacing.w10,
        XTextBtn(
          label: '确定',
          width: 64,
          height: 30,
          onTap: () => _doSub(controller.text),
        ),
      ],
    );

    child = Box(
      height: 50,
      alignment: Alignment.center,
      padding: const Pad(horizontal: 10),
      child: child,
    );

    child = Material(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          child,
          $KeyboardHolder(
            child: autofocus ? Spacing.blank : EmojiView(
              onSelect: controller.join,
              // doBackspace: controller.backspace,
              doSend: () => _doSub(controller.text),
            ),
          ),
        ],
      ),
    );

    child = Align(
      alignment: Alignment.bottomCenter,
      child: child,
    );

    return child;
  }

  Widget get suffixIcon {
    return OpacityButton(
      onTap: () {
        autofocus = false;
        hideKeyboard(keepFocus: true);
        setState(() {});
      },
      child: Box(
        padding: const Pad(vertical: 4),
        child: SvgView(SVG.$('chat/表情')),
      ),
    );
  }

  void _doSub(String txt) {
    Get.back(result: txt.isEmpty ? null : txt);
  }
}

class ReplyView extends StatelessWidget {
  final VoidCallback onTap;

  const ReplyView({super.key, required this.onTap});

  static const _decor = ShapeDecoration(
    shape: XStadiumBorder(),
    color: Color(0xFFF5F5F5),
  );

  @override
  Widget build(BuildContext context) {
    Widget child = Container(
      alignment: Alignment.centerLeft,
      padding: const Pad(horizontal: 10),
      decoration: _decor,
      child: const XText(
        '输入评论',
        style: TextStyle(fontSize: 12, color: AppPalette.hint),
      ),
    );

    child = OpacityButton(
      onTap: onTap,
      child: Box(
        height: 50,
        padding: const Pad(all: 10),
        child: child,
      ),
    );

    child = PhysicalModel(
      elevation: 4,
      color: Colors.white,
      child: SafeArea(child: child),
    );

    return child;
  }
}
