import 'dart:ui';

import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/exception.dart';
import 'package:app/model/auth_info_model.dart';
import 'package:app/net/api.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/tools/open_install_utils.dart';
import 'package:app/tools/statistic.dart';
import 'package:app/types.dart';
import 'package:app/ui/app.dart';
import 'package:app/ui/login/init/my_user_init_perfect_info_page.dart';
import 'package:app/ui/login/init/user_init_0_page.dart';
import 'package:app/ui/my/real_identity_1_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'package:app/store/common/ready_ctrl_mixin.dart';
import 'package:app/store/user/user_ctrl.dart';

import 'package:fixnum/fixnum.dart';

class OAuthCtrl extends GetxService with ReadyMixin, ReadyCtrlMixin {

  static AuthInfoModel? _auth;

  static OAuthCtrl get ins {
    return Get.find<OAuthCtrl>();
  }

  @override
  void onInit() async {
    super.onInit();

    try {
      final data = await KvBox.read(PrefKey.AuthInfo);

      if (data is Map) {
        _setup(AuthInfoModel.fromJson(data.cast()), true);
      }
    } catch (e, s) {
      errLog(e, s);
    } finally {
      markReady();
    }

    // skipToMain();
    App.toADLoading();
  }

  void skipToMain() {
    if(isLogin && _auth?.sex != 0) {
      // 己登录，并且资料己经填完
      App.toApp();
      // 己登录
      // OpenInstallUtils.ins.initPrivacy();
      // 登录时间记录
      loginUpdate();
      // 查询未上报的充值订单
      rechargeRecordNotReportQuery();
      // 需要等待unity加载完成
      UnityCtrl.ins.needWaitForUnityReady = true;
      Statistic.launch();
    } else {
      // 未登录，或者资料没有完善
      App.toLogin();
    }
    // FlutterNativeSplash.remove();
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

        await useAuth(resp['session']);

        // 登录时间记录
        loginUpdate();
        // 查询未上报的充值订单
        rechargeRecordNotReportQuery();
        // 统计登录
        Statistic.login();
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

  ///
  /// 打开app时请求
  ///
  void loginUpdate() {
    Api.UserInfo.loginUpdate();
  }

  ///
  /// 打开app时请求
  /// 查询未上报的充值订单
  /// 查到后立即请求完成充值订单上报
  ///
  void rechargeRecordNotReportQuery() {
    simpleSub(
      Api.Wallet.rechargeRecordNotReportQuery(),
      callback1: (resp) {
        final items = resp['items'];
        if (items is List && items.isNotEmpty) {
          final List<int> idList = items.map((e) {
            int? recordId = e['id'];
            return recordId ?? 0;
          }).toList();
          Api.Wallet.rechargeRecordReportFinish(idList: idList);
        }
      },
    );
  }

  Future<void> useAuth(String token) async {
    try {
      var myInfo = await Api.UserInfo.myInfo(token: token);
      // 性别为空，那么需要去选择角色
      if(myInfo.containsKey("sex") == false || myInfo["sex"] == 0) {

        // 键盘收起来，再进入unity，否则会崩溃
        await Future.delayed(const Duration(seconds: 2));

        final info = await holderProgress(
          Get.to(
                // () => Env.useUnity ? UserInit1Page(token: token) : UserInit2Page(token: token, gender: GenderEnum.male),
            () => MyUserInitPerfectInfoPage(token: token),
            transition: Transition.noTransition,
          )!,
        );

        if (info is Map) {
          await updateUserInfo(info, token);
          _setup(_auth!, false, info: myInfo);
          // 创建角色成功
          Statistic.userCreate();
        } else {
          throw const CanceledException();
        }

        // 上传注册信息
        await OpenInstallUtils.ins.reportRegister();

      } else {
        await updateUserInfo(myInfo, token);
        _setup(_auth!, true, info: myInfo);
      }
    } on LogicException catch (e) {
      rethrow;
    }
  }

  ///
  /// 细节处理
  ///
  Future<void> udpateUserInfo() async {
    var myInfo = await Api.UserInfo.myInfo(token: token);
    await updateUserInfo(myInfo, token ?? "");
  }

  Future<Map> updateUserInfo(Map info, String token) async {
    if(info.containsKey("uid") == false || info.containsKey("role_id") == false) {
      return info;
    }
    final uid = info['uid'];
    Int64 nUid = Int64(info['role_id']);

    final auth = AuthInfoModel(
      token: token,
      uid: uid,
      nuid: nUid,
      sex: info["sex"] ?? 0,
      realNameType: info["real_name_type"] ?? 0,
      showName: ""
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
  void _setup(AuthInfoModel data, bool showTransition, {Map? info}) {
    _auth = data;
    Get.put(
      UserCtrl(_auth = data, init: info, showTransition: _auth?.sex != 0),
      permanent: true,
    );
    //debugPrint("[showTransition] 如果未登录时，选角界面111111");
    // 开启socket连接, 新建一个等待的队列
    SocketCtrl.ins.startClient(Env.serverIP, Env.serverPort);

    // 此处unity选角成功后，发送用户信息给unity
    UnityCtrl.ins.sendUserInfo2Unity();
  }

  //</editor-fold>

  //<editor-fold desc="注销">
  void doLogout({bool reqApi = true, String? msg}) {
    // 退出统计
    Statistic.logout();
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

  static String get uid => _auth!.uid ?? '';
  static NUID get nUid => (_auth!.nuid != null && _auth!.nuid! > 0) ? _auth!.nuid! : Int64(0);
  static int get sex => _auth!.sex ?? 0;
  static String get showName => _auth!.showName ?? '';

  // 是否人脸识别
  static bool get isFaceValidate => _auth?.realNameType == 2;

  // 是否实名
  static bool get isNameValidate => _auth?.realNameType == 1 || _auth?.realNameType == 2;

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

  static Future<bool> checkValid() async {
    // 更新数据
    if(!OAuthCtrl.isNameValidate) {
      // 没有实名，更新用户信息，防止缓存数据问题
      await OAuthCtrl.ins.udpateUserInfo();
      // 更新数据后，仍然未实名，就去实名
      if(!OAuthCtrl.isNameValidate) {
        String? label = await Get.simpleDialog(msg: "此功能需要进行实名认证", okLabel: "去实名", cancelLabel: "取消");
        if(label != "去实名") {
          return Future.value(false);
        }
        // 未认证，去认证
        await Get.to(() => const RealIdentity1Page());
        // 更新用户数据
        await OAuthCtrl.ins.udpateUserInfo();
        // 未实名，直接返回
        if(!OAuthCtrl.isNameValidate) {
          return Future.value(false);
        }
      }
    }
    return Future.value(true);
  }

  static Future<void> toIdentityReal() async {
    String? label = await Get.simpleDialog(msg: "此功能需要进行实名认证", okLabel: "去实名", cancelLabel: "取消");
    if(label != "去实名") {
      return Future.value();
    }
    // 未认证，去认证
    await Get.to(() => const RealIdentity1Page());
    // 更新用户数据
    await OAuthCtrl.ins.udpateUserInfo();
  }
}
