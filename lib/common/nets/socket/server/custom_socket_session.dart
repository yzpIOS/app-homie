

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/nets/commons/utils/base_client.dart';
import 'package:app/common/nets/commons/utils/byte_utils.dart';
import 'package:app/common/nets/commons/utils/call_back.dart';
import 'package:app/env.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:protobuf/protobuf.dart';

class CustomSocketSession with BaseClient {

  ///
  /// 连接进来的socket对像
  ///
  Socket socket;

  // 客户端id
  String uniqueId = "";

  // 网络连接订阅
  StreamSubscription? _socketSubscription;

  // 上一次收到协义数据
  int lastReceivePkgTime = DateTime.now().millisecondsSinceEpoch;

  Function? exitCallBack;

  CustomSocketSession({required this.socket}) {
    // 监听数据
    socket.asBroadcastStream(onListen: (event) {
      _socketSubscription = event;
    }).listen((data) {
      // 接收到数据
      onReceive(data);
    }, onError: (error) {
      // 断开连接
      // unity退出
      exitCallBack?.call();
    });
    
    registerFromBuffers(CMD.C_Verify, C_Verify.fromBuffer);
  }

  ///
  /// 获取ip
  ///
  String getHost() {
    return socket.address.address;
  }

  ///
  /// 获取端口
  ///
  int getPort() {
    return socket.port;
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
  bool sendBytes(int cmd, {Uint8List? datas}) {
    if(Env.isDebug) {
      xlog("[socket]:sever>>>unity发送数据, cmd = $cmd, data = ${datas
          .toString()}", type: LogType.SOCKET);
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
    try {
      socket.add(datas);
    } catch(e) {
      return false;
    }
    return true;
  }

  ///
  /// 发送返回的数据
  ///
  Future<T?> sendByteAsync<T extends GeneratedMessage>(int cmd, {Uint8List? datas, int? resCmd}) async {
    CallBack<T> callBack = createCallBack(cmd, resCmd:resCmd);
    sendBytes(cmd, datas: datas);
    return callBack.getFuture();
  }

  @override
  void handleResponse(int cmd, Uint8List? curPkg, GeneratedMessage? onGeneratedMessage) {
    super.handleResponse(cmd, curPkg, onGeneratedMessage);
    switch(cmd) {
      case BaseClient.CONNECT_VARIFY:
        // flutter传给unity的，由unity通过协议传过来的
        C_Verify? c_verify = onGeneratedMessage as C_Verify?;
        uniqueId = c_verify?.uniqueId ?? "";
        if(Env.isDebug) {
          xlog("[socket]:接收到unity uniqueId = $uniqueId", type: LogType.SOCKET);
        }
        break;
      case BaseClient.CONNECT_EXIT:
        // unity退出
        exitCallBack?.call();
        break;
      case BaseClient.USER_HEART_BEAT:
        // 心跳
        lastReceivePkgTime = DateTime.now().millisecondsSinceEpoch;
        xlog("[socket]:收到unity发来的心跳 = $uniqueId", type: LogType.SOCKET);
        break;
    }
  }

  ///
  /// 获取map的key值
  ///
  String getUniqueKey() {
    return getUniqueKey2(socket);
  }

  static String getUniqueKey2(Socket socket) {
    return "${socket.address.address}:${socket.port}";
  }

  void dispose() {
    socket.close();
    exitCallBack = null;
    _socketSubscription?.cancel();
  }
}