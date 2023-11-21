
import 'dart:async';
import 'dart:typed_data';

import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/commons/config/socket_config.dart';
import 'package:app/common/nets/commons/utils/base_client.dart';
import 'package:app/common/nets/commons/utils/byte_utils.dart';
import 'package:app/common/nets/commons/utils/call_back.dart';
import 'package:app/env.dart';
import 'package:app/tools.dart';
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

  // 发送数据错误次数
  int sendFailTime = 0;

  // 从后台到前台时，把下面的值设成不为0，然后就会待待socket数据包
  int forceWaitTimes = 0;
  // 是否可以连接，连接时不能重置forceWaitTimes值
  bool _canForceWaitTimes = true;

  // socket状态
  Completer<bool> _shareSocketStatus = Completer();

  CustomClient() {
    // 收到消息时的回调
    _customSocket.addReceive((data) {
      onReceive(data);
    });

    // 断开连接时的回调，用于清理数据
    _customSocket.addDisconnect(() {
      serverByteBuffer.clearBuffer();
      _heartBeatStream?.cancel();
      // 设成没有完成
      resetShareSocketStatus();
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

    // 开始连接时，重新设置网络状态
    _customSocket.startConnect = () {
      logForDebug("socket开始重新连接....");
      _canForceWaitTimes = false;
      resetShareSocketStatus();
    };
  }

  @override
  void riseOnData(int curCmd, GeneratedMessage? generatedMessage) {
    super.riseOnData(curCmd, generatedMessage);
    // 数据返回，通知网络通了
    if(curCmd != CMD.S_Err && _canForceWaitTimes) {
      logForDebug("收到服务端的协议，重置forceWaitTimes = ${forceWaitTimes}字段, 此时_shareSocketStatus = ${_shareSocketStatus.isCompleted} ,_canForceWaitTimes = $_canForceWaitTimes");
      completeShareSocketStatus();
    }
  }

  Future<bool> isConnect() async {
    if(forceWaitTimes > 0) {
      resetShareSocketStatus();
    }

    // 等待socket连接成功
    if(!_shareSocketStatus.isCompleted) {
      logForDebug("socket没有连接，等待socket连接");
      await _shareSocketStatus.future;
      logForDebug("socket连接成功111");
    } else {
      return Future.value(true);
    }
    return _shareSocketStatus.future;
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
    debugPrint("[socket]:${sendToUntiy}发送数据, cmd = $cmd, data = ${datas
        .toString()}");
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
    try {
      var sendResult = _customSocket.send(datas);
      sendFailTime = 0;
      return sendResult;
    } catch(e) {
      // 发送数据错误超过3次，就重新连接
      sendFailTime += 1;
      if(sendFailTime > 3) {
        logForDebug("多次网络请求发送异常，sendFailTime = ${sendFailTime}");
        _customSocket.reconnect();
        sendFailTime = 0;
      }
    }
    return false;
  }

  ///
  /// 发送返回的数据
  ///
  Future<T?> sendByteAsync<T extends GeneratedMessage>(int cmd, {Uint8List? datas, int? resCmd, int timeout = 16}) async {
    CallBack<T> callBack = createCallBack(cmd, resCmd: resCmd);
    sendBytes(cmd, datas: datas);
    return callBack.getFuture(timeout: timeout);
  }

  ///
  /// 设置host和port
  ///
  void setHostAndPort(String host, int port) {
    _customSocket.setHostAndPort(host, port);
  }

  ///
  /// 连接服务器
  ///
  CustomClient connect() {
    _customSocket.connect();
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
  /// 断开回调
  ///
  CustomClient removeDisconnect(Disconnect disconnect) {
    _customSocket.removeDisconnect(disconnect);
    return this;
  }

  ///
  /// 心跳
  ///
  CustomClient startHeartBeat({int interval = CLIENT_BEAT_RATE}) {
    // 心跳没有响应的次数
    if(heartBeatNumber >= CLIENT_MAX_BEAT_TIME) {
      logForDebug("长时间没有接收服务端的心跳， heartBeatNumber = ${heartBeatNumber}");
      _customSocket.reconnect(foreceConnect: true);
      heartBeatNumber = 0;
    }

    // 取消定时器
    _heartBeatStream?.cancel();

    // 延尺执行
    _heartBeatStream = Future.delayed(Duration(seconds: interval)).asStream().listen((event) {
      // 发送心跳成功，数值加1
      sendBytes(1);
      heartBeatNumber += 1;
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
    if(cmd == CMD.S_Err) {
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
  void resetConnect({bool clearHost = true}) {
    logForDebug("重置网络状态 ${heartBeatNumber}");
    _customSocket.resetConnect(clearHost: clearHost);
  }

  ///
  /// 重置连接数据
  ///
  void reConnect({bool foreceConnect = false}) {
    if(_shareSocketStatus.isCompleted) {
      _shareSocketStatus = Completer();
    }
    logForDebug("socket重新连接 ${heartBeatNumber}");
    _customSocket.reconnect(foreceConnect: foreceConnect);
  }

  int getReceiveTime() {
    return _customSocket.preReceiveTime;
  }

  ///
  /// 连接成功状态设置
  ///
  void completeShareSocketStatus() {
    if(!_shareSocketStatus.isCompleted) {
      _shareSocketStatus.complete(true);
    }
    forceWaitTimes = 0;
    _canForceWaitTimes = true;
  }

  ///
  /// 设置连接成时错误
  ///
  void completeErrorShareSocketStatus() {
    if(!_shareSocketStatus.isCompleted) {
      _shareSocketStatus.completeError(TimeoutException("time out"));
    }
  }

  ///
  /// 重置_shareSocketStatus状态
  ///
  void resetShareSocketStatus() {
    if(_shareSocketStatus.isCompleted) {
      _shareSocketStatus = Completer();
    }
  }

  ///
  /// 销毁连接
  ///
  @override
  void dispose() {
    completeErrorShareSocketStatus();
    _customSocket.dispose();
  }
}