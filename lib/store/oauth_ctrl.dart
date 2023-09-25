import 'dart:convert';
import 'dart:ui';

import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/exception.dart';
import 'package:app/model/auth_info.dart';
import 'package:app/model/enum/gender_enum.dart';
import 'package:app/net/api.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/app.dart';
import 'package:app/ui/login/init/my_user_init_perfect_info_page.dart';
import 'package:app/ui/login/init/user_init_0_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:app/ui/login/init/user_init_1_page.dart';
import 'package:app/ui/login/init/user_init_2_page.dart';
import 'package:app/store/common/ready_ctrl_mixin.dart';
import 'package:app/store/user/user_ctrl.dart';

import 'package:fixnum/fixnum.dart';
import 'package:openinstall_flutter_plugin/openinstall_flutter_plugin.dart';

class OAuthCtrl extends GetxService with ReadyMixin, ReadyCtrlMixin {
  static AuthInfo? _auth;

  static OAuthCtrl get ins {
    return Get.find<OAuthCtrl>();
  }

  OpeninstallFlutterPlugin? _openinstallFlutterPlugin;

  @override
  void onInit() async {
    super.onInit();

    try {
      final data = await KvBox.read(PrefKey.AuthInfo);

      if (data is Map) {
        _setup(AuthInfo.fromJson(data.cast()), true);
      }
    } catch (e, s) {
      errLog(e, s);
    } finally {
      markReady();
    }

    if(isLogin && _auth?.sex != 0) {
      // 己登录，并且资料己经填完
      App.toApp();
    } else {
      // 未登录，或者资料没有完善
      App.toLogin();
    }
    FlutterNativeSplash.remove();
  }

  ///
  /// 同意隐私协议后，才进行初始化
  ///
  void initPrivacy() {
    // 未登录时，初始化OpeninstallFlutterPlugin
    if(_openinstallFlutterPlugin == null) {
      // 未登录时，初始化OpeninstallFlutterPlugin
      _openinstallFlutterPlugin = OpeninstallFlutterPlugin();
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
    if(Env.isDebugCfg) {
      return;
    }
    _openinstallFlutterPlugin?.reportRegister();
    // 记录己经上传过
    KvBox.write(PrefKey.OpenInstallBlindDataFlag2, PrefKey.OpenInstallBlindDataFlag2);
  }

  //<editor-fold desc="登录">
  Future<void> doPwdLogin({required String phone, required String pwd}) {

    return _doLoginBy(
      Api.UserAuth.loginByPwd(name: phone, pwd: pwd),
      onOk: () => KvBox.write(PrefKey.LastPhone, phone),
    );
  }

  Future<void> doSmsLogin({required String phone, required String smsToken, required String smsCode}) {
    return _doLoginBy(
      Api.UserAuth.loginBySms(phone: phone, smsToken: smsToken, smsCode: smsCode),
      onOk: () => KvBox.write(PrefKey.LastPhone, phone),
    );
  }

  Future<void> doOneClickLogin(String token) {
    return _doLoginBy(
      Api.UserAuth.loginByOneClick(token),
    );
  }

  Future<void> doWxLogin(String code) {
    return _doLoginBy(
      Api.UserAuth.loginByWx(code: code),
      middleware: _onLoginByThird,
    );
  }

  Future<void> _doLoginBy(Future api, {Future<Map> Function(Map)? middleware, VoidCallback? onOk}) {
    return simpleSub(
      () async {
        dynamic resp = await api;

        if (middleware != null) {
          resp = await middleware(resp);
        }

        await _useAuth(resp['session']);
      },
      callback: () {
        App.toApp();

        onOk?.call();
      },
    );
  }

  Future<Map> _onLoginByThird(Map data) async {
    if (data['is_new'] == true) {
      final resp = await holderProgress(
        Get.to(() => UserInit0Page(token: data['third_party_token']), transition: Transition.noTransition)!,
      );

      if (resp is Map) return resp;

      throw const CanceledException();
    } else {
      return data;
    }
  }

  Future<void> _useAuth(String token) async {
    try {
      var myInfo = await Api.UserInfo.myInfo(token: token);
      // 性别为空，那么需要去选择角色
      if(myInfo.containsKey("sex") == false || myInfo["sex"] == 0) {

        // 键盘收起来，再进入unity，否则会崩溃
        await Future.delayed(const Duration(seconds: 2));

        final info = await holderProgress(
          Get.to(
                () => Env.useUnity ? UserInit1Page(token: token) : UserInit2Page(token: token, gender: GenderEnum.male),
            // () => MyUserInitPerfectInfoPage(token: token),
            transition: Transition.noTransition,
          )!,
        );

        if (info is Map) {
          await updateUserInfo(info, token);
          _setup(_auth!, false, info: myInfo);
        } else {
          throw const CanceledException();
        }

        // 上传注册信息
        await reportRegister();
      } else {
        await updateUserInfo(myInfo, token);
        _setup(_auth!, true, info: myInfo);
      }
    } on LogicException catch (e) {
      rethrow;
    }
  }
  Future<Map> updateUserInfo(Map info, String token) async {
    if(info.containsKey("uid") == false || info.containsKey("role_id") == false) {
      return info;
    }
    final uid = info['uid'];
    Int64 nUid = Int64(info['role_id']);

    final auth = AuthInfo(
      token: token,
      uid: uid,
      nuid: nUid,
      sex: info["sex"] ?? 0,
    );

    Map<String, dynamic> data = auth.toJson();
    await KvBox.write(PrefKey.AuthInfo, data);

    // _setup(auth, info: info);
    _auth = auth;
    return info;
  }

  ///
  /// [showTransition] 如果未登录时，选角界面
  ///
  void _setup(AuthInfo data, bool showTransition, {Map? info}) {
    _auth = data;
    Get.put(
      UserCtrl(_auth = data, init: info, showTransition: _auth?.sex != 0),
      permanent: true,
    );
    debugPrint("[showTransition] 如果未登录时，选角界面111111");
    // 开启socket连接, 新建一个等待的队列
    SocketCtrl.ins.startClient(Env.serverIP, Env.serverPort);

    // 此处unity选角成功后，发送用户信息给unity
    UnityCtrl.ins.sendUserInfo2Unity();
  }

  //</editor-fold>

  //<editor-fold desc="注销">
  void doLogout({bool reqApi = true, String? msg}) {
    simpleSub(
      _logoutTask(reqApi),
      callback: () => App.toLogin(msg),
    );
  }

  Future<void> _logoutTask(bool reqApi) async {
    if (reqApi) {
      await Future.any(
        [
          Api.UserAuth.logout().catchError((_) {}),
          Future.delayed(const Duration(seconds: 3)),
        ],
      );
    }

    _auth = null;

    await KvBox.remove(PrefKey.AuthInfo);

    await Get.delete<UserCtrl>(force: true);

    // 重置socket
    SocketCtrl.ins.closeSocket();
  }

  //</editor-fold>

  static String get uid => _auth!.uid;
  static NUID get nUid => _auth!.nuid;

  static bool isSelf(String? uid) {
    final _uid = _auth?.uid;

    return _uid != null && uid != null && _uid == uid;
  }

  static bool isSelf2(int? uid) {
    final _uid = _auth?.nuid;

    return _uid != null && uid != null && _uid == uid;
  }

  static String? get token => _auth?.token;

  static bool get isLogin => _auth != null;
}
