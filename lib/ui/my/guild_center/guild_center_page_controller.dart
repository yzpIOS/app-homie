import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/guild_center_list_page.dart';
import 'package:app/ui/my/guild_center/model/guild_model.dart';
import 'package:app/ui/my/my_guild/my_guild_center_page.dart';
import 'package:flutter/material.dart';

/// 公会中心控制器
class GuildCenterPageController extends GetxController {
  /// tabs
  late Map<String, Widget> tabs = {};

  /// 是否检查过用户是否加入公会
  final checkExistGuild = false.obs;

  /// 用户是否加入公会
  final userIsExistGuild = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  /// 加载数据
  void loadData() {
    Future.delayed(const Duration(microseconds: 200), () {
      simpleTry(() => Api.Guild.getGuildInfo(guildNumber: ""),
          showProgress: true, callback: (resp) {
        checkExistGuild.value = true;
        if (resp != null && resp is Map && resp.isNotEmpty) {
          final guildModel = GuildModel.fromJson(resp);
          final existGuild = guildModel.anchorType != null &&
              guildModel.anchorType! > 0;
          existGuild
              ? tabs = {
                  '公会中心': const GuildCenterListPage(),
                  '我的公会': MyGuildCenterPage(guildModel: guildModel),
                }
              : tabs = {'公会中心': const GuildCenterListPage()};
          userIsExistGuild.value = existGuild;
        } else {
          tabs = {'公会中心': const GuildCenterListPage()};
          userIsExistGuild.value = false;
        }
      });
    });
  }
}
