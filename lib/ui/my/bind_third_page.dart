import 'package:app/3rd/tencent/wx.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class BindThirdPage extends StatefulWidget {
  const BindThirdPage({super.key});

  @override
  State<BindThirdPage> createState() => _BindThirdPageState();
}

class _BindThirdPageState extends State<BindThirdPage> {
  late final api = Api.UserAuth.bindQuery();
  var _wxAuthLock = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '第三方账号绑定'),
      body: XFutureBuilder(
        api,
        onData: (dynamic data) {
          return SingleChildScrollView(child: $DataView(data));
        },
      ),
    );
  }

  Widget $DataView(Map data) {
    // late final bindQq = data['bind_qq'] == true;
    late final bindWechat = data['bind_wechat'] == true;

    final items = [
      TableItem(
        title: '微信',
        tips: bindWechat ? '已绑定' : '未绑定',
        onTap: (bindWechat ? unbindWx : bindWx).let((fn) => () => fn(data)),
      ),
    ];

    return TableView([TableGroup(items)]);
  }

  void bindWx(Map data) {
    if (_wxAuthLock) return;

    simpleTry(
      Wx.doAuth,
      callback: (resp) async {
        if (_wxAuthLock) return;

        try {
          _wxAuthLock = true;

          await simpleSub(
            Api.UserAuth.bindWechat(resp),
            callback: () => setState(() => data['bind_wechat'] = true),
          );
        } finally {
          _wxAuthLock = false;
        }
      },
    );
  }

  void unbindWx(Map data) {
    Get.alertSub(
      Api.UserAuth.unbindWechat,
      alert: '确认是否解除绑定',
      callback: () => setState(() => data['bind_wechat'] = false),
    );
  }
}
