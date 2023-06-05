import 'package:app/event/event.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/room/chat/msg_adapter/index.dart';
import 'package:flutter/widgets.dart';

class RoomChatCtrl extends GetxController with BusGetLifeMixin {
  final int roomId;

  RoomChatCtrl(this.roomId);

  final dataRx = RxList<Widget>();

  @override
  void onInit() {
    super.onInit();

    final sendCmd2Unity = Get.find<UnityCtrl>().sendCmd;

    on<MsgTxtEvent>((data) {
      final uid = data.uid;
      final txt = data.txt;

      sendCmd2Unity(App2UnityEnum.FTU_IPUTFIELDCONTENT, data: {'uid': uid, 'content': txt});

      dataRx.add(
        TxtMsgView(
          TxtMsgData(uid: uid, data: txt),
        ),
      );
    });

    on<UserInEvent>((data) {
      dataRx.add(
        UserInMsgView(
          UserInMsgData(uid: data.uid),
        ),
      );
    });

    on<NoticeEvent>((data) {
      dataRx.add(
        NoticeMsgView(
          BaseMsgData<String>(data: data.data['message']),
        ),
      );
    });

    final findByUidX = Get.find<UserInfoCtrl>().findByUidX;

    on<GiftEvent>((data) async {
      final sendUid = data.uid;
      final ids = data.data['accept_uid_list'] as Iterable;

      final users = await findByUidX({sendUid, ...ids}, useNet: true);

      for (final uid in ids) {
        dataRx.add(
          GiftMsgView(
            GiftMsgAdapter(uid: sendUid, acceptUid: uid, users: users, data: data.data),
          ),
        );
      }
    });
  }
}
