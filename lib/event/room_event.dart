part of 'event.dart';

mixin UidMixin<T extends Map> on RoomEvent<T> {
  late final UID uid = data['uid'];
  late final NUID nUid = data['role_id'];
}

class RoomReConnectEvent extends Event {
  final int roomId;

  RoomReConnectEvent(this.roomId);
}

class RoomEvent<T> extends Event {
  final T data;

  const RoomEvent(this.data);
}

class InRoomEvent<T extends Map> extends RoomEvent<T> {
  InRoomEvent(super.data);

  late final int roomId = data['room_id'];
}

class UserTotalEvent extends InRoomEvent<Map> with UidMixin {
  UserTotalEvent(super.data);

  late final int total = data['total'];
}

class UserInEvent extends UserTotalEvent with UidMixin {
  UserInEvent(super.data);
}

class UserOutEvent extends UserTotalEvent with UidMixin {
  UserOutEvent(super.data);
}

class _MicEvent extends InRoomEvent<Map> with UidMixin {
  _MicEvent(super.data);

  late final int micId = data['mike_id'];
  late final String micNo = data['mike_no'];
}

class InviteMicUpEvent extends _MicEvent {
  InviteMicUpEvent(super.data);
}

class MicUpEvent extends _MicEvent {
  MicUpEvent(super.data);

  late final bool isMute = data['open_status'] == 2;
  late final int hotCount = data['number'] ?? 0;
  late final String? oldMicNo = data['old_mike_no'];

  @override
  String toString() {
    return 'MicUpEvent{data: $data}';
  }
}

class MicDownEvent extends _MicEvent {
  MicDownEvent(super.data);

  @override
  String toString() {
    return 'MicDownEvent{data: $data}';
  }
}

class MicApplyEvent extends _MicEvent {
  MicApplyEvent(super.data);

  @override
  String toString() {
    return 'MicApplyEvent{data: $data}';
  }
}

class MicStateEvent extends _MicEvent {
  final bool isMute;

  MicStateEvent(super.data, this.isMute);

  @override
  String toString() {
    return 'MicStateEvent{isMute: $isMute data: $data}';
  }
}

class NoticeEvent extends InRoomEvent<Map> {
  NoticeEvent(super.data);
}

class MsgTxtEvent extends InRoomEvent<Map> with UidMixin {
  MsgTxtEvent(super.data);

  late final String txt = data['message'];
}

class GiftEvent extends InRoomEvent<Map> {
  GiftEvent(super.data);

  late final UID uid = data['send_uid'];

  late final NUID nuid = data['role_id'];
}

//1
class AdminSetEvent extends InRoomEvent<Map> with UidMixin {
  AdminSetEvent(super.data);

  late final bool isAdd = data['status'] == 1;
}

//1
class UpdateHotCountEvent extends InRoomEvent<Map> {
  UpdateHotCountEvent(super.data);
}

// 1
class RoomCloseEvent extends InRoomEvent {
  RoomCloseEvent(super.data);
}

//1
class UserBlockEvent extends InRoomEvent with UidMixin {
  UserBlockEvent(super.data);
}

//1
class UserLevelUpEvent extends RoomEvent<Map> with UidMixin {
  UserLevelUpEvent(super.data);

  late final String level = data['level'];
}

//1
class UserCharmUpEvent extends RoomEvent<Map> with UidMixin {
  UserCharmUpEvent(super.data);

  late final String level = data['charm_level'];
}

class RoomAtEvent extends Event {
  final String nickName;

  RoomAtEvent(this.nickName);
}
