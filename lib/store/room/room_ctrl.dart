import 'dart:convert';

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

export 'package:app/model/enum/room_role_type.dart';

typedef RoomBaseInfo = Map;
typedef RoomRunInfo = Map;

T sceneCtrl<T extends SceneCtrl>() => Get.find<SceneCtrl>(tag: '$T') as T;

abstract class SceneCtrl extends GetxController with GetDisposableMixin, BusGetLifeMixin, ReadyMixin, ReadyCtrlMixin {
  final String? pwd;
  final RoomBaseInfo info;

  final WidgetBuilder overlay;

  final int roomId;
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
    super.onInit();

    Get.find<RoomManagerCtrl>().sceneCtrl = this;
  }

  @override
  @mustCallSuper
  void onReady() async {
    if (!Env.useUnity) {
      try {
        await doOnReady(await Api.Room.joinRoom(roomId, pwd: pwd));
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

    super.onClose();
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

    Future.doWhile(
      () async {
        await Future.delayed(const Duration(seconds: 5));

        if (isClosed) return false;

        try {
          await Api.Room.heartbeat(roomId: roomId);
        } catch (_) {
          //ignore
        }

        return !isClosed;
      },
    );
  }

  @mustCallSuper
  void _bindGet(RoomRunInfo data) {
    bindGet(RoomMsgCtrl(roomId));
    bindGet(RoomMsgCtrlPb(roomId: roomId));
    bindGet(RoomChatCtrl(roomId));
  }

  @mustCallSuper
  void _initListener(RoomRunInfo data) {
    on<XUnityEvent>(
      test: (event) => event.code == Unity2AppEnum.UTF_ROLE_INFOPANEL,
      (event) {
        final data = jsonDecode(event.data);
        var roleId = data["role_id"];
        if(roleId == null) {
          return;
        }

        RoomUserInfoDialog.show(uid: data['uid'], nuid: Int64(roleId));
      },
    );

    //靠近售卖机
    on<XUnityEvent>(
      test: (event) => event.code == Unity2AppEnum.UTF_DETECT_BUILDING && event.ext['type'] == 2,
      (_) => ActMainDialog.show(),
    );
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
            const dur = Duration(seconds: 10);
            final data = {'token': OAuthCtrl.token, 'scene': info};

            return unity.sendMessage(App2UnityEnum.FTU_JOIN_GAME, data: data, timeout: dur);
          }

          if (isReady) {
            // assert(false, '产品需求改了，这个逻辑应该不会走');

            await doJoinGame();
          } else {
            final info = await Api.Room.joinRoom(roomId, pwd: pwd);
            isNotClose();

            await doJoinGame();
            isNotClose();

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

    bindGet<SceneMicCtrl>(RoomMicCtrl(roomId, maxMic: maxMic, roomType: roomType, micInit: data['mikes']));
    bindGet(RoomAdminCtrl(roomId, managerRx));
  }

  @override
  void _initListener(RoomRunInfo data) {
    super._initListener(data);

    on<UserTotalEvent>(
      (data) {
        userCountRx.rebuild((val) => data.total);
      },
    );

    on<AdminSetEvent>(
      (data) {
        if (data.isAdd) {
          managerRx.add(data.uid);
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

  void setBlock({required NUID uid, required bool isAdd}) {
    simpleSub(
      () => Api.Room.setBlock(roomId: roomId, uid: uid, isAdd: isAdd),
    );
  }

  void setManager({required UID uid, required bool isAdd}) {
    simpleSub(
      () => Api.Room.setManager(roomId: roomId, uid: uid, isAdd: isAdd),
    );
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
