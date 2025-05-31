import 'package:app/3rd/tencent/im.dart';
import 'package:app/net/api.dart';
import 'package:app/store/common/ready_ctrl_mixin.dart';
import 'package:app/store/user/user_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:flutter/foundation.dart';

class ImCtrl extends GetxService with ReadyMixin, ReadyCtrlMixin, BusGetLifeMixin {
  @override
  void onInit() async {
    super.onInit();

    try {
      await _initClient();

      markReady();
    } catch (e, s) {
      markFail(e, s);
    }
  }

  Future _initClient() async {
    final _handler = FlutterError.onError;

    try {
      await IM.init();
    } finally {
      FlutterError.onError = _handler;
    }
  }
}

class ImAuth extends GetxController with ReadyMixin, ReadyCtrlMixin, GetDisposableMixin {
  final UID uid;

  ImAuth({required this.uid});

  String? token;

  Future<String> fetchToken({bool doRefresh = false}) {
    const key = 'ImToken';

    return UserCtrl.useBox<String>((box) async {
      final _token = token ??= await box.get(key);

      if (_token is String && _token.isNotEmpty) {
        if (doRefresh) {
          final api = Api.Common.imToken().then((val) {
            box.put(key, val);

            return token = val;
          });

          try {
            return await api.timeout(const Duration(seconds: 1));
          } catch (e, s) {
            errLog(e, s);
          }
        }

        return _token;
      } else {
        final _token = token = await Api.Common.imToken();

        box.put(key, _token);

        return _token;
      }
    });
  }

  @override
  void onReady() {
    fetchToken(doRefresh: true).then(_doLogin);
  }

  @override
  void onClose() {
    _doLogout();

    super.onClose();
  }

  Future<void> _doLogin(String token) async {
    if (isClosed) return;

    await Get.find<ImCtrl>().ready;

    try {
      await _signIn(token);

      markReady();
    } catch (e, s) {
      markFail(e, s);
    }
  }

  Future<void> _doLogout() async {
    try {
      await _signOut();
    } catch (e, s) {
      errLog(e, s, type: LogType.IM);
    }
  }

  Future<void> _signIn(String token) async {
    final _uid = await IM.$.getLoginUser().dataOrNull;

    if (_uid == uid) {
      // xlog('登录复用 -> $uid', type: LogType.IM);
      //
      // return;
    } else if (isNotEmpty(_uid)) {
      await _signOut();

      xlog('登录注销原用户 -> $_uid', type: LogType.IM);
    }

    await IM.$.login(userID: uid, userSig: token).isOk;

    xlog('登录成功 -> $uid', type: LogType.IM);
  }

  Future<void> _signOut() {
    return IM.$.logout().timeout(const Duration(seconds: 2));
  }
}
