

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:app/common/nets/socket/base_client.dart';
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

  CustomSocketSession({required this.socket}) {
    // 监听数据
    socket.asBroadcastStream(onListen: (event) {
      _socketSubscription = event;
    }).listen((data) {
      // 接收到数据
      onReceive(data);
    }, onError: (error) {
      // 断开连接
    });
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
    int len = datas?.length ?? 0;
    datas = Uint8List.fromList([
      // 32位整数，转化成二进制数据
      (len >> 24).toUnsigned(8), (len >> 16).toUnsigned(8), (len >> 8).toUnsigned(8), (len).toUnsigned(8),
      // 32位整数，转化成二进制数据
      (cmd >> 24).toUnsigned(8), (cmd >> 16).toUnsigned(8), (cmd >> 8).toUnsigned(8), (cmd).toUnsigned(8), ...(datas ?? [])
    ]);
    return sendBytes2(datas);
  }

  ///
  /// 发送数据
  ///
  bool sendBytes2(Uint8List datas) {
    try {
      socket.add(datas);
    } catch(e) {
      return false;
    }
    return true;
  }

  @override
  void handleResponse(int cmd, Uint8List? curPkg, GeneratedMessage? onGeneratedMessage) {
    super.handleResponse(cmd, curPkg, onGeneratedMessage);
    if(cmd != BaseClient.USER_LOGIN) {
      return;
    }
    // 登录成功
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
    _socketSubscription?.cancel();
  }
}