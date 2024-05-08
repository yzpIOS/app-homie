import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/apply_join_guild_page.dart';
import 'package:app/ui/my/guild_center/guild_information_page.dart';
import 'package:app/ui/my/guild_center/guild_level_dialog.dart';
import 'package:app/ui/my/guild_center/guild_level_info_model.dart';
import 'package:app/ui/my/real_identity_1_page.dart';
import 'package:app/ui/room/persion/common_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

/// 公会名片控制器
class GuildBusinessCardController extends GetxController {
  final List<String> roomList = <String>[
    '相亲',
    '男神',
    '女神',
    '点唱',
    '相亲',
    '男神',
    '相亲',
    '男神',
    '女神',
    '点唱',
    '相亲',
    '男神'
  ];




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
    Get.to(() => const ApplyJoinGuildPage());

    // if(!OAuthCtrl.isNameValidate){
    //   // 未实名，就去实名
    //   showDialog(context: Get.context!, builder: (context) {
    //     return CommonDialog(title: "申请公会需实名认证",confirmLabel: "去实名", confirm:  () async {
    //       // 未认证，去认证
    //       await Get.to(() => const RealIdentity1Page());
    //       // 更新用户数据
    //       await OAuthCtrl.ins.udpateUserInfo();
    //       // 未实名，直接返回
    //       if(!OAuthCtrl.isNameValidate) {
    //         return;
    //       }
    //     });
    //   });
    // }else{
    //   Get.to(() => const ApplyJoinGuildPage());
    // }
  }
}
