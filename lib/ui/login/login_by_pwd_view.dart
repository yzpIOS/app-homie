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
        FormInputView(
          controller: inputs['手机号'],
          hint: '手机号',
          keyboardType: TextInputType.phone,
          bgColor: AppPalette.colorEB,
        ),
        Spacing.h22,
        FormInputView(
          controller: inputs['密码'],
          hint: '密码',
          isPwd: true,
          bgColor: AppPalette.colorEB,
        ),
        Spacing.h96,
        Pact.app.$PactView(),
        Spacing.h16,
        XTextBtn(
          height: 39,
          label: '登录',
          shape: AppShape.a4,
          textStyle: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: fw$Bold),
          onTap: doLogin,
        ),
        Spacing.h12,
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            child: Text.rich(
              TextSpan(
                style: const TextStyle(fontSize: 12, color: AppPalette.c9),
                children: [
                  const TextSpan(text: '忘记密码',),
                  WidgetSpan(child: Image.asset(IMG.format('login/small_arrow'), color: AppPalette.c9, scale: 3), alignment: PlaceholderAlignment.middle),
                ],
              ),
            ),
            onTap: () => Get.to(() => ForgetPwdPage(phone: inputs.by('手机号'),)),
          ),
        ),
      ],
    );

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.asset(IMG.format('login/login_pic_bg'), scale: 3, fit: BoxFit.contain),
        ),
        Positioned.fill(
          top: AppSize.safeTop + AppSize.appBar + 60,
          left: 36,
          right: 36,
          child: child,
        ),
      ],
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
