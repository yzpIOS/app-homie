import 'package:app/event/event.dart';
import 'package:app/store/room/room_rtc_ctrl.dart';
import 'package:app/store/room/scene_mic_ctrl.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/tools.dart';

class SquareMicCtrl extends SceneMicCtrl with BusGetLifeMixin {
  final dataRx = Rxn<String>();

  @override
  void onInit() {
    super.onInit();

    on<XUnityEvent>(
      test: (event) => event.code == Unity2AppEnum.UTF_DETECT_BUILDING && event.ext['type'] == 1,
      (event) {
        final String id = event.ext['buildingID'];

        //进入聊天区域
        if (event.ext['isClose'] == true) {
          assert(dataRx.isNull());

          dataRx(id);
        } else {
          assert(!dataRx.isNull());

          dataRx.nil();
        }
      },
    );

    bindWorker(
      ever(dataRx, (it) {
        if (it == null) {
          rtcCtrl.leaveRoom();
        } else {
          rtcCtrl.joinRoom(roomId: it);
        }
      }),
    );
  }

  @override
  bool canSpeakRx(String uid) => !dataRx.isNull();

  @override
  void onRtcInit(RoomRtcCtrl rtc) {}
}
