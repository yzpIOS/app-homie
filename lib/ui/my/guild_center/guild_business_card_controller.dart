
import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/apply_join_guild_page.dart';
import 'package:app/ui/my/guild_center/guild_information_page.dart';
import 'package:app/ui/my/guild_center/model/guild_model.dart';
import 'package:app/ui/my/guild_center/model/guild_role_model.dart';
import 'package:app/ui/my/real_identity_1_page.dart';
import 'package:app/ui/room/model/room_info_model.dart';
import 'package:app/ui/room/persion/common_dialog.dart';
import 'package:flutter/material.dart';

/// 公会名片控制器
class GuildBusinessCardController extends GetxController {
  /// 公会信息
  final GuildModel guildModel;
  GuildBusinessCardController({required this.guildModel});
  /// 公会房间列表
  final List<RoomInfoModel> roomList = <RoomInfoModel>[].obs;
  /// 是否检查过用户是否加入公会
  final checkExistGuild = false.obs;
  /// 用户是否加入公会
  final userIsExistGuild = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
    checkUserIsExistGuild();
  }

  /// 加载数据
  void loadData() async {
    final List itemList = await Api.Room.getGuildRoomList(guildModel.guildNo ?? "");
    final List<RoomInfoModel> roomInfoModelList = [];
    for (final Map item in itemList){
      final roomInfoModel = RoomInfoModel.fromJson(item);
      roomInfoModelList.add(roomInfoModel);
    }
    roomList.addAll(roomInfoModelList);
  }

  /// 检查用户是否加入公会
  void checkUserIsExistGuild(){
    Api.Guild.checkUserIsExistGuild(guildNumber: guildModel.guildNo ?? "").then((value) {
      checkExistGuild.value = true;
      if(value != null){
        final guildRoleModel = GuildRoleModel.fromJson(value);
        userIsExistGuild.value = guildRoleModel.anchorType != null && guildRoleModel.anchorType! > 0;
      }else{
        userIsExistGuild.value = false;
      }
    });
  }

  /// 点击房间信息
  void clickRoomInfo() {
    Get.to(() => const GuildInformationPage());
  }

  /// 点击返回
  void clickBack() {
    Get.back();
  }

  /// 点击申请加入公会
  void clickApplyJoinGuild() {
    if(!OAuthCtrl.isNameValidate){
      // 未实名，就去实名
      showDialog(context: Get.context!, builder: (context) {
        return CommonDialog(title: "申请公会需实名认证",confirmLabel: "去实名", confirm:  () async {
          // 未认证，去认证
          await Get.to(() => const RealIdentity1Page());
          // 更新用户数据
          await OAuthCtrl.ins.udpateUserInfo();
          // 未实名，直接返回
          if(!OAuthCtrl.isNameValidate) {
            return;
          }
        });
      });
    }else{
      Get.to(() => ApplyJoinGuildPage(guildNumber: guildModel.guildNo ?? '',));
    }
  }
}
