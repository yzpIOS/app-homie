import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class AppBottomSheet extends StatelessWidget {
  final List<Widget> children;

  const AppBottomSheet({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 17, color: AppPalette.c3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...children.separator(const Divider()),
          const Divider(),
          SafeArea(
            minimum: AppSize.safeAreaMini,
            child: Padding(
              padding: const Pad(horizontal: 27, top: 16),
              child: XTextBtn(
                label: '取消',
                height: 50,
                color: const Color(0xFFF0F0F0),
                textStyle: const TextStyle(fontSize: 17, color: AppPalette.c3, fontWeight: fw$Medium),
                onTap: Get.back,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBottomSheetAction extends StatelessWidget {
  final String title;
  final String? hint;
  final TextStyle? style;
  final VoidCallback onTap;

  const AppBottomSheetAction({super.key, required this.title, required this.onTap, this.hint, this.style});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Box(
        height: 60,
        alignment: Alignment.center,
        child: XText(title, style: style),
      ),
    );
  }
}
