import 'package:app/ui/login/login_base_view.dart';
import 'package:app/ui/login/login_by_sms_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class LoginSmsPage extends StatefulWidget {
  const LoginSmsPage({super.key});

  @override
  State<LoginSmsPage> createState() => _LoginSmsPageState();
}

class _LoginSmsPageState extends State<LoginSmsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: xAppBar(),
      body: const LoginBaseView(child: LoginBySmsView()),
    );
  }
}
