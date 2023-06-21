
import 'dart:core';
import 'dart:typed_data';
import 'package:app/common/nets/commons/utils/base_byte_buffer.dart';
import 'package:app/common/nets/commons/utils/byte_buffer1.dart';
import 'package:app/common/nets/commons/utils/byte_utils.dart';
import 'package:app/common/nets/commons/utils/call_back.dart';
import 'package:protobuf/protobuf.dart';


///
/// 原始数据回调
///
typedef OnReceiveRawData = void Function(int cmd, Uint8List? data);

///
/// 数据处理
///
typedef OnGeneratedMessage = GeneratedMessage Function(List<int> data);

mixin BaseClient {
  // 连接失败, 有可能回调多次
  static const CONNECT_SUC = 900000000;
  // 连接失败, 有可能回调多次
  static const CONNECT_FAIL = 900000001;
  // 连接断开
  static const CONNECT_CLOSE = 900000002;

  // 连接认证
  static const CONNECT_VARIFY = 10000;
  // 退出
  static const CONNECT_EXIT = 10001;
  // 心跳
  static const USER_HEART_BEAT = 10002;
  // 用户登录
  static const USER_LOGIN = 900000003;

  // 粘包处理
  BaseByteBuffer serverByteBuffer = ByteBuffer1();

  // 全局收到数据回调方法
  final List<OnReceiveData> _onReceive = [];
  // 监听指令的pb对像
  final Map<int, List<CallBack<GeneratedMessage>>> _onReceiveCmds = {};
  // future返回数据
  final Map<int, List<CallBack<GeneratedMessage>>>  _onReceiveFutures = {};

  // 全局原始数据接收回调
  final List<OnReceiveRawData> _onReceiveRaw = [];
  // 监听指令的原始数据回调
  final Map<int, List<OnReceiveRawData>> _onReceiveRawCmds = {};

  // 数据转化器
  final Map<int, OnGeneratedMessage> _onGeneratedMessage = <int, OnGeneratedMessage>{};

  ///
  /// 收到数据的处理
  ///
  void onReceive(Uint8List data) {
    serverByteBuffer.addBuffer(data);
    // 获取解析数据
    Uint8List? curPkg = serverByteBuffer.getPackage();
    // 当前协议号
    int curCmd = serverByteBuffer.getUnPackCmd();
    while(curPkg != null) {
      // curPkg需要解密
      ByteUtils.decrypt(curPkg);
      // 唤起ProtoBuff的数据回调
      GeneratedMessage? message = _onGeneratedMessage[curCmd]?.call(curPkg);
      // 监听的方法回调
      riseOnData(curCmd, message);
      // Future事件回调
      riseOnDataFuture(curCmd, message);
      // 原始数据
      riseOnRawData(curCmd, curPkg);
      // 处理心跳
      handleResponse(curCmd, curPkg, message);
      // 解析下一个包的数据
      curPkg = serverByteBuffer.getPackage();
      // 获取下一个包的指令号
      curCmd = serverByteBuffer.getUnPackCmd();
    }
  }

  ///
  /// 创建callBack
  ///
  CallBack<T> createCallBack<T extends GeneratedMessage>(int cmd, {int? resCmd}) {
    int targetCmd = resCmd ?? cmd;
    CallBack<T> callBack = CallBack.create(targetCmd);
    if(!_onReceiveFutures.containsKey(cmd)) {
      _onReceiveFutures[targetCmd] = [];
    }
    // todo 没有requestId，只能保存一个
    _onReceiveFutures[targetCmd]?.clear();
    _onReceiveFutures[targetCmd]?.add(callBack);
    return callBack;
  }

  ///
  /// 子类相关的数据处理
  /// [cmd] 协议号
  /// [curPkg] 当前的包数据
  /// [onGeneratedMessage] 解析出来的数据
  ///
  void handleResponse(int cmd, Uint8List? curPkg, GeneratedMessage? onGeneratedMessage) {

  }

  ///
  /// 唤起原始数据的回调
  ///
  void riseOnRawData(int curCmd, Uint8List? curPkg) {
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
  void riseOnData(int curCmd, GeneratedMessage? generatedMessage) {
    // 唤起回调, 全局的数据监听
    for(int index = 0; index < _onReceive.length; index ++) {
      _onReceive[index].call(curCmd, generatedMessage);
    }
    // 特定指令监听指定的指令回调
    List<CallBack<GeneratedMessage>>? callBacks = _onReceiveCmds[curCmd];
    if(callBacks != null) {
      callBacks.forEach((element) {
        element.responseCallBack(curCmd, generatedMessage);
      });
    }
  }

  ///
  /// 异步回调
  ///
  void riseOnDataFuture(int curCmd, GeneratedMessage? generatedMessage) {
    if(!_onReceiveFutures.containsKey(curCmd)) {
      return;
    }
    _onReceiveFutures.remove(curCmd)?.forEach((element) {
      element.response(curCmd, generatedMessage);
    });
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
  void onDataCmd<T extends GeneratedMessage>(int cmd, OnReceiveData<T> receiveData) {
    if(!_onReceiveCmds.containsKey(cmd)) {
      _onReceiveCmds[cmd] = [];
    }
    _onReceiveCmds[cmd]?.forEach((element) {
      if(element.onCallBack == receiveData) {
        return;
      }
    });
    _onReceiveCmds[cmd]?.add(CallBack<T>(cmd: cmd, onCallBack: receiveData));
  }

  ///
  /// 取消注册数据回调
  ///
  void removeOnDataCmd<T extends GeneratedMessage>(int cmd, OnReceiveData<T> receiveData) {
    if(!_onReceiveCmds.containsKey(cmd)) {
      return;
    }
    if(_onReceiveCmds.containsKey(cmd) == false) {
      return;
    }
    List<CallBack>? list = _onReceiveCmds[cmd];
    if(list == null) {
      return;
    }
    for(int index = list.length - 1; index >= 0; index --) {
      if(list[index].onCallBackHashCode == receiveData.hashCode) {
        list.removeAt(index);
      }
    }
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
  /// 收到数据回调
  ///
  void addOnReceiveData(OnReceiveData onReceiveData) {
    if(_onReceive.contains(onReceiveData)) {
      return;
    }
    _onReceive.add(onReceiveData);
  }

  void dispose() {
    _onReceive.clear();
    _onReceiveCmds.clear();
    _onReceiveFutures.clear();
    _onReceiveRaw.clear();
    _onReceiveRawCmds.clear();
    _onGeneratedMessage.clear();
    serverByteBuffer.clearBuffer();
  }
}