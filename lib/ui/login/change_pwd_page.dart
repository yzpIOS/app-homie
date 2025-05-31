import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class ChangePwdPage extends StatefulWidget {
  final bool hasPwd;

  const ChangePwdPage({super.key, required this.hasPwd});

  @override
  State<ChangePwdPage> createState() => _ChangePwdPageState();
}

class _ChangePwdPageState extends State<ChangePwdPage> {
  late final hasPwd = widget.hasPwd;
  late final inputs = Map.fromIterable(
    {
      if (hasPwd) '原密码',
      '新密码',
    },
    value: (_) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: xAppBar(title: '设置密码'),
      body: $BodyView(),
    );
  }

  Widget $BodyView() {
    Widget child = Column(
      children: [
        Spacing.h54,
        ...inputs.entries //
            .map<Widget>((it) => FormInputView(controller: it.value, hint: it.key, isPwd: true))
            .separator(Spacing.h20),
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
    if (inputs.validate()) {
      simpleSub(
        Api.UserAuth.updatePwd(pwd: inputs.by('新密码'), oldPwd: hasPwd ? inputs.by('原密码') : null),
        callback: () => Get.back(result: true),
      );
    }
  }
}
