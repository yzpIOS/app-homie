import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:app/ui/common/web_page.dart';

class RealIdentity2Page extends StatefulWidget {
  const RealIdentity2Page({super.key});

  @override
  State<RealIdentity2Page> createState() => _RealIdentity2PageState();
}

class _RealIdentity2PageState extends State<RealIdentity2Page> with BusStateMixin {
  final inputs = Map.fromIterable(
    const {'姓名', '证件号码'},
    value: (_) => TextEditingController(),
  );

  final maskFormatter = MaskFunctionTextInputFormatter(
    maskFunction: ({required oldValue, required newValue}) => '######Y###M#D####V',
    filter: {
      "#": RegExp(r'\d'),
      "Y": RegExp('[1-2]'),
      "M": RegExp('[0-1]'),
      "D": RegExp('[0-3]'),
      "V": RegExp(r'[\dxX]'),
    },
  );

  @override
  void initState() {
    super.initState();

    on<AppLifecycleEvent>(
      test: (event) => event.state == AppLifecycleState.resumed,
      (_) {
        simpleSub(
          Api.UserInfo.realFaceCallback,
          callback1: (resp) {
            if (resp case {'result': true}) {
              showToast('实名认证[已完成]');

              Get.back(result: true);
            } else {
              showToast('实名认证[未完成]');
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '支付宝快捷实名认证'),
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

  void doSub() async {
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

    hideKeyboard(keepFocus: true);

    simpleSub(
      Api.UserInfo.realFace(name: name, number: number),
      callback1: (resp) async {
        final url = resp['page_url'];

        try {
          final b = await launchUrl(
            Uri(
              scheme: 'alipays',
              host: 'platformapi',
              pathSegments: ['startapp'],
              queryParameters: {'appId': '20000067', 'url': url},
            ),
            mode: LaunchMode.platformDefault,
          );

          if (b) return;
        } catch (e, s) {
          errLog(e, s);
        }

        if (await launchUrlString(url, mode: LaunchMode.externalApplication)) return;

        showToast('打开失败');
      },
    );
  }
}
