import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/room/room_mic_ctrl.dart';
import 'package:app/store/room/room_rtc_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';

T sceneMicCtrl<T extends SceneMicCtrl>() {
  if(RoomManagerCtrl.ins.sceneCtrl2 is RoomCtrl) {
    var micCtrl = RoomManagerCtrl.ins.sceneCtrl.getRoomMicCtrl();
    if(micCtrl is SceneMicCtrl) {
      return micCtrl as T;
    }
  }
  return Get.find<T>();
}

abstract class SceneMicCtrl extends GetxController with GetDisposableMixin {
  late final RoomRtcCtrl rtcCtrl;

  bool canSpeakRx(UID uid);

  @override
  void onInit() {
    super.onInit();

    onRtcInit(rtcCtrl = bindGet(RoomRtcCtrl()));
  }

  Future<void> doRefresh();

  void onRtcInit(RoomRtcCtrl rtc);

  List<MicInfo> get simpleUserList => [];
}
