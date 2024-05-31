
import 'pay_plugin_platform_interface.dart';

class PayPlugin {
  Future<String?> getPlatformVersion() {
    return PayPluginPlatform.instance.getPlatformVersion();
  }

  Future<Map<String,dynamic>> startSandPay({required String cashierUrl}){
    return PayPluginPlatform.instance.startSandPay(cashierUrl: cashierUrl);
  }
}
