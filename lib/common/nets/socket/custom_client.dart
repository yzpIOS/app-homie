
import 'dart:async';
import 'dart:typed_data';
import 'custom_byte_buffer.dart';
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
typedef OnGeneratedMessage = GeneratedMessage Function(List<int> data);

class CustomClient {

  // 私有构造函数
  CustomClient._() { }
  // 单例引用
  static final CustomClient _ins = CustomClient();
  // 单例获取方法
  static CustomClient get ins {
    return _ins;
  }

  // socket连接
  final CustomSocket _customSocket = CustomSocket();

  // 粘包处理
  final CustomByteBuffer _serverByteBuffer = CustomByteBuffer();

  // 全局收到数据回调方法
  final List<OnReceiveData> _onReceive = [];
  // 监听指令的pb对像
  Map<int, List<OnReceiveData>> _onReceiveCmds = {};

  // 全局原始数据接收回调
  final List<OnReceiveRawData> _onReceiveRaw = [];
  // 监听指令的原始数据回调
  Map<int, List<OnReceiveRawData>> _onReceiveRawCmds = {};

  // 数据转化器
  Map<int, OnGeneratedMessage> _onGeneratedMessage = <int, OnGeneratedMessage>{};

  // 心跳定时器
  StreamSubscription? _heartBeatStream;

  // 记录客户端发送心跳次数，服务端心跳返回时清理
  int heartBeatNumber = 0;

  CustomClient() {
    // 断开自动连接
    _customSocket.closeAutoConnect();
    // 收到消息时的回调
    _customSocket.addReceive((data) {
      _serverByteBuffer.addBuffer(data);
      // 获取解析数据
      Uint8List? curPkg = _serverByteBuffer.getPackage();
      // 当前协议号
      int curCmd = _serverByteBuffer.curUnPkgCmd;
      while(curPkg != null) {
        // 唤起ProtoBuff的数据回调
        _riseOnData(curCmd, _onGeneratedMessage[curCmd]?.call(curPkg));
        // 原始数据
        _riseOnRawData(curCmd, curPkg);
        // 处理心跳
        _handleHeartBeatRes(curCmd);
        // 解析下一个包的数据
        curPkg = _serverByteBuffer.getPackage();
        // 获取下一个包的指令号
        curCmd = _serverByteBuffer.curUnPkgCmd;
      }
    });

    // 断开连接时的回调，用于清理数据
    _customSocket.addDisconnect(() {
      _serverByteBuffer.clearBuffer();
      _heartBeatStream?.cancel();
    });

    // 监听开始心跳
    _customSocket.addConnect(() {
      startHeartBeat();
    });

    // socket状态变化
    _customSocket.socketStatusCallBack = (cmd) {
      // 处理protobuf
      _riseOnData(cmd, null);
      // 原始数据
      _riseOnRawData(cmd, null);
    };
  }

  ///
  /// 唤起原始数据的回调
  ///
  void _riseOnRawData(int curCmd, Uint8List? curPkg) {
    // 唤起原始数据的回调
    for(int index = 0; index < _onReceiveRaw.length; index ++) {
      _onReceiveRaw[index].call(curCmd, curPkg);
    }
    // 原始数据的指令数据回调
    List<OnReceiveRawData>? callBacks2 = _onReceiveRawCmds[curCmd];
    if(callBacks2 != null) {
      callBacks2.forEach((element) {
        element.call(curCmd, curPkg);
      });
    }
  }

  ///
  /// 唤起回调
  ///
  void _riseOnData(int curCmd, GeneratedMessage? generatedMessage) {
    // 唤起回调, 全局的数据监听
    for(int index = 0; index < _onReceive.length; index ++) {
      _onReceive[index].call(curCmd, generatedMessage);
    }
    // 特定指令监听指定的指令回调
    List<OnReceiveData>? callBacks = _onReceiveCmds[curCmd];
    if(callBacks != null) {
      callBacks.forEach((element) {
        element.call(curCmd, generatedMessage);
      });
    }
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
    return _customSocket.send(datas);
  }


  ///
  /// 注册数据解析器
  ///
  void registerFromBuffers(int cmd, OnGeneratedMessage parseData) {
    if(_onGeneratedMessage.containsKey(cmd)) {
      return;
    }
    _onGeneratedMessage[cmd] = parseData;
  }

  ///
  /// 取消数据解析器
  ///
  void unRegisterFromBuffers(int cmd) {
    if(!_onGeneratedMessage.containsKey(cmd)) {
      return;
    }
    _onGeneratedMessage.remove(cmd);
  }

  ///
  /// 注册数据回调
  ///
  void onDataCmd(int cmd, OnReceiveData receiveData) {
    if(!_onReceiveCmds.containsKey(cmd)) {
      _onReceiveCmds[cmd] = [];
    }
    if(_onReceiveCmds[cmd]?.contains(receiveData) == true) {
      return;
    }
    _onReceiveCmds[cmd]?.add(receiveData);
  }

  ///
  /// 取消注册数据回调
  ///
  void removeOnDataCmd(int cmd, OnReceiveData receiveData) {
    if(!_onReceiveCmds.containsKey(cmd)) {
      return;
    }
    if(_onReceiveCmds[cmd]?.contains(receiveData) == false) {
      return;
    }
    _onReceiveCmds[cmd]?.remove(receiveData);
  }

  ///
  /// 注册数据回调
  ///
  void onData(OnReceiveData receiveData) {
    if(_onReceive.contains(receiveData)) {
      return;
    }
    _onReceive.add(receiveData);
  }

  ///
  /// 取消注册数据回调
  ///
  void removeOnData(OnReceiveData receiveData) {
    if(!_onReceive.contains(receiveData)) {
      return;
    }
    _onReceive.remove(receiveData);
  }

  ///
  /// 注册数据回调
  ///
  void onRawDataCmd(int cmd, OnReceiveRawData receiveData) {
    if(!_onReceiveRawCmds.containsKey(cmd)) {
      _onReceiveRawCmds[cmd] = [];
    }
    if(_onReceiveRawCmds[cmd]?.contains(receiveData) == true) {
      return;
    }
    _onReceiveRawCmds[cmd]?.add(receiveData);
  }

  ///
  /// 取消注册数据回调
  ///
  void removeOnRawDataCmd(int cmd, OnReceiveRawData receiveData) {
    if(_onReceiveRawCmds[cmd]?.contains(receiveData) == false) {
      return;
    }
    _onReceiveRawCmds[cmd]?.remove(receiveData);
  }


  ///
  /// 注册数据回调
  ///
  void onRawData(OnReceiveRawData receiveData) {
    if(_onReceiveRaw.contains(receiveData)) {
      return;
    }
    _onReceiveRaw.add(receiveData);
  }

  ///
  /// 取消注册数据回调
  ///
  void removeOnRawData(OnReceiveRawData receiveData) {
    if(!_onReceiveRaw.contains(receiveData)) {
      return;
    }
    _onReceiveRaw.remove(receiveData);
  }

    ///
  /// 连接服务器
  ///
  CustomClient connect(String host, int port, {int timeout = 10}) {
    _customSocket.connect(host, port, timeout: timeout);
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
  /// 心跳
  ///
  CustomClient startHeartBeat({int interval = 5}) {
    // 心跳没有响应的次数
    if(heartBeatNumber >= 4) {
      _customSocket.reconnect();
      heartBeatNumber = 0;
    }

    // 取消定时器
    _heartBeatStream?.cancel();
    // 延尺执行
    _heartBeatStream = Future.delayed(Duration(seconds: interval)).asStream().listen((event) {
      // 发送心跳成功，数值加1
      if(sendBytes(1)) {
        heartBeatNumber += 1;
      }
      // 下一个心跳
      startHeartBeat(interval: interval);
    }, onError: (error){
    // 下一个心跳
      startHeartBeat(interval: interval);
    });
    return this;
  }

  ///
  /// 心跳返回处理
  void _handleHeartBeatRes(int cmd) {
    if(cmd != 1) {
      return;
    }
    // 尺到心跳回庆重新置成0
    heartBeatNumber = 0;
  }

  ///
  /// 销毁连接
  ///
  void dispose() {
    _customSocket.dispose();
    _serverByteBuffer.clearBuffer();
  }
}