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

const String type_room = "房间";

const String type_lucky = "幸运";

const String type_world = "世界";

class RoomChatCtrl extends GetxController with BusGetLifeMixin {
  final int roomId;

  RoomChatCtrl(this.roomId);

  final dataRx = RxList<Widget>();

  RxString selected = RxString(type_room);

  Map dataSet = {
    type_room: RxList<Widget>(),
    // "幸运": RxList<Widget>(),
  };

  static List cacheEvents = [];

  @override
  void onInit() {
    super.onInit();

    /// 显示系统公告消息
    on<SystemMsgEvent>((data) {
      data.systemMsgList.forEach((element) {
        roomRxList.add(
          SystemMsgView(
            BaseMsgData<String>(data: element),
          ),
        );
      });
    });

    // 本地消息
    on<LocalMsgEvent>((data) {
      roomRxList.add(SimpleTextMsg(data.localMsgData));
    });

    /// 文本消息
    on<MsgTxtEvent>((data) {
      handleEvent(data);
      cacheEventItem(data);
    });

    /// xxx进入了房间消息
    on<UserInEvent>((data) {
      roomRxList.add(
        UserInMsgView(
          UserInMsgData(uid: data.uid ?? "", nuid: data.data?.roleId ?? Int64(0)),
        ),
      );
    });

    /// 房间公告
    on<NoticeEvent>((data) {
      roomRxList.add(
        NoticeMsgView(
          BaseMsgData<String>(data: data.data?.message ?? ""),
        ),
      );
    });

    /// 礼物消息
    on<GiftEvent>((data) async {
      handleEvent(data);

      cacheEventItem(data);
    });

    /// 多个礼物播放广播（盲盒开出的礼物数组）
    on<MoreGiftPlayEvent>((data) async {
      handleEvent(data);

      cacheEventItem(data);
    });

    on<RoomInfoEvent>((data) async {
      if(data.s_syncRoomInfo?.luckChatChannel == true) {
        if(!dataSet.containsKey(type_lucky)) {
          dataSet[type_lucky] = RxList<Widget>();
        }
      } else {
        dataSet.remove(type_lucky);
      }

      if(data.s_syncRoomInfo?.worldChatChannel == true) {
        if(!dataSet.containsKey(type_world)) {
          dataSet[type_world] = RxList<Widget>();
        }
      } else {
        dataSet.remove(type_world);
      }

      selected.refresh();

      // 多条消息
      // cacheEvents.forEach((element) async {
      //   await Future.delayed(const Duration(milliseconds: 90));
      //   handleEvent(element);
      // });
    });

    on<LuckScreenEvent>((data) async {
      handleEvent(data);
      cacheEventItem(data);
    });
  }


  void switchType(String type) {
    selected.value = type;
  }


  Future<void> handleEvent(data) async {
    // 礼物事件
    // 礼物事件
    // 礼物事件
    if(data is GiftEvent) {
      S_GiftPlay? gift = data.data;
      if(gift == null) {
        return;
      }
      final sendUid = data.uid;
      if(sendUid == null) {
        return;
      }
      _handleSendGift(sendUid, gift);
      return;
    }


    // 多个礼物播放
    // 多个礼物播放
    // 多个礼物播放
    if(data is MoreGiftPlayEvent) {
      final findByUidX = Get.find<UserInfoCtrl>().findByUidX;

      S_MoreGiftPlay? moreGift = data.data;
      if(moreGift == null) {
        return;
      }
      final List<S_GiftPlay>? items = data.items;
      if(items == null) {
        return;
      }

      // 判断是一键赠送
      // 判断是一键赠送
      // 判断是一键赠送
      // todo
      if(moreGift.type == 2) {
        items.forEach((element) {
          _handleSendGift(element.sendId, element);
        });
        return;
      }

      /// 配置数据，多个人多个礼物
      /// 配置数据，多个人多个礼物
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
      /// 生成每个人的礼物消息
      /// 生成每个人的礼物消息
      dataMap.forEach((dataKey, dataValue) async {
        S_GiftPlay? gift = dataValue.first;
        final sendUid = gift.sendId;
        final ids = gift.acceptUidList ?? [];
        final users = await findByUidX({sendUid, ...ids}, useNet: true);
        users.forEach((key, value) {
          if(sendUid != value.uid) {
            roomRxList.add(
              BlindBoxGiftOpenMsgView(
                BlindBoxGiftOpenMsgAdapter(uid: sendUid, acceptUid: value.uid, nuid: Int64(value.nuid!), users: users, items: dataValue, data: moreGift),
              ),
            );
          }
        });
      });
      return;
    }

    // 幸运漂屏
    // 幸运漂屏
    // 幸运漂屏
    if(data is LuckScreenEvent) {
      data.data?.items.forEach((gift) {
        giftRxList.add(
          LuckMsgView(
            LuckMsgAdapter(uid: gift.uid, nuid: Int64(0), data: gift),
          ),
        );
        if(giftRxList.length > 200) {
          giftRxList.removeAt(0);
        }
      });
      return;
    }

    // 文本消息
    // 文本消息
    // 文本消息
    if(data is MsgTxtEvent) {
      final uid = data.uid ?? "";
      final txt = data.data?.message ?? "";
      final nuid = data.data?.roleId;

      roomRxList.add(
        TxtMsgView(
          TxtMsgData(data: txt, uid: uid, nuid: nuid ?? Int64(0)),
        ),
      );

      worldList.add(
          TxtMsgView(
            TxtMsgData(data: txt, uid: uid, nuid: nuid ?? Int64(0)),
          )
      );
      return;
    }

    // 其它消息
    // 其它消息
    // 其它消息
  }

  Future<void> _handleSendGift(UID sendUid, S_GiftPlay gift) async {

    final ids = gift.acceptUidList ?? [];

    final users = await Get.find<UserInfoCtrl>().findByUidX({sendUid, ...ids}, useNet: true);

    users.forEach((key, value) {
      if(sendUid != value.uid && gift.type != 6) {//盲盒礼物不需要显示这条
        // 房间信息
        roomRxList.add(GiftMsgView(
          GiftMsgAdapter(uid: sendUid, acceptUid: value.uid, nuid: Int64(value.nuid!), users: users, data: gift),
        ));
      }
    });
  }

  static void cacheEventItem(event) {
    if(cacheEvents.contains(event)) {
      debugPrint("aa");
      return;
    }
    cacheEvents.add(event);
    if(cacheEvents.length > 200) {
      cacheEvents.removeAt(0);
    }
  }


  RxList<Widget> get roomRxList {
    return dataSet[type_room] ?? RxList.empty();
  }

  RxList<Widget> get giftRxList {
    return dataSet[type_lucky] ?? RxList.empty();
  }

  RxList<Widget> get worldList {
    return dataSet[type_world] ?? RxList.empty();
  }
}
