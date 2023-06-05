import 'package:app/event/event.dart';
import 'package:app/model/enum/room_event_type.dart';
import 'package:app/store/mq_ctrl.dart';
import 'package:app/tools.dart';

class RoomMsgCtrl extends GetxController {
  final MqCtrl mq;
  final int roomId;
  final String subKey;

  RoomMsgCtrl(this.roomId)
      : subKey = MqCtrl.exchange('online_message_topic/room.$roomId.#.app.#'),
        mq = Get.find<MqCtrl>();

  final _createMap = <RoomEventType, RoomEvent Function(Map)?>{
    RoomEventType.updateHotCount: UpdateHotCountEvent.new,
    RoomEventType.userIn: UserInEvent.new,
    RoomEventType.userOut: UserOutEvent.new,
    RoomEventType.inviteMicUp: InviteMicUpEvent.new,
    RoomEventType.micUp: MicUpEvent.new,
    RoomEventType.micDown: MicDownEvent.new,
    RoomEventType.notice: NoticeEvent.new,
    RoomEventType.msgTxt: MsgTxtEvent.new,
    RoomEventType.gift: GiftEvent.new,
    RoomEventType.managerSet: AdminSetEvent.new,
    RoomEventType.micApply: MicApplyEvent.new,
    RoomEventType.micEnable: (it) => MicStateEvent(it, false),
    RoomEventType.micDisabled: (it) => MicStateEvent(it, true),
    RoomEventType.micReject: null,
    RoomEventType.userBlock: UserBlockEvent.new,
    RoomEventType.closeLive: RoomCloseEvent.new,
    RoomEventType.updateUserLevel: UserLevelUpEvent.new,
    RoomEventType.updateCharmLevel: UserCharmUpEvent.new,
  };

  @override
  void onInit() {
    super.onInit();

    mq.sub(
      subKey,
      onData: onData,
      onReSub: () => RoomReConnectEvent(roomId).fire(),
    );
  }

  @override
  void onClose() {
    mq.unSub(subKey);

    super.onClose();
  }

  void onData(Map event) {
    final type = RoomEventType.fromVal(event['code']);

    assert(_createMap.containsKey(type), '数据错误 -> $event');

    _createMap[type]?.also(
      (fn) {
        final _event = fn(event['data']);

        if (_event is InRoomEvent) {
          if (_event.roomId == roomId) {
            _event.fire();
          } else {
            assert(false, '数据错误 -> $event');
          }
        } else {
          _event.fire();
        }
      },
    );
  }
}
