import 'package:app/3rd/tencent/keys.dart';
import 'package:app/3rd/tencent/rtc.dart';
import 'package:app/event/event.dart';
import 'package:app/store/im/im_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';

class RoomRtcCtrl extends GetxController with BusGetLifeMixin {
  late final _myUid = OAuthCtrl.uid;

  @override
  void onInit() async {
    super.onInit();

    await Rtc.init;

    _initListener();
  }

  void _initListener() {
    on<UserBlockEvent>(
      test: (event) {
        return OAuthCtrl.isSelf(event.uid);
      },
      (_) => leaveRoom(),
    );
  }

  @override
  void onClose() {
    leaveRoom();

    super.onClose();
  }

  Future<void> joinRoom({required String roomId}) async {
    await Rtc.init;
    await Rtc.leave(isJoinBefore: true);

    xlog('用户[$_myUid]准备加入房间 -> $roomId', type: LogType.RTC);

    final token = await Get.find<ImAuth>().fetchToken();

    await Rtc.rtcClient.enterRoom(
      TRTCParams(
        sdkAppId: appId,
        roomId: 0,
        strRoomId: roomId,
        userId: _myUid,
        userSig: token,
        role: TRTCCloudDef.TRTCRoleAudience,
      ),
      TRTCCloudDef.TRTC_APP_SCENE_VOICE_CHATROOM,
    );

    Rtc.micRx(false);
  }

  Future<void> leaveRoom() {
    Rtc.micRx(false);

    return Rtc.leave();
  }

  Future<void> setMicVol(double volume) => Rtc.rtcClient.setAudioCaptureVolume(volume.toInt());
}
