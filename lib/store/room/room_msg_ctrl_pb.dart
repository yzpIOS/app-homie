import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/event/room_event_pb.dart';
import 'package:app/tools.dart';
import 'package:protobuf/protobuf.dart';

class RoomMsgCtrlPb extends GetxController {
  final int roomId;

  RoomMsgCtrlPb({required this.roomId});

  final _createMap = <int, RoomEvent Function()>{
    // 房间计数器广播 【对应旧mq类型：18】
    CMD.S_AccMikeBroadcast: UpdateHotCountEvent.new,
    // 用户进入1
    CMD.S_JoinBroadcast: UserInEvent.new,
    // 用户退出
    CMD.S_LeaveBroadcast: UserOutEvent.new,
    // 邀请上麦
    CMD.S_InviteMikeBroadcast: InviteMicUpEvent.new,
    // 上麦
    CMD.S_UpMikeBroadcast: MicUpEvent.new,
    // 下麦
    CMD.S_DownMikeBroadcast: MicDownEvent.new,
    // 修改房间公告
    CMD.S_NoticeBroadcast: NoticeEvent.new,
    CMD.S_ChatMessageBroadcast: RoomChatMessageEvent.new,
    // CMD.msgTxt: MsgTxtEvent.new,
    // 礼物
    CMD.S_GiftPlay: GiftEvent.new,
    // 设置管理员
    CMD.S_AdministratorBroadcast: AdminSetEvent.new,
    // 申请上麦
    CMD.S_ApplyUpMikeBroadcast: MicApplyEvent.new,
    // 开麦
    CMD.S_OpenBroadcast: MicOpenEvent.new,
    // 下麦
    CMD.S_CloseMikeBroadcast: MicCloseEvent.new,
    // 把用设设置成黑名单
    CMD.S_BlackBroadcast: UserBlockEvent.new,
    // 关闭房间
    CMD.S_LiveStopBroadcast: RoomCloseEvent.new,
    // 用户等级
    CMD.S_UpdateLevel: UserLevelUpEvent.new,
    // 魅力待级
    CMD.S_UpdateCharmLevel: UserCharmUpEvent.new,
  };

  @override
  void onInit() {
    super.onInit();
    SocketCtrl.ins.onData(onReceive);
    SocketCtrl.ins.addClientConnect(onConnected);
  }

  @override
  void onClose() {
    SocketCtrl.ins.removeOnData(onReceive);
    SocketCtrl.ins.removeClientConnect(onConnected);
    super.onClose();
  }

  ///
  /// 接收到tcp数据
  ///
  void onReceive(int cmd, GeneratedMessage? generatedMessage) {
    _createMap[cmd]?.call().myFire(generatedMessage);
  }

  ///
  /// 发送重新连接事件
  ///
  void onConnected() {
    RoomReConnectEvent(roomId).fire();
  }
}
