
import 'dart:typed_data';

import 'package:app/widgets.dart';


class ByteUtils {
  static Uint8List secret = Uint8List.fromList("#123456!".codeUnits);

  ///
  /// 解密数据
  /// [data] 加密数据
  ///
  static void decrypt(Uint8List? data) {
    decryptByKey(data, secret);
  }

  ///
  /// 解密数据
  /// [data] 加密数据
  /// [key] 解密数据
  ///
  static void decryptByKey(Uint8List? data, Uint8List key) {
    if(data == null) {
      return;
    }
    int value = 0;
    for(int index = 0; index < key.length; index ++) {
      value = key[index];
      if(value < data.length) {
        data[value] = ~data[value];
      }
    }
  }

  ///
  /// 解密
  /// [data] 加密数据
  ///
  static void encryption(Uint8List? data) {
    return encryptionByKey(data, secret);
  }

  ///
  /// 加密
  /// [data] 需要加密的数据
  /// [key] 加密的key
  ///
  static void encryptionByKey(Uint8List? data, Uint8List key) {
    if(data == null) {
      return;
    }
    int value = 0;
    for(int index = 0; index < key.length; index ++) {
      value = key[index];
      if(value < data.length) {
        data[value] = ~data[value];
      }
    }
  }
}