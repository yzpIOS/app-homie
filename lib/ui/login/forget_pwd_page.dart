import 'package:app/common/theme.dart';
import 'package:app/common/utils/en.dart';
import 'package:app/model/enum/verify_code_enum.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/sms_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgetPwdPage extends StatefulWidget {
  final String phone;
  const ForgetPwdPage({super.key, required this.phone});

  @override
  State<ForgetPwdPage> createState() => _ForgetPwdPageState();
}

class _ForgetPwdPageState extends State<ForgetPwdPage> {
  final inputs = Map.fromIterable(
    const {'手机号', '验证码', '新密码', '再次输入新密码'},
    value: (_) => TextEditingController(),
  );

  final tokenRx = RxnString();

  @override
  void initState() {
    super.initState();

    if (widget.phone.isNotEmpty) {
      inputs['手机号']?.text = widget.phone;
    }
  }

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
      crossAxisAlignment: CrossAxisAlignment.start,
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
          maxLength: 6,
          keyboardType: TextInputType.number,
          inputFormatters: [
            // 数字，只能是整数
            FilteringTextInputFormatter.digitsOnly,
          ],
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
          maxLength: 16,
        ),
        Spacing.h20,
        FormInputView(
          controller: inputs['再次输入新密码'],
          fullHint: '请再次输入新密码',
          isPwd: true,
          maxLength: 16,
        ),
        Spacing.h10,
        Text.rich(
          TextSpan(
            children: [
              WidgetSpan(child: SvgView(SVG.$('login/login_icon_zy')),),
              const TextSpan(text: ' 密码由6-16个任意数字或字母组合'),
            ],
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
        ),
        Spacing.h76,
        XTextBtn(
          label: '确定',
          shape: AppShape.a4,
          textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$Bold),
          onTap: doSub,
        ),
      ],
    );

    child = Padding(
      padding: const Pad(horizontal: 36),
      child: child,
    );

    child = DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 14, color: Colors.black),
      child: child,
    );

    return child;
  }

  void doSub() {
    String? token = tokenRx();
    if (token == null) {
      showToast('请先发送验证码'.en());
      return;
    }

    if (inputs.validate()) {
      hideKeyboard();

      final newPassword = inputs.by('新密码');
      final againNewPassword = inputs.by('再次输入新密码');
      if (newPassword != againNewPassword) {
        showToast('两次输入的密码不一致');
        return;
      }

      final phone = inputs.by('手机号');
      final smsCode = inputs.by('验证码');

      simpleSub(
        Api.UserAuth.passwordReset(phone: phone, smsToken: token ?? "", smsCode: smsCode, newPassword: newPassword, againNewPassword: againNewPassword),
        callback: () {
          showToast('密码修改成功');
          Get.back();
        },
      );
    }
  }
}
