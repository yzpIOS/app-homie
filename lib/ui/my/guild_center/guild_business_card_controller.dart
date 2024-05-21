import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/apply_join_guild_page.dart';
import 'package:app/ui/my/guild_center/guild_center_page_controller.dart';
import 'package:app/ui/my/guild_center/guild_information_page.dart';
import 'package:app/ui/my/guild_center/model/guild_model.dart';
import 'package:app/ui/my/real_identity_1_page.dart';
import 'package:app/ui/room/model/room_info_model.dart';
import 'package:app/ui/room/persion/common_dialog.dart';
import 'package:flutter/material.dart';

/// 公会名片控制器
class GuildBusinessCardController extends GetxController with BusGetLifeMixin {
  /// 公会信息
  final GuildModel guildModel;
  GuildBusinessCardController({required this.guildModel});
  /// 公会房间列表
  RxList<RoomInfoModel> roomList = <RoomInfoModel>[].obs;
  /// 用户是否加入公会
  bool userIsExistGuild = false;

  @override
  void onInit() {
    super.onInit();
    userIsExistGuild = Get.find<GuildCenterPageController>().userIsExistGuild.value;
    loadData();
  }

  /// 加载数据
  void loadData() {
    Future.delayed(const Duration(microseconds:200),(){
      simpleTry(
              () => Api.Room.getGuildRoomList(guildNumber:guildModel.guildNo ?? ""),
          showProgress: true,
          callback: (resp) {
            if (resp != null && resp is List) {
              final List itemList = resp;
              final List<RoomInfoModel> roomInfoModelList = [];
              for (final Map item in itemList) {
                final roomInfoModel = RoomInfoModel.fromJson(item);
                roomInfoModelList.add(roomInfoModel);
              }
              roomList.addAll(roomInfoModelList);
            }
          });
    });
  }

  /// 点击房间信息
  void clickRoomInfo() {
    Get.to(() => GuildInformationPage(
          guildNumber: guildModel.guildNo ?? '',
        ));
  }

  /// 点击返回
  void clickBack() {
    Get.back();
  }

  /// 点击申请加入公会
  void clickApplyJoinGuild() {
    if (!OAuthCtrl.isNameValidate) {
      // 未实名，就去实名
      showDialog(
          context: Get.context!,
          builder: (context) {
            return CommonDialog(
                title: "申请公会需实名认证",
                confirmLabel: "去实名",
                confirm: () async {
                  // 未认证，去认证
                  await Get.to(() => const RealIdentity1Page());
                  // 更新用户数据
                  await OAuthCtrl.ins.udpateUserInfo();
                  // 未实名，直接返回
                  if (!OAuthCtrl.isNameValidate) {
                    return;
                  }
                });
          });
    } else {
      Get.to(() => ApplyJoinGuildPage(
            guildNumber: guildModel.guildNo ?? '',
          ));
    }
  }
}
