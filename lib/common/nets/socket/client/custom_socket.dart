
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:app/common/nets/commons/utils/base_client.dart';
import 'package:app/widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/utils.dart';

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

  // 当前ip
  int _port = 0;

  // 网络状态订阅
  StreamSubscription? _netStateSubscription;

  // 网络连接订阅
  StreamSubscription? _socketSubscription;

  // 接收数据
  List<Receive> _receive = <Receive>[];

  // 连接成功
  List<Connected> _connected = <Connected>[];

  // 连接失败
  List<ConnectError> _connectError = <ConnectError>[];

  // 断开连接
  List<Disconnect> _disconnects = <Disconnect>[];

  // 过期时间
  int _timeout = 0;
  bool _isConnecting = false;

  // 是否需要重连
  bool _needReconnecting = false;

  // socket状态回调
  SocketStatusCallBack? socketStatusCallBack;

  ///
  /// 链接socket
  /// [host]              ip地址
  /// [port]              端口号
  /// [timeout]           过期时间
  ///
  CustomSocket connect(String host, int port, {int timeout = 5, int reconnectTimes = 2}) {
    // 防止重复调用
    if(_host == host && _port == port) {
      debugPrint("[socket]:连接地址相同, host=$host, port=$port");
      return this;
    }
    _timeout = timeout;
    // 关闭之前的socket
    _socket?.close();
    // 记录当前的host
    _host = host;
    // 记录当前port
    _port = port;
    // 取消回调监听
    _socketSubscription?.cancel();

    if(reconnectTimes <= 0 || _isConnecting) {
      debugPrint("[socket]:连接条件不满足, reconnectTimes=$reconnectTimes, _isConnecting=$_isConnecting");
      return this;
    }

    debugPrint("[socket]:发起连接, host=$host, port=$_port");
    // 正在连接中
    _isConnecting = true;
    // 链接新的socket
    Socket.connect(host, port, timeout: Duration(seconds: timeout)).then((Socket event) {
      debugPrint("[socket]:连接成功, host=$host, port=$_port");
      _isConnecting = false;
      _needReconnecting = false;
      _socket = event;
      // 处理连接
      _handleConnect();
      // 连接成功
      for(int index = 0; index < _connected.length; index ++) {
        try {
          _connected[index].call();
        } catch(e) {
          debugPrint("[socket]:_connected热行失败");
        }
      }
      // 连接成功回调
      _riseCallBack2(BaseClient.CONNECT_SUC);
    }, onError: (error) async {
      debugPrint("[socket]:连接失败, host=$host, port=$_port");
      _isConnecting = false;
      // 关闭之前的socket链接
      _socket?.close();
      _socket = null;
      // 取消回调监听
      _socketSubscription?.cancel();
      for(int index = 0; index < _connectError.length; index ++) {
        try {
          _connectError[index].call();
        } catch(e) {
          debugPrint("[socket]:onError热行失败");
        }
      }

      // 需要重新链接
      if(reconnectTimes > 0 || _needReconnecting) {
        // 如果重连，就重新设置重连次数
        if(_needReconnecting) {
          reconnectTimes = 3;
          _needReconnecting = false;
        }
        // ip和端口
        String host = _host;
        int port = _port;
        // 重置数据
        _host = "";
        _port = 0;
        // 网络连接
        connect(host, port, timeout: _timeout, reconnectTimes: reconnectTimes - 1);
        // 连接失败
        _riseCallBack2(BaseClient.CONNECT_FAIL);
      }
    });
    return this;
  }

  ///
  /// 发送数据
  ///
  bool send(Uint8List datas) {
    if(datas.isEmpty || _socket == null) {
      return false;
    }
    debugPrint("[socket]:发送数据");
    _socket?.add(datas);
    return true;
  }

  ///
  /// socket连接上
  ///
  void _handleConnect() {
    // 把前一个订阅取消掉
    _socketSubscription?.cancel();
    debugPrint("[socket]:监听网络数据, ${_socket?.address}");

    _socket?.asBroadcastStream(onListen: (event) {
      _socketSubscription = event;
    }).listen((data) {
      debugPrint("[socket]:接收到网络数据");
      // 接收到数据
      _riseCallBack(data);
    }, onError: (error) {
      debugPrint("[socket]:网络连接错误, ${error.toString()}");
      // 接收到数据报错，需要断开重接吗？
      // 关闭之前的socket链接
      _socket?.close();
      _socket = null;
      _socketSubscription?.cancel();
      // 回调断开连接
      for(int index = 0; index < _disconnects.length; index ++) {
        try {
          _disconnects[index].call();
        } catch(e) {
          debugPrint("[socket]:断开连接回调处理失败, ${e.toString()}");
        }
      }
      _riseCallBack2(BaseClient.CONNECT_CLOSE);
    });
  }

  ///
  /// 把原来的socket关掉，并且进行重联
  ///
  void reconnect() {
    // 正在连接中，防止重复连接
    if(_isConnecting) {
      _needReconnecting = true;
      return;
    }
    _resetConnect();

    String host = _host;
    int port = _port;

    _host = "";
    _port = 0;

    // 发起重联
    connect(host, port, timeout: _timeout, reconnectTimes: 3);
  }

  ///
  /// 连接关闭时自动连接
  ///
  CustomSocket closeAutoConnect() {
    _netStateSubscription?.cancel();
    // 订阅网络变化
    _netStateSubscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult state) {
      debugPrint("[socket]:网络发生变化, state = $state");
      // 是否有网络
      final hasNet = state != ConnectivityResult.none && state != ConnectivityResult.bluetooth;
      // 没有网络直接返回
      if(!hasNet) {
        debugPrint("[socket]:网络发生变化；无网络, state = $state");
        _resetConnect();
        return;
      }

      // 己经连接, 或者在重连中
      if(_socket != null) {
        debugPrint("[socket]:网络发生变化；己连接, state = $state");
        return;
      }
      debugPrint("[socket]:网络发生变化；发送连接请求, state = $state");
      // ip和端口
      String host = _host;
      int port = _port;
      // 重置数据
      _host = "";
      _port = 0;
      // 网络连接
      connect(host, port, timeout: _timeout, reconnectTimes: 3);
    });
    return this;
  }

  ///
  /// 添加回调
  ///
  CustomSocket addConnect(Connected connected) {
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
  /// 唤起回调
  ///
  void _riseCallBack(Uint8List data) {
    _receive.forEach((element) {
      try {
        element.call(data);
      } catch(e) {
        debugPrint("[socket]:数据接逻辑处理失败, ${e.toString()}");
      }
    });
  }

  ///
  /// 连接错误回调
  ///
  void _riseCallBack2(int cmd) {
    socketStatusCallBack?.call(cmd);
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
  void _resetConnect() {
    _socket?.close();
    _socket = null;
    _socketSubscription?.cancel();
    _socketSubscription = null;
  }

  void dispose() {
    _socket?.close();
    _connectError.clear();
    _disconnects.clear();
    _receive.clear();
    _socketSubscription?.cancel();
    _netStateSubscription?.cancel();
    socketStatusCallBack = null;
  }

}