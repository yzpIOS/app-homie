import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
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

  final List<GuildLevelInfoModel> guildLevelInfoModelList =
      <GuildLevelInfoModel>[
    GuildLevelInfoModel(
        levelString: '1星公会',
        fireString: '自然月音浪(火力)≥0紫钻',
        userCountString: '自然月有效主播人数≥10人',
        levelImageName: 'my/guild_center_level_star_1'),
        GuildLevelInfoModel(
            levelString: '2星公会',
            fireString: '自然月音浪(火力)≥5百万紫钻',
            userCountString: '自然月有效主播人数≥20人',
            levelImageName: 'my/guild_center_level_star_2'),
        GuildLevelInfoModel(
            levelString: '3星公会',
            fireString: '自然月音浪(火力)≥2千万紫钻',
            userCountString: '自然月有效主播人数≥30人',
            levelImageName: 'my/guild_center_level_star_3'),
        GuildLevelInfoModel(
            levelString: '4星公会',
            fireString: '自然月音浪(火力)≥5千万紫钻',
            userCountString: '自然月有效主播人数≥50人',
            levelImageName: 'my/guild_center_level_star_4'),
        GuildLevelInfoModel(
            levelString: '5星公会',
            fireString: '自然月音浪(火力)≥1亿紫钻',
            userCountString: '自然月有效主播人数≥100人',
            levelImageName: 'my/guild_center_level_star_5'),
  ];

  final GlobalKey anchorKey = GlobalKey();

  /// 点击房间信息
  void clickRoomInfo() {
    Get.to(() => const GuildInformationPage());
  }

  /// 点击返回
  void clickBack() {
    Get.back();
  }

  /// 点击公会等级
  void clickGuildLevel({required Offset anchorPoint,required int level}) {
    showDialog(
      barrierColor: Colors.transparent,
      context: Get.context!,
      builder: (context) {
        if(level < guildLevelInfoModelList.length) {
          return GuildLevelDialog(showAnchorPoint: anchorPoint, guildLevelInfoModel: guildLevelInfoModelList[level],);
        }else{
          return GuildLevelDialog(showAnchorPoint: anchorPoint, guildLevelInfoModel: guildLevelInfoModelList.last,);
        }
      },
      useSafeArea: false,
    );
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

    }
  }
}
