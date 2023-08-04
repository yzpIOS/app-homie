import 'package:app/3rd/tencent/wx.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'package:app/ui/login/widgets/pact_view.dart';
import 'package:wechat_kit/wechat_kit.dart';

var _wxAuthLock = false;

class LoginByThirdView extends StatelessWidget {
  const LoginByThirdView({super.key});

  // wwxIsInstalled () {
  //   final wxIsInstalled = WechatKitPlatform.instance.isInstalled();
  //   return wxIsInstalled;
  // }

  @override
  Widget build(BuildContext context) {

    final data = [
      // 'phone',
      // 'qq',
      // if (wwxIsInstalled())
      'wx',
      // if (GetPlatform.isIOS) 'apple',
    ];

    return Box(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: data.map(itemBuilder).separator(Spacing.w20).toList(growable: false),
      ),
    );
  }

  Widget itemBuilder(String type) {
    return InkResponse(
      child: SvgView(SVG.$('login/$type')),
      onTap: () {
        Pact.app.alertSub(
          doSub: () => doLogin(type),
        );
      },
    );
  }

  void doLogin(String type) {
    switch (type) {
      case 'phone':
        // simpleSub(
        //   JVerify.preLogin(),
        //   callback: () {
        //     JVerify.doLogin(onOk: Get.find<OAuthCtrl>().doOneClickLogin);
        //   },
        // );
        break;
      case 'qq':
        break;
      case 'wx':
        doLoginByWx();
        break;
      case 'apple':
        break;
    }
  }

  void doLoginByWx() {
    if (_wxAuthLock) return;

    simpleTry(
      Wx.doAuth,
      callback: (resp) async {
        if (_wxAuthLock) return;

        try {
          _wxAuthLock = true;

          await Get.find<OAuthCtrl>().doWxLogin(resp);
        } finally {
          _wxAuthLock = false;
        }
      },
    );
  }
}
