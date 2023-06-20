import 'dart:ui';

import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/exception.dart';
import 'package:app/model/auth_info.dart';
import 'package:app/model/enum/gender_enum.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/app.dart';
import 'package:app/ui/login/init/user_init_0_page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:app/ui/login/init/user_init_1_page.dart';
import 'package:app/ui/login/init/user_init_2_page.dart';
import 'package:app/store/common/ready_ctrl_mixin.dart';
import 'package:app/store/user/user_ctrl.dart';

import 'package:fixnum/fixnum.dart';

class OAuthCtrl extends GetxService with ReadyMixin, ReadyCtrlMixin {
  static AuthInfo? _auth;

  @override
  void onInit() async {
    super.onInit();

    try {
      final data = await KvBox.read(PrefKey.AuthInfo);

      if (data is Map) {
        _setup(AuthInfo.fromJson(data.cast()));
      }
    } catch (e, s) {
      errLog(e, s);
    } finally {
      markReady();
    }

    (isLogin ? App.toApp : App.toLogin).call();

    FlutterNativeSplash.remove();
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
    Future<void> _useInfo(Map info) async {
      final uid = info['uid'];
      Int64 nUid = Int64(info['role_id']);

      final auth = AuthInfo(
        token: token,
        uid: uid,
        nuid: nUid,
      );

      Map<String, dynamic> data = auth.toJson();
      await KvBox.write(PrefKey.AuthInfo, data);

      _setup(auth, info: info);
    }

    try {
      await _useInfo(
        await Api.UserInfo.myInfo(token: token),
      );
    } on LogicException catch (e) {
      switch (e.code) {
        case 13004:
          final info = await holderProgress(
            Get.to(
              () => Env.useUnity ? UserInit1Page(token: token) : UserInit2Page(token: token, gender: GenderEnum.male),
              transition: Transition.noTransition,
            )!,
          );

          if (info is Map) {
            await _useInfo(info);
          } else {
            throw const CanceledException();
          }
          break;
        default:
          rethrow;
      }
    }
  }

  void _setup(AuthInfo data, {Map? info}) {
    Get.put(
      UserCtrl(_auth = data, init: info),
      permanent: true,
    );
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

    SocketCtrl.ins.resetConnect();
    SocketCtrl.ins.onCanConnected(false);
  }

  //</editor-fold>

  static String get uid => _auth!.uid;
  static NUID get nUid => _auth!.nuid;

  static bool isSelf(String? uid) {
    final _uid = _auth?.uid;

    return _uid != null && uid != null && _uid == uid;
  }

  static String? get token => _auth?.token;

  static bool get isLogin => _auth != null;
}
