import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/store/intro_ctrl.dart';
import 'package:app/tools.dart';
import 'package:flutter/material.dart';

abstract class IntroOverlay extends StatelessWidget {
  final rectangle = Container(
    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
  );

  IntroOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    Widget child = background();

    child = ColorFiltered(
      colorFilter: const ColorFilter.mode(AppPalette.barrier, BlendMode.srcOut),
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.black, backgroundBlendMode: BlendMode.dstOut),
        child: child,
      ),
    );

    child = Stack(
      children: [
        child,
        foreground(),
      ],
    );

    final event = context.read<CloseOverlayEvent?>();

    if (event != null) {
      child = GestureDetector(
        child: child,
        onTap: () {
          event.fire();

          Get.find<IntroCtrl>().doMark(event.key as String);
        },
      );
    }

    return child;
  }

  Widget background();

  Widget foreground();
}
