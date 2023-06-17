
import 'dart:typed_data';

import 'package:app/common/nets/base_byte_buffer.dart';

// 单个包体长度
const int PKG_LEN = 4;
// 协仪长度
const int CMD_LEN = 4;

class ByteBuffer1 extends BaseByteBuffer {


  // 当前的包体长度
  int _curPkgLen = 0;
  // 当前的cmd
  int _curCmd = 0;
  ///
  /// 原始buffer数据
  ///
  Uint8List _buffer = Uint8List(0);

  ///
  /// 添加新的数据列表
  ///
  @override
  void addBuffer(Uint8List newBuffer) {
    if(newBuffer.isEmpty) {
      return;
    }
    // 合并buffer
    _buffer = Uint8List.fromList([..._buffer, ...newBuffer]);
  }

  @override
  int getUnPackCmd() {
    return _curCmd;
  }

  ///
  /// 获取单个包体数据
  /// 只有返回的数据不为空时，unPkgCmd才是当前解析出来的数据包的协议号
  ///
  @override
  Uint8List? getPackage() {
    if(_buffer.length < CMD_LEN + PKG_LEN) {
      return null;
    }
    // 当前包体长度
    if(_curPkgLen == 0) {
      _curPkgLen = (_buffer[0] << 24).toInt() + (_buffer[1] << 16).toInt() +  (_buffer[2] << 8).toInt() + _buffer[3].toInt();
    }
    // 当前协议号
    if(_curCmd == 0) {
      _curCmd = (_buffer[4] << 24).toInt() + (_buffer[5] << 16).toInt() +  (_buffer[6] << 8).toInt() + _buffer[7];
    }
    // 粘包了，不解析数据，等下个包数据过来
    if(_curPkgLen < _buffer.length - PKG_LEN - CMD_LEN) {
      return null;
    }
    // 读取
    Uint8List result = _buffer.sublist(PKG_LEN + CMD_LEN, _curPkgLen + PKG_LEN + CMD_LEN);
    // 删除,协议长度，协议号和数据
    if(_buffer.length == _curPkgLen + PKG_LEN + CMD_LEN) {
      // 数据己经读完
      _buffer = Uint8List(0);
    } else {
      // 获取剩余的包数据
      _buffer = _buffer.sublist(_curPkgLen + PKG_LEN + CMD_LEN, _buffer.length);
    }
    // 记录协议
    // 重置数据
    _curPkgLen = 0;
    return result;
  }

  ///
  /// 清理缓存数据
  void clearBuffer() {
    _curCmd = 0;
    _curPkgLen = 0;
    _buffer = Uint8List(0);
  }

  @override
  int getUdpPkgIndex() {
    return 0;
  }
}