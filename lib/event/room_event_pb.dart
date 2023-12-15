part of 'event.dart';

class EventPb {
  String get name => '$runtimeType';

  const EventPb();

  void fire() => Bus.fire(this);

  @override
  String toString() {
    return '$runtimeType{name:$name}';
  }
}

abstract class RoomEvent<T extends GeneratedMessage> extends EventPb {
  T? data;

  UID? get uid => null;

  NUID? get nuid => null;

  void myFire(T? msg) {
    data = msg;
    fire();
  }
}

abstract class UserTotalEvent<T extends GeneratedMessage> extends RoomEvent<T> {
  int? get total;
}

// 用户进入房间
class UserInEvent extends UserTotalEvent<S_JoinBroadcast> {
  UID? get uid => data?.uid;

  NUID? get nuid => data?.roleId;

  int? get total => data?.total;
}

// 用户退出房间
class UserOutEvent extends UserTotalEvent<S_LeaveBroadcast> {
  int? get total => data?.total;
}

// 房间关闭
class RoomCloseEvent extends RoomEvent<S_LiveStopBroadcast> { }

// 上麦
class MicUpEvent extends RoomEvent<S_UpMikeBroadcast> {

  UID? get uid => data?.uid;

  late final bool isMute = false;
  late final int hotCount = 0;
}

// 下麦
class MicDownEvent extends RoomEvent<S_DownMikeBroadcast> {
  UID? get uid => data?.uid;
}

// 房间公告
// S_NoticeBroadcast
class NoticeEvent extends RoomEvent<S_NoticeBroadcast> {
}

// 黑名单
// S_BlackBroadcast = 2250
class UserBlockEvent extends RoomEvent<S_BlackBroadcast> {
  UID? get uid => data?.uid;
}


// 房间聊天
class RoomChatMessageEvent extends RoomEvent<S_ChatMessageBroadcast> {
  UID? get uid => data?.uid;
}

// 房间计数器S_AccMikeBroadcast
class RoomAacMikeEvent extends RoomEvent<S_AccMikeBroadcast> {
}

// 魅力等级提升广播（对应mq的19）
class UserCharmUpEvent extends RoomEvent<S_UpdateCharmLevel> {
}

// 等级提升广播（对应mq的16）
class UserLevelUpEvent extends RoomEvent<S_UpdateLevel> {
  UID? get uid => data?.uid;
}

// 礼物播放广播(对应mq的8)
class GiftEvent extends RoomEvent<S_GiftPlay> {
  UID? get uid => data?.sendId;
  NUID? get nuid => data?.roleId;
}

// 多个礼物播放广播
class MoreGiftPlayEvent extends RoomEvent<S_MoreGiftPlay> {
  List<S_GiftPlay>? get items => data?.items;
  String? get blindBoxName => data?.blindBoxName;
  String? get blindBoxCover => data?.blindBoxCover;
}

// 房间管理员设置
class AdminSetEvent extends RoomEvent<S_AdministratorBroadcast> {

  UID? get uid => data?.uid;

  late final bool isAdd = data?.status == 1;
}

// 申请上麦
class MicApplyEvent extends RoomEvent<S_ApplyUpMikeBroadcast> {
  UID? get uid => data?.uid;
}

// 邀请上麦
class InviteMicUpEvent extends RoomEvent<S_InviteMikeBroadcast> {
  UID? get uid => data?.uid;
}

// 开麦
class MicOpenEvent extends RoomEvent<S_OpenBroadcast> {
  UID? get uid => data?.uid;
}

// 下麦
class MicCloseEvent extends RoomEvent<S_CloseMikeBroadcast> {
  UID? get uid => data?.uid;
}

// socket状态回调
class RoomReConnectEvent extends EventPb {
  final int roomId;
  RoomReConnectEvent(this.roomId);
}

// 房间计数器广播 【对应旧mq类型：18】
class UpdateHotCountEvent extends RoomEvent<S_AccMikeBroadcast> {
}


class MsgTxtEvent extends RoomEvent<S_ChatMessageBroadcast> {
  UID? get uid => data?.uid;
}

/// 房间系统公告
class SystemMsgEvent extends EventPb {
  final List systemMsgList;
  SystemMsgEvent(this.systemMsgList);
}

// ?
class RoomAtEvent extends EventPb {
  final String nickName;

  RoomAtEvent(this.nickName);
}

class RoomExitEvent extends EventPb {

  final String message;

  RoomExitEvent(this.message);
}

class LocalMsgEvent extends EventPb {
  LocalMsgData localMsgData;

  LocalMsgEvent(this.localMsgData);
}