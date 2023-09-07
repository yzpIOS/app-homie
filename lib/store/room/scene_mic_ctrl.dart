import 'package:app/store/room/room_mic_ctrl.dart';
import 'package:app/store/room/room_rtc_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';

T sceneMicCtrl<T extends SceneMicCtrl>() => Get.find<SceneMicCtrl>() as T;

abstract class SceneMicCtrl extends GetxController with GetDisposableMixin {
  late final RoomRtcCtrl rtcCtrl;

  bool canSpeakRx(UID uid);

  @override
  void onInit() {
    super.onInit();

    onRtcInit(rtcCtrl = bindGet(RoomRtcCtrl()));
  }

  void onRtcInit(RoomRtcCtrl rtc);
}
