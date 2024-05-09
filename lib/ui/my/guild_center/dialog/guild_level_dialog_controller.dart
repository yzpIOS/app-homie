
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/dialog/guild_level_introduce_dialog.dart';
import 'package:flutter/material.dart';

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