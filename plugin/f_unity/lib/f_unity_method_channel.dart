import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'f_unity_platform_interface.dart';

/// An implementation of [FUnityPlatform] that uses method channels.
class MethodChannelFUnity extends FUnityPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('f_unity');
  final streamController = StreamController<MapEntry<String, String>>.broadcast();

  MethodChannelFUnity() {
    methodChannel.setMethodCallHandler(
      (call) async {
        streamController.add(MapEntry(call.method, call.arguments));
      },
    );
  }

  @override
  Stream<String> onMethodCall(String method) {
    bool test(MapEntry<String, String> event) {
      return event.key == method;
    }

    String map(MapEntry<String, String> event) {
      return event.value;
    }

    return streamController.stream.where(test).map(map);
  }

  @override
  Stream<String> onUnityMessage() => onMethodCall('onUnityMessage');

  @override
  Future<void> postMessage(String gameObject, String methodName, String message) {
    final data = {
      'gameObject': gameObject,
      'methodName': methodName,
      'message': message,
    };

    return methodChannel.invokeMethod<void>('postMessage', data);
  }
}
