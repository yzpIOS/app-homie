import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/tools/statistic.dart';
import 'package:app/ui/login/widgets/pact_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class FreezeAccountPage extends StatefulWidget {
  const FreezeAccountPage({super.key});

  @override
  State<FreezeAccountPage> createState() => _FreezeAccountPageState();
}

class _FreezeAccountPageState extends State<FreezeAccountPage> {
  @override
  void initState() {
    super.initState();

    Pact.freezeAccount.pactRx(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '申请注销'),
      body: Column(
        children: [
          Expanded(
            flex: 550,
            child: $TextView(),
          ),
          Padding(
            padding: const Pad(horizontal: 40),
            child: Column(
              children: [
                Pact.freezeAccount.$PactView(),
                Spacing.h10,
                XTextBtn(
                  label: '已清楚风险，确定注销',
                  height: 40,
                  textStyle: const TextStyle(fontSize: 16, fontWeight: fw$SemiBold),
                  onTap: _doSub,
                ),
              ],
            ),
          ),
          const Spacing(flex: 70),
        ],
      ),
    );
  }

  Widget $TextView() {
    return const Padding(
      padding: Pad(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '注销账户有以下风险',
            style: TextStyle(fontSize: 16, fontWeight: fw$Medium),
          ),
          Spacing.h20,
          Padding(
            padding: Pad(left: 20),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '1.永久注销，无法登录',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  TextSpan(text: '\n'),
                  TextSpan(text: '账号一旦注销，无法登录，且会解除第三方账号的绑定 关系'),
                  TextSpan(text: '\n\n'),
                  TextSpan(
                    text: '2.数据将无法找回',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  TextSpan(text: '\n'),
                  TextSpan(text: '注销后，账号及相关数据将无法找回'),
                ],
              ),
              style: TextStyle(fontSize: 12, color: AppPalette.c9),
            ),
          ),
        ],
      ),
    );
  }

  void _doSub() {
    Pact.freezeAccount.alertSub(
      fromLogin: false,
      doSub: () {
        Get.alertSub(
          alert: '确定注销',
          () async {
            // 注删帐号
            Statistic.deleteCount();
            await Api.UserAuth.cancelAccount();

            Get.find<OAuthCtrl>().doLogout(reqApi: false);
          },
        );
      },
    );
  }
}
