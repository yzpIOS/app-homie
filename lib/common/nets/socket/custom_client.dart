
import 'dart:typed_data';
import 'big_byte_buffer.dart';
import 'custom_socket.dart';
import 'dart:core';
import 'package:protobuf/protobuf.dart';

///
/// 接收到数据
///
typedef OnReceiveData = void Function(int cmd, GeneratedMessage? data);

///
/// 原始数据回调
///
typedef OnReceiveRawData = void Function(int cmd, Uint8List? data);

///
/// 数据处理
///
typedef OnFromBuffers = GeneratedMessage Function(List<int> data);

class CustomClient {

  // 私有构造函数
  CustomClient._() { }
  // 单例引用
  static final CustomClient _ins = CustomClient();
  // 单例获取方法
  static CustomClient get ins {
    return _ins;
  }

  ///
  /// socket连接
  ///
  final CustomSocket _customSocket = CustomSocket();

  ///
  /// 粘包处理
  ///
  final BigByteBuffer _bigByteBuffer = BigByteBuffer();

  ///
  /// 收到数据回调方法
  ///
  final List<OnReceiveData> _onReceive = [];

  ///
  /// 原始数据
  ///
  final List<OnReceiveRawData> _onReceiveRaw = [];

  ///
  /// 数据转化器
  ///
  Map<int, OnFromBuffers> _pbFromBuffers = <int, OnFromBuffers>{};

  CustomClient() {
    // 断开自动连接
    _customSocket.closeAutoConnect();
    // 收到消息时的回调
    _customSocket.addReceive((data) {
      _bigByteBuffer.addBuffer(data);
      // 获取解析数据
      Uint8List? curPkg = _bigByteBuffer.getPackage();
      // 当前协议号
      int curCmd = _bigByteBuffer.curUnPkgCmd;
      while(curPkg != null) {
        // 唤起ProtoBuff的数据回调
        // 解析proto数据
        GeneratedMessage? generatedMessage = _pbFromBuffers[curCmd]?.call(curPkg);
        // 唤起回调
        for(int index = 0; index < _onReceive.length; index ++) {
          _onReceive[index].call(curCmd, generatedMessage);
        }

        // 唤起原始数据的回调
        // 原始数据
        for(int index = 0; index < _onReceiveRaw.length; index ++) {
          _onReceiveRaw[index].call(curCmd, curPkg);
        }

        // 解析下一个包的数据
        curPkg = _bigByteBuffer.getPackage();
        // 获取下一个包的指令号
        curCmd = _bigByteBuffer.curUnPkgCmd;
      }
    });
    // 断开连接时的回调，用于清理数据
    _customSocket.addDisconnect(() {
      // todo 清理缓存数据
      _bigByteBuffer.clearBuffer();
    });
  }

  ///
  /// 发送数据
  ///
  bool send(int cmd, Uint8List datas) {
    int len = datas.length;
    datas = Uint8List.fromList([
        (len >> 24).toUnsigned(4), (len >> 16).toUnsigned(4), (len >> 8).toUnsigned(4), (len).toUnsigned(8),
        (cmd >> 24).toUnsigned(4), (cmd >> 16).toUnsigned(4), (cmd >> 8).toUnsigned(4), (cmd).toUnsigned(8)
      ]..addAll(datas));
    return _customSocket.send(datas);
  }


  ///
  /// 注册数据解析器
  ///
  void registerFromBuffers(int cmd, OnFromBuffers parseData) {
    if(_pbFromBuffers.containsKey(cmd)) {
      return;
    }
    _pbFromBuffers[cmd] = parseData;
  }

  ///
  /// 取消数据解析器
  ///
  void unRegisterFromBuffers(int cmd) {
    if(!_pbFromBuffers.containsKey(cmd)) {
      return;
    }
    _pbFromBuffers.remove(cmd);
  }

  ///
  /// 注册数据回调
  ///
  void registerOnReceiveData(int cmd, OnReceiveData receiveData) {
    if(_onReceive.contains(cmd)) {
      return;
    }
    _onReceive[cmd] = receiveData;
  }

  ///
  /// 取消注册数据回调
  ///
  void unRegisterOnReceiveData(int cmd, OnReceiveData receiveData) {
    if(!_onReceive.contains(cmd)) {
      return;
    }
    _onReceive.remove(cmd);
  }

  ///
  /// 注册数据回调
  ///
  void registerOnReceiveRawData(int cmd, OnReceiveRawData receiveData) {
    if(_onReceiveRaw.contains(cmd)) {
      return;
    }
    _onReceiveRaw[cmd] = receiveData;
  }

  ///
  /// 取消注册数据回调
  ///
  void unRegisterOnReceiveRawData(int cmd, OnReceiveRawData receiveData) {
    if(!_onReceiveRaw.contains(cmd)) {
      return;
    }
    _onReceiveRaw.remove(cmd);
  }


    ///
  /// 连接服务器
  ///
  CustomClient connect(String host, int port) {
    _customSocket.connect(host, port);
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
  /// 断开回调
  ///
  CustomClient addDisconnect(Disconnect disconnect) {
    _customSocket.addDisconnect(disconnect);
    return this;
  }

  ///
  /// 收到数据回调
  ///
  CustomClient addOnReceiveData(OnReceiveData onReceiveData) {
    if(_onReceive.contains(onReceiveData)) {
      return this;
    }
    _onReceive.add(onReceiveData);
    return this;
  }

  ///
  /// 销毁连接
  ///
  void dispose() {
    _customSocket.dispose();
    _bigByteBuffer.clearBuffer();
  }
}