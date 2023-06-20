import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/event/room_event_pb.dart';
import 'package:app/model/enum/room_event_type.dart';
import 'package:app/tools.dart';
import 'package:protobuf/protobuf.dart';

class RoomMsgCtrlPb extends GetxController {
  final int roomId;

  RoomMsgCtrlPb({required this.roomId});

  final _createMap = <RoomEventType, RoomEvent Function()>{
    RoomEventType.updateHotCount: UpdateHotCountEvent.new,
    // 用户进入
    RoomEventType.userIn: UserInEvent.new,
    // 用户退出
    RoomEventType.userOut: UserOutEvent.new,
    RoomEventType.inviteMicUp: InviteMicUpEvent.new,
    // 上麦
    RoomEventType.micUp: MicUpEvent.new,
    // 下麦
    RoomEventType.micDown: MicDownEvent.new,
    // 修改房间公告
    RoomEventType.notice: NoticeEvent.new,
    RoomEventType.msgTxt: MsgTxtEvent.new,
    // 礼物
    RoomEventType.gift: GiftEvent.new,
    // 设置管理员
    RoomEventType.managerSet: AdminSetEvent.new,
    RoomEventType.micApply: MicApplyEvent.new,
    // 禁麦
    RoomEventType.micEnable: () => MicStateEvent(false),
    RoomEventType.micDisabled: () => MicStateEvent(true),
    // 黑名单
    RoomEventType.userBlock: UserBlockEvent.new,
    // 关闭房间
    RoomEventType.closeLive: RoomCloseEvent.new,
    // 用户等级
    RoomEventType.updateUserLevel: UserLevelUpEvent.new,
    // 魅力待级
    RoomEventType.updateCharmLevel: UserCharmUpEvent.new,
  };

  @override
  void onInit() {
    super.onInit();
    SocketCtrl.getCtrl().onData(onReceive);
    SocketCtrl.getCtrl().addClientConnect(onConnected);
  }

  @override
  void onClose() {
    SocketCtrl.getCtrl().removeOnData(onReceive);
    SocketCtrl.getCtrl().removeClientConnect(onConnected);

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
