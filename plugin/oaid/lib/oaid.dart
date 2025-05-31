
import 'oaid_platform_interface.dart';

class Oaid {
  Future<String?> getPlatformVersion() {
    return OaidPlatform.instance.getPlatformVersion();
  }

  Future<Map<String, String>?> getOAID() {
    return OaidPlatform.instance.getOAID();
  }

  Future<Map<String, String>?> getIDFA() {
    return OaidPlatform.instance.getIDFA();
  }
}
