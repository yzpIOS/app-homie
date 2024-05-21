
import 'package:app/net/api.dart';
import 'package:app/tools/help.dart';
import 'package:app/ui/room/model/room_info_model.dart';
import 'package:get/get.dart';

/// 公会房间信息
class GuildRoomInformationController extends GetxController {
  int roomId;

  GuildRoomInformationController({required this.roomId});
  final roomInfoModel = RoomInfoModel().obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

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
}