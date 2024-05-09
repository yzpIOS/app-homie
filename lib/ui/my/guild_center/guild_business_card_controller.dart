
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/apply_join_guild_page.dart';
import 'package:app/ui/my/guild_center/guild_information_page.dart';
import 'package:app/ui/my/guild_center/model/guild_model.dart';
import 'package:app/ui/room/model/room_info_model.dart';

/// 公会名片控制器
class GuildBusinessCardController extends GetxController {
  final GuildModel guildModel;
  GuildBusinessCardController({required this.guildModel});
  final List<RoomInfoModel> roomList = <RoomInfoModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() async {
    final List itemList = await Api.Room.getGuildRoomList(guildModel.guildNo ?? "");
    final List<RoomInfoModel> roomInfoModelList = [];
    for (final Map item in itemList){
      final roomInfoModel = RoomInfoModel.fromJson(item);
      roomInfoModelList.add(roomInfoModel);
    }
    roomList.addAll(roomInfoModelList);
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
