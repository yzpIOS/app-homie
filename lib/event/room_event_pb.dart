
import 'package:app/common/nets/socket/proto/Message.pb.dart';
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
class UserInEvent extends RoomEvent<S_OnlineBroadcast> {
}

// 用户退出房间
class UserOutEvent extends RoomEvent<S_OnlineBroadcast> { }

// 房间关闭
class RoomCloseEvent extends RoomEvent<S_LiveBroadcast> { }

// 上麦
class MicUpEvent extends RoomEvent<S_MikeBroadcast> { }

// 下麦
class MicDownEvent extends RoomEvent<S_MikeBroadcast> { }

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




class UpdateHotCountEvent extends RoomEvent<S_AccMikeBroadcast> {
}
class InviteMicUpEvent extends RoomEvent<S_AccMikeBroadcast> {
}
class MsgTxtEvent extends RoomEvent<S_AccMikeBroadcast> {
}
class GiftEvent extends RoomEvent<S_AccMikeBroadcast> {
}
class AdminSetEvent extends RoomEvent<S_AccMikeBroadcast> {
}
class MicApplyEvent extends RoomEvent<S_AccMikeBroadcast> {
}
class MicStateEvent extends RoomEvent<S_AccMikeBroadcast> {

  final bool isMute;

  MicStateEvent(this.isMute);
}
class UserLevelUpEvent extends RoomEvent<S_AccMikeBroadcast> {
}
class UserCharmUpEvent extends RoomEvent<S_AccMikeBroadcast> {
}
class RoomReConnectEvent extends EventPb {
  final int roomId;

  RoomReConnectEvent(this.roomId);
}
