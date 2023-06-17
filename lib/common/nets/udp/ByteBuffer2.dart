
import 'dart:typed_data';

import 'package:app/common/nets/base_byte_buffer.dart';
import 'package:app/common/nets/byte_buffer1.dart';

const INDEX_LENGTH = 4;

class ByteBuffer2 extends BaseByteBuffer {

  // 当前的包体长度
  int _curPkgLen = 0;
  // 当前的cmd
  int _curCmd = 0;

  int _currentIndex = 0;

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

  @override
  int getUdpPkgIndex() {
    return _currentIndex;
  }

  ///
  /// 获取单个包体数据
  /// 只有返回的数据不为空时，unPkgCmd才是当前解析出来的数据包的协议号
  ///
  @override
  Uint8List? getPackage() {
    if(_buffer.length < CMD_LEN + PKG_LEN + INDEX_LENGTH) {
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
    // 获取协仪的号码
    if(_currentIndex == 0) {
      _currentIndex = (_buffer[8] << 24).toInt() + (_buffer[9] << 16).toInt() +  (_buffer[10] << 8).toInt() + _buffer[11];
    }
    // 粘包了，不解析数据，等下个包数据过来
    if(_curPkgLen < _buffer.length - PKG_LEN - CMD_LEN - INDEX_LENGTH) {
      return null;
    }
    // 读取
    Uint8List result = _buffer.sublist(PKG_LEN + CMD_LEN + INDEX_LENGTH, _curPkgLen + PKG_LEN + CMD_LEN + INDEX_LENGTH);
    // 删除,协议长度，协议号和数据
    if(_buffer.length == _curPkgLen + PKG_LEN + CMD_LEN + INDEX_LENGTH) {
      // 数据己经读完
      _buffer = Uint8List(0);
    } else {
      // 获取剩余的包数据
      _buffer = _buffer.sublist(_curPkgLen + PKG_LEN + CMD_LEN + INDEX_LENGTH, _buffer.length);
    }
    // 重置数据
    _curCmd = 0;
    _curPkgLen = 0;
    return result;
  }

  ///
  /// 清理缓存数据
  @override
  void clearBuffer() {
    _curCmd = 0;
    _curPkgLen = 0;
    _buffer = Uint8List(0);
  }

}