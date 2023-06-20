import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/event/event.dart';
import 'package:app/model/enum/room_event_type.dart';
import 'package:app/store/mq_ctrl.dart';
import 'package:app/tools.dart';
import 'package:protobuf/protobuf.dart';

class RoomMsgCtrl extends GetxController {
  final MqCtrl mq;
  final int roomId;
  final String subKey;

  RoomMsgCtrl(this.roomId)
      : subKey = MqCtrl.exchange('online_message_topic/room.$roomId.#.app.#'),
        mq = Get.find<MqCtrl>();

  final _createMap = <RoomEventType, RoomEvent Function(Map)?>{
    RoomEventType.updateHotCount: UpdateHotCountEvent.new,
    // 用户进入1
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
    RoomEventType.micEnable: (it) => MicStateEvent(it, false),
    RoomEventType.micDisabled: (it) => MicStateEvent(it, true),
    RoomEventType.micReject: null,
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
