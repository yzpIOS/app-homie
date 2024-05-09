import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/guild_business_card_page.dart';
import 'package:app/ui/my/guild_center/model/guild_model.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

/// 公会中心列表控制器
class GuildCenterListController extends GetxController {
  final textController = TextEditingController();
  final keywordRx = RxnString();
  final ScrollController scrollController = ScrollController();
  final List<GuildModel> dataList = <GuildModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() async {
    final List itemList = await Api.Guild.guildRankList(page: const PageNum());
    final List<GuildModel> guildList = [];
    for (final Map item in itemList){
      final guildModel = GuildModel.fromJson(item);
      guildList.add(guildModel);
    }
    dataList.addAll(guildList);
  }

  /// 点击列表项
  void clickItem(int index) {
    Get.to(() => GuildBusinessCardPage(guildModel: dataList[index],));
  }
}