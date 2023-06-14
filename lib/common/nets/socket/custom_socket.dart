
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:app/widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

// 链接回调, 底层在多次重连时，会多次调用
typedef Connected = Function();

// 连接错误, 底层在多次重连时，会多次调用
typedef ConnectError = Function();

// 断开回调, 底层在多次重连时，会多次调用
typedef Disconnect = Function();

// 接收到数据
typedef Receive = Function(Uint8List data);

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

  ///
  /// 链接socket
  /// [host]              ip地址
  /// [port]              端口号
  /// [timeout]           过期时间
  ///
  CustomSocket connect(String host, int port, {int timeout = 10, int reconnectTimes = 1}) {
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
      _socket = event;
      // 处理连接
      _handleConnect();
      // 连接成功
      for(int index = 0; index < _connected.length; index ++) {
        _connected[index].call();
      }
    }, onError: (error) async {
      debugPrint("[socket]:连接失败, host=$host, port=$_port");
      _isConnecting = false;
      // 关闭之前的socket链接
      _socket?.close();
      _socket = null;
      // 取消回调监听
      _socketSubscription?.cancel();
      for(int index = 0; index < _connectError.length; index ++) {
        _connectError[index].call();
      }

      // 需要重新链接
      if(reconnectTimes > 0) {
        // ip和端口
        String host = _host;
        int port = _port;
        // 重置数据
        _host = "";
        _port = 0;
        // 网络连接
        connect(host, port, timeout: _timeout, reconnectTimes: reconnectTimes - 1);
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
    _socket?.add(datas);
    _socket?.flush();
    return true;
  }

  Stream<List<int>>? mStream;

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
      for(int index = 0; index < _receive.length; index ++) {
        _receive[index].call(data);
      }
    }, onError: (error) {
      debugPrint("[socket]:网络连接错误, ${error.toString()}");
      // 接收到数据报错，需要断开重接吗？
      // 关闭之前的socket链接
      _socket?.close();
      _socket = null;
      _socketSubscription?.cancel();
      // 回调断开连接
      for(int index = 0; index < _disconnects.length; index ++) {
        _disconnects[index].call();
      }
    });
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
  /// 收到数据回调
  ///
  CustomSocket addReceive(Receive receive) {
    if(_receive.contains(receive)) {
      return this;
    }
    _receive.add(receive);
    return this;
  }

  void dispose() {
    _socket?.close();
    _receive.clear();
    _connectError.clear();
    _disconnects.clear();
    _receive.clear();
    _socketSubscription?.cancel();
    _netStateSubscription?.cancel();
  }
}