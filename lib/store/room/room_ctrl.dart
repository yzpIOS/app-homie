import 'dart:convert';

import 'package:app/common/nets/commons/proto/ErrorCode.pb.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/exception.dart';
import 'package:app/store/room/room_msg_ctrl_pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:app/event/event.dart';
import 'package:app/model/enum/api_switch.dart';
import 'package:app/model/enum/room_role_type.dart';
import 'package:app/model/enum/room_state.dart';
import 'package:app/net/api.dart';
import 'package:app/store/common/ready_ctrl_mixin.dart';
import 'package:app/store/gift_ctrl.dart';
import 'package:app/store/my_anime_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/my_gift_ctrl.dart';
import 'package:app/store/room/room_admin_ctrl.dart';
import 'package:app/store/room/room_chat_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/room/room_mic_ctrl.dart';
import 'package:app/store/room/room_msg_ctrl.dart';
import 'package:app/store/room/scene_mic_ctrl.dart';
import 'package:app/store/room/square_mic_ctrl.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/tools/scene_loader.dart';
import 'package:app/types.dart';
import 'package:app/ui/activity/act_main_dialog.dart';
import 'package:app/ui/room/user/room_user_info_dialog.dart';
import 'package:app/widgets.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/event/event.dart';

export 'package:app/model/enum/room_role_type.dart';

typedef RoomBaseInfo = Map;
typedef RoomRunInfo = Map;

T sceneCtrl<T extends SceneCtrl>() => Get.find<SceneCtrl>(tag: '$T') as T;

abstract class SceneCtrl extends GetxController with GetDisposableMixin, BusGetLifeMixin, ReadyMixin, ReadyCtrlMixin {
  final String? pwd;
  final RoomBaseInfo info;

  final WidgetBuilder overlay;


  List<S_UpMikeBroadcast> newMicList = [];

  int roomId = 0;
  final String roomUid;
  final RoomType roomType;

  late final RxString noticeRx;

  SceneCtrl({required this.info, this.pwd, required this.overlay})
      : roomId = info['room_id'],
        roomUid = info['uid'],
        roomType = RoomType.fromVal(info['room_type']),
        noticeRx = RxString(info['notice_message'] ?? '');

  final sceneHudRx = Rx(RoomHudState.None);

  abstract bool keepState;

  @override
  void onInit() {
    debugPrint("开始监听麦位信息");

    // 服务端的数据广播比较快，而客户端数据比较慢
    // 所以要记录用户的列表，然后当服务端数据返回来的时候
    // 把当前数据更新到http列表的数据
    on<MicUpEvent>((event) {
      S_UpMikeBroadcast? data = event.data;
      if(data == null) {
        return;
      }
      debugPrint("新增麦位：data = ${data.toProto3Json()}");
      newMicList.add(data);
    }
    );

    super.onInit();

    Get.find<RoomManagerCtrl>().sceneCtrl = this;
  }

  @override
  @mustCallSuper
  void onReady() async {
    if (!Env.useUnity) {
      try {
        var jointResult = await Api.Room.joinRoom(roomId, pwd: pwd);
        if(jointResult == null || jointResult.code != ErrorCode.Ok) {
          return;
        }
        var info = await Api.Room.getRoomInfo(roomId, pwd: pwd);
        await doOnReady(info);
        markReady();
      } catch (e, s) {
        markFail(e, s);

        rethrow;
      }

      sceneHudRx(RoomHudState.Normal);
    }
  }

  @override
  void onClose() {
    Api.Room.outRoom(roomId).ignore();
    SocketCtrl.ins.removeDisconnect(onDisconnect);
    newMicList.clear();
    super.onClose();
    roomId = 0;
  }

  @mustCallSuper
  FutureOr<void> doOnReady(RoomRunInfo data) {
    _bindGet(data);
    _initListener(data);

    post(
      () {
        Get.find<MyAnimeCtrl>().doPreCache();
      },
    );
  }

  @mustCallSuper
  void _bindGet(RoomRunInfo data) {
    // bindGet(RoomMsgCtrl(roomId));
    bindGet(RoomMsgCtrlPb(roomId: roomId));
    bindGet(RoomChatCtrl(roomId));
  }

  @mustCallSuper
  void _initListener(RoomRunInfo data) {
    on<XUnityEvent>(
      test: (event) => event.code == Unity2AppEnum.UTF_ROLE_INFOPANEL,
      (event) {
        final data = jsonDecode(event.data);

        RoomUserInfoDialog.show(uid: data['uid']);
      },
    );

    //靠近售卖机
    on<XUnityEvent>(
      test: (event) => event.code == Unity2AppEnum.UTF_DETECT_BUILDING && event.ext['type'] == 2,
      (_) => ActMainDialog.show(),
    );

    SocketCtrl.ins.addDisconnect(onDisconnect);
  }

  void onDisconnect() {
    Get.alertDialog('网络己断开').then((value) => {
      Get.back()
    });
  }

  Future<void> loadScene(UnityCtrl unity, SceneLoader loader, ValueChanged<double> onProcess) async {
    sceneHudRx(RoomHudState.None);

    // await unity.loadSceneBlank();

    await loader(
      'Room',
      doOnBefore: () => {
        'scene': {
          'scene_id': info['scene_id'],
        },
      },
      doOnAfter: () async {
        onProcess(0.8);

        void isNotClose() {
          if (isClosed) throw 'isClosed';
        }

        try {
          isNotClose();

          Future<void> doJoinGame() {
            const dur = Duration(seconds: unity_time_out);
            final data = {'token': OAuthCtrl.token, 'scene': info};

            return unity.sendMessage(App2UnityEnum.FTU_JOIN_GAME, data: data, timeout: dur);
          }

          if (isReady) {
            // assert(false, '产品需求改了，这个逻辑应该不会走');

            await doJoinGame();
          } else {
            final joinResult = await Api.Room.joinRoom(roomId, pwd: pwd);
            if(joinResult == null || joinResult.code != ErrorCode.Ok) {
              if(joinResult?.code == ErrorCode.ROOM_UID_BLACK) {
                throw const LogicException(-1, "你被封禁了");
              } else {
                throw const LogicException(-1, "房间数据加载失败");
              }
            }
            final info = await Api.Room.getRoomInfo(roomId, pwd: pwd);
            isNotClose();

            await doJoinGame();
            isNotClose();

            // 等待unity发来UTF_INIT_START事件
            // await unity.ready;

            await doOnReady(info);
            isNotClose();

            markReady();
          }
        } catch (e, s) {
          markFail(e, s);

          // if (!isClosed) unity.loadSceneCombo(unity.loadSceneBlank);

          rethrow;
        }

        sceneHudRx(RoomHudState.Normal);
      },
    );
  }

  Future doClose() {
    return Get.delete<SceneCtrl>(tag: '$runtimeType', force: true);
  }
}

class RoomCtrl extends SceneCtrl {
  final int maxMic;
  final int maxUser;
  final RxBool freeMicRx;
  final RxBool examineMicRx;
  final RxSet<String> managerRx;

  late final RxBool followRx;
  late final RxInt userCountRx;

  RoomCtrl({required super.info, required super.pwd, required super.overlay})
      : assert({RoomType.customize.code, RoomType.guild.code}.contains(info['room_type'])),
        maxMic = info['mike_num'],
        maxUser = info['max_num'] ?? -1,
        //麦克风状态1开放 2.关闭；默认:2
        freeMicRx = RxBool(
          info['mike_status'] == ApiSwitch.open.code && info['room_type'] != RoomType.guild.code,
        ),
        //房间麦审核状态1.开 2.关  默认：2
        examineMicRx = RxBool(info['mike_examine_status'] == ApiSwitch.open.code),
        managerRx = RxSet();

  final micPanelRx = RxBool(true);
  final noticePanelRx = RxBool(false);

  @override
  bool keepState = true;

  @override
  FutureOr<void> doOnReady(RoomRunInfo data) async {
    await super.doOnReady(data);

    followRx = RxBool(data['follow_status']);
    userCountRx = RxInt(data['total']);

    if (noticeRx.isNotEmpty) {
      noticePanelRx(true);

      Future.delayed(
        3.seconds,
        () {
          if (!isClosed) noticePanelRx(false);
        },
      );
    }

    post(
      () {
        Get.find<GiftCtrl>().doPreCache();
        Get.find<MyGiftCtrl>().doPreCache();
      },
    );
  }

  @override
  void _bindGet(RoomRunInfo data) {
    super._bindGet(data);

    var oldMikeList = RoomMicCtrl.micDataFrom(data['mikes'] ?? []);
    // 服务端的麦列表
    var oldMikeKeyList = oldMikeList.keys.toList();
    for(int index = oldMikeKeyList.length - 1; index >= 0; index --) {
      debugPrint("删除旧麦位1：uid = ${oldMikeList[oldMikeKeyList[index]]?.uid}");
      for(int innerIndex = 0; innerIndex < newMicList.length; innerIndex ++) {
        // http返回来的数据为旧的，把旧数据删除
        if(oldMikeList[oldMikeKeyList[index]]?.uid == newMicList[index].uid) {
          oldMikeList.remove(oldMikeKeyList[index]);
          debugPrint("删除旧麦位2：uid = ${newMicList[index].uid}");
          break;
        }
      }
    }
    // 把新的数据加到列列中
    newMicList.forEach((element) {
      oldMikeList[element.mikeNo] = MicInfo(uid: element.uid ?? "",
          micId: element.mikeId.toInt(), hotCount: element.number, isMute: false, nUid: element.roleId);
    });
    newMicList.clear();

    bindGet<SceneMicCtrl>(RoomMicCtrl(roomId, maxMic: maxMic, roomType: roomType, micInit: oldMikeList));
    bindGet(RoomAdminCtrl(roomId, managerRx));
  }

  @override
  void _initListener(RoomRunInfo data) {
    super._initListener(data);

    // todo 这里
    on<UserTotalEvent>(
      (data) {
        userCountRx.rebuild((val) => data.total ?? 0);
      },
    );

    on<AdminSetEvent>(
      (data) {
        if (data.isAdd && data.uid != null && data.uid?.isNotEmpty == true) {
          managerRx.add(data.uid ?? "");
        } else {
          managerRx.remove(data.uid);
        }
      },
    );
  }

  bool isOwner(UID uid) => roomUid == uid;

  bool isAdmin(UID uid) => managerRx.contains(uid);

  RoomRoleType? getRole(UID uid) {
    final owner = isOwner(uid);
    final admin = isAdmin(uid);

    if (owner) return RoomRoleType.owner;
    if (admin) return RoomRoleType.manager;
    return null;
  }

  void setBlock({required UID uid, required bool isAdd}) {
    simpleSub(
      () => Api.Room.setBlock(uid:uid, roomId: roomId, isAdd: isAdd),
    );
  }

  void setManager({required UID uid, required bool isAdd}) {
    Api.Room.setManager(roomId: roomId, uid: uid, isAdd: isAdd);
  }
}

class SquareCtrl extends SceneCtrl {
  SquareCtrl({required super.info, required super.pwd, required super.overlay})
      : assert(info['room_type'] == RoomType.square.code);

  @override
  bool keepState = false;

  @override
  void _bindGet(RoomRunInfo data) {
    super._bindGet(data);

    bindGet<SceneMicCtrl>(SquareMicCtrl());
  }
}
