
import 'package:app/tools.dart';

/// 房间设置
class GuildRoomSettingController extends GetxController {
  int roomId;
  bool isOpen;
  GuildRoomSettingController({required this.roomId,required this.isOpen});

  final isOpenLive = false.obs;

  @override
  void onInit() {
    super.onInit();
    isOpenLive.value = isOpen;
  }

  /// 直播间运营状态
  void clickChangeOpenStatus(){
  }

  /// 更换直播间背景
  void clickChangeRoomBackground(){

  }
}