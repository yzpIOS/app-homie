
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:app/common/nets/commons/config/socket_config.dart';
import 'package:app/common/nets/commons/utils/base_client.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/env.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools/log.dart';
import 'package:app/widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

typedef StartConnect = void Function();

// 链接回调, 底层在多次重连时，会多次调用
typedef Connected = void Function();

// 连接错误, 底层在多次重连时，会多次调用
typedef ConnectError = void Function();

// 断开回调, 底层在多次重连时，会多次调用
typedef Disconnect = void Function();

// socket状态回调
typedef SocketStatusCallBack = void Function(int cmd);

/// 接收到数据
/// [data]        返回数据
typedef Receive = void Function(Uint8List data);

class CustomSocket {

  // 当前的socket链接
  Socket? _socket;

  // 当前地址
  String _host = "";

  bool _isDisposed = false;

  // 当前ip
  int _port = 0;

  // 网络状态订阅
  StreamSubscription? _netStateSubscription;

  // 网络连接订阅
  StreamSubscription? _socketSubscription;

  // 接收数据
  final List<Receive> _receive = <Receive>[];

  // 连接成功
  final List<Connected> _connected = <Connected>[];

  // 连接失败
  final List<ConnectError> _connectError = <ConnectError>[];

  // 断开连接
  final List<Disconnect> _disconnects = <Disconnect>[];
  int _preRiseTime = 0;

  // 过期时间
  int _timeout = 0;
  bool _isConnecting = false;

  // socket状态回调
  SocketStatusCallBack? socketStatusCallBack;

  // 是否可以发起链接
  bool _canConnected = true;

  // 记录上一次收到数据的时间，用于判断太久没有收到数据时，认为是断开连接
  int preReceiveTime = 0;

  // 开始连接时的回调
  StartConnect? startConnect;


  // socket状态
  Completer<bool> socketStatus = Completer();

  void setHostAndPort(String host, int port) {
    // 记录当前的host
    _host = host;
    // 记录当前port
    _port = port;
  }

  ///
  /// 链接socket
  /// [host]              ip地址
  /// [port]              端口号
  /// [timeout]           过期时间
  ///
  CustomSocket connect({int timeout = SOCKET_CONNECT_TIMEOUT, int delayReconnect = 3}) {
    if(_isDisposed) {
      logForDebug("CustomSocket类己被销毁");
      return this;
    }
    _timeout = timeout;
    // 关闭之前的socket
    _socket?.close();
    _socket = null;
    // 取消回调监听
    _socketSubscription?.cancel();

    if(_host == "" || _port == 0) {
      return this;
    }

    if(_isConnecting) {
      logForDebug("[CustomSocket:connect]:正在连接中，不需要重连, _isConnecting=$_isConnecting");
      return this;
    }

    // 是否可以连接
    if(!_canConnected) {
      logForDebug("[CustomSocket:connect]:发起连接, 不能自动连接 _canConnected = $_canConnected");
      return this;
    }

    if(SocketCtrl.ins.share.forceWaitTimes > 0) {
      logForDebug("[CustomSocket:connect]:发起连接, 此时要把房间关闭");
      RoomManagerCtrl.ins.closeRoom2();
    }

    startConnect?.call();

    logForDebug("[CustomSocket:connect]:发起连接, host=$_host, port=$_port");
    // 正在连接中
    _isConnecting = true;
    // 重置连接状态
    resetShareSocketStatus();
    // 链接新的socket
    Socket.connect(_host, _port, timeout: Duration(milliseconds: timeout)).then((Socket event) {
      logForDebug("[CustomSocket:connect]:连接成功, host=$_host, port=$_port");
      // 清理之前的链接
      _socket?.close();
      _socket = null;

      _socket = event;
      _isConnecting = false;
      // 处理连接
      _handleConnect();
      // 连接成功
      logForDebug("[CustomSocket:connect]:连接成功，唤起成功回调，_connected.length = ${_connected.length}");
      for(int index = 0; index < _connected.length; index ++) {
        try {
          _connected[index].call();
        } catch(e) {
          logForDebug("[CustomSocket:connect]:_connected热行失败");
        }
      }
      // 连接成功回调
      _riseCallBack2(BaseClient.CONNECT_SUC);
      completeShareSocketStatus();
    }, onError: (error) async {
      // 关闭之前的socket链接
      _socket?.close();
      _socket = null;
      // 取消回调监听
      _socketSubscription?.cancel();
      logForDebug("[CustomSocket:connect]:连接失败, host=$_host, port=$_port, 唤起回调_connectError.length = ${_connectError.length}");
      for(int index = 0; index < _connectError.length; index ++) {
        try {
          _connectError[index].call();
        } catch(e) {
          logForDebug("[CustomSocket:connect]:onError热行失败");
        }
      }
      // 延迟去重新连接
      await Future.delayed(Duration(seconds: delayReconnect));
      // 网络连接
      _isConnecting = false;
      connect(timeout: _timeout);
      // 连接失败
      _riseCallBack2(BaseClient.CONNECT_FAIL);
      // 断开连接
      riseDisconnect();
      completeErrorShareSocketStatus();
    });
    return this;
  }

  ///
  /// 发送数据
  ///
  bool send(Uint8List datas) {
    if(_socket == null) {
      return false;
    }
    if(datas.isEmpty) {
      return true;
    }
    _socket?.add(datas);
    return true;
  }

  ///
  /// socket连接上
  ///
  void _handleConnect() {
    // 把前一个订阅取消掉
    _socketSubscription?.cancel();
    logForDebug("[CustomSocket:_handleConnect]:网络连接成功，开始监听网络数据, ${_socket?.address}");

    _socket?.asBroadcastStream(onListen: (event) {
      _socketSubscription = event;
    }).listen((data) {
      // 记录上一次收到数据的时间，用于判断太久没有收到数据时，认为是断开连接
      preReceiveTime = DateTime.now().millisecondsSinceEpoch;
      // 接收到数据
      _riseCallBack(data);
    }, onError: (error) {
      logForDebug("[CustomSocket:_handleConnect]:网络连接错误, ${error.toString()}");
      // 接收到数据报错，需要断开重接吗？
      // 关闭之前的socket链接
      _socket?.close();
      _socket = null;
      _socketSubscription?.cancel();
      _riseCallBack2(BaseClient.CONNECT_CLOSE);
      completeErrorShareSocketStatus();
    });
  }


  ///
  /// 把原来的socket关掉，并且进行重联
  ///
  void reconnect({bool foreceConnect = false}) {
    // 强制连接
    if(foreceConnect) {
      _canConnected = true;
    }
    logForDebug("[CustomSocket:reconnect]:重置网络状态 foreceConnect = ${foreceConnect}");
    // 重置网络状态
    resetConnect(clearHost: foreceConnect);
    // 发起重联
    connect(timeout: _timeout);
  }

  ///
  /// 是否可以连接
  ///
  void onCanConnected(bool canConnect) {
    _canConnected = canConnect;
  }

  ///
  /// 添加回调
  ///
  CustomSocket addConnect(Connected connected) {
    if(_socket != null) {
      connected.call();
      return this;
    }
    if(_connected.contains(connected)) {
      return this;
    }
    _connected.add(connected);
    return this;
  }

  ///
  /// 删除回调
  ///
  CustomSocket removeConnect(Connected connected) {
    if(!_connected.contains(connected)) {
      return this;
    }
    _connected.remove(connected);
    return this;
  }

  ///
  /// 断开回调
  ///
  CustomSocket addDisconnect(Disconnect disconnect) {
    if(_disconnects.contains(disconnect)) {
      return this;
    }
    _disconnects.add(disconnect);
    return this;
  }

  ///
  /// 断开回调
  ///
  CustomSocket removeDisconnect(Disconnect disconnect) {
    if(!_disconnects.contains(disconnect)) {
      return this;
    }
    _disconnects.remove(disconnect);
    return this;
  }

  ///
  /// 唤起回调
  ///
  void _riseCallBack(Uint8List data) {
    _receive.forEach((element) {
      try {
        element.call(data);
      } catch(e) {
        xlog("[socket]:数据接逻辑处理失败, ${e.toString()}", type: LogType.SOCKET);
      }
    });
  }

  ///
  /// 连接错误回调
  ///
  void _riseCallBack2(int cmd) {
    try {
      socketStatusCallBack?.call(cmd);
    } catch(e) {
    }
  }

  ///
  /// 收到数据回调
  ///
  CustomSocket addReceive(Receive receive) {
    if(_receive.contains(receive)) {
      return this;
    }
    _receive.add(receive);
    return this;
  }

  ///
  /// 重置连接数据
  ///
  void resetConnect({bool clearHost = true}) {
    logForDebug("[CustomSocket:resetConnect]:resetConnect, 重置网络状态 clearHost = ${clearHost}");

    _socket?.close();
    _socket = null;
    _socketSubscription?.cancel();
    _socketSubscription = null;

    // 唤起断开连接
    riseDisconnect();
  }

  ///
  /// 唤起断开回调
  ///
  void riseDisconnect() {
    if(_preRiseTime != 0 && DateTime.now().millisecondsSinceEpoch - _preRiseTime < 1000) {
      return;
    }
    logForDebug("[CustomSocket:riseDisconnect]:riseDisconnect, 回调socket关闭回调方法");
    _preRiseTime = DateTime.now().millisecondsSinceEpoch;
    for(int index = 0; index < _disconnects.length; index ++) {
      try {
        _disconnects[index].call();
      } catch(e) {
        xlog("[socket]:断开连接回调处理失败, ${e.toString()}", type: LogType.SOCKET);
      }
    }
  }

  ///
  /// 连接成功状态设置
  ///
  void completeShareSocketStatus() {
    if(!socketStatus.isCompleted) {
      socketStatus.complete(true);
    }
  }

  ///
  /// 设置连接成时错误
  ///
  void completeErrorShareSocketStatus() {
    if(!socketStatus.isCompleted) {
      socketStatus.completeError(TimeoutException("time out"));
    }
  }

  ///
  /// 重置_shareSocketStatus状态
  ///
  void resetShareSocketStatus() {
    if(socketStatus.isCompleted) {
      socketStatus = Completer();
    }
  }

  ///
  /// 是否连接成功
  ///
  Future<bool> isConnect() async {
    logForDebug("[CustomSocket:isConnect]:当前socket状态 connected = ${socketStatus.isCompleted}");
    return socketStatus.future;
  }

  void dispose() {
    completeErrorShareSocketStatus();
    _isDisposed = true;
    _socket?.close();
    _connectError.clear();
    _disconnects.clear();
    _receive.clear();
    _socketSubscription?.cancel();
    _netStateSubscription?.cancel();
    socketStatusCallBack = null;
  }

}