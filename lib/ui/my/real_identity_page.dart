import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/real_identity_1_page.dart';
import 'package:app/ui/my/real_identity_2_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class RealIdentityPage extends StatefulWidget {
  final Map? data;

  const RealIdentityPage({super.key, this.data});

  @override
  State<RealIdentityPage> createState() => _RealIdentityPageState();
}

class _RealIdentityPageState extends State<RealIdentityPage> with BusStateMixin {
  late final api = Future.wait(
    [
      Api.UserAuth.privacy(),
      Api.UserInfo.realFaceCallback().catchError((_) {}),
    ],
  );

  @override
  void initState() {
    super.initState();

    final closePage = context.closePage;

    on<AppLinkEvent>(
      test: (event) => event.link.host == 'alipay_face',
      (_) {
        showToast('实名认证[已完成]');

        closePage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '实名认证'),
      body: Padding(
        padding: const Pad(all: 10),
        child: XFutureBuilder<List>(
          api,
          initialData: [widget.data, null],
          onData: (data) {
            final data1 = data[0];
            final data2 = data[1];

            final phone = data1?['phone'];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '手机绑定和实名认证',
                  style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$Medium),
                ),
                Spacing.h10,
                const Text(
                  '为了保护您权益，绑定手机号/实名认证通过之后即可申请入驻',
                  style: TextStyle(fontSize: 12, color: AppPalette.c9),
                ),
                Spacing.h54,
                ...[
                  (icon: '手机号', label: '绑定手机号', status: phone is String && phone.isNotEmpty),
                  (icon: '实名', label: '完成实名认证', status: data1?['is_real_name'] == true),
                  // (icon: '实名2', label: '完成人脸实名认证', status: data2?['result'] == true),
                ].map(itemBuilder).separator(Spacing.h20),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget itemBuilder(({String icon, String label, bool status}) data) {
    Widget child = Row(
      children: [
        SvgView(SVG.$('real/${data.icon}'), width: 24, height: 24),
        Expanded(
          child: Padding(
            padding: const Pad(horizontal: 5),
            child: Text(
              data.label,
              style: const TextStyle(fontSize: 12, color: AppPalette.c9),
            ),
          ),
        ),
        if (data.status)
          XTextBtn(
            label: '已完成',
            width: 54,
            height: 24,
            textStyle: const TextStyle(fontSize: 12, color: Colors.white),
          )
        else
          XOutlinedBtn(
            label: '去认证',
            width: 54,
            height: 24,
            textStyle: const TextStyle(fontSize: 12, color: Colors.black),
            side: const BorderSide(color: AppPalette.cc),
            onTap: () => onItemClick(data.icon),
          ),
      ],
    );

    child = Box(
      padding: const Pad(horizontal: 10),
      height: 40,
      child: child,
    );

    child = Material(
      borderRadius: AppBorderRadius.a4,
      color: const Color(0xFFF5F5F5),
      child: child,
    );

    return child;
  }

  void onItemClick(String action) {
    switch (action) {
      case '实名':
        Get.to(() => const RealIdentity1Page()).xx();
        break;
      // case '实名2':
      //   Get.to(() => const RealIdentity2Page()).xx();
      //   break;
    }
  }
}

extension on Future? {
  void xx() {
    this?.then((val) {
      if (val == true) Get.back(result: val);
    });
  }
}
