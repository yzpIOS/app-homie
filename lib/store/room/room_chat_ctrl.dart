import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
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

    /// 显示系统公告消息
    on<SystemMsgEvent>((data) {
      data.systemMsgList.forEach((element) {
        dataRx.add(
          SystemMsgView(
            BaseMsgData<String>(data: element),
          ),
        );
      });
    });

    on<MsgTxtEvent>((data) {
      final uid = data.uid ?? "";
      final txt = data.data?.message ?? "";
      final nuid = data.data?.roleId;

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
        if(sendUid != value.uid && gift.type != 6) {//盲盒礼物不需要显示这条
          dataRx.add(
            GiftMsgView(
              GiftMsgAdapter(uid: sendUid, acceptUid: value.uid, nuid: value.nuid!, users: users, data: gift),
            ),
          );
        }
      });
    });

    // 多个礼物播放广播
    on<MoreGiftPlayEvent>((data) async {
      S_MoreGiftPlay? moreGift = data.data;
      if(moreGift == null) {
        return;
      }
      final List<S_GiftPlay>? items = data.items;
      if(items == null) {
        return;
      }
      S_GiftPlay? gift = items.first;
      final sendUid = gift.sendId;
      final ids = gift.acceptUidList ?? [];
      final users = await findByUidX({sendUid, ...ids}, useNet: true);
      users.forEach((key, value) {
        if(sendUid != value.uid) {
          dataRx.add(
            BlindBoxGiftOpenMsgView(
              BlindBoxGiftOpenMsgAdapter(uid: sendUid, acceptUid: value.uid, nuid: value.nuid!, users: users, data: moreGift),
            ),
          );
        }
      });

      // for(var i = 0; i < items.length; i ++) {
      //   S_GiftPlay? gift = items[i];
      //
      //   final sendUid = gift.sendId;
      //   final ids = gift.acceptUidList ?? [];
      //   final users = await findByUidX({sendUid, ...ids}, useNet: true);
      //   users.forEach((key, value) {
      //     if(sendUid != value.uid) {
      //       dataRx.add(
      //         BlindBoxGiftOpenMsgView(
      //           GiftMsgAdapter(uid: sendUid, acceptUid: value.uid, nuid: value.nuid!, users: users, data: gift, blindBoxName: data.blindBoxName),
      //         ),
      //       );
      //     }
      //   });
      // }
    });
  }
}
