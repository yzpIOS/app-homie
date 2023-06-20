import 'dart:typed_data';

import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/commons/utils/base_client.dart';
import 'package:app/common/nets/socket/client/custom_client.dart';
import 'package:app/common/nets/socket/client/custom_socket.dart';
import 'package:app/common/nets/socket/proto/Message.pb.dart';
import 'package:app/common/nets/socket/server/custom_local_server.dart';
import 'package:protobuf/protobuf.dart';
import 'package:app/env.dart';
import 'package:app/tools/bus.dart';
import 'package:get/get.dart';


const FLUTTER_UINITY_START = 20000;
const FLUTTER_UINITY_END = 21000;

///
/// socket控制器
///
class SocketCtrl extends GetxController with BusGetLifeMixin, BaseClient {

  // client, 用于与后台通信
  final CustomClient shareClient = CustomClient();

  // 分配给unity的唯一id
  String uniqueId = DateTime.now().toString();
  // flutter 内部的server, 用于与unity进行通信
  final CustomLocalServer localServer = CustomLocalServer();

  static SocketCtrl get ins {
    return Get.find<SocketCtrl>();
  }



  @override
  void onInit() {
    super.onInit();
    // 注册所有数据解析器
    registerAll();
    // 初始化客户端socketserver, 用于与unity通仿
    localServer.bindServer();
    // 监听unity发送的消息
    localServer.onReceiveRawData((session, cmd, data) {
      if(session.uniqueId != uniqueId) {
        return;
      }
      // flutter与unity之间的协义号从20001开始
      // 大于20000的是unity发给flutter的信息
      if(cmd >= FLUTTER_UINITY_START || cmd <= FLUTTER_UINITY_END) {
        // 通知flutter收到信息
        riseOnRawData(cmd, data);
        return;
      }
      // 发送数据到服务端
      shareClient.sendBytes(cmd, datas: data);
    });
    // 监听unity发送的消息
    localServer.onReceiveDataFromU((session, cmd, data) {
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
    localServer.beatHeartCheck();

    // 接收到原始数据
    shareClient.onRawData((cmd, data) {
      riseOnRawData(cmd, data);
      localServer.getSession(uniqueId)?.sendBytes(cmd, datas: data);
    });
    // 接收到反序列化后的数据
    shareClient.onData((cmd, data) {
      riseOnData(cmd, data);
    });
  }

  Future<int> getLocalServerPort() async {
    return localServer.getPortAsync();
  }

  void addServerStatusCallBacks(ServerStatusCallBack serverStatusCallBacks) {
    localServer.addServerStatusCallBacks(serverStatusCallBacks);
  }

  void removeServerStatusCallBacks(ServerStatusCallBack serverStatusCallBacks) {
    localServer.removeServerStatusCallBacks(serverStatusCallBacks);
  }

  ///
  /// 启动client
  ///
  void startClient(String host, int port) {
    shareClient.connect(host, port);
  }

  ///
  /// 发送pb对像数据
  ///
  bool sendSever(int cmd, {GeneratedMessage? message}) {
    return shareClient.send(cmd, message: message);
  }

  ///
  /// 发送数据到server
  ///
  bool senByteServer(int cmd, {Uint8List? datas}) {
    return shareClient.sendBytes(cmd, datas: datas);
  }

  ///
  /// 注册反序例化protobuf模型
  ///
  void register(int cmd, OnGeneratedMessage client) {
    shareClient.registerFromBuffers(cmd, client);
    localServer.registerFromBuffers(cmd, client);
  }

  ///
  /// 发送数据到服务端
  ///
  Future<T?> sendByteAsyncServer<T extends GeneratedMessage>(int cmd, {Uint8List? datas, int? resCmd}) async {
    return shareClient.sendByteAsync(cmd, datas: datas, resCmd: resCmd);
  }

  ///
  /// 添加连接成功回调
  ///
  void addClientConnect(Connected callBack) {
    shareClient.addConnect(callBack);
  }

  ///
  /// 删除回调
  ///
  void removeClientConnect(Connected callBack) {
    shareClient.removeConnect(callBack);
  }


  ///
  /// 发送pb对像数据
  ///
  bool sendUnity(int cmd, {GeneratedMessage? message}) {
    return localServer.getSession(uniqueId)?.send(cmd, message: message) ?? false;
  }

  ///
  /// 发送数据到server
  ///
  bool senByteUnity(int cmd, {Uint8List? datas}) {
    return localServer.getSession(uniqueId)?.sendBytes(cmd, datas: datas) ?? false;
  }

  ///
  /// 发送数据到服务端
  ///
  Future<T?> sendByteAsyncUnity<T extends GeneratedMessage>(int cmd, {Uint8List? datas, int? resCmd}) async {
    return localServer.getSession(uniqueId)?.sendByteAsync(cmd, datas: datas, resCmd: resCmd);
  }

  ///
  /// 更新时间
  ///
  void updateUniqueId() {
    uniqueId = DateTime.now().toString();
  }

  ///
  /// 是否可以连接
  ///
  void onCanConnected(bool canConnect) {
    shareClient.onCanConnected(canConnect);
  }

  ///
  /// 重置连接数据
  ///
  void resetConnect() {
    shareClient.resetConnect();
  }

  ///
  /// 注册所有的数据解析器
  ///
  void registerAll() {
    register(CMD.S_CreateScene, S_CreateScene.fromBuffer);
    register(CMD.S_Role, S_Role.fromBuffer);
    register(CMD.S_Err, S_Err.fromBuffer);
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
    register(CMD.S_UpdateLevel, S_UpdateLevel.fromBuffer);
    register(CMD.S_UpdateCharmLevel, S_UpdateCharmLevel.fromBuffer);
    register(CMD.S_LiveStopBroadcast, S_LiveStopBroadcast.fromBuffer);
    register(CMD.S_ApplyUpMikeBroadcast, S_ApplyUpMikeBroadcast.fromBuffer);
    register(CMD.S_ChatMessageBroadcast, S_ChatMessageBroadcast.fromBuffer);

    register(CMD.S_GiveGiftByRoom, C_GiveGiftByRoom.fromBuffer);
  }

  @override
  void dispose() {
    super.dispose();
    shareClient.dispose();
    localServer.dispose();
  }
}