
import 'package:app/ui/my/guild_center/guild_center_list_page.dart';
import 'package:app/ui/my/my_guild/my_guild_center_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

/// 公会中心控制器
class GuildCenterController extends GetxController {
  late Map <String, Widget> tabs = {};
  @override
  void onInit() {
    super.onInit();
    tabs = {
      '公会中心': const GuildCenterListPage(),
      '我的公会': const MyGuildCenterPage(),
    };
  }
}