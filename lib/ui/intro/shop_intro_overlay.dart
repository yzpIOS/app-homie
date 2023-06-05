import 'package:app/common/theme.dart';
import 'package:app/shop/shop_view_header.dart';
import 'package:app/tools.dart';
import 'package:app/ui/intro/intro_overlay.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class ShopIntroOverlay extends IntroOverlay {
  final offsetY = Get.width / MyModelView.ratio;

  final offset1 = 50.0;

  ShopIntroOverlay({super.key});

  @override
  Widget background() {
    return Stack(
      children: [
        Positioned(top: offsetY - 10 - offset1, left: 5, width: 110, height: offset1, child: rectangle),
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
          top: offsetY - 10 - offset1 - 105,
          left: 40,
          child: Image.asset(IMG.$('intro/shop/0'), scale: 3, fit: BoxFit.contain),
        ),
        Positioned(
          top: offsetY + 7,
          child: Image.asset(IMG.$('intro/shop/1'), scale: 3, fit: BoxFit.contain),
        ),
      ],
    );
  }
}
