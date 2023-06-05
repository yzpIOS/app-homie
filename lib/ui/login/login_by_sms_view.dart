import 'package:app/common/theme.dart';
import 'package:app/model/enum/verify_code_enum.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/sms_view.dart';
import 'package:app/ui/login/login_pwd_page.dart';
import 'package:app/ui/login/widgets/pact_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class LoginBySmsView extends StatefulWidget {
  const LoginBySmsView({super.key});

  @override
  State<LoginBySmsView> createState() => _LoginBySmsViewState();
}

class _LoginBySmsViewState extends State<LoginBySmsView> {
  final inputs = Map.fromIterable(
    const {'手机号', '验证码'},
    value: (_) => TextEditingController(),
  );

  final tokenRx = RxnString(Env.isDebugCfg ? '' : null);

  @override
  void initState() {
    super.initState();

    post(
      () {
        Pact.app
          ..pactRx(false)
          ..alertSub();
      },
    );

    KvBox.read<String>(PrefKey.LastPhone).onNotNull((val) {
      inputs['手机号']?.text = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    final child = Column(
      children: [
        const XText(
          '手机验证码登录',
          style: TextStyle(fontSize: 18, fontWeight: fw$Medium),
        ),
        Spacing.h54,
        FormInputView(
          controller: inputs['手机号'],
          hint: '手机号',
          keyboardType: TextInputType.phone,
        ),
        Spacing.h20,
        FormInputView(
          controller: inputs['验证码'],
          hint: '验证码',
          keyboardType: TextInputType.number,
          suffixIcon: SmsVerifyView(number: inputs['手机号']!, tokenRx: tokenRx, type: VerifyCodeEnum.REGISTER_OR_LOGIN),
        ),
        Spacing.h20,
        const Align(
          alignment: Alignment.centerLeft,
          child: XText(
            '未注册的手机号码验证后将自动登录',
            style: TextStyle(fontSize: 12, color: AppPalette.c9),
          ),
        ),
        Spacing.h4,
        Pact.app.$PactView(),
        Spacing.h54,
        XTextBtn(
          label: '登录',
          shape: AppShape.a4,
          textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$Medium),
          onTap: doLogin,
        ),
        Align(
          alignment: Alignment.topRight,
          child: XTextBtn(
            width: 64,
            label: '密码登录',
            color: Colors.transparent,
            textStyle: const TextStyle(fontSize: 12, color: AppPalette.c3),
            onTap: () => Get.to(() => const LoginPwdPage()),
          ),
        ),
      ],
    );

    return DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 14, color: Colors.black),
      child: Padding(
        padding: const Pad(horizontal: 36, top: 30),
        child: child,
      ),
    );
  }

  void doLogin() {
    final token = tokenRx();

    if (token == null) {
      showToast('请先发送验证码');

      return;
    }
    if (inputs.validate()) {
      hideKeyboard();

      final phone = inputs.by('手机号');
      final code = inputs.by('验证码');

      Pact.app.alertSub(
        doSub: () {
          Get.find<OAuthCtrl>().doSmsLogin(phone: phone, smsToken: token, smsCode: code);
        },
      );
    }
  }
}
