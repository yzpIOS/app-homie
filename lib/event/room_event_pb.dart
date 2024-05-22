part of 'event.dart';

class EventPb {
  String get name => '$runtimeType';

  EventPb();

  Future<void> fire() async {
    if(delayFire > 0) {
      await Future.delayed(Duration(milliseconds: delayFire));
    }
    Bus.fire(this);
  }

  @override
  String toString() {
    return '$runtimeType{name:$name}';
  }

  int delayFire = 0;
}

class RoomInfoEvent extends EventPb {
  S_SyncRoomInfo? s_syncRoomInfo;

  RoomInfoEvent(this.s_syncRoomInfo);
}

abstract class RoomEvent<T extends GeneratedMessage> extends EventPb {
  T? data;

  UID? get uid => null;

  NUID? get nuid => null;

  int? get status => null;

  NUID? get roleId => null;
  // int? get status => null;

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

  @override
  int delayFire = 250;
}


// 用户进入房间
class UserInEvent2 extends UserTotalEvent<S_JoinBroadcast> {
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

  late final bool isMute = data?.status == 3;
  late final int hotCount = 0;
}


// 盲盒事件
class BlindBoxEvent extends RoomEvent<S_BlindBox> {
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

// 幸运广播
class LuckScreenEvent extends RoomEvent<S_LuckScreen> {
}

// 全服广播
class AllRoomEvent extends RoomEvent<S_AllScreen> {
}

// 世界频道聊天
class WorldChatMessageBroadcastEvent extends RoomEvent<S_WorldChatMessageBroadcast> {
}

//  清除公屏广播
class ClearScreenBroadcastEvent extends RoomEvent<S_ClearScreenBroadcast> {
}

//  加入房间场景反馈结果
class JoinSceneEvent extends RoomEvent<S_JoinScene> {
  UID? get userId => data?.userId;
  int? get sdkAppId => data?.sdkAppId;
  UID? get userSig => data?.userSig;
}

// class BanChatBroadcast extends RoomEvent<S_BanChatBroadcast> {
// }

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


// 拒绝上麦
class RefuseUpEvent extends RoomEvent<S_RefuseUpMikeBroadcast> {
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

// 房间禁言广播
class MikeSpeakingEvent extends RoomEvent<S_MikeSpeakingBroadcast> {

  @override
  UID? get uid => data?.uid;

  @override
  NUID? get nuid => data?.roomId;

   @override
   int? get status => data?.status;

  @override
   NUID? get roleId => data?.roleId;
}

// 个人房开麦结算
class LiveStopSettlementEvent extends RoomEvent<S_LiveStopSettlementBroadcast> {

}