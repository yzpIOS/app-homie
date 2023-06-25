import 'package:app/common/nets/commons/proto/Message.pb.dart';
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
      final uid = data.uid ?? "";
      final txt = data.data?.message ?? "";
      final nuid = data.data?.roleId;

      sendCmd2Unity(App2UnityEnum.FTU_IPUTFIELDCONTENT, data: {'uid': uid, 'content': txt});

      dataRx.add(
        TxtMsgView(
          TxtMsgData(uid: uid, data: txt, nuid: nuid),
        ),
      );
    });

    on<UserInEvent>((data) {
      dataRx.add(
        UserInMsgView(
          UserInMsgData(uid: data.uid ?? "", nuid: data.data?.roleId),
        ),
      );
    });

    on<NoticeEvent>((data) {
      dataRx.add(
        NoticeMsgView(
          BaseMsgData<String>(data: data.data?.message ?? ""),
        ),
      );
    });

    final findByUidX = Get.find<UserInfoCtrl>().findByUidX;

    on<GiftEvent>((data) async {
      S_GiftPlay? gift = data.data;
      if(gift == null) {
        return;
      }
      final sendUid = data.uid;
      if(sendUid == null) {
        return;
      }
      final ids = data.data?.acceptUidList ?? [];

      final users = await findByUidX({sendUid, ...ids}, useNet: true);

      users.forEach((key, value) {
        if(sendUid != value.uid) {
          dataRx.add(
            GiftMsgView(
              GiftMsgAdapter(uid: sendUid, acceptUid: value.uid, nuid: value.nuid!, users: users, data: gift),
            ),
          );
        }
      });
    });
  }
}
