import 'package:app/common/theme.dart';
import 'package:app/model/enum/verify_code_enum.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/sms_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class UserInit0Page extends StatefulWidget {
  final String token;

  const UserInit0Page({super.key, required this.token});

  @override
  State<UserInit0Page> createState() => _UserInit0PageState();
}

class _UserInit0PageState extends State<UserInit0Page> {
  final inputs = Map.fromIterable(
    const {'手机号', '验证码'},
    value: (_) => TextEditingController(),
  );

  final tokenRx = RxnString();

  @override
  Widget build(BuildContext context) {
    Widget child = Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: xAppBar(title: '绑定手机号'),
      body: $BodyView(),
    );

    child = WillPopScope(
      onWillPop: () => Get.simpleDialog(msg: '确定取消注册').then((it) => it == '确定'),
      child: child,
    );

    return child;
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
            type: VerifyCodeEnum.REGISTER_OR_LOGIN,
          ),
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
    final token = tokenRx();

    if (token == null) {
      showToast('请先发送验证码');

      return;
    }

    if (inputs.validate()) {
      hideKeyboard();

      final phone = inputs.by('手机号');
      final code = inputs.by('验证码');

      simpleSub(
        Api.UserAuth.loginBySms(phone: phone, smsToken: token, smsCode: code, thirdToken: widget.token),
        callback1: (resp) {
          Get.back(result: resp);
        },
      );
    }
  }
}
