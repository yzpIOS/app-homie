import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/store/config_ctrl.dart';
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
  final pactRx = RxBool(false); //是否选中直播规范
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

  bool check = false;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _createTitle(),
            const SizedBox(height: 18,),
            FormInputView(
              controller: inputs['姓名'],
              hint: '真实姓名',
              autofocus: true,
              borderRadius: BorderRadius.circular(6),
              bgColor: const Color(0xFFEBEBFF),
            ),
            Spacing.h10,
            FormInputView(
              controller: inputs['证件号码'],
              hint: '身份证号码',
              inputFormatters: [maskFormatter],
              borderRadius: BorderRadius.circular(6),
              bgColor: const Color(0xFFEBEBFF),
            ),
            Spacing.exp,

            _createAccord(),
            SizedBox(height: 12,),
            Align(
              alignment: Alignment.topCenter,
              child: _createBottom(),
            ),
            SizedBox(height: AppSize.safeBottom + 40,)
          ],
        ),
      ),
    );
  }

  void doSub() async {
    final name = inputs.by('姓名').trim();
    final number = maskFormatter.getUnmaskedText();
    final pact = pactRx();

    if (name.isEmpty) {
      showToast('请输入真实姓名');
      return;
    }
    if (number.length != 18) {
      showToast('请输入身份证号码');
      return;
    }
    if (pact == false) {
      showToast('请阅读并同意《主播协议》');
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

  Widget _createTitle() {
    return Text(
      "主播认证",
      style: TextStyle(
        fontSize: 15,
        color: Colors.black,
      ),
    );
  }

  Widget _createAccord() {
    return GetBuilder<ConfigCtrl>(
      initState: (state) => state.controller?.doRefresh(),
      builder: (ctrl) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return OpacityButton(
                child: Image.asset(IMG.format(
                    pactRx.value ? 'shop/协议选中' : 'shop/协议未选中'),
                    width: 13, height: 13, scale: 3, fit: BoxFit.contain),
                onTap: () {
                  pactRx.toggle();
                },
              );
            }),
            Spacing.w4,
            StyledText(
              text: '我已阅读并同意<c>《<a1>主播协议</a1>》</c>',
              tags: {
                'c': StyledTextTag(
                    style: const TextStyle(color: AppPalette.primary)),
                'a1': StyledTextActionTag((val, __) =>
                    ctrl.onTapLink(val!, 'anchor_protocol')),
              },
              style: const TextStyle(fontSize: 12, color: AppPalette.colorA9),
            ),
          ],
        );
      },
    );
  }

  Widget _createBottom() {
    return GestureDetector(
      onTap: doSub,
      child: Container(
        width: 305,
        height: 42,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFFB17FDD),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          "确 定",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
