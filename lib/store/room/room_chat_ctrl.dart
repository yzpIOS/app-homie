import 'dart:ffi';

import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/room/chat/msg_adapter/index.dart';
import 'package:flutter/widgets.dart';

import 'package:fixnum/fixnum.dart';

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

    // 本地消息
    on<LocalMsgEvent>((data) {
      dataRx.add(SimpleTextMsg(data.localMsgData));
    });

    /// 文本消息
    on<MsgTxtEvent>((data) {
      final uid = data.uid ?? "";
      final txt = data.data?.message ?? "";
      final nuid = data.data?.roleId;

      dataRx.add(
        TxtMsgView(
          TxtMsgData(data: txt, uid: uid, nuid: nuid ?? Int64(0)),
        ),
      );
    });

    /// xxx进入了房间消息
    on<UserInEvent>((data) {
      dataRx.add(
        UserInMsgView(
          UserInMsgData(uid: data.uid ?? "", nuid: data.data?.roleId ?? Int64(0)),
        ),
      );
    });

    /// 房间公告
    on<NoticeEvent>((data) {
      dataRx.add(
        NoticeMsgView(
          BaseMsgData<String>(data: data.data?.message ?? ""),
        ),
      );
    });

    final findByUidX = Get.find<UserInfoCtrl>().findByUidX;

    /// 礼物消息
    on<GiftEvent>((data) async {

      S_GiftPlay? gift = data.data;
      if(gift == null) {
        return;
      }
      final sendUid = data.uid;
      if(sendUid == null) {
        return;
      }
      _handleSendGift(sendUid, gift);
    });

    /// 多个礼物播放广播（盲盒开出的礼物数组）
    on<MoreGiftPlayEvent>((data) async {
      S_MoreGiftPlay? moreGift = data.data;
      if(moreGift == null) {
        return;
      }
      final List<S_GiftPlay>? items = data.items;
      if(items == null) {
        return;
      }

      // 判断是一键赠送
      // todo
      if(moreGift.type == 2) {
        items.forEach((element) {
          _handleSendGift(element.sendId, element);
        });
        return;
      }

      /// 配置数据，多个人多个礼物
      var dataMap = <List, List<S_GiftPlay>>{};
      for(S_GiftPlay gift in items) {
        final ids = gift.acceptUidList ?? [];
        if (dataMap.keys.contains(ids)) {
           var giftArray = dataMap[ids];
           giftArray?.add(gift);
           dataMap[ids] = giftArray ?? [];
        } else {
          dataMap[ids] = [gift];
        }
      }

      /// 生成每个人的礼物消息
      dataMap.forEach((dataKey, dataValue) async {
        S_GiftPlay? gift = dataValue.first;
        final sendUid = gift.sendId;
        final ids = gift.acceptUidList ?? [];
        final users = await findByUidX({sendUid, ...ids}, useNet: true);
        users.forEach((key, value) {
          if(sendUid != value.uid) {
            dataRx.add(
              BlindBoxGiftOpenMsgView(
                BlindBoxGiftOpenMsgAdapter(uid: sendUid, acceptUid: value.uid, nuid: Int64(value.nuid!), users: users, items: dataValue, data: moreGift),
              ),
            );
          }
        });
      });
    });
  }

  Future<void> _handleSendGift(UID sendUid, S_GiftPlay gift) async {

    final ids = gift.acceptUidList ?? [];

    final users = await Get.find<UserInfoCtrl>().findByUidX({sendUid, ...ids}, useNet: true);

    users.forEach((key, value) {
      if(sendUid != value.uid && gift.type != 6) {//盲盒礼物不需要显示这条
        dataRx.add(
          GiftMsgView(
            GiftMsgAdapter(uid: sendUid, acceptUid: value.uid, nuid: Int64(value.nuid!), users: users, data: gift),
          ),
        );
      }
    });
  }
}
