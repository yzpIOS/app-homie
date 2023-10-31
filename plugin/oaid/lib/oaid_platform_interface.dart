import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'oaid_method_channel.dart';

abstract class OaidPlatform extends PlatformInterface {
  /// Constructs a OaidPlatform.
  OaidPlatform() : super(token: _token);

  static final Object _token = Object();

  static OaidPlatform _instance = MethodChannelOaid();

  /// The default instance of [OaidPlatform] to use.
  ///
  /// Defaults to [MethodChannelOaid].
  static OaidPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OaidPlatform] when
  /// they register themselves.
  static set instance(OaidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<Map<String, String>?> getOAID() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<Map<String, String>?> getIDFA() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
