import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/commons/config/socket_config.dart';
import 'package:app/common/nets/commons/proto/Common.pb.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/event/event.dart';
import 'package:app/event/refresh_hot_event.dart';
import 'package:app/exception.dart';
import 'package:app/model/enum/api_switch.dart';
import 'package:app/model/enum/room_state.dart';
import 'package:app/net/api.dart';
import 'package:app/store/gift_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/gift/gift_send_logic.dart';
import 'package:app/ui/gift/gift_sheet.dart';
import 'package:app/ui/room/overlay/room_overlay.dart';
import 'package:app/ui/room/overlay/square_overlay.dart';
import 'package:app/ui/room/persion/down_mic_settle_dialog.dart';
import 'package:app/ui/room/persion/person_room_overlay.dart';
import 'package:app/ui/room/room_middle_page.dart';
import 'package:app/ui/room/room_page.dart';
import 'package:app/ui/room/user/accept_challenge_view.dart';
import 'package:app/ui/room/user/accept_enter_room.dart';
import 'package:app/widgets.dart';
import 'package:dartz/dartz.dart';

class RoomManagerCtrl extends GetxController with BusGetLifeMixin, GetDisposableMixin {
  final interval_time = 200;
  bool shouldOpenGift = false;

  // 加一个标识用来是否要加入房间，个人房在创建的时候不需要加入房间
  bool needJoinRoom = true;

  static RoomManagerCtrl get ins {
    return Get.find<RoomManagerCtrl>();
  }

  void closeRoom({Function? closeFunc}) {
    if(_sceneCtrl == null && _sceneCtrl is RoomCtrl == false) {
      return;
    }
    // 关闭函数

    // 房间
    RoomCtrl? roomCtrl = _sceneCtrl as RoomCtrl?;
    if(roomCtrl != null && roomCtrl.roomType != RoomType.guild && roomCtrl.getRole(OAuthCtrl.uid).isOwner) {
      // 不是公会，并且用户所在的房间是主人房
      Api.Room.close().asStream().listen((event) {
        doCloseState();
        closeFunc?.call();
      });
    } else {
      // 房间manager
      doCloseState();
      closeFunc?.call();
    }
  }

  final stateRx = Rx(RoomState.None);

  SceneCtrl? _sceneCtrl;

  SceneCtrl get sceneCtrl => _sceneCtrl!;

  SceneCtrl? get sceneCtrl2 => _sceneCtrl;

  set sceneCtrl(SceneCtrl ctrl) => _sceneCtrl = ctrl;

  @override
  void onInit() {
    super.onInit();

    void _doClose(String? msg) async {
      await doCloseState();

      if (msg != null) Get.alertDialog(msg);
    }

    on<SwitchRoomEvent>(
      test: (_) => stateRx() == RoomState.Mini,
      (_) => _doClose(null),
    );

    on<RoomCloseEvent>(
      test: (_) => stateRx() == RoomState.Mini && !OAuthCtrl.isSelf(sceneCtrl.roomUid),
      (_) => _doClose('主播已下播'),
    );

    on<UserBlockEvent>(
      test: (event) {
        debugPrint("用户被禁；userInfo = ${event?.data?.toString()}");
        return stateRx() == RoomState.Mini && OAuthCtrl.isSelf(event.uid);
      },
      (_) => _doClose('你被封禁了'),
    );

    on<LiveStopSettlementEvent>((data) {
    });
    // 注册被邀请的F端，邀请对战信息监听回调
    SocketCtrl.ins.onDataCmd(CMD.S_PKInvite, onPKInvite);
    // 注册S端广播给同房间内所有C端匹配结果，如果双方都选择对战，则进入PK场景。【进入Start状态】监听回调
    SocketCtrl.ins.onDataCmd(CMD.S_PKInviteResult, onPKInviteResult);
    // 注册一轮游戏结束后，两个C端选择是否继续下一轮的结果  isContinue=2就是不继续了，需要退出当前场景
    SocketCtrl.ins.onDataCmd(CMD.S_PKContinue, onPKContinue);
    // 注册Unity控制AppUI开关
    SocketCtrl.ins.onDataCmd(CMD.C_ControlAppUI, onControlAppUI);
    // 连接成功时，服务端通知的用户信息
    SocketCtrl.ins.onDataCmd(CMD.S_Role, onRoleResponse);
    // 个人房结算
    SocketCtrl.ins.onDataCmd(CMD.S_LiveStopSettlementBroadcast, handleSettle);
  }

  ///
  /// 结算
  ///
  void handleSettle(int cmd, S_LiveStopSettlementBroadcast? settle) {
    if(settle == null) {
      return;
    }
    DownMicSettleDialog.show(settle);
  }

  ///
  /// 打开盲盒界面
  ///
  void toRoomBlind(int roomId) {
    if(Get.currentRoute.toLowerCase().contains(RoomPage.room_name.toLowerCase())) {
      // 跳到新的界面
      if(sceneCtrl2?.roomId != roomId) {
        shouldOpenGift = true;
        // 当前不在同一个房间
        toMiddleRoom(roomId: roomId);
      } else {
        RoomOverlay.showGiftSend(roomId);
      }
    } else {
      shouldOpenGift = true;
      toRoom(roomId: roomId);
    }
  }

  bool canGoToComment = true;

  ///
  /// socket连接成功时，服务端返回的用户信息
  ///
  void onRoleResponse(int cmd, S_Role? role) async {
    if(role == null) {
      return;
    }
    // PkRoomID不为空时，证明用户此时还在PK房中，那么强制拉进房间里
    var pkRoomId = 0;//role.pkRoomId.toInt();
    var roomId = role.roomId.toInt();
    // 数据异常
    if(pkRoomId > 0 && roomId > 0) {
      // 在pk房中
      Future.delayed(const Duration(milliseconds: 3500)).whenComplete(() async {
        var roomInfo = await Api.Room.info(roomId: roomId, tryTimes: 2);
        putPkInfo(roomInfo, pkRoomId);

        if(roomInfo["scene_id"] != 0) {
          toMiddleRoom(roomId: roomId, data: roomInfo, off: Get.currentRoute.toLowerCase().contains(RoomPage.room_name.toLowerCase()), callCloseRoom: false);
        } else {
          toSquare(data: roomInfo);
        }
      });
    } else if(roomId > 0) {
      // 在普通房间中
      if(sceneCtrl2 != null) {
        // 加载房间数据
        sceneCtrl2?.loadSceneInfo();
      } else {
        // 房间己关闭, 从新打开房间
        Future.delayed(const Duration(milliseconds: 3500)).whenComplete(() async {
          // 己经加入到其它的房间，此时不处理
          if(sceneCtrl2 != null) {
            return;
          }
          // 跳到房间中
          var roomInfo = await Api.Room.info(roomId: roomId, tryTimes: 2);
          putRoomInfo(roomInfo);
          if(roomInfo["scene_id"] != 0) {
            if(Env.isDebug) {
              AcceptEnterRoom.show(roomId, roomInfo);
              return;
            }
            toRoom(roomId: roomId, data: roomInfo, off: Get.currentRoute.toLowerCase().contains(RoomPage.room_name.toLowerCase()));
          } else {
            toSquare(data: roomInfo);
          }
        });
      }
    } else {
      // 没有在房间中
      onSocketDisconnect();
      // 新用户首次打开app时随机进房
      Future.delayed(const Duration(milliseconds: 3500)).whenComplete(() async {
        simpleTry(() => Api.Common.getEntryPoint(),
            callback: (t) {
              if(t is Map) {
                var type = t["type"] ?? 0;
                if(type == 1) {
                  Map<dynamic, dynamic>? roomData = t["room_data"];
                  // 随机进房
                  if(roomData != null) {
                    if(roomData["scene_id"] != 0) {
                      // http://192.168.1.156:20000/project/15/interface/api/2114
                      // toRoom(roomId: roomId, data: roomData, off: Get.currentRoute.toLowerCase().contains(RoomPage.room_name));
                      AcceptEnterRoom.show(roomId, roomData);
                    } else {
                      toSquare(data: roomData);
                    }
                  }
                } else if(type == 2 && canGoToComment) {
                  const GoComment().fire();
                }
                canGoToComment = false;
              }
            }
        );
      });
    }
  }

  ///
  /// socket断开连接时的回调
  ///
  void onSocketDisconnect({String? message = null}) {
    if(stateRx.value == RoomState.Mini) {
      // 房间最小化中
      closeRoom2();
    } else if(stateRx.value == RoomState.Normal) {
      // 现在在房间中
      RoomExitEvent(message ?? "房间数据加载失败，请重试").fire();
      // 房间最小化中
      closeRoom2();
    } else {
      // 现在在房间中
      if(SocketCtrl.ins.needSendCloseEvent) {
        RoomExitEvent(message ?? "房间数据加载失败，请重试").fire();
      }
      SocketCtrl.ins.needSendCloseEvent = true;
    }
  }

  // 被邀请的F端，邀请对战信息监听回调
  void onPKInvite(int cmd, S_PKInvite? data) {
    if (data == null) {
      return;
    }

    // 显示是否接受挑战的弹窗
    AcceptChallengeDialog.show(
      '${data.invitingGuildName}直播间对你发起挑战\n是否接受？',
      callback: (isAccept) async {
        Get.pop();
        simpleSub(
          Api.Room.pkAccept(accept: isAccept, invitingGuildId: data.invitingGuildId),
        );
      },
    );
  }

  // S端广播给同房间内所有C端匹配结果，如果双方都选择对战，则进入PK场景。【进入Start状态】监听回调
  void onPKInviteResult(int cmd, S_PKInviteResult? data) {
    if (data == null) {
      return;
    }

    if (data.isSuccess) {//true进入PK场景
      int pkRoomId = data.pkRoomId.toInt();//生成了一个PK房ID
      if(sceneCtrl2?.info == null) {
        return;
      }
      // pk房是一个场景，这里使用当前房间的信息
      var curRoomInfo = sceneCtrl2?.info ?? {};
      putPkInfo(curRoomInfo, pkRoomId);
      toMiddleRoom(roomId: sceneCtrl2?.roomId ?? 0, off: true, data: curRoomInfo, callCloseRoom: false);
    } else {
      showToast('已取消挑战邀请');
    }
  }

  // 一轮游戏结束后，两个C端选择是否继续下一轮的结果  isContinue=2就是不继续了，需要退出当前场景
  void onPKContinue(int cmd, S_PKContinue? data) {
    if (data == null) {
      return;
    }

    int isContinue = data.isContinue;
    if (isContinue == 2) {
      toMiddleRoom(roomId: sceneCtrl2?.roomId ?? 0, off: true, data: null, callCloseRoom: false);
    }
  }

  // Unity控制AppUI开关
  void onControlAppUI(int cmd, C_ControlAppUI? data) {
    if (data == null) {
      return;
    }
    data.parts.forEach((element) {
      //part 约定id[1: 麦位面板节点, 20:左侧消息UI节点, 30:底部栏面板节点]
      //close 1打开, 2关闭
      if (element.part == 1) {
        _sceneCtrl?.micPanelRx(element.close == 1);
      } else if (element.part == 20) {
        _sceneCtrl?.chatMsgViewIsShowRx(element.close == 1);
      } else if (element.part == 30) {
        _sceneCtrl?.bottomBarIsShowRx(element.close == 1);
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    doCloseState();
    // 移除被邀请的F端，邀请对战信息监听回调
    SocketCtrl.ins.removeOnDataCmd(CMD.S_PKInvite, onPKInvite);
    // 移除S端广播给同房间内所有C端匹配结果，如果双方都选择对战，则进入PK场景。【进入Start状态】监听回调
    SocketCtrl.ins.removeOnDataCmd(CMD.S_PKInviteResult, onPKInviteResult);
    // 移除一轮游戏结束后，两个C端选择是否继续下一轮的结果
    SocketCtrl.ins.removeOnDataCmd(CMD.S_PKContinue, onPKContinue);
    // 移除Unity控制AppUI开关
    SocketCtrl.ins.removeOnDataCmd(CMD.C_ControlAppUI, onControlAppUI);
    // 移除用户监听
    SocketCtrl.ins.removeOnDataCmd(CMD.S_Role, onRoleResponse);
    // 结算
    SocketCtrl.ins.removeOnDataCmd(CMD.S_LiveStopSettlementBroadcast, handleSettle);
  }

  ///
  /// [changeRoom] 是否个人房主切换房间
  ///
  void _show({
    required bool off,
    required FutureOr Function(int?) infoApi,
    required SceneCtrl Function(Tuple2<RoomBaseInfo, String?>) storeCreate,
    int? roomId,
    bool changeRoom = false,
  }) async {
    Future doJoin() async {
      Future<Tuple2<RoomBaseInfo, String?>> api() async {

        logForDebug("获取房间信息 roomId= ${roomId}");

        final info = await infoApi(roomId);

        if (OAuthCtrl.isSelf(info['uid'])) {
          logForDebug("用户自入自己的房间 info= ${info}");
          return Tuple2(info, null);
        }

        final status = info['private_status'];

        if (status == ApiSwitch.open.code) {
          logForDebug("用户进入其它房间，房间信息 info= ${info}");
          return Tuple2(info, null);
        } else if (status == ApiSwitch.close.code) {
          logForDebug("用户进入密码房，房间信息 info= ${info}");
          return holderProgress(
            Get.showInputDialog(title: '请输入密码').then((val) {
              if (val == null) throw const LogicException(-1, '已取消');

              return Tuple2(info, val);
            }),
          );
        } else {
          throw const LogicException(-1, '数据错误');
        }
      }

      void onReady(SceneCtrl store) async {
        Get.put<SceneCtrl>(
          store,
          tag: '${store.runtimeType}',
          permanent: true,
        );

        RoomPage.show(off);
      }

      simpleSub(
        api(),
        callback1: (resp) {
          var result = storeCreate(resp);
          return onReady(result);
        },
        whenErr: off ? doBackWhenErr : null,
      );
    }

    if(SocketCtrl.ins.share.forceWaitTimes > 0) {
      logForDebug("从后台到前台时，进房时等待心跳返回");
      // 显示loading
      WaitingCtrl.obj.show();
      // 添加超时时间
      Future.delayed(Duration(seconds: SocketCtrl.ins.share.forceWaitTimes)).asStream().listen((event) {
        WaitingCtrl.obj.hidden();
      });
      // 待主待
      await SocketCtrl.ins.isCConnect();
      // 隐藏loading
      WaitingCtrl.obj.hidden();
    }

    logForDebug("开始进房流程, 此时stateRx= ${stateRx.value}");

    switch (stateRx()) {
      case RoomState.Normal:
        WaitingCtrl.obj.hidden();
        if (!tempCallCloseRoom) {
          RoomPage.show(off);
          return;
        }
        closeRoom2();
        return;
      case RoomState.Mini:
        WaitingCtrl.obj.hidden();
        if (!tempCallCloseRoom || _sceneCtrl!.roomId == roomId) {
          RoomPage.show(off);

          return;
        } else {
          String msg = changeRoom ? "您正在直播中，是否下播" : '已在另一个房间，需要切换房间吗';
          String okLabel = changeRoom ? "下播" : '切换';

          final other = await Get.simpleDialog(msg: msg, okLabel: okLabel);

          if (okLabel != other) {
            return;
          } else {
            // 清除原房间资源
            await doCloseState();

            continue join;
          }
        }
      join:
      case RoomState.None:
        await doJoin();
        break;
    }
  }

  bool tempCallCloseRoom = true;

  ///
  /// 公会房
  ///
  void toRoom({required int roomId, Map? data, bool off = false}) {
    if(_preClickTime != 0 && DateTime.now().millisecondsSinceEpoch - _preClickTime < interval_time) {
      return;
    }
    _preClickTime = DateTime.now().millisecondsSinceEpoch;
    simpleTry(
      () => Api.Room.info(roomId: roomId, tryTimes: 2),
      callback: (data) {
        bool changeRoom = (sceneCtrl2 is PersonRoomCtrl) && (sceneCtrl2?.roomUid == OAuthCtrl.uid);
        if(data["room_type"] == 1) {
          if(data["status"] == 2) {
            Get.alertDialog2("主播已下播", callBack: () {
              RefreshHotEvent().fire();
              Get.back();
            });
            return;
          }
          // 个人房
          toPersonRoom(roomId: roomId, data: data, off: off, changeRoom: changeRoom);
        } else if(data["room_type"] == 2) {
          // 公会房
          toGuildRoom(roomId: roomId, data: data, off: off, changeRoom: changeRoom);
        } else if(data["room_type"] == 3) {
          // 广场
          toSquare(data: data, changeRoom: changeRoom);
        }
      },
      showProgress: true
    );
    // reset tempCallCloseRoom param
    tempCallCloseRoom = true;
  }

  void toGuildRoom({required int roomId, Map? data, bool off = false, bool changeRoom = false}) {
    _show(
      roomId: roomId,
      off: off,
      infoApi: (it) => data ?? Api.Room.info(roomId: it, tryTimes: 2),
      storeCreate: (it) => RoomCtrl(info: it.value1, pwd: it.value2, overlay: (_) => RoomOverlay()),
      changeRoom:changeRoom,
    );
    // reset tempCallCloseRoom param
    tempCallCloseRoom = true;
  }

  ///
  /// 个人房
  ///
  void toPersonRoom({required int roomId, Map? data, bool off = false, bool changeRoom = false}) {
    _show(
      roomId: roomId,
      off: off,
      infoApi: (it) => data ?? Api.Room.info(roomId: it, tryTimes: 2),
      storeCreate: (it) => PersonRoomCtrl(info: it.value1, pwd: it.value2, overlay: (_) => PersonRoomOverlay()),
      changeRoom: changeRoom,
    );
    // reset tempCallCloseRoom param
    tempCallCloseRoom = true;
  }

  ///
  /// 从房间大厅跳到房间B时，两个界面都是unity界面会报错，所以加一个中间界面来跳转
  /// 有更好的方式？？
  ///
  void toMiddleRoom({required int roomId, Map? data, bool off = false, bool callCloseRoom = true}) {
    // RoomMiddlePage will call toRoom method, and tempCallCloseRoom will be reset to true in the toRoom method
    tempCallCloseRoom = callCloseRoom;
    Get.off(() => RoomMiddlePage(roomId: roomId, data: data, callCloseRoom: callCloseRoom,), transition: Transition.noTransition);
  }

  int _preClickTime = 0;

  ///
  /// 广场
  ///
  void toSquare({Map? data, bool changeRoom = false}) {
    if(_preClickTime != 0 && DateTime.now().millisecondsSinceEpoch - _preClickTime < interval_time) {
      return;
    }
    _preClickTime = DateTime.now().millisecondsSinceEpoch;
    return _show(
      off: false,
      infoApi: (_) => data ?? Api.Room.info(type: RoomType.square),
      storeCreate: (it) => SquareCtrl(info: it.value1, pwd: it.value2, overlay: (_) => SquareOverlay()),
      changeRoom: changeRoom,
    );
  }

  ///
  /// 随机房间
  ///
  Future<void> toRandomRoom() async {
    Map? roomInfo = await Api.Room.getRandomRoom();
    if(roomInfo == null) {
      return;
    }
    if(roomInfo["scene_id"] != 0) {
      toRoom(roomId: roomInfo["room_id"], data: roomInfo);
    } else {
      toSquare(data: roomInfo);
    }
  }

  void doNormalState() {
    stateRx(RoomState.Normal);
  }

  void doMiniState() {
    stateRx(RoomState.Mini);
  }

  void closeRoom2() async {
    if(sceneCtrl2 == null) {
      await doCloseState();
      return;
    }
    // 房间
    if(_sceneCtrl != null && _sceneCtrl?.roomType != RoomType.guild && _sceneCtrl?.roomId == OAuthCtrl.uid) {
      // 不是公会，并且用户所在的房间是主人房
      // 请求关闭
      await Api.Room.close();
      // 关闭房间
      await doCloseState();
    } else {
      // 房间manager
      await doCloseState();
    }
  }

  ///
  /// 构建pk房的进房信息
  ///
  void putPkInfo(Map<dynamic, dynamic> roomInfo, int pkRoomId) {
    roomInfo["scene_id"] = 4;
    roomInfo["pk_status"] = 1;
    roomInfo["neeJoinRoom"] = false;
    roomInfo["pkRoomId"] = pkRoomId;
  }

  ///
  /// 构建pk房的进房信息
  ///
  void putRoomInfo(Map<dynamic, dynamic> roomInfo) {
    roomInfo["neeJoinRoom"] = false;
  }

  Future<void> doCloseState() async {
    stateRx(RoomState.None);

    final doClose = _sceneCtrl?.doClose;

    _sceneCtrl = null;

    return await doClose?.call();
  }
}
