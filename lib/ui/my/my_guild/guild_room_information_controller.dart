
import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/tools/help.dart';
import 'package:app/ui/my/my_guild/guild_room_setting_page.dart';
import 'package:app/ui/room/model/room_info_model.dart';
import 'package:get/get.dart';

/// 公会房间信息
class GuildRoomInformationController extends GetxController with BusGetLifeMixin{
  int roomId;

  GuildRoomInformationController({required this.roomId});
  final roomInfoModel = RoomInfoModel().obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
    /// 处理房间直播状态事件
    on<RoomLiveStatusChangeEvent>((event) {
      roomInfoModel.value.status = event.isLive ? 1 : 2;
    });
  }

  /// 获取房间信息
  void loadData(){
    Future.delayed(const Duration(microseconds:200),(){
      simpleTry(
              () => Api.Room.info(roomId: roomId),
          showProgress: true,
          callback: (resp) {
            if (resp != null ) {
              final RoomInfoModel model = RoomInfoModel.fromJson(resp);
              roomInfoModel.value = model;
            }
          });
    });
  }

  /// 点击进入设置
  void clickRoomSetting(){
    Get.to(() => GuildRoomSettingPage(roomId: roomId,isOpen: roomInfoModel.value.status == 1,));
  }
}