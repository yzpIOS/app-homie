
import 'dart:async';
import 'dart:io';
import 'package:app/common/nets/socket/server/custom_socket_session.dart';

/// 服务开始
typedef ServerStarted = void Function(int port);

class CustomSocketServer {

  // 私有构造函数
  CustomSocketServer._();
  // 单例引用
  static final CustomSocketServer _ins = CustomSocketServer();
  // 单例获取方法
  static CustomSocketServer get ins {
    return _ins;
  }

  // 服务器socket
  ServerSocket? serverSocket;

  // 网络连接订阅
  StreamSubscription? _socketSubscription;

  // 所有的链接
  Map<String, CustomSocketSession> _sessions = {};

  // 服务器开启成功
  ServerStarted? serverStarted;

  CustomSocketServer();

  ///
  /// 绑定server
  ///
  void bindServer({int port = 8321, int connectTimes = 0}) {
    // 超过100次
    if(connectTimes >= 300) {
      return;
    }
    // 开启ServerSocket
    ServerSocket.bind('localhost', port).asStream().listen((event) {
      // socket连接上
      serverSocket = event;
      // 绑定server
      _handleServer();
      // 服务器链接上
      serverStarted?.call(port);
    }, onError: (error) async {
      await Future.delayed(const Duration(milliseconds: 40));
      // 绑定失败，尝试期它端口
      bindServer(port: port - 1, connectTimes: connectTimes + 1);
    });
  }

  ///
  /// 处理server连接
  ///
  void _handleServer() {
    serverSocket?.asBroadcastStream(onListen: (event) {
      _socketSubscription = event;
    }).listen((data) {
      // 先销毁当前的session
      _sessions[CustomSocketSession.getUniqueKey2(data)]?.dispose();
      // 新创建session
      _sessions[CustomSocketSession.getUniqueKey2(data)] = CustomSocketSession(socket: data);
    }, onError: (error) {
      // 服务端断开
      dispose();
      // 重新打开server
      bindServer();
    });
  }

  ///
  /// 获取到Session
  ///
  CustomSocketSession? getSession(String uniqueId) {
    for(int index = 0; index < _sessions.length; index ++) {
      if(_sessions[index]?.uniqueId == uniqueId) {
        return _sessions[index];
      }
    }
    return null;
  }

  void dispose() {
    _sessions.values.forEach((element) {
      element.dispose();
    });
    _sessions.clear();
    _socketSubscription?.cancel();
  }
}