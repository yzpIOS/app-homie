import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/guild_business_card_page.dart';
import 'package:app/ui/my/guild_center/guild_level_dialog.dart';
import 'package:app/ui/my/guild_center/guild_level_info_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

/// 公会中心列表控制器
class GuildCenterListController extends GetxController {
  final textController = TextEditingController();
  final keywordRx = RxnString();
  final ScrollController scrollController = ScrollController();
  final List dataList = ['','','','','',''].obs;

  /// 点击列表项
  void clickItem(int index) {
    Get.to(() => const GuildBusinessCardPage());
  }
}