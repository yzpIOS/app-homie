import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'pay_plugin_platform_interface.dart';

/// An implementation of [PayPluginPlatform] that uses method channels.
class MethodChannelPayPlugin extends PayPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('pay_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<Map ?> startSandPay({required String cashierUrl}) async {
    final result = await methodChannel.invokeMethod<Map>('startSandPay',{'cashierUrl':cashierUrl}) ?? {'code':-1,'msg':'支付失败'};
    return result;
  }

}
