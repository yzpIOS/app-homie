import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

class RealIdentity1Page extends StatefulWidget {
  const RealIdentity1Page({super.key});

  @override
  State<RealIdentity1Page> createState() => _RealIdentity1PageState();
}

class _RealIdentity1PageState extends State<RealIdentity1Page> {
  final inputs = Map.fromIterable(
    const {'姓名', '证件号码'},
    value: (_) => TextEditingController(),
  );

  final maskFormatter = MaskFunctionTextInputFormatter(
    maskFunction: ({required oldValue, required newValue}) => '######-Y###M#D#-###V',
    filter: {
      "#": RegExp(r'\d'),
      "Y": RegExp('[1-2]'),
      "M": RegExp('[0-1]'),
      "D": RegExp('[0-3]'),
      "V": RegExp(r'[\dxX]'),
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '实名认证'),
      body: Padding(
        padding: const Pad(horizontal: 20),
        child: Column(
          children: [
            Spacing.h32,
            FormInputView(
              controller: inputs['姓名'],
              hint: '真实姓名',
              autofocus: true,
            ),
            Spacing.h10,
            FormInputView(
              controller: inputs['证件号码'],
              hint: '18位身份证号码',
              inputFormatters: [maskFormatter],
            ),
            Spacing.exp,
            Padding(
              padding: Pad(horizontal: 40, bottom: AppSize.safeBottom + 40),
              child: XTextBtn(
                label: '确定',
                textStyle: const TextStyle(fontSize: 16, fontWeight: fw$Medium),
                onTap: doSub,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void doSub() {
    final name = inputs.by('姓名').trim();
    final number = maskFormatter.getUnmaskedText();

    if (name.isEmpty) {
      showToast('请输入真实姓名');

      return;
    }

    if (number.length != 18) {
      showToast('请输入18位身份证号码');

      return;
    }

    simpleSub(
      Api.UserInfo.realName(name: name, number: number.toUpperCase()),
      callback: () {
        showToast('实名认证[已完成]');

        Get.back(result: true);
      },
    );
  }
}
