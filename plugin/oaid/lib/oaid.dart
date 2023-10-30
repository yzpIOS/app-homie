
import 'oaid_platform_interface.dart';

class Oaid {
  Future<String?> getPlatformVersion() {
    return OaidPlatform.instance.getPlatformVersion();
  }
}
