part of 'event.dart';

//<editor-fold desc="消息事件">
class _MsgEvent extends Event {
  final V2TimMessage msg;

  _MsgEvent(this.msg);
}

class MsgStateEvent extends _MsgEvent {
  MsgStateEvent(super.msg);

  @override
  String toString() {
    return 'MsgStateEvent{msg: ${msg.toJson()}}';
  }
}

class NewMsgEvent extends _MsgEvent {
  NewMsgEvent(super.msg);
}
//</editor-fold>

//<editor-fold desc="单聊消息已读回执事件">
class C2CReadReceiptEvent extends Event {
  final List<V2TimMessageReceipt> receiptList;

  C2CReadReceiptEvent(this.receiptList);
}
//</editor-fold>

//<editor-fold desc="群事件">
class GroupEvent extends Event {
  final String groupId;

  GroupEvent(this.groupId);
}

class GroupKickedOffEvent extends GroupEvent {
  final String manager;
  final String to;

  GroupKickedOffEvent({required String groupId, required this.manager, required this.to}) : super(groupId);
}

class GroupDismissedEvent extends GroupEvent {
  GroupDismissedEvent({required String groupId}) : super(groupId);
}

class GroupQuitedEvent extends GroupEvent {
  GroupQuitedEvent({required String groupId}) : super(groupId);
}
//</editor-fold>
