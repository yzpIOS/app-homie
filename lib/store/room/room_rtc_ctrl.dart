import 'package:app/3rd/tencent/keys.dart';
import 'package:app/3rd/tencent/rtc.dart';
import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/event/event.dart';
import 'package:app/store/im/im_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';

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
        debugPrint("用户被禁；userInfo = ${event?.data?.toString()}");
        return OAuthCtrl.isSelf(event.uid);
      },
      (_) => leaveRoom(),
    );

    post(() async{
      SocketCtrl.ins.onDataCmd(CMD.S_GoToRoom, goToRoom);
      SocketCtrl.ins.onDataCmd(CMD.S_InFreeMikesArea, inFreeMikesArea);

      SocketCtrl.ins.onDataCmd(CMD.C_GoAwayRoom, outRoom);
      SocketCtrl.ins.onDataCmd(CMD.C_OutFreeMikesArea, outFreeMikesArea);
    });
  }

  ///
  /// 加入到房间
  ///
  void goToRoom(int cmd, S_GoToRoom? data) {
    if(data == null) {
      return;
    }
    joinRoom(roomId: data.roomId.toInt().toString());
  }

  ///
  /// 加入到房间
  ///
  void outRoom(int cmd, C_GoAwayRoom? data) {
    if(data == null) {
      return;
    }
    leaveRoom();
    S_GoAwayRoom s_goAwayRoom = S_GoAwayRoom(buildingId: data.buildingId);
    SocketCtrl.ins.sendUnity(CMD.S_GoAwayRoom, message: s_goAwayRoom);
  }

  ///
  /// 加入到房间
  ///
  void inFreeMikesArea(int cmd, S_GoToRoom? data) {
    if(data == null) {
      return;
    }
    joinRoom(roomId: data.roomId.toInt().toString());
  }

  ///
  /// 退出房间
  ///
  void outFreeMikesArea(int cmd, C_OutFreeMikesArea? data) {
    leaveRoom();
    // 通知unity收到消息
    SocketCtrl.ins.sendUnity(CMD.S_OutFreeMikesArea);
  }

  @override
  void onClose() {
    leaveRoom();
    SocketCtrl.ins.removeOnDataCmd(CMD.S_GoToRoom, goToRoom);
    SocketCtrl.ins.removeOnDataCmd(CMD.S_InFreeMikesArea, inFreeMikesArea);

    SocketCtrl.ins.removeOnDataCmd(CMD.C_GoAwayRoom, outRoom);
    SocketCtrl.ins.removeOnDataCmd(CMD.C_OutFreeMikesArea, outFreeMikesArea);

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
