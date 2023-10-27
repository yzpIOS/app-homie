import 'dart:typed_data';

import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/commons/config/socket_config.dart';
import 'package:app/common/nets/commons/proto/ErrorCode.pb.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/nets/commons/utils/base_client.dart';
import 'package:app/common/nets/commons/utils/byte_converter.dart';
import 'package:app/common/nets/socket/client/custom_client.dart';
import 'package:app/common/nets/socket/client/custom_socket.dart';
import 'package:app/common/nets/socket/server/custom_local_server.dart';
import 'package:app/event/event.dart';
import 'package:app/exception.dart';
import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/message/announcement_message_dialog.dart';
import 'package:app/widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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

  // 网络状态订阅
  StreamSubscription? _netStateSubscription;

  static SocketCtrl get ins {
    return Get.find<SocketCtrl>();
  }

  @override
  void onInit() {
    super.onInit();
    // 注册所有数据解析器
    registerAll();
    // 注册协议解析类
    ByteConverter(share: share, local: local).inject();
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

      // 发送成功事件
      if(!local.statusCompleter.isCompleted) {
        local.statusCompleter.complete(true);
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
    });

    // 连接成功回调
    addClientConnect(onClientConnect);
    onDataCmd(CMD.S_Role, onRoleResponse);
    onDataCmd(CMD.S_Err, onServerError);

    // 监听网络状态
    netStateChangeListener();
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


  void addLocalDisconnect(Disconnect disconnect) {
    local.addDisconnect(disconnect);
  }

  void removeLocalDisconnect(Disconnect disconnect) {
    local.removeDisconnect(disconnect);
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
    // 漂屏礼物广播
    onDataCmd(CMD.S_FloatingScreen, onFloatingScreen);
    onDataCmd(CMD.C_PlazaToRoom, onPlazaToRoom);

    // 多个礼物飘屏广播广播
    onDataCmd(CMD.S_MoreGiftFloatingScreen, onMoreGiftFloatingScreen);

    // 公告广播(公告板)
    onDataCmd(CMD.S_BulletinBroadcast, onBulletinBroadcast);

    // 连接状态
    onDataCmd(BaseClient.CONNECT_FAIL, onConnectFail);
    onDataCmd(BaseClient.CONNECT_SUC, onConnectSuccess);

  }

  ///
  /// 开启socket连接
  ///
  void startClient(String host, int port) {
    // 设置host和port
    share.setHostAndPort(host, port);
    // 连接socket
    post(() async {
      // 重置状态
      share.onCanConnected(true);
      // 连接服务器
      share.connect();
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
  /// 用户信息返回
  ///
  void onRoleResponse(int cmd, S_Role? role) {
    if(role == null) {
      return;
    }
    logForDebug("[SocketCtrl:onRoleResponse]:连接成功，收到用户信息, role = ${role.toString()}");

    // 收到用户信息后，才认为是己经连接上
    share.completeShareSocketStatus();
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
      share.completeErrorShareSocketStatus();
      // 立即连接会有问题，延迟去连接
      share.resetConnect();
      delay(300, () {
        share.reConnect(foreceConnect: true);
      });
    }

    logForDebug("服务端返回错误：cmd = $cmd error = ${role?.code}", type: LogType.SOCKET);
    if(role?.message.isNotEmpty == true) {
      showToast(role?.message ?? "");
    }
  }

  ///
  /// 获取socket连接状态，认为收到用户信息时才是连接成功
  ///
  Future<bool> isCConnect() async {
    // socket己经连接，但是没有收到数据包超过10秒时间
    await share.isConnect();

    // 等待unity连接成功
    if(!local.statusCompleter.isCompleted) {
      logForDebug("unity没有连接，等待unity连接");
      await local.statusCompleter.future;
      logForDebug("unity连接成功111");
    }
    return Future.value(true);
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

    _streamSubscription?.cancel();
    _netStateSubscription?.cancel();

    removeOnDataCmd(CMD.S_FloatingScreen, onFloatingScreen);
    removeOnDataCmd(CMD.C_PlazaToRoom, onPlazaToRoom);
    removeOnDataCmd(CMD.S_MoreGiftFloatingScreen, onMoreGiftFloatingScreen);
    removeOnDataCmd(CMD.S_BulletinBroadcast, onBulletinBroadcast);
    removeOnDataCmd(BaseClient.CONNECT_FAIL, onConnectFail);
    removeOnDataCmd(BaseClient.CONNECT_SUC, onConnectSuccess);

    removeOnDataCmd(CMD.S_Role, onRoleResponse);
    removeOnDataCmd(CMD.S_Err, onServerError);
    removeClientConnect(onClientConnect);
  }

  // 连接错误次数
  int errorTimes = 0;

  var hasShowPopUp = false;
  // 记录无网络的弹窗是否弹起
  var popUp = false;

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
    if(!OAuthCtrl.isLogin) {
      return;
    }
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

  ///
  /// 公告广播(公告板)
  ///
  void onBulletinBroadcast(int cmd, S_BulletinBroadcast? sBulletinBroadcast) {
    if(sBulletinBroadcast == null) {
      return;
    }
    Get.dialog(AnnouncementMessageDialog(bulletinId: sBulletinBroadcast.bulletinId.toInt(), message: sBulletinBroadcast.message,));
  }

  ConnectivityResult? preState;

  ///
  /// 连接关闭时自动连接
  ///
  void netStateChangeListener() {
    _netStateSubscription?.cancel();
    // 订阅网络变化
    _netStateSubscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult state) {
      // 如果网络变化的值一样，就不处理
      if(preState == state) {
        logForDebug("网络状态与之前状态一致, state = $state");
        return;
      }
      preState = state;
      // 没有网络直接返回
      final hasNet = state != ConnectivityResult.none && state != ConnectivityResult.bluetooth;
      if(!hasNet) {
        logForDebug("网络发生变化；无网络000, state = $state");
        // 重置所有与unity相关的socket连接
        local.resetConnect();
        local.cancelHeartBeat();
        // 重置所有的网
        share.resetConnect(clearHost: false);
        // 不给自动重连
        share.onCanConnected(false);
        return;
      }
      logForDebug("网络发生变化；有网络111, state = $state");
      // 设置自动重连
      share.onCanConnected(true);
      // 连接server
      share.reConnect(foreceConnect: true);
      // 唤起unity相关的回调，与unity进行socket连接
      local.riseServerStatusCallBacks();
      local.beatHeartCheck();
    });

    // 检测刚刚开始的网络
    Connectivity().checkConnectivity().then((value) {
      preState = value;
    });
  }


  // 是否需要关闭socket
  bool needSendCloseEvent = true;
  // 重置socket的定时器
  StreamSubscription? _streamSubscription;

  ///
  /// App从后台到前台时，判断socket是否还在连接
  ///
  void onAppResume() {
    // 设置进房需要等待服务端返回数据，才能进房
    _streamSubscription?.cancel();
    SocketCtrl.ins.share.forceWaitTimes = CLIENT_BEAT_RATE * CLIENT_MAX_BEAT_TIME + 2;
    _streamSubscription = Future.delayed(Duration(seconds: SocketCtrl.ins.share.forceWaitTimes)).asStream().listen((event) {
      needSendCloseEvent = true;
      // 长时间连不上, 做兜底连接
      if(SocketCtrl.ins.share.forceWaitTimes > 0) {
        SocketCtrl.ins.share.reConnect(foreceConnect: true);
      }
    });
  }

  ///
  /// app退后台时调用此方法，重置数据
  ///
  void onAppPause() {
    needSendCloseEvent = false;
    _streamSubscription?.cancel();
  }

}