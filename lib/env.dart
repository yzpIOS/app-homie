import 'package:flutter/foundation.dart';

abstract class Env {
  static const isRelease = kReleaseMode;
  static const isDebug = kDebugMode;
  static const isDebugCfg = bool.fromEnvironment('is_debug', defaultValue: isDebug);

  static const channelCode = String.fromEnvironment('channelCode', defaultValue: 'app'); //渠道号
  static const useUnity = true;

  static final apiUrl = Uri.parse(const String.fromEnvironment('api_url'));
  static final apiImgUrl = Uri.parse(const String.fromEnvironment('api_img_url'));

  static const mqAcc = String.fromEnvironment('mq_acc');
  static const mqPwd = String.fromEnvironment('mq_pwd');
  static final mqUrl = Uri.parse(const String.fromEnvironment('mq_url'));

  static const appName = String.fromEnvironment('app_name');

  static const serverIP = String.fromEnvironment('server_ip');
  static const serverPort = int.fromEnvironment('server_port');

  static const version = 10123;
}
