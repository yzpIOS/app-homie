import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/guild_business_card_page.dart';
import 'package:flutter/material.dart';

/// 公会中心列表控制器
class GuildCenterListController extends GetxController {
  final textController = TextEditingController();
  final keywordRx = RxnString();
  final ScrollController scrollController = ScrollController();
  final List dataList = ['','','','','','','','','','','',''].obs;

  /// 点击列表项
  void clickItem(int index) {
    Get.to(() => const GuildBusinessCardPage());
  }
}