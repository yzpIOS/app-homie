import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'package:app/ui/intro/intro_overlay.dart';

class RoomIntroOverlay extends IntroOverlay {
  RoomIntroOverlay({super.key});

  @override
  Widget background() {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(top: 250, right: 0, width: 67, height: 50, child: rectangle),
          Positioned(bottom: 141, right: 10, width: 50, height: 50, child: rectangle),
          // Positioned(bottom: 116 - 34, left: 35, width: 40, height: 40, child: rectangle),
          // Positioned(bottom: 104 - 34, right: 40, width: 66, height: 66, child: rectangle),
        ],
      ),
    );
  }

  @override
  Widget foreground() {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: 12,
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
            top: 274,
            right: 42,
            child: Image.asset(IMG.format('intro/room/0'), scale: 3, fit: BoxFit.contain),
          ),
          Positioned(
            right: 20,
            bottom: 143,
            child: Image.asset(IMG.format('intro/room/1'), scale: 3, fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }
}
