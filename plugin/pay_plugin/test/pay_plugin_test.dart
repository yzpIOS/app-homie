import 'package:flutter_test/flutter_test.dart';
import 'package:pay_plugin/pay_plugin.dart';
import 'package:pay_plugin/pay_plugin_platform_interface.dart';
import 'package:pay_plugin/pay_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPayPluginPlatform
    with MockPlatformInterfaceMixin
    implements PayPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PayPluginPlatform initialPlatform = PayPluginPlatform.instance;

  test('$MethodChannelPayPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPayPlugin>());
  });

  test('getPlatformVersion', () async {
    PayPlugin payPlugin = PayPlugin();
    MockPayPluginPlatform fakePlatform = MockPayPluginPlatform();
    PayPluginPlatform.instance = fakePlatform;

    expect(await payPlugin.getPlatformVersion(), '42');
  });
}
