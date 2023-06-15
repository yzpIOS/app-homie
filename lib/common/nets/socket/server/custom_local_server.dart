
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:protobuf/protobuf.dart';
import 'package:app/common/nets/socket/base_client.dart';
import 'package:app/common/nets/socket/server/custom_socket_session.dart';

const int SOCKET_TIME_OUT = 15;

/// 服务开始
typedef ServerStarted = void Function(int port);

// 接收到unity数据
typedef OnReceiveDataFromU = void Function(CustomSocketSession session, int cmd, GeneratedMessage? data);

// 接收到unity 数据
typedef OnReceiveRawDataFromU = void Function(CustomSocketSession session, int cmd, Uint8List? data);

class CustomLocalServer with BaseClient {

  // 服务器socket
  ServerSocket? serverSocket;

  // 网络连接订阅
  StreamSubscription? _socketSubscription;

  // 所有的链接
  Map<String, CustomSocketSession> _sessions = {};
  List<CustomSocketSession> _sessionList = [];

  // 服务器开启成功
  ServerStarted? serverStarted;

  // 心跳定时器
  StreamSubscription? _beatHeartCheckStream;

  // 全局收到数据回调方法
  final List<OnReceiveDataFromU> _onReceiveFromU = [];
  // 全局原始数据接收回调
  final List<OnReceiveRawDataFromU> _onReceiveRawFromU = [];

  CustomLocalServer();

  ///
  /// 绑定server
  ///
  void bindServer({int port = 7778, int connectTimes = 0}) {
    // 超过1000次
    if(connectTimes >= 1000) {
      return;
    }
    // 开启ServerSocket
    ServerSocket.bind('192.168.1.177', port).asStream().listen((event) {
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
      CustomSocketSession? exist = _sessions[CustomSocketSession.getUniqueKey2(data)];
      if(exist != null && _sessionList.contains(exist)) {
        _sessionList.remove(exist);
      }
      _sessions[CustomSocketSession.getUniqueKey2(data)]?.dispose();

      // 新创建session
      CustomSocketSession customSocketSession = CustomSocketSession(socket: data);
      // 监听protobuf数据对像
      customSocketSession.onData((cmd, data) {
        _onReceiveFromU.forEach((element) {
          element.call(customSocketSession, cmd, data);
        });
      });
      // 监听原始数据
      customSocketSession.onRawData((cmd, data) {
        _onReceiveRawFromU.forEach((element) {
          element.call(customSocketSession, cmd, data);
        });
      });
      _sessionList.add(customSocketSession);
      _sessions[CustomSocketSession.getUniqueKey2(data)] = customSocketSession;
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

  ///
  /// 心跳，检查无用连接
  ///
  void beatHeartCheck({int interval = 5}) {
    _beatHeartCheckStream?.cancel();
    _beatHeartCheckStream = Future.delayed(Duration(seconds: interval)).asStream().listen((event) {
      int nowSeconds = DateTime.now().second;
      // 遍历所有的session
      for(int index = _sessionList.length - 1; index >= 0; index --) {
        // 心跳
        if(nowSeconds - _sessionList[index].lastReceivePkgTime > SOCKET_TIME_OUT) {
          _sessionList[index].dispose();
          _sessionList.removeAt(index);
        }
      }
      beatHeartCheck();
    }, onError: (error) {
      beatHeartCheck();
    });
  }

  ///
  /// 注册数据回调
  ///
  void onReceiveRawData(OnReceiveRawDataFromU receiveData) {
    if(_onReceiveRawFromU.contains(receiveData)) {
      return;
    }
    _onReceiveRawFromU.add(receiveData);
  }

  ///
  /// 取消注册数据回调
  ///
  void removeReceiveRawDataFromU(OnReceiveRawDataFromU receiveData) {
    if(!_onReceiveRawFromU.contains(receiveData)) {
      return;
    }
    _onReceiveRawFromU.remove(receiveData);
  }

  ///
  /// 注册数据回调
  ///
  void onReceiveDataFromU(OnReceiveDataFromU receiveData) {
    if(_onReceiveFromU.contains(receiveData)) {
      return;
    }
    _onReceiveFromU.add(receiveData);
  }

  ///
  /// 取消注册数据回调
  ///
  void removeOnReceiveDataFromU(OnReceiveDataFromU receiveData) {
    if(!_onReceiveFromU.contains(receiveData)) {
      return;
    }
    _onReceiveFromU.remove(receiveData);
  }


  @override
  void dispose() {
    super.dispose();
    _sessions.values.forEach((element) {
      element.dispose();
    });
    _sessions.clear();
    _onReceiveFromU.clear();
    _onReceiveRawFromU.clear();
    _socketSubscription?.cancel();
    _beatHeartCheckStream?.cancel();
  }
}