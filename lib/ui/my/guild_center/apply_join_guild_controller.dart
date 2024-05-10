
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/model/guild_model.dart';

/// 申请加入公会控制器
class ApplyJoinGuildController extends GetxController {
  /// 公会编号
  final String guildNumber;
  ApplyJoinGuildController({required this.guildNumber});
  /// 是否加载数据
  final loadedData = false.obs;
  /// 公会信息
  final guildModel = GuildModel().obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  /// 加载数据
  void loadData() {
    Future.delayed(const Duration(microseconds:200),(){
      simpleTry(
              () => Api.Guild.getGuildInfo(guildNumber: guildNumber),
          showProgress: true,
          callback: (resp) {
            loadedData.value = true;
            if (resp != null && resp is Map) {
              final model = GuildModel.fromJson(resp);
              guildModel.value = model;
            }
          });
    });
  }

  /// 点击申请加入公会
  void clickApplyJoinGuild() {
    Future.delayed(const Duration(microseconds:200),(){
      simpleTry(
              () => Api.Guild.applyJoinGuild(guildNumber: guildNumber),
          showProgress: true,
          callback: (resp) {
                showToast("申请成功");
                Get.back();
          });
    });
  }
}