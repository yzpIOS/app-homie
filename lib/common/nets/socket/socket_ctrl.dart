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
  final CustomClient _client = CustomClient();

  // 分配给unity的唯一id
  String uniqueId = DateTime.now().toString();
  // flutter 内部的server, 用于与unity进行通信
  final CustomLocalServer _localServer = CustomLocalServer();

  static SocketCtrl getCtrl() {
    return Get.find<SocketCtrl>();
  }

  @override
  void onInit() {
    super.onInit();
    // 注册所有数据解析器
    registerAll();
    // 初始化客户端socketserver, 用于与unity通仿
    _localServer.bindServer();
    // 监听unity发送的消息
    _localServer.onReceiveRawData((session, cmd, data) {
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
      _client.sendBytes(cmd, datas: data);
    });
    // 监听unity发送的消息
    _localServer.onReceiveDataFromU((session, cmd, data) {
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
    _localServer.beatHeartCheck();

    // 接收到原始数据
    _client.onRawData((cmd, data) {
      riseOnRawData(cmd, data);
      _localServer.getSession(uniqueId)?.sendBytes(cmd, datas: data);
    });
    // 接收到反序列化后的数据
    _client.onData((cmd, data) {
      riseOnData(cmd, data);
    });
  }

  Future<int> getLocalServerPort() async {
    return _localServer.getPortAsync();
  }

  void addServerStatusCallBacks(ServerStatusCallBack serverStatusCallBacks) {
    _localServer.addServerStatusCallBacks(serverStatusCallBacks);
  }

  void removeServerStatusCallBacks(ServerStatusCallBack serverStatusCallBacks) {
    _localServer.removeServerStatusCallBacks(serverStatusCallBacks);
  }

  ///
  /// 启动client
  ///
  void startClient(String host, int port) {
    _client.connect(host, port);
  }

  ///
  /// 发送pb对像数据
  ///
  bool sendSever(int cmd, {GeneratedMessage? message}) {
    return _client.send(cmd, message: message);
  }

  ///
  /// 发送数据到server
  ///
  bool senByteServer(int cmd, {Uint8List? datas}) {
    return _client.sendBytes(cmd, datas: datas);
  }

  ///
  /// 注册反序例化protobuf模型
  ///
  void register(int cmd, OnGeneratedMessage client) {
    _client.registerFromBuffers(cmd, client);
    _localServer.registerFromBuffers(cmd, client);
  }

  ///
  /// 发送数据到服务端
  ///
  Future<T?> sendByteAsyncServer<T extends GeneratedMessage>(int cmd, {Uint8List? datas, int? resCmd}) async {
    return _client.sendByteAsync(cmd, datas: datas, resCmd: resCmd);
  }

  ///
  /// 添加连接成功回调
  ///
  void addClientConnect(Connected callBack) {
    _client.addConnect(callBack);
  }

  ///
  /// 删除回调
  ///
  void removeClientConnect(Connected callBack) {
    _client.removeConnect(callBack);
  }


  ///
  /// 发送pb对像数据
  ///
  bool sendUnity(int cmd, {GeneratedMessage? message}) {
    return _localServer.getSession(uniqueId)?.send(cmd, message: message) ?? false;
  }

  ///
  /// 发送数据到server
  ///
  bool senByteUnity(int cmd, {Uint8List? datas}) {
    return _localServer.getSession(uniqueId)?.sendBytes(cmd, datas: datas) ?? false;
  }

  ///
  /// 发送数据到服务端
  ///
  Future<T?> sendByteAsyncUnity<T extends GeneratedMessage>(int cmd, {Uint8List? datas, int? resCmd}) async {
    return _localServer.getSession(uniqueId)?.sendByteAsync(cmd, datas: datas, resCmd: resCmd);
  }

  ///
  /// 更新时间
  ///
  void updateUniqueId() {
    uniqueId = DateTime.now().toString();
  }

  ///
  /// 注册所有的数据解析器
  ///
  void registerAll() {
    register(CMD.S_CreateScene, S_CreateScene.fromBuffer);
    register(CMD.S_Role, S_Role.fromBuffer);
    register(CMD.S_Err, S_Err.fromBuffer);
    // register(CMD.S_CloseScene, S_CloseScene.fromBuffer);
    // register(CMD.S_JoinScene, S_JoinScene.fromBuffer);
    // register(CMD.S_OutScene, S_OutScene.fromBuffer);
    register(CMD.S_LiveBroadcast, S_LiveBroadcast.fromBuffer);
    register(CMD.S_OnlineBroadcast, S_OnlineBroadcast.fromBuffer);
    register(CMD.S_MikeBroadcast, S_MikeBroadcast.fromBuffer);
    register(CMD.S_AccMikeBroadcast, S_AccMikeBroadcast.fromBuffer);
    register(CMD.S_NoticeBroadcast, S_NoticeBroadcast.fromBuffer);
    register(CMD.S_BlackBroadcast, S_BlackBroadcast.fromBuffer);
    register(CMD.S_ChatMessageBroadcast, S_ChatMessageBroadcast.fromBuffer);
  }

  @override
  void dispose() {
    super.dispose();
    _client.dispose();
    _localServer.dispose();
  }
}