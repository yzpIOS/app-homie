import 'package:app/common/theme.dart';
import 'package:app/model/enum/verify_code_enum.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/sms_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class ForgetPwdPage extends StatefulWidget {
  const ForgetPwdPage({super.key});

  @override
  State<ForgetPwdPage> createState() => _ForgetPwdPageState();
}

class _ForgetPwdPageState extends State<ForgetPwdPage> {
  final inputs = Map.fromIterable(
    const {'手机号', '验证码', '新密码'},
    value: (_) => TextEditingController(),
  );

  final tokenRx = RxnString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: xAppBar(title: '忘记密码'),
      body: $BodyView(),
    );
  }

  Widget $BodyView() {
    Widget child = Column(
      children: [
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
          suffixIcon: SmsVerifyView(
            number: inputs['手机号']!,
            tokenRx: tokenRx,
            type: VerifyCodeEnum.FIND_PASSWORD_CHANGE,
          ),
        ),
        Spacing.h20,
        FormInputView(
          controller: inputs['新密码'],
          hint: '新密码',
          isPwd: true,
        ),
        Spacing.h54,
        XTextBtn(
          label: '确定',
          shape: AppShape.a4,
          textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$Medium),
          onTap: doSub,
        ),
      ],
    );

    child = Padding(
      padding: const Pad(horizontal: 36, top: 30),
      child: child,
    );

    child = DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 14, color: Colors.black),
      child: child,
    );

    return child;
  }

  void doSub() {
    Get.back();
  }
}
