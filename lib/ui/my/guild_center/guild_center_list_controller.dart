import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/guild_business_card_page.dart';
import 'package:app/ui/my/guild_center/model/guild_model.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

/// 公会中心列表控制器
class GuildCenterListController extends GetxController {
  /// 搜索框控制器
  final textController = TextEditingController();
  /// 搜索关键字
  final keywordRx = RxnString();
  /// 滚动控制器
  final ScrollController scrollController = ScrollController();
  /// 数据列表
  final List<GuildModel> dataList = <GuildModel>[].obs;
  /// 是否加载数据
  final loadedData = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  /// 加载数据
  void loadData() async {
    final List itemList = await Api.Guild.guildRankList(page: const PageNum());
    loadedData.value = true;
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