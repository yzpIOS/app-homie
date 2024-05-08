import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

/// 公会等级介绍弹窗
class GuildLevelIntroduceDialog extends StatelessWidget {
  const GuildLevelIntroduceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.black.withAlpha(80),
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            left: (Get.width - 300)/2.0,
            top: (Get.height - 306)/2.0,
            child:
                Image.asset(IMG.format('my/guild_center_level_introduce_icon'),width: 300,height: 306,),
          ),
          Positioned(
            left: (Get.width - 28)/2.0,
            top: (Get.height - 306)/2.0 + 306 + 20,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              behavior: HitTestBehavior.translucent,
              child: Image.asset(IMG.format("room/game/turntable_rule_close"), width: 28, height: 28,),
            ),
          ),
        ],
      ),
    );
  }
}
