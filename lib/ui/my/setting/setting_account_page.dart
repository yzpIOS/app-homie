import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/real_identity_2_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'package:app/ui/login/change_pwd_page.dart';
import 'package:app/ui/my/bind_third_page.dart';
import 'package:app/ui/my/real_identity_page.dart';

class SettingAccountPage extends StatefulWidget {
  const SettingAccountPage({super.key});

  @override
  State<SettingAccountPage> createState() => _SettingAccountPageState();
}

class _SettingAccountPageState extends State<SettingAccountPage> {
  late final api = Api.UserAuth.privacy();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '账号与安全'),
      body: XFutureBuilder(
        api,
        onData: (dynamic data) {
          return SingleChildScrollView(child: $DataView(data));
        },
      ),
    );
  }

  Widget $DataView(Map data) {
    final phone = data['phone'] as String?;
    final hasPwd = data['is_set_password'] == true;
    final isRealName = data['is_real_name'] == true;

    final items = [
      TableItem(title: '账号名称', tips: data['user_name']),
      TableItem(title: '手机绑定', tips: phone),
      // todo:屏蔽微信
      if (GetPlatform.isAndroid)
        TableItem(
          title: '第三方账号绑定',
          onTap: () => Get.to(() => const BindThirdPage()),
        ),
      TableItem(
        title: '密码',
        tips: hasPwd ? '已设置' : '未设置',
        onTap: () {
          Get.to(() => ChangePwdPage(hasPwd: hasPwd)) //
              ?.onNotNull((val) => setState(() => data['is_set_password'] = true));
        },
      ),
      // TableItem(
      //   title: '实名认证',
      //   tips: isRealName ? '已认证' : '未认证',
      //   onTap: () => Get.to(() => RealIdentityPage(data: data)),
      // ),
      TableItem(
        title: '完成人脸实名认证',
        tips: OAuthCtrl.isFaceValidate ? '已认证' : '未认证',
        onTap: () async {
          // 己认证
          if(OAuthCtrl.isFaceValidate) {
            return;
          }
          // 未认证，去认证
          await Get.to(() => const RealIdentity2Page());
          // 刷新用户数据
          OAuthCtrl.ins.useAuth(OAuthCtrl.token ?? "");
        },
      ),
    ];

    return TableView([TableGroup(items)]);
  }
}


extension on Future? {
  void xx() {
    this?.then((val) {
      if (val == true) Get.back(result: val);
    });
  }
}
