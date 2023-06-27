
import 'dart:async';
import 'dart:typed_data';

import 'package:app/common/nets/commons/utils/base_client.dart';
import 'package:app/common/nets/commons/utils/byte_utils.dart';
import 'package:app/common/nets/commons/utils/call_back.dart';
import 'package:app/env.dart';
import 'package:app/widgets.dart';

import 'custom_socket.dart';
import 'dart:core';
import 'package:protobuf/protobuf.dart';


class CustomClient with BaseClient {

  // 单例引用
  static final CustomClient _ins = CustomClient();
  // 单例获取方法
  static CustomClient get ins {
    return _ins;
  }

  // socket连接
  final CustomSocket _customSocket = CustomSocket();

  // 心跳定时器
  StreamSubscription? _heartBeatStream;

  // 记录客户端发送心跳次数，服务端心跳返回时清理
  int heartBeatNumber = 0;

  CustomClient() {
    // 断开自动连接
    _customSocket.closeAutoConnect();
    // 收到消息时的回调
    _customSocket.addReceive((data) {
      onReceive(data);
    });

    // 断开连接时的回调，用于清理数据
    _customSocket.addDisconnect(() {
      serverByteBuffer.clearBuffer();
      _heartBeatStream?.cancel();
    });

    // 监听开始心跳
    _customSocket.addConnect(() {
      startHeartBeat();
    });

    // socket状态变化
    _customSocket.socketStatusCallBack = (cmd) {
      // 处理protobuf
      riseOnData(cmd, null);
      // 原始数据
      riseOnRawData(cmd, null);
    };
  }

  ///
  /// 发送数据
  ///
  bool send(int cmd, {GeneratedMessage? message}) {
    return sendBytes(cmd, datas: message?.writeToBuffer());
  }


  ///
  /// 发送数据
  /// C_Role c_role = C_Role(session: "家武，家武，收到请回答！");
  /// CustomClient.ins.sendBytes(6666, datas: c_role.writeToBuffer());
  ///
  bool sendBytes(int cmd, {Uint8List? datas, String sendToUntiy = ""}) {
    if(Env.isDebug) {
      debugPrint("[socket]:${sendToUntiy}发送数据, cmd = $cmd, data = ${datas
          .toString()}");
    }
    int len = datas?.length ?? 0;
    // 加密
    ByteUtils.encryption(datas);
    // 数据封装
    datas = Uint8List.fromList([
      // 32位整数，转化成二进制数据
      (len >> 24).toUnsigned(8), (len >> 16).toUnsigned(8), (len >> 8).toUnsigned(8), (len).toUnsigned(8),
      // 32位整数，转化成二进制数据
      (cmd >> 24).toUnsigned(8), (cmd >> 16).toUnsigned(8), (cmd >> 8).toUnsigned(8), (cmd).toUnsigned(8), ...(datas ?? [])
    ]);
    return _customSocket.send(datas);
  }

  ///
  /// 发送返回的数据
  ///
  Future<T?> sendByteAsync<T extends GeneratedMessage>(int cmd, {Uint8List? datas, int? resCmd}) async {
    CallBack<T> callBack = createCallBack(cmd, resCmd: resCmd);
    sendBytes(cmd, datas: datas);
    return callBack.getFuture();
  }

  ///
  /// 连接服务器
  ///
  CustomClient connect(String host, int port, {int timeout = 10}) {
    _customSocket.connect(host, port, timeout: timeout);
    return this;
  }

  ///
  /// 连接成功回调
  ///
  CustomClient addConnect(Connected connected) {
    _customSocket.addConnect(connected);
    return this;
  }

  ///
  /// 连接成功回调
  ///
  CustomClient removeConnect(Connected connected) {
    _customSocket.removeConnect(connected);
    return this;
  }

  ///
  /// 断开回调
  ///
  CustomClient addDisconnect(Disconnect disconnect) {
    _customSocket.addDisconnect(disconnect);
    return this;
  }

  ///
  /// 心跳
  ///
  CustomClient startHeartBeat({int interval = 5}) {
    // 心跳没有响应的次数
    if(heartBeatNumber > 3) {
      _customSocket.reconnect();
      heartBeatNumber = 0;
    }

    // 取消定时器
    _heartBeatStream?.cancel();
    // 延尺执行
    _heartBeatStream = Future.delayed(Duration(seconds: interval)).asStream().listen((event) {
      // 发送心跳成功，数值加1
      if(sendBytes(1)) {
        heartBeatNumber += 1;
      }
      // 下一个心跳
      startHeartBeat(interval: interval);
    }, onError: (error){
    // 下一个心跳
      startHeartBeat(interval: interval);
    });
    return this;
  }

  @override
  void handleResponse(int cmd, Uint8List? curPkg, GeneratedMessage? onGeneratedMessage) {
    super.handleResponse(cmd, curPkg, onGeneratedMessage);
    handleHeartBeatRes(cmd);
  }
  ///
  /// 心跳返回处理
  void handleHeartBeatRes(int cmd) {
    if(cmd != 1) {
      return;
    }
    // 尺到心跳回庆重新置成0
    heartBeatNumber = 0;
  }

  ///
  /// 是否可以连接
  ///
  void onCanConnected(bool canConnect) {
    _customSocket.onCanConnected(canConnect);
  }

  ///
  /// 重置连接数据
  ///
  void resetConnect() {
    _customSocket.resetConnect();
  }

  ///
  /// 销毁连接
  ///
  @override
  void dispose() {
    _customSocket.dispose();
  }
}