
import 'dart:typed_data';

class BigByteBuffer {

  // 单个包体长度
  static const int PKG_LEN = 4;
  // 协仪长度
  static const int CMD_LEN = 4;

  // 当前的包体长度
  int _curPkgLen = 0;
  // 当前的cmd
  int _curCmd = 0;

  // 解析出来的协议号
  int curUnPkgCmd = 0;

  ///
  /// 原始buffer数据
  ///
  Uint8List _buffer = Uint8List(0);

  ///
  /// 添加新的数据列表
  ///
  void addBuffer(Uint8List newBuffer) {
    if(newBuffer.isEmpty) {
      return;
    }
    // 合并buffer
    _buffer = Uint8List.fromList([]..addAll(_buffer)..addAll(newBuffer));
  }

  ///
  /// 获取单个包体数据
  /// 只有返回的数据不为空时，unPkgCmd才是当前解析出来的数据包的协议号
  ///
  Uint8List? getPackage() {
    if(_buffer.length < CMD_LEN + PKG_LEN) {
      return null;
    }
    // 当前包体长度
    if(_curPkgLen == 0) {
      _curPkgLen = _buffer[0] << 4 + _buffer[1] << 3 +  _buffer[2] << 2 + _buffer[3];
    }
    // 当前协议号
    if(_curCmd == 0) {
      _curCmd = _buffer[4] << 4 + _buffer[5] << 3 +  _buffer[6] << 2 + _buffer[7];
    }
    // 粘包了，不解析数据，等下个包数据过来
    if(_curPkgLen < _buffer.length - PKG_LEN - CMD_LEN) {
      return null;
    }
    // 读取
    Uint8List result = _buffer.sublist(PKG_LEN + CMD_LEN, _curPkgLen + PKG_LEN + CMD_LEN);
    // 删除,协议长度，协议号和数据
    _buffer.removeRange(0, PKG_LEN + CMD_LEN + _curPkgLen);
    // 记录协议
    curUnPkgCmd = _curCmd;
    // 重置数据
    _curCmd = 0;
    _curPkgLen = 0;
    return result;
  }

  ///
  /// 清理缓存数据
  void clearBuffer() {
    _curCmd = 0;
    _curPkgLen = 0;
    _buffer = Uint8List(0);
    curUnPkgCmd = 0;
  }
}