import 'package:app/common/theme.dart';
import 'package:app/shop/shop_view_header.dart';
import 'package:app/tools.dart';
import 'package:app/ui/intro/intro_overlay.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class MyClothIntroOverlay extends IntroOverlay {
  final offsetY = Get.width / MyModelView.ratio;

  final offset1 = 67.0;
  final offset2 = 60.0;

  MyClothIntroOverlay({super.key});

  @override
  Widget background() {
    return Stack(
      children: [
        Positioned(top: offsetY, left: 0, width: offset1, height: offset2, child: rectangle),
        Positioned(top: offsetY, left: offset1 + 8, right: 51, height: offset2, child: rectangle),
      ],
    );
  }

  @override
  Widget foreground() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: AppSize.safeTop + 12,
          right: 10,
          width: 54,
          height: 24,
          child: XOutlinedBtn(
            label: '跳过',
            side: const BorderSide(color: Colors.white),
            textStyle: const TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
        Positioned(
          top: offsetY - 105,
          left: 40,
          child: Image.asset(IMG.$('intro/shop/2'), scale: 3, fit: BoxFit.contain),
        ),
        Positioned(
          top: offsetY + offset2,
          child: Image.asset(IMG.$('intro/shop/3'), scale: 3, fit: BoxFit.contain),
        ),
      ],
    );
  }
}
