import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'oaid_platform_interface.dart';

/// An implementation of [OaidPlatform] that uses method channels.
class MethodChannelOaid extends OaidPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('oaid');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<Map<String, String>?> getOAID() async {
    // 只支持android平台
    if(!Platform.isAndroid) {
      return {};
    }
    // android平台获取oaid
    final version = await methodChannel.invokeMethod<Map<Object?, Object?>?>('getOaid');
    return {};
  }
}
