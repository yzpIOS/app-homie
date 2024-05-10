
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/model/guild_model.dart';

/// 公会信息控制器
class GuildInformationController extends GetxController {
  /// 公会编号
  final String guildNumber;
  GuildInformationController({required this.guildNumber});
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

  /// 点击复制
  void clickCopy() {
    copyTxt(guildModel.value.guildNo ?? '');
  }
}