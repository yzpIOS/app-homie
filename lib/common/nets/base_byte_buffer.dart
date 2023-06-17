
import 'dart:typed_data';

abstract class BaseByteBuffer {

  /// 获取cmd
  int getUnPackCmd();

  /// 获取udp的包索引
  int getUdpPkgIndex();

  /// 获取单个包的数据
  Uint8List? getPackage();

  /// 添加buffer
  void addBuffer(Uint8List newBuffer);

  /// 清理buffer
  void clearBuffer();
}