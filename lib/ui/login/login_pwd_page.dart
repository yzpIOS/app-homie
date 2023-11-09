import 'package:app/common/theme.dart';
import 'package:app/ui/login/login_by_pwd_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'package:app/ui/login/login_base_view.dart';

class LoginPwdPage extends StatefulWidget {
  const LoginPwdPage({super.key});

  @override
  State<LoginPwdPage> createState() => _LoginPwdPageState();
}

class _LoginPwdPageState extends State<LoginPwdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '账号密码登录', bgColor: AppPalette.appBarForegroundColorDark.withAlpha(0)),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,//是否调整大小以避免底部嵌入(防止下一步按钮上移)
      // appBar: xAppBar(),
      // body: LoginBaseView(child: LoginByPwdView()),
      body: const LoginByPwdView(),
    );
  }
}
