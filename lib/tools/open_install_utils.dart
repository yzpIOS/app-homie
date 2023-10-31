
import 'dart:convert';
import 'dart:io';

import 'package:app/tools.dart';
import 'package:app/tools/local_storage.dart';
import 'package:oaid/oaid.dart';
import 'package:openinstall_flutter_plugin/openinstall_flutter_plugin.dart';

class OpenInstallUtils {

  static OpenInstallUtils? _ins;
  OpenInstallUtils._();
  static OpenInstallUtils get ins {
    _ins ??= OpenInstallUtils._();
    return _ins!;
  }

  OpeninstallFlutterPlugin? _openinstallFlutterPlugin;

  ///
  /// 同意隐私协议后，才进行初始化
  ///
  Future<void> initPrivacy() async {
    // 获取广告平台的oaid
    // https://www.openinstall.io/doc/ads/adClickDataReport.html
    // https://www.openinstall.io/doc/ad_android.html
    // https://www.openinstall.io/doc/function_faq.html#a2
    // https://www.tapd.cn/68741847/prong/stories/view/1168741847001000682
    // https://developer.openinstall.io/2022961229/app-promotion-activity-ad-detail?channelId=653f973618c85caf7b795514
    // https://developer.openinstall.io/2022961229/app-platform-config-detail?adPlatform=oppo

    // 未登录时，初始化OpeninstallFlutterPlugin
    if(_openinstallFlutterPlugin == null) {
      // 未登录时，初始化OpeninstallFlutterPlugin
      _openinstallFlutterPlugin = OpeninstallFlutterPlugin();
      if(Platform.isAndroid) {
        // 获取android OAID
        Map<String, String>? datas = await Oaid().getOAID();
        _openinstallFlutterPlugin?.configAndroid({
          "oaid": datas?["iaid"] ?? ""
        });
      } else if(Platform.isIOS) {
        // 获取ios的IDFA
        Map<String, String>? datas = await Oaid().getOAID();
        // ios配置
        _openinstallFlutterPlugin?.configIos({
          "idfaStr": datas?["idfaStr"] ?? ""
        });
      }
      _openinstallFlutterPlugin?.init(wakeupHandler);
      _openinstallFlutterPlugin?.install(onInstall);
    }
  }

  Future wakeupHandler(Map<String, Object> data) async {
    // if(await KvBox.contains(PrefKey.OpenInstallBlindDataFlag)) {
    //   return;
    // }
    // final bindData = data['bindData'];
    // if (bindData != null) {
    //   final bindDataStr = bindData.toString();
    //   final Map<String, dynamic> result = jsonDecode(bindDataStr);
    //   KvBox.write(PrefKey.OpenInstallBlindData, result);
    //   // 记录己经上传过
    //   KvBox.write(PrefKey.OpenInstallBlindDataFlag, PrefKey.OpenInstallBlindDataFlag);
    // }
  }

  Future onInstall(Map<String, Object> data) async {
    if(await KvBox.contains(PrefKey.OpenInstallBlindDataFlag)) {
      return;
    }
    final bindData = data['bindData'];
    if (bindData != null) {
      final bindDataStr = bindData.toString();
      final Map<String, dynamic> result = jsonDecode(bindDataStr);
      KvBox.write(PrefKey.OpenInstallBlindData, result);
      // 记录己经上传过
      KvBox.write(PrefKey.OpenInstallBlindDataFlag, PrefKey.OpenInstallBlindDataFlag);
    }
  }

  ///
  /// 上传注册信息
  ///
  Future<void> reportRegister() async {
    _openinstallFlutterPlugin?.reportRegister();
    // 记录己经上传过
    KvBox.write(PrefKey.OpenInstallBlindDataFlag2, PrefKey.OpenInstallBlindDataFlag2);
  }

}