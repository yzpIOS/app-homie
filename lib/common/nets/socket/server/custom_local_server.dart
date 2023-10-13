
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/nets/commons/utils/byte_utils.dart';
import 'package:app/common/nets/socket/client/custom_socket.dart';
import 'package:app/common/nets/socket/server/custom_socket_session.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/env.dart';
import 'package:app/tools/log.dart';
import 'package:app/widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:protobuf/protobuf.dart';
import 'package:app/common/nets/commons/utils/base_client.dart';

const int SOCKET_TIME_OUT = 9 * 1000;

/// 服务开始
typedef ServerStatusCallBack = void Function();


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

  // 服务器开启成功
  List<ServerStatusCallBack> _serverStatusCallBacks = [];

  // 心跳定时器
  StreamSubscription? _beatHeartCheckStream;

  // 全局收到数据回调方法
  final List<OnReceiveDataFromU> _onReceiveFromU = [];
  // 全局原始数据接收回调
  final List<OnReceiveRawDataFromU> _onReceiveRawFromU = [];

  // 当前的端口
  int _currentPort = 0;
  Completer<int>? _portCompleter;

  bool _isBindingServer = false;
  bool previouseHasNet = true;

  // 网络状态订阅
  StreamSubscription? _netStateSubscription;

  Completer statusCompleter = Completer();

  // 断开连接
  int _preRiseTime = 0;
  final List<Disconnect> _disconnects = <Disconnect>[];

  CustomLocalServer() {
  }

  ///
  /// 绑定server
  ///
  void bindServer({int port = 7678, int connectTimes = 0}) {
    if(_isBindingServer) {
      return;
    }
    // 超过1000次
    if(connectTimes >= 1000) {
      _portCompleter?.complete(_currentPort);
      _portCompleter = null;
      return;
    }
    _currentPort = 0;
    _isBindingServer = true;
    logForDebug("[CustomLocalServer:bindServer]:开启与Unity通信的本地SocketServer, port = $port");

    // 开启ServerSocket
    ServerSocket.bind("127.0.0.1", port).asStream().listen((event) {
      _isBindingServer = false;
      _currentPort = port;
      _portCompleter?.complete(_currentPort);
      _portCompleter = null;
      // socket连接上
      serverSocket = event;
      // 绑定server
      _handleServer();
      logForDebug("[CustomLocalServer:_handleServer]:SocketServer开启成功，通知Unity进行连接");
      riseServerStatusCallBacks();
    }, onError: (error) async {
      _isBindingServer = false;
      _currentPort = 0;
      serverSocket?.close();
      serverSocket = null;
      await Future.delayed(const Duration(milliseconds: 100));
      // 绑定失败，尝试期它端口
      bindServer(port: port - 1, connectTimes: connectTimes + 1);
    });
  }

  ///
  /// 处理server连接
  ///
  void _handleServer() {
    logForDebug("[CustomLocalServer:_handleServer]:SocketServer开启成功");
    serverSocket?.asBroadcastStream(onListen: (event) {
      _socketSubscription = event;
    }).listen((data) {
      // 先销毁当前的session
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
        onReceive2(customSocketSession, cmd, data);
      });
      // 由unity调用的退出
      customSocketSession.exitCallBack = () {
        customSocketSession.dispose();
        _sessions.remove(customSocketSession.getUniqueKey());
      };
      _sessions[CustomSocketSession.getUniqueKey2(data)] = customSocketSession;
    }, onError: (error) {
      // 重新打开server
      bindServer();
    });
  }


  ///
  /// 收到数据的处理
  ///
  void onReceive2(CustomSocketSession session, int curCmd, Uint8List? data) {
    // 唤起ProtoBuff的数据回调
    GeneratedMessage? message = data == null ? null : onGeneratedMessage[curCmd]?.call(data);

    _onReceiveFromU.forEach((element) {
      element.call(session, curCmd, message);
    });
    _onReceiveRawFromU.forEach((element) {
      element.call(session, curCmd, data);
    });
  }

  ///
  /// 获取到Session
  ///
  CustomSocketSession? getSession(String uniqueId) {
    for(var key in _sessions.keys) {
      if(_sessions[key]?.uniqueId == uniqueId) {
        return _sessions[key];
      }
    }
    return null;
  }

  ///
  /// 获取端口
  ///
  Future<int> getPortAsync() async {
    if(_currentPort != 0) {
      return Future.value(_currentPort);
    }
    _portCompleter?.completeError("error");
    _portCompleter = Completer();

    return _portCompleter!.future;
  }

  ///
  /// 心跳，检查无用连接
  ///
  void beatHeartCheck({int interval = 3}) {
    _beatHeartCheckStream?.cancel();
    _beatHeartCheckStream = Future.delayed(Duration(seconds: interval)).asStream().listen((event) {
      int nowSeconds = DateTime.now().millisecondsSinceEpoch;
      // 遍历所有的session
      if(_sessions.isNotEmpty && _sessions.keys.isNotEmpty) {
        List<String> deletes = <String>[];
        for(var key in _sessions.keys) {
          var item = _sessions[key];
          if(item == null) {
            continue;
          }
          // 心跳
          if(nowSeconds - item.lastReceivePkgTime > SOCKET_TIME_OUT) {
            logForDebug("[CustomLocalServer:beatHeartCheck]:收不到unity心跳，断开链接");

            // 移除session
            deletes.add(key);
            // 己经挂掉
            item.dispose();
          } else {
            // 发送心跳
            item.send(BaseClient.USER_HEART_BEAT);
          }
        }
        deletes.forEach((element) {
          _sessions.remove(element);
        });

        // 如果断开就重连
        if(deletes.isNotEmpty && _sessions.isEmpty) {
          logForDebug("[CustomLocalServer:beatHeartCheck]:没有unity与flutter有socket连接1");
          // 己经连接成功
          if(statusCompleter.isCompleted) {
            statusCompleter = Completer();
          }
          riseServerStatusCallBacks();
          riseDisconnect();
        }
      } else {
        logForDebug("[CustomLocalServer:beatHeartCheck]:没有unity与flutter有socket连接2");
        // 己经连接成功
        if(statusCompleter.isCompleted) {
          statusCompleter = Completer();
        }
        riseServerStatusCallBacks();
        riseDisconnect();
      }
      beatHeartCheck();
    }, onError: (error) {
      beatHeartCheck();
    });
  }

  void cancelHeartBeat() {
    _beatHeartCheckStream?.cancel();
  }

  ///
  /// 无网时，重置所有的连接
  ///
  void resetConnect() {
    logForDebug("[CustomLocalServer:beatHeartCheck]:网络发生变化；无网络");
    _sessions.forEach((key, value) {
      value.dispose();
    });
    _sessions.clear();
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

  void addServerStatusCallBacks(ServerStatusCallBack serverStatusCallBacks) {
    if(_serverStatusCallBacks.contains(serverStatusCallBacks)) {
      return;
    }
    _serverStatusCallBacks.add(serverStatusCallBacks);
  }

  void removeServerStatusCallBacks(ServerStatusCallBack serverStatusCallBacks) {
    if(!_serverStatusCallBacks.contains(serverStatusCallBacks)) {
      return;
    }
    _serverStatusCallBacks.remove(serverStatusCallBacks);
  }

  void riseServerStatusCallBacks() {
    logForDebug("[CustomLocalServer:beatHeartCheck]:网络发生变化；有网络，请求与unity进行连接");
    _serverStatusCallBacks.forEach((element) {
      element.call();
    });
  }


  ///
  /// 注册数据解析器
  ///
  @override
  void registerFromBuffers(int cmd, OnGeneratedMessage parseData) {
    super.registerFromBuffers(cmd, parseData);
  }

  ///
  /// 断开回调
  ///
  CustomLocalServer addDisconnect(Disconnect disconnect) {
    if(_disconnects.contains(disconnect)) {
      return this;
    }
    _disconnects.add(disconnect);
    return this;
  }

  ///
  /// 断开回调
  ///
  CustomLocalServer removeDisconnect(Disconnect disconnect) {
    if(!_disconnects.contains(disconnect)) {
      return this;
    }
    _disconnects.remove(disconnect);
    return this;
  }

  void riseDisconnect() {
    if(_preRiseTime != 0 && DateTime.now().millisecondsSinceEpoch - _preRiseTime < 1000) {
      return;
    }
    _preRiseTime = DateTime.now().millisecondsSinceEpoch;
    logForDebug("[CustomLocalServer:riseDisconnect]:unity断开连接，执行断开回调方法, 方法数：${_disconnects.length}");
    for(int index = 0; index < _disconnects.length; index ++) {
      try {
        _disconnects[index].call();
      } catch(e) {
        xlog("[socket]:断开连接回调处理失败, ${e.toString()}", type: LogType.SOCKET);
      }
    }
  }
  @override
  void dispose() {
    super.dispose();
    _sessions.values.forEach((element) {
      element.dispose();
    });
    _disconnects.clear();
    _sessions.clear();
    _onReceiveFromU.clear();
    _onReceiveRawFromU.clear();
    _socketSubscription?.cancel();
    _beatHeartCheckStream?.cancel();
    _portCompleter = null;
    _serverStatusCallBacks.clear();
    _netStateSubscription?.cancel();
  }
}