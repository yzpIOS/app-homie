import 'dart:convert';

import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/commons/proto/ErrorCode.pb.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/common/theme.dart';
import 'package:app/exception.dart';
import 'package:app/store/room/room_msg_ctrl_pb.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/ui/room/overlay/room_overlay.dart';
import 'package:app/ui/room/overlay/square_overlay.dart';
import 'package:app/ui/room/user/online_user_view.dart';
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
import 'package:fixnum/fixnum.dart';
import 'package:provider/provider.dart';


export 'package:app/model/enum/room_role_type.dart';

typedef RoomBaseInfo = Map;
typedef RoomRunInfo = Map;

T sceneCtrl<T extends SceneCtrl>() => Get.find<SceneCtrl>(tag: '$T') as T;

abstract class SceneCtrl extends GetxController with GetDisposableMixin, BusGetLifeMixin, ReadyMixin, ReadyCtrlMixin {
  final String? pwd;
  final RoomBaseInfo info;

  final WidgetBuilder overlay;

  Map? roomHttpInfo = null;

  List<S_UpMikeBroadcast> newMicList = [];

  int roomId = 0;
  final String roomUid;
  final RoomType roomType;

  bool isDisposed = false;

  late final RxString noticeRx;

  SceneCtrl({required this.info, this.pwd, required this.overlay})
      : roomId = info['room_id'],
        roomUid = info['uid'],
        roomType = RoomType.fromVal(info['room_type']),
        noticeRx = RxString(info['notice_message'] ?? '');

  final sceneHudRx = Rx(RoomHudState.None);
  final micPanelRx = RxBool(true);//麦位是否显示
  final chatMsgViewIsShowRx = RxBool(true);//聊天消息视图是否显示
  final bottomBarIsShowRx = RxBool(true);//底部栏视图是否显示

  abstract bool keepState;

  // 是否加载房间成功
  bool isRequestBack = false;

  /// 记录是否己经加入房间
  bool _hasJoinRoom = false;

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

    // 等待unity发来UTF_INIT_START事件
    // await unity.ready;
    doOnReady();

    Get.find<RoomManagerCtrl>().sceneCtrl = this;
  }

  ///
  /// 渲染数据
  ///
  void onRender(S_SyncRoomInfo? s_syncRoomInfo) {}

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
        roomHttpInfo = info;
        await doOnReady();
        markReady();
      } catch (e, s) {
        markFail(e, s);

        rethrow;
      }
    }
  }

  @override
  void onClose() {
    Api.Room.outRoom(roomId).ignore();
    newMicList.clear();
    super.onClose();
    roomId = 0;
    isDisposed = true;
  }

  @mustCallSuper
  FutureOr<void> doOnReady() {
    _bindGet();
    _initListener();

    post(
      () {
        Get.find<MyAnimeCtrl>().doPreCache();
      },
    );
  }

  @mustCallSuper
  void _bindGet() {
    // bindGet(RoomMsgCtrl(roomId));
    bindGet(RoomMsgCtrlPb(roomId: roomId));
    bindGet(RoomChatCtrl(roomId));
  }

  @mustCallSuper
  void _initListener() {
    on<XUnityEvent>(
      test: (event) => event.code == Unity2AppEnum.UTF_ROLE_INFOPANEL,
      (event) {
        final data = jsonDecode(event.data);

        RoomUserInfoDialog.show(uid: data['uid'], nuid: Int64(data['role_id']));
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
    isRequestBack = false;

    void isNotClose() {
      if (isClosed) throw 'isClosed';
    }

    // unity初始化与加入房间同时进行
    post(() async {
      roomHttpInfo = await Api.Room.getRoomInfo(roomId, pwd: pwd);
      logForDebug("[SceneCtrl:loadScene]:房间信息返回, roomHttpInfo = ${roomHttpInfo.toString()}");

      // 监听unity发过来的信息
      logForDebug("[SceneCtrl:loadScene]:获听unity初始化完成消息");
      // 判断是否关闭界面
      isNotClose();
      await loadSceneInfo();

      // 加载成功后，设置成成功，后面unity加载完成后，再把状态设置成normal
      if(keepState) {
        RoomManagerCtrl.ins.doMiniState();
      } else {
        RoomManagerCtrl.ins.doNormalState();
      }

      // 服务端数据返回
      isRequestBack = true;

      /// 请求房间系统公告消息数组
      isNotClose();
      Api.Common.systemQuery().then((data) {
        isNotClose();
        List systemNoticeList = data['system_notice_list'];
        SystemMsgEvent(systemNoticeList).fire();
      });
      sceneHudRx(RoomHudState.Normal);


      // unity初始化与加入房间同时进行
      logForDebug("[SceneCtrl:loadScene]:开始加载unity");
      isNotClose();
      await loader(
        'Room',
        doOnBefore: () => {
          'scene': {
            'scene_id': info['scene_id'],
          },
        },
        doOnAfter: () async {
          onProcess(0.8);
          try {
            isNotClose();
            Future<void> doJoinGame() {
              const dur = Duration(seconds: unity_time_out);
              final data = {'token': OAuthCtrl.token, 'scene': info};
              logForDebug("[SceneCtrl:loadScene]:发送加入房间信息给Unity, type = ${App2UnityEnum.FTU_JOIN_GAME}, data = ${data.toString()}");
              var result =  unity.sendMessage(App2UnityEnum.FTU_JOIN_GAME, data: data, timeout: dur);
              logForDebug("[SceneCtrl:loadScene]:发送加入房间信息给Unity返回");
              return result;
            }

            if (isReady) {
              // assert(false, '产品需求改了，这个逻辑应该不会走');
              await doJoinGame();
            } else {
              logForDebug("[SceneCtrl:loadScene]:获取房间信息开始");

              // 加载unity
              isNotClose();
              await doJoinGame();

              isNotClose();
              markReady();
            }
            // unity加载完成，设置成normal状态，如果返回的时候
            RoomManagerCtrl.ins.doNormalState();
          } catch (e, s) {
            if(isDisposed) {
              return;
            }
            markFail(e, s);
            // if (!isClosed) unity.loadSceneCombo(unity.loadSceneBlank);
            return;
          }
        },
      );
    });
  }

  ///
  /// socket断开或者是首次进房时调用的接口
  ///
  Future<void> loadSceneInfo() async {
    void isNotClose() {
      if (isClosed) throw 'isClosed';
    }

    //没有加房的时候，先进房pk的状态；1.房间pk中
    if(!_hasJoinRoom) {
      if (((isInPKRoom() && RoomManagerCtrl.ins.stateRx.value == RoomState.None) || !isInPKRoom()) && neeJoinRoom()) {
        logForDebug("[SceneCtrl:loadScene]:非pk状态，调用加入房间接口");
        final joinResult = await Api.Room.joinRoom(roomId, pwd: pwd);
        logForDebug("[SceneCtrl:loadScene]:房间接口返回数据, joinResult = ${joinResult.toString()}");
        if(joinResult == null || (joinResult.code != ErrorCode.Ok && joinResult.code != ErrorCode.Success)) {
          if(joinResult?.code == ErrorCode.ROOM_UID_BLACK) {
            throw const LogicException(-1, "你被封禁了");
          } else if (joinResult?.code == ErrorCode.ROOM_PASSWORD_NOT_PERMISSION) {
            throw const LogicException(-1, "输入的房间密码错误");
          } else {
            throw const LogicException(-1, "房间数据加载失败");
          }
        }

      } else {
        logForDebug("[SceneCtrl:loadScene]:pk状态，不需要调用加入房间接口");
      }
      _hasJoinRoom = true;
    }

    isNotClose();
    logForDebug("[SceneCtrl:loadScene]:unity返回信息，开始发送进入房间信息，让服务端同步相关信息");
    // unity初始化完成后，发送同步信息指令
    C_RoomEnterComplete c_roomEnterComplete = C_RoomEnterComplete.create();
    c_roomEnterComplete.roomId = Int64(roomId);
    S_SyncRoomInfo? s_syncRoomInfo = await SocketCtrl.ins.sendByteAsyncServer(
        CMD.C_RoomEnterComplete,
        datas: c_roomEnterComplete.writeToBuffer(),
        resCmd: CMD.S_SyncRoomInfo
    );

    // 判断是否关闭界面
    isNotClose();
    onRender(s_syncRoomInfo);
    logForDebug("[SceneCtrl:loadScene]:开始发送进入房间信息，让服务端同步相关信息, s_syncRoomInfo = ${s_syncRoomInfo.toString()}");
  }

  Future doClose() {
    return Get.delete<SceneCtrl>(tag: '$runtimeType', force: true);
  }

  SceneMicCtrl? getRoomMicCtrl() => null;

  bool isInPKRoom() {
    return info.containsKey('pk_status') && info['pk_status'] == 1;
  }

  bool neeJoinRoom() {
    // 如果不存在neeJoinRoom，默认就是true
    return info.containsKey("neeJoinRoom") == false ||
        (info.containsKey('neeJoinRoom') && info['neeJoinRoom'] == true);
  }

  Widget createHeader();
}

class RoomCtrl extends SceneCtrl {
  final int maxMic;
  final int maxUser;
  RxBool examineMicRx = RxBool(false);
  RxSet<String> managerRx = RxSet();

  // 大厅房间不能自收组麦，只能是普通房间
  // 由于在大厅
  RxBool freeMicRx = RxBool(false);

  RxBool followRx = RxBool(false);
  RxInt userCountRx = RxInt(0);

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

  final noticePanelRx = RxBool(false);

  @override
  bool keepState = true;

  @override
  FutureOr<void> doOnReady() async {
    await super.doOnReady();

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
  void onRender(S_SyncRoomInfo? data) {
    followRx.value = roomHttpInfo?['follow_status'] ?? false;
    userCountRx.value = data?.onlineList.length ?? 0;

    // 更新mike位数据
    roomMicCtrl = getRoomMicCtrl();
    (roomMicCtrl as RoomMicCtrl?)?.dataRx.value = RoomMicCtrl.createMicInfo(data?.mikes ?? []);
  }

  SceneMicCtrl? roomMicCtrl;

  @override
  void _bindGet() {
    super._bindGet();

    getRoomMicCtrl();
    bindGet(RoomAdminCtrl(roomId, managerRx));
  }

  SceneMicCtrl getRoomMicCtrl() {
    roomMicCtrl ??= bindGet<SceneMicCtrl>(RoomMicCtrl(roomId, maxMic: maxMic, roomType: roomType));
    return roomMicCtrl!;
  }

  @override
  void _initListener() {
    super._initListener();

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

  bool isCharge(UID uid) {
    try {
      return (roomMicCtrl as RoomMicCtrl?)?.dataRx["1"]?.uid == uid;
    } catch(e) {
    }
    return false;
  }

  RoomRoleType? getRole(UID uid) {
    final owner = isOwner(uid);
    final admin = isAdmin(uid);
    // final charge = isCharge(uid);

    // if(charge) return RoomRoleType.charge;
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

  @override
  Widget createHeader() {
    final isLandscape = Get.context?.watch<Orientation>() == Orientation.landscape;

    return Obx(() {
      final showMic = micPanelRx();
      final freeMic = freeMicRx();

      //公会房且不在pk中，才显示麦位
      final topMicMode = (roomType == RoomType.guild && !Get.find<RoomManagerCtrl>().sceneCtrl.isInPKRoom());

      final showMicPanel = maxMic > 0 && !freeMic;
      return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: CommonRoomHeader(
          showMicPanel: showMicPanel && topMicMode,
          showMic: showMic,
          isLandscape: isLandscape,
          onItemClick: (action) {
            switch (action) {
              case '最小化':
                try {
                  keepState = true;
                  // 公会房通知下线
                  if(roomType == RoomType.guild || roomType == RoomType.customize) {
                    C_GoBack c_goBack = C_GoBack.create();
                    c_goBack.roomId = Int64(roomId);
                    SocketCtrl.ins.sendSever(CMD.C_GoBack, message: c_goBack);
                  }
                } catch(e, s) {
                }
                Get.back();
                break;
              case '公告':
                noticePanelRx.toggle();
                break;
              case '用户':
                OrientationSheet.show(
                  child: OnlineUserPage(roomId: roomId),
                  direction: Get.isLandscape ? SheetOrientation.right : SheetOrientation.bottom,
                );
                break;
            }
          },
        ),
      );
    });
  }
}

class SquareCtrl extends SceneCtrl {
  // 大厅中的人是否接口了其它的房间
  RxBool enableUpMikeButton = RxBool(false);

  SquareCtrl({required super.info, required super.pwd, required super.overlay})
      : assert(info['room_type'] == RoomType.square.code);

  @override
  bool keepState = false;

  @override
  void _bindGet() {
    super._bindGet();

    bindGet<SceneMicCtrl>(SquareMicCtrl());
  }

  @override
  Widget createHeader() {
    return Positioned(
        top: AppSize.safeTop,
        left: 5,
        right: 5,
        height: 44,
        child: const SqureRoomHeader(),
    );
  }
}
