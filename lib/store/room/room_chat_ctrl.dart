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

    // dataRx.add(
    //   SystemMsgView(
    //     BaseMsgData<String>(data: "欢迎来到派对房，官方禁止末成年人充值消费。如存在用户在派对房内以陪玩、返利等方式诱导进行礼物赠送、私下交易，请谨慎判断，以防人身或财产 损失。官方提倡绿色健康游戏，严禁色情低俗、赌博、 谩骂、买卖金币/道具等违规行为，并对派对房进行24小时巡查。如发现违规行为，请及时举报。请您遵守派对房管理规范"),
    //   ),
    // );
    // dataRx.add(
    //   SystemMsgView(
    //     BaseMsgData<String>(data: "该房间为高音质房间，房问音质提升，同时消耗的流量将增加。"),
    //   ),
    // );

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
        if(sendUid != value.uid) {
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
      for(var i = 0; i < items.length; i ++) {
        S_GiftPlay? gift = items[i];

        final sendUid = gift.sendId;
        final ids = gift.acceptUidList ?? [];
        final users = await findByUidX({sendUid, ...ids}, useNet: true);
        users.forEach((key, value) {
          if(sendUid != value.uid) {
            dataRx.add(
              BlindBoxOpenGiftMsgView(
                BaseMsgData<String>(data: gift.name),
              ),
            );
          }
        });
      }
    });
  }
}
