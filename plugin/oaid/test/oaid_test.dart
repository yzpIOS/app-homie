import 'package:flutter_test/flutter_test.dart';
import 'package:oaid/oaid.dart';
import 'package:oaid/oaid_platform_interface.dart';
import 'package:oaid/oaid_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOaidPlatform
    with MockPlatformInterfaceMixin
    implements OaidPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<Map<String, String>?> getOAID() {
    return Future.value({});
  }

  @override
  Future<Map<String, String>?> getIDFA() {
    return Future.value({});
  }
}

void main() {
  final OaidPlatform initialPlatform = OaidPlatform.instance;

  test('$MethodChannelOaid is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOaid>());
  });

  test('getPlatformVersion', () async {
    Oaid oaidPlugin = Oaid();
    MockOaidPlatform fakePlatform = MockOaidPlatform();
    OaidPlatform.instance = fakePlatform;

    expect(await oaidPlugin.getPlatformVersion(), '42');
  });
}
