import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/ui/login/login_base_view.dart';
import 'package:app/ui/login/login_by_sms_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class LoginHomePage extends StatefulWidget {
  const LoginHomePage({super.key});

  @override
  State<LoginHomePage> createState() => _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> with GetStateMixin {
  @override
  void initState() {
    super.initState();

    bindGet(true, tag: 'LoginPageMark');

    final msg = Get.arguments;

    if (msg is String) {
      showToast(msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: xAppBar(title: '手机验证码登录', bgColor: AppPalette.appBarForegroundColorDark.withAlpha(0)),
      body: const LoginBaseView(child: LoginBySmsView()),
    );

    if (GetPlatform.isAndroid) {
      child = WillPopScope(
        onWillPop: () => goHome().then((_) => false),
        child: child,
      );
    }

    return child;
  }
}
