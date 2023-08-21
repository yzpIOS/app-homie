import 'package:app/common/theme.dart';
import 'package:app/common/utils/en.dart';
import 'package:app/model/enum/gender_enum.dart';
import 'package:app/model/enum/verify_code_enum.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/sms_view.dart';
import 'package:app/ui/login/init/user_init_1_page.dart';
import 'package:app/ui/login/init/user_init_2_page.dart';
import 'package:app/ui/login/login_pwd_page.dart';
import 'package:app/ui/login/widgets/pact_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        XText(
          '手机验证码登录'.en(),
          style: TextStyle(fontSize: 18, fontWeight: fw$Medium),
        ),
        Spacing.h54,
        FormInputView(
          controller: inputs['手机号'.en()],
          hint: '手机号'.en(),
          keyboardType: TextInputType.phone,
        ),
        Spacing.h20,

        FormInputView(
          controller: inputs['验证码'.en()],
          hint: '验证码'.en(),
          maxLength: 6,
          keyboardType: TextInputType.number,
          inputFormatters: [
            // 数字，只能是整数
            FilteringTextInputFormatter.digitsOnly,
            // 数字包括小数
            // FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
          ],
          suffixIcon: SmsVerifyView(number: inputs['手机号'.en()]!, tokenRx: tokenRx, type: VerifyCodeEnum.REGISTER_OR_LOGIN),
        ),
        Spacing.h20,
        Align(
          alignment: Alignment.centerLeft,
          child: XText(
            '未注册的手机号码验证后将自动登录'.en(),
            style: const TextStyle(fontSize: 12, color: AppPalette.c9),
          ),
        ),
        Spacing.h4,
        Pact.app.$PactView(),
        Spacing.h54,
        XTextBtn(
          label: '登录'.en(),
          shape: AppShape.a4,
          textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$Medium),
          onTap: doLogin,
        ),
        Align(
          alignment: Alignment.topRight,
          child: XTextBtn(
            width: 64,
            label: '密码登录'.en(),
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
    String? token = tokenRx();
    if(Env.isDebugCfg && (token == null || token.isEmpty == true)) {
      token = "1";
    }

    if (token == null) {
      showToast('请先发送验证码'.en());
      return;
    }

    if (inputs.validate()) {
      hideKeyboard();
      final phone = inputs.by('手机号'.en());
      final code = inputs.by('验证码'.en());
      Pact.app.alertSub(
        doSub: () {
          Get.find<OAuthCtrl>().doSmsLogin(phone: phone, smsToken: token ?? "", smsCode: code);
        },
      );
    }
  }
}
