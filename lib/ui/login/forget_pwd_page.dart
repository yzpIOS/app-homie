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
      appBar: xAppBar(title: '忘记密码', bgColor: AppPalette.appBarForegroundColorDark.withAlpha(0)),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: $BodyView(),
    );
  }

  Widget $BodyView() {
    Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormInputView(
          controller: inputs['手机号'],
          hint: '手机号',
          keyboardType: TextInputType.phone,
          bgColor: AppPalette.colorEB,
        ),
        Spacing.h22,
        FormInputView(
          controller: inputs['验证码'],
          hint: '验证码',
          maxLength: 6,
          keyboardType: TextInputType.number,
          bgColor: AppPalette.colorEB,
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
        Spacing.h22,
        FormInputView(
          controller: inputs['新密码'],
          hint: '新密码',
          isPwd: true,
          maxLength: 16,
          bgColor: AppPalette.colorEB,
        ),
        Spacing.h22,
        FormInputView(
          controller: inputs['再次输入新密码'],
          fullHint: '请再次输入新密码',
          isPwd: true,
          maxLength: 16,
          bgColor: AppPalette.colorEB,
        ),
        const Padding(
          padding: Pad(left: 17, top: 20),
          child: Text(
            '密码由6-16个任意数字和字母组合',
            style: TextStyle(fontSize: 10, color: AppPalette.c9, fontWeight: fw$Regular),
          ),
        ),
        Spacing.h76,
        XTextBtn(
          height: 39,
          label: '确定',
          shape: AppShape.a4,
          textStyle: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: fw$Bold),
          onTap: doSub,
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
