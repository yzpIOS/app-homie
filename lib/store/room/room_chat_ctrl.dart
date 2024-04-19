import 'dart:ffi';

import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/store/im/chat_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/room/chat/msg_adapter/index.dart';
import 'package:app/ui/room/room_page.dart';
import 'package:flutter/widgets.dart';

import 'package:fixnum/fixnum.dart';

const String type_room = "房间";

const String type_lucky = "幸运";

const String type_world = "世界";

const String type_new = "萌新";

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

  bool firstEnter = true;

  static bool isDisposed = false;

  @override
  void onClose() {
    super.dispose();
    isDisposed = true;
  }

  @override
  void onInit() {
    super.onInit();
    isDisposed = false;

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
    });

    /// xxx进入了房间消息
    on<UserInEvent>((data) async {
      if(firstEnter) {
        await Future.delayed(const Duration(milliseconds: 1200));
        UserInEvent2().myFire(data.data);
        firstEnter = false;
      }
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
    });

    /// 多个礼物播放广播（盲盒开出的礼物数组）
    on<MoreGiftPlayEvent>((data) async {
      handleEvent(data);
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

      // 萌新
      dataSet[type_new]  = RxList<Widget>();

      selected.refresh();

      // 多条消息
      // cacheEvents.forEach((element) async {
      //   await Future.delayed(const Duration(milliseconds: 90));
      //   handleEvent(element);
      // });

      getNewUserList();
    });

    on<LuckScreenEvent>((data) async {
      handleEvent(data);
    });

    on<AllRoomEvent>((data) async {
      handleEvent(data);
    });
    // 世界频道
    on<WorldChatMessageBroadcastEvent>((data) {
      handleEvent(data);
    });
  }


  void switchType(String type) {
    if(type == type_new) {
      getNewUserList();
    }
    if(type == type_world) {
      Api.RoomMsg.switchWorld();
    } else {
      Api.RoomMsg.switchRoom();
    }
    selected.value = type;

    // S_JoinBroadcast s_joinBroadcast = S_JoinBroadcast.create();
    // s_joinBroadcast.roleId = OAuthCtrl.nUid;
    // s_joinBroadcast.roomId = Int64(RoomManagerCtrl.ins.sceneCtrl.roomId);
    // s_joinBroadcast.uid = OAuthCtrl.uid;
    // UserInEvent().myFire(s_joinBroadcast);
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
      return;
    }


    // 全服信息
    // 全服信息
    // 全服信息
    if(data is AllRoomEvent) {
      data.data?.items.forEach((element) {
        roomRxList.add(
            LuckyNotifyMsgView(AllRoomMsgAdapter(data: element))
        );
      });
      return;
    }

    // 世界聊天频道
    // 世界聊天频道
    // 世界聊天频道
    if(data is WorldChatMessageBroadcastEvent) {
      data.data?.items.forEach((element) {
        worldList.add(
            WorldMessageView(WorldMsgAdapter(data: element))
        );
      });
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
    debugPrint("房间内不需要缓存信息: ${Get.currentRoute}, roomPage = ${RoomPage.room_name}");
    // 在房间内，不缓存信息
    if(Get.currentRoute == RoomPage.room_name) {
      return;
    }
    if(cacheEvents.contains(event)) {
      return;
    }
    cacheEvents.add(event);
    if(cacheEvents.length > 200) {
      cacheEvents.removeAt(0);
    }
  }

  ///
  /// 新用户
  ///
  Future<void> getNewUserList() async {
    var list = await Api.UserInfo.getNewList().then((value) => (value != null && value["items"] != null) ? value["items"] : null);
    if(list == null) {
      return;
    }
    newList.clear();
    (list as List).forEach((element) {
      newList.add(NewUserMsgView(NewUserMsgAdapter(data: element)));
    });
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

  RxList<Widget> get newList {
    return dataSet[type_new] ?? RxList.empty();
  }

}
