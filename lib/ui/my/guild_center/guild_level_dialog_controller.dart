
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/guild_level_introduce_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

/// 公会等级弹窗控制器
class GuildLevelDialogController extends GetxController {

  /// 点击返回
  void clickBack() {
    Get.back();
  }

  /// 点击介绍
  void clickLevelIntroduce() {
    showDialog(
      barrierColor: Colors.transparent,
      context: Get.context!,
      builder: (context) {
        return const GuildLevelIntroduceDialog();
      },
      useSafeArea: false,
    );
  }
}