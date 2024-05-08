
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/guild_level_dialog.dart';
import 'package:app/ui/my/guild_center/guild_level_info_model.dart';
import 'package:app/ui/my/my_guild/guild_flows_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

/// 我的公会控制器
class MyGuildCenterController extends GetxController {

  /// 点击公会流水
  void clickGuildFlows(){
    Get.to(() => const GuildFlowsPage());
  }
}