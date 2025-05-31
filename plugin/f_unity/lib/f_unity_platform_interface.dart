import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'f_unity_method_channel.dart';

abstract class FUnityPlatform extends PlatformInterface {
  /// Constructs a FUnityPlatform.
  FUnityPlatform() : super(token: _token);

  static final Object _token = Object();

  static FUnityPlatform _instance = MethodChannelFUnity();

  /// The default instance of [FUnityPlatform] to use.
  ///
  /// Defaults to [MethodChannelFUnity].
  static FUnityPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FUnityPlatform] when
  /// they register themselves.
  static set instance(FUnityPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Stream<String> onMethodCall(String method) {
    throw UnimplementedError('onMethodCall() has not been implemented.');
  }

  Stream<String> onUnityMessage() {
    throw UnimplementedError('onUnityMessage() has not been implemented.');
  }

  Future<void> postMessage(String gameObject, String methodName, String message) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
