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
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: xAppBar(),
      // body: LoginBaseView(child: LoginByPwdView()),
      body: LoginByPwdView(),
    );
  }
}
