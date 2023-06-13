
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
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

  ///
  /// 当前的socket链接
  ///
  Socket? _socket;

  ///
  /// 当前地址
  ///
  String _host = "";

  ///
  /// 当前ip
  ///
  int _port = 0;

  ///
  /// 网络状态订阅
  ///
  StreamSubscription? _netStateSubscription;

  ///
  /// 网络连接订阅
  ///
  StreamSubscription? _socketSubscription;

  ///
  /// 当前的网络状态
  ///
  ConnectivityResult? _curState;

  ///
  /// 接收数据
  List<Receive> _receive = <Receive>[];

  ///
  /// 连接成功
  ///
  List<Connected> _connected = <Connected>[];

  ///
  /// 连接失败
  ///
  List<ConnectError> _connectError = <ConnectError>[];

  ///
  /// 断开连接
  ///
  List<Disconnect> _disconnects = <Disconnect>[];

  ///
  /// 链接socket
  /// [host]              ip地址
  /// [port]              端口号
  /// [failRetryTime]     失败重试次数, -1表示无限重试
  CustomSocket connect(String host, int port) {
    // 防止重复调用
    if(_host == host && _port == port) {
      return this;
    }
    // 记录当前的host
    _host = host;
    // 记录当前port
    _port = port;
    // 关闭之前的socket链接
    _socket?.close();
    _socket = null;
    // 取消回调监听
    _socketSubscription?.cancel();
    // 链接新的socket
    Socket.connect(host, port).asStream().listen((event) {
      _socket = event;
      // 处理连接
      _handleConnect();
      // 连接成功
      for(int index = 0; index < _connected.length; index ++) {
        _connected[index].call();
      }
    }, onError: (error) async {
      // 关闭之前的socket链接
      _socket?.close();
      _socket = null;
      // 取消回调监听
      _socketSubscription?.cancel();
      for(int index = 0; index < _connectError.length; index ++) {
        _connectError[index].call();
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

    _socket?.write(datas);
    _socket?.flush();
    return true;
  }

  ///
  /// socket连接上
  ///
  void _handleConnect() {
    // 把前一个订阅取消掉
    _socketSubscription?.cancel();
    _socketSubscription = _socket?.listen((event) {
      // 接收到数据
      for(int index = 0; index < _receive.length; index ++) {
        _receive[index].call(event);
      }
    }, onError: (error) {
      // 接收到数据报错，需要断开重接吗？
      _socket?.close();
      _socketSubscription?.cancel();
      // 调用者调用了closeAutoConnect方法，这时主动断开连接时，重新链接
      if(_netStateSubscription != null) {
        _reconnect();
      }
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
    _netStateSubscription = Connectivity().onConnectivityChanged.listen(_onNetStatusChange);
    // 获取网络状态
    Connectivity().onConnectivityChanged.first.asStream().listen((event) {
      _curState = event;
    }, onError: (error) {
      _curState = null;
    });
    return this;
  }

  ///
  /// 网络变化
  ///
  void _onNetStatusChange(ConnectivityResult state) {
    if(_curState == state) {
      return;
    }
    // 当前的网络状态
    _curState = state;
    // 是否有网络
    final hasNet = state != ConnectivityResult.none && state != ConnectivityResult.bluetooth;
    // 没有网络直接返回
    if(!hasNet) {
      return;
    }
    _reconnect();
  }

  ///
  /// 重连
  ///
  void _reconnect() {
    // ip和端口
    String host = _host;
    int port = _port;
    // 重置数据
    _host = "";
    _port = 0;
    // 网络连接
    connect(host, port);
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