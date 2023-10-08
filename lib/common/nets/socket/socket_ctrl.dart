import 'dart:typed_data';

import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/commons/config/socket_config.dart';
import 'package:app/common/nets/commons/proto/ErrorCode.pb.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/nets/commons/utils/base_client.dart';
import 'package:app/common/nets/socket/client/custom_client.dart';
import 'package:app/common/nets/socket/client/custom_socket.dart';
import 'package:app/common/nets/socket/server/custom_local_server.dart';
import 'package:app/event/event.dart';
import 'package:app/exception.dart';
import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:protobuf/protobuf.dart';
import 'package:app/env.dart';
import 'package:app/tools/bus.dart';
import 'package:get/get.dart';
import 'package:slugid/slugid.dart';



///
/// socket控制器
///
class SocketCtrl extends GetxController with BusGetLifeMixin, BaseClient {

  // client, 用于与后台通信
  final CustomClient share = CustomClient();

  // 分配给unity的唯一id
  String uniqueId = Slugid.nice().toString();
  // flutter 内部的server, 用于与unity进行通信
  final CustomLocalServer local = CustomLocalServer();

  Completer<bool> _socketStatus = new Completer();

  int forceWaitTimes = 0;

  static SocketCtrl get ins {
    return Get.find<SocketCtrl>();
  }

  @override
  void onInit() {
    super.onInit();
    // 注册所有数据解析器
    registerAll();
    // 初始化客户端socketserver, 用于与unity通信
    local.bindServer();
    // 监听unity发送的消息
    local.onReceiveRawData((session, cmd, data) {
      if(session.uniqueId != uniqueId) {
        return;
      }
      // flutter与unity之间协议通是区间：10000～20000之间
      if(cmd >= FLUTTER_UINITY_START && cmd <= FLUTTER_UINITY_END) {
        // 通知flutter收到信息
        riseOnRawData(cmd, data);
        return;
      }
      // unity发送数据到服务端
      share.sendBytes(cmd, datas: data, sendToUntiy: "unity>>>server");
    });
    // 监听unity发送的消息
    local.onReceiveDataFromU((session, cmd, data) {
      xlog("[socket]:uniqueId: uniqueId ${uniqueId}, cmd = ${cmd}", type: LogType.SOCKET);
      if(session.uniqueId != uniqueId) {
        return;
      }
      // 小于20000的不处理, 因为unity发给服务端的
      if(cmd < FLUTTER_UINITY_START || cmd > FLUTTER_UINITY_END) {
        return;
      }
      // flutter与客户端的通信
      riseOnData(cmd, data);
    });
    // 开心跳心检查
    local.beatHeartCheck();
    local.closeAutoConnect();

    // 接收到原始数据
    share.onRawData((cmd, data) {
      riseOnRawData(cmd, data);
      if(Env.isDebug) {
        xlog("[socket]:uniqueId: uniqueId ${uniqueId}", type: LogType.SOCKET);
      }
      local.getSession(uniqueId)?.sendBytes(cmd, datas: data);
    });
    // 接收到反序列化后的数据
    share.onData((cmd, data) {
      riseOnData(cmd, data);
      // 数据返回，通知网络通了
      if(cmd != CMD.S_Err && !_socketStatus.isCompleted) {
        _socketStatus.complete(true);
      }
    });

    // 断开连接时重置socket状态
    share.addDisconnect(() {
      if(_socketStatus.isCompleted) {
        _socketStatus = Completer();
        return;
      }
    });
  }

  Future<int> getLocalServerPort() async {
    return local.getPortAsync();
  }

  void addServerStatusCallBacks(ServerStatusCallBack serverStatusCallBacks) {
    local.addServerStatusCallBacks(serverStatusCallBacks);
  }

  void removeServerStatusCallBacks(ServerStatusCallBack serverStatusCallBacks) {
    local.removeServerStatusCallBacks(serverStatusCallBacks);
  }

  ///
  /// 发送pb对像数据
  ///
  bool sendSever(int cmd, {GeneratedMessage? message}) {
    if(lastSendTime.containsKey(cmd) && DateTime.now().millisecondsSinceEpoch - lastSendTime[cmd]! < 500) {
      return false;
    }
    lastSendTime[cmd] = DateTime.now().millisecondsSinceEpoch;
    return share.send(cmd, message: message);
  }

  ///
  /// 发送数据到server
  ///
  bool senByteServer(int cmd, {Uint8List? datas}) {
    if(lastSendTime.containsKey(cmd) && DateTime.now().millisecondsSinceEpoch - lastSendTime[cmd]! < 500) {
      return false;
    }
    lastSendTime[cmd] = DateTime.now().millisecondsSinceEpoch;
    return share.sendBytes(cmd, datas: datas);
  }

  ///
  /// 注册反序例化protobuf模型
  ///
  void register(int cmd, OnGeneratedMessage client) {
    share.registerFromBuffers(cmd, client);
    local.registerFromBuffers(cmd, client);
  }

  Map<int, int> lastSendTime = {};

  ///
  /// 发送数据到服务端
  ///
  Future<T?> sendByteAsyncServer<T extends GeneratedMessage>(int cmd, {Uint8List? datas, int? resCmd}) async {
    if(lastSendTime.containsKey(cmd) && DateTime.now().millisecondsSinceEpoch - lastSendTime[cmd]! < 500) {
      return Future.value(null);
    }
    lastSendTime[cmd] = DateTime.now().millisecondsSinceEpoch;
    return share.sendByteAsync(cmd, datas: datas, resCmd: resCmd);
  }

  ///
  /// 添加连接成功回调
  ///
  void addClientConnect(Connected callBack) {
    share.addConnect(callBack);
  }

  void addDisconnect(Disconnect disconnect) {
    share.addDisconnect(disconnect);
  }

  void removeDisconnect(Disconnect disconnect) {
    share.removeDisconnect(disconnect);
  }

  ///
  /// 删除回调
  ///
  void removeClientConnect(Connected callBack) {
    share.removeConnect(callBack);
  }


  ///
  /// 发送pb对像数据
  ///
  bool sendUnity(int cmd, {GeneratedMessage? message}) {
    return local.getSession(uniqueId)?.send(cmd, message: message) ?? false;
  }

  ///
  /// 发送数据到server
  ///
  bool senByteUnity(int cmd, {Uint8List? datas}) {
    return local.getSession(uniqueId)?.sendBytes(cmd, datas: datas) ?? false;
  }

  ///
  /// 发送数据到服务端
  ///
  Future<T?> sendByteAsyncUnity<T extends GeneratedMessage>(int cmd, {Uint8List? datas, int? resCmd}) async {
    return local.getSession(uniqueId)?.sendByteAsync(cmd, datas: datas, resCmd: resCmd);
  }

  ///
  /// 更新时间
  ///
  void updateUniqueId() {
    uniqueId = Slugid.nice().toString();;
  }

  ///
  /// 注册所有的数据解析器
  ///
  void registerAll() {
    register(CMD.S_CreateScene, S_CreateScene.fromBuffer);
    register(CMD.S_Role, S_Role.fromBuffer);
    register(CMD.S_Err, S_Err.fromBuffer);
    register(CMD.S_UpMike, S_UpMike.fromBuffer);
    register(CMD.S_JoinBroadcast, S_JoinBroadcast.fromBuffer);
    register(CMD.S_LeaveBroadcast, S_LeaveBroadcast.fromBuffer);
    register(CMD.S_InviteMikeBroadcast, S_InviteMikeBroadcast.fromBuffer);
    register(CMD.S_UpMikeBroadcast, S_UpMikeBroadcast.fromBuffer);
    register(CMD.S_DownMikeBroadcast, S_DownMikeBroadcast.fromBuffer);
    register(CMD.S_NoticeBroadcast, S_NoticeBroadcast.fromBuffer);
    register(CMD.S_AdministratorBroadcast, S_AdministratorBroadcast.fromBuffer);
    register(CMD.S_BlackBroadcast, S_BlackBroadcast.fromBuffer);
    register(CMD.S_CloseMikeBroadcast, S_CloseMikeBroadcast.fromBuffer);
    register(CMD.S_OpenBroadcast, S_OpenBroadcast.fromBuffer);
    register(CMD.S_AccMikeBroadcast, S_AccMikeBroadcast.fromBuffer);
    register(CMD.S_GiftPlay, S_GiftPlay.fromBuffer);
    register(CMD.S_MoreGiftPlay, S_MoreGiftPlay.fromBuffer);
    register(CMD.S_UpdateLevel, S_UpdateLevel.fromBuffer);
    register(CMD.S_UpdateCharmLevel, S_UpdateCharmLevel.fromBuffer);
    register(CMD.S_LiveStopBroadcast, S_LiveStopBroadcast.fromBuffer);
    register(CMD.S_ApplyUpMikeBroadcast, S_ApplyUpMikeBroadcast.fromBuffer);
    register(CMD.S_ChatMessageBroadcast, S_ChatMessageBroadcast.fromBuffer);
    register(CMD.S_GiveGiftByRoom, S_GiveGiftByRoom.fromBuffer);
    register(CMD.S_FloatingScreen, S_FloatingScreen.fromBuffer);
    register(CMD.S_MoreGiftFloatingScreen, S_MoreGiftFloatingScreen.fromBuffer);
    register(CMD.S_JoinScene, S_JoinScene.fromBuffer);
    register(CMD.S_GoToRoom, S_GoToRoom.fromBuffer);
    register(CMD.S_InFreeMikesArea, S_InFreeMikesArea.fromBuffer);
    register(CMD.S_GiveGiftByDynamic, S_GiveGiftByDynamic.fromBuffer);
    register(CMD.S_SaveUserCurrentDressUp, S_SaveUserCurrentDressUp.fromBuffer);
    register(CMD.S_UpdateRole, S_UpdateRole.fromBuffer);
    register(CMD.S_SyncRoomInfo, S_SyncRoomInfo.fromBuffer);
    register(CMD.S_UseProductAndSaveUserCurrentDressUp, S_UseProductAndSaveUserCurrentDressUp.fromBuffer);
    register(CMD.S_CameraSwitch, S_CameraSwitch.fromBuffer);
    register(CMD.S_PKRoomList, S_PKRoomList.fromBuffer);
    register(CMD.S_PKInvite, S_PKInvite.fromBuffer);
    register(CMD.S_PKInviteResult, S_PKInviteResult.fromBuffer);
    register(CMD.S_PKContinue, S_PKContinue.fromBuffer);

    // 客户端间的通信协仪
    register(BaseClient.CONNECT_VARIFY, C_Verify.fromBuffer);
    register(BaseClient.USER_HEART_BEAT, G_UFHeart.fromBuffer);
    register(CMD.C_GoAwayRoom, C_GoAwayRoom.fromBuffer);
    register(CMD.C_OutFreeMikesArea, C_OutFreeMikesArea.fromBuffer);
    register(CMD.C_PlazaToRoom, C_PlazaToRoom.fromBuffer);
    register(CMD.C_InFreeMikesArea, C_InFreeMikesArea.fromBuffer);
    register(CMD.S_OnlineList, S_OnlineList.fromBuffer);

    // 漂屏礼物广播
    onDataCmd(CMD.S_FloatingScreen, onFloatingScreen);
    onDataCmd(CMD.C_PlazaToRoom, onPlazaToRoom);

    // 多个礼物飘屏广播广播
    onDataCmd(CMD.S_MoreGiftFloatingScreen, onMoreGiftFloatingScreen);

    // 连接状态
    onDataCmd(BaseClient.CONNECT_FAIL, onConnectFail);
    onDataCmd(BaseClient.CONNECT_SUC, onConnectSuccess);

  }

  ///
  /// 开启socket连接
  ///
  void startClient(String host, int port) {
    removeClientConnect(onClientConnect);
    removeOnDataCmd(CMD.S_Role, onRoleResponse);
    removeOnDataCmd(CMD.S_Err, onServerError);

    // 连接socket
    post(() async {
      // 重置状态
      share.onCanConnected(true);
      // 连接服务器
      share.connect(host, port);
      // 连接成功回调
      addClientConnect(onClientConnect);
      onDataCmd(CMD.S_Role, onRoleResponse);
      onDataCmd(CMD.S_Err, onServerError);
    });
  }

  ///
  /// 断开socket
  ///
  void closeSocket() {
    share.onCanConnected(false);
    share.resetConnect();
  }

  ///
  /// 取消心跳
  ///
  void cancelUnityHeartBeat() {
    local.cancelHeartBeat();
  }

  ///
  /// 开始与unity的心跳
  ///
  void startUnityHeartBeat() {
    local.beatHeartCheck();
  }

  ///
  /// 用户信息返回
  ///
  void onRoleResponse(int cmd, S_Role? role) {
    if(role == null) {
      return;
    }
    var roleId = role.role.roleId;
    var name = role.role.name;
    // 收到用户信息后，才认为是己经连接上
    if(!_socketStatus.isCompleted) {
      _socketStatus.complete(true);
    }
    // PkRoomID不为空时，证明用户此时还在PK房中，那么强制拉进房间里
    var pkRoomId = role.pkRoomId.toInt();
    var roomId = role.roomId.toInt();
    // 数据异常
    if(pkRoomId <= 0 || roomId <= 0) {
      return;
    }
    Future.delayed(const Duration(seconds: 2)).whenComplete(() async {
      var roomInfo = await Api.Room.info(roomId: roomId, tryTimes: 2);
      RoomManagerCtrl.ins.putPkInfo(roomInfo, pkRoomId);
      RoomManagerCtrl.ins.toMiddleRoom(roomId: roomId, data: roomInfo, off: true, callCloseRoom: false);
    });
  }

  ///
  /// unity通知切换roomId
  ///
  void onPlazaToRoom(int cmd, C_PlazaToRoom? role) {
    if(role == null) {
      return;
    }
    post(() async {
      Get.find<RoomManagerCtrl>().toMiddleRoom(roomId: role.roomid.toInt(), off: true);
    });
  }

  ///
  /// 服务端错误
  ///
  void onServerError(int cmd, S_Err? role) {
    // 网络连接非法
    if(role?.code == ErrorCode.NETWORK_ANOMALY) {
      if(!_socketStatus.isCompleted) {
        _socketStatus.complete(false);
      }
      share.reConnect();
      _socketStatus = Completer();
    }

    xlog("服务端返回错误：cmd = $cmd error = ${role?.code}", type: LogType.SOCKET);
    if(role?.message.isNotEmpty == true) {
      showToast(role?.message ?? "");
    }

  }

  ///
  /// 获取socket连接状态，认为收到用户信息时才是连接成功
  ///
  Future<bool> isCConnect() async {
    // socket己经连接，但是没有收到数据包超过10秒时间
    // 没有收到数据包超过10秒时间
    if(forceWaitTimes > 0) {
      _socketStatus = Completer();
      forceWaitTimes = 0;
    }
    if(_socketStatus.isCompleted) {
      return Future.value(true);
    }
    return _socketStatus.future;
  }

  ///
  /// 连接成功后，就请求用户信息
  ///
  void onClientConnect() {
    C_Role role = C_Role.create();
    role.session = OAuthCtrl.token ?? "";
    sendSever(CMD.C_Role, message: role);
  }

  @override
  void dispose() {
    super.dispose();
    share.dispose();
    local.dispose();
    lastSendTime.clear();

    removeOnDataCmd(CMD.S_FloatingScreen, onFloatingScreen);
    removeOnDataCmd(CMD.C_PlazaToRoom, onPlazaToRoom);
    removeOnDataCmd(CMD.S_MoreGiftFloatingScreen, onMoreGiftFloatingScreen);
    removeOnDataCmd(BaseClient.CONNECT_FAIL, onConnectFail);
    removeOnDataCmd(BaseClient.CONNECT_SUC, onConnectSuccess);

    removeOnDataCmd(CMD.S_Role, onRoleResponse);
    removeOnDataCmd(CMD.S_Err, onServerError);
    removeClientConnect(onClientConnect);
  }

  // 连接错误次数
  int errorTimes = 0;

  // 记录无网络的弹窗是否弹起
  var popUp = false;

  var hasShowPopUp = false;

  void onConnectSuccess(int cmd, GeneratedMessage? data) {
    errorTimes = 0;
    // 弹窗在调起时, 直接返回
    if(popUp) {
      Get.back();
    }
    if(hasShowPopUp) {
      showToast("连接成功");
      hasShowPopUp = false;
    }
  }

  ///
  /// 连接失败
  ///
  void onConnectFail(int cmd, GeneratedMessage? data) async {
    errorTimes += 1;
    if(errorTimes <= 2 || popUp) {
      return;
    }
    popUp = true;
    hasShowPopUp = true;
    Get.alertDialog2("网络连接失败", button: "重连", callBack: () {
      popUp = false;
      errorTimes = 0;
      Get.back();
    });
  }

  ///
  /// 漂屏
  ///
  void onFloatingScreen(int cmd, S_FloatingScreen? sFloatingscreen) {
    if(sFloatingscreen == null) {
      return;
    }
    SuperGiftEvent(sFloatingscreen).fire();
  }

  ///
  /// 多个礼物漂屏
  ///
  void onMoreGiftFloatingScreen(int cmd, S_MoreGiftFloatingScreen? sMoreGiftFloatingScreen) {
    if(sMoreGiftFloatingScreen == null) {
      return;
    }
    sMoreGiftFloatingScreen.items.forEach((element) {
      SuperGiftEvent(element).fire();
    });
  }
}