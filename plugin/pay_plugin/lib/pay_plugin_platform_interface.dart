import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pay_plugin_method_channel.dart';

abstract class PayPluginPlatform extends PlatformInterface {
  /// Constructs a PayPluginPlatform.
  PayPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static PayPluginPlatform _instance = MethodChannelPayPlugin();

  /// The default instance of [PayPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelPayPlugin].
  static PayPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PayPluginPlatform] when
  /// they register themselves.
  static set instance(PayPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> startSandPay({required String cashierUrl}){
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
