import 'package:app/common/theme.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/login/widgets/pact_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'forget_pwd_page.dart';

class LoginByPwdView extends StatefulWidget {
  const LoginByPwdView({super.key});

  @override
  State<LoginByPwdView> createState() => _LoginByPwdViewState();
}

class _LoginByPwdViewState extends State<LoginByPwdView> {
  final inputs = Map.fromIterable(
    const {'手机号', '密码'},
    value: (_) => TextEditingController(),
  );

  @override
  void initState() {
    super.initState();

    KvBox.read<String>(PrefKey.LastPhone).onNotNull((val) {
      inputs['手机号']?.text = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    final child = Column(
      children: [
        const XText(
          '账号密码登录',
          style: TextStyle(fontSize: 18, fontWeight: fw$Bold),
        ),
        Spacing.h50,
        FormInputView(
          controller: inputs['手机号'],
          hint: '手机号',
          keyboardType: TextInputType.phone,
        ),
        Spacing.h20,
        FormInputView(
          controller: inputs['密码'],
          hint: '密码',
          isPwd: true,
        ),
        Spacing.h20,
        Pact.app.$PactView(),
        Spacing.h76,
        XTextBtn(
          label: '登录',
          shape: AppShape.a4,
          textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$Bold),
          onTap: doLogin,
        ),
        Row(
          children: [
            XTextBtn(
              width: 64,
              label: '手机号登录',
              color: Colors.transparent,
              textStyle: const TextStyle(fontSize: 12, color: AppPalette.c3),
              onTap: () => Get.back(),
            ),
            const Expanded(child: Spacing.blank),
            XTextBtn(
              width: 64,
              label: '忘记密码',
              color: Colors.transparent,
              textStyle: const TextStyle(fontSize: 12, color: AppPalette.c3),
              onTap: () => Get.to(() => ForgetPwdPage(phone: inputs.by('手机号'),)),
            ),
          ],
        ),
      ],
    );

    return DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 14, color: Colors.black),
      child: Padding(
        padding: Pad(horizontal: 36, top: AppSize.safeTop + AppSize.appBar + 30),
        child: child,
      ),
    );
  }

  void doLogin() {
    if (inputs.validate()) {
      hideKeyboard();

      Pact.app.alertSub(
        doSub: () {
          Get.find<OAuthCtrl>().doPwdLogin(phone: inputs.by('手机号'), pwd: inputs.by('密码'));
        },
      );
    }
  }
}
