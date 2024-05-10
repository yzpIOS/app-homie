
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/model/guild_model.dart';
import 'package:app/ui/my/my_guild/anchor_list_page.dart';
import 'package:app/ui/my/my_guild/guild_flows_page.dart';

/// 我的公会控制器
class MyGuildCenterController extends GetxController {
  /// 公会信息
  final GuildModel guildModel;
  MyGuildCenterController({required this.guildModel});

  /// 点击公会流水
  void clickGuildFlows(){
    Get.to(() => const GuildFlowsPage());
  }

  /// 点击主播列表
  void clickAnchorList(){
    Get.to(() => const AnchorListPage());
  }
}