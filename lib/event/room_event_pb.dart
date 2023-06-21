
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/tools/bus.dart';
import 'package:protobuf/protobuf.dart';

class EventPb {
  String get name => '$runtimeType';

  const EventPb();

  void fire() => Bus.fire(this);

  @override
  String toString() {
    return '$runtimeType{name:$name}';
  }
}

class RoomEvent<T extends GeneratedMessage> extends EventPb {
  T? data;

  void myFire(T? msg) {
    data = msg;
    fire();
  }
}

// 用户进入房间
class UserInEvent extends RoomEvent<S_JoinBroadcast> {
}

// 用户退出房间
class UserOutEvent extends RoomEvent<S_LeaveBroadcast> { }

// 房间关闭
class RoomCloseEvent extends RoomEvent<S_LiveStopBroadcast> { }

// 上麦
class MicUpEvent extends RoomEvent<S_UpMikeBroadcast> { }

// 下麦
class MicDownEvent extends RoomEvent<S_DownMikeBroadcast> { }

// 房间公告
// S_NoticeBroadcast
class NoticeEvent extends RoomEvent<S_NoticeBroadcast> {
}

// 黑名单
// S_BlackBroadcast = 2250
class UserBlockEvent extends RoomEvent<S_BlackBroadcast> {
}


// 房间聊天
class RoomChatMessageEvent extends RoomEvent<S_ChatMessageBroadcast> {
}

// 房间计数器S_AccMikeBroadcast
class RoomAacMikeEvent extends RoomEvent<S_AccMikeBroadcast> {
}

// 魅力等级提升广播（对应mq的19）
class UserCharmUpEvent extends RoomEvent<S_UpdateCharmLevel> {
}

// 等级提升广播（对应mq的16）
class UserLevelUpEvent extends RoomEvent<S_UpdateLevel> {
}

// 礼物播放广播(对应mq的8)
class GiftEvent extends RoomEvent<S_GiftPlay> {
}

// 房间管理员设置
class AdminSetEvent extends RoomEvent<S_AdministratorBroadcast> {
}

// 申请上麦
class MicApplyEvent extends RoomEvent<S_ApplyUpMikeBroadcast> {
}

// 邀请上麦
class InviteMicUpEvent extends RoomEvent<S_InviteMikeBroadcast> {
}

// 开麦
class MicOpenEvent extends RoomEvent<S_OpenBroadcast> {
}

// 下麦
class MicCloseEvent extends RoomEvent<S_CloseMikeBroadcast> {
}

// socket状态回调
class RoomReConnectEvent extends EventPb {
  final int roomId;
  RoomReConnectEvent(this.roomId);
}

// 房间计数器广播 【对应旧mq类型：18】
class UpdateHotCountEvent extends RoomEvent<S_AccMikeBroadcast> {
}


class MsgTxtEvent extends RoomEvent<S_AccMikeBroadcast> {
}

// ?
class RoomAtEvent extends EventPb {
  final String nickName;

  RoomAtEvent(this.nickName);
}