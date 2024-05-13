
import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/model/guild_model.dart';
import 'package:app/ui/my/my_guild/anchor_list_page.dart';
import 'package:app/ui/my/my_guild/guild_flows_page.dart';

/// 我的公会控制器
class MyGuildCenterController extends GetxController with BusGetLifeMixin{
  /// 公会信息
  final GuildModel guildModel;
  MyGuildCenterController({required this.guildModel});

  /// 主播申请数量
  final anchorApplyCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadGuildAnchorApplyCount();

    /// 处理公会主播申请事件
    on<HandleGuildAnchorApplyEvent>(
          (_) {
        int count = anchorApplyCount.value;
        count--;
        if(count <= 0){
          count = 0;
        }
        anchorApplyCount.value = count;
      },
    );
  }

  /// 加载公会主播申请数量
  void loadGuildAnchorApplyCount(){
    Future.delayed(const Duration(microseconds: 300),(){
      simpleTry(
              () => Api.Guild.getGuildAnchorApplyCount(), callback: (result) {
        if(result != null && result is Map){
          final int total = result['total'];
          anchorApplyCount.value = total;
        }
      });
    });
  }

  /// 点击公会流水
  void clickGuildFlows(){
    Get.to(() => const GuildFlowsPage());
  }

  /// 点击主播列表
  void clickAnchorList(){
    Get.to(() => const AnchorListPage());
  }
}