import 'dart:io';

import 'package:app/common/cache_manager.dart';
import 'package:app/common/theme.dart';
import 'package:app/store/config_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/web_page.dart';
import 'package:app/ui/my/setting/setting_account_page.dart';
import 'package:app/ui/my/setting/setting_notify_page.dart';
import 'package:app/ui/my/setting/setting_privacy_page.dart';
import 'package:app/ui/my/setting/setting_version_page.dart';
import 'package:app/ui/task/freeze_account_view.dart';
import 'package:app/ui/task/young_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final _divider = const Divider(height: 10, thickness: 10, color: AppPalette.background2);

  late final configCtrl = Get.find<ConfigCtrl>();

  @override
  void initState() {
    super.initState();

    configCtrl.doRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.background2,
      appBar: xAppBar(title: '设置'),
      body: SingleChildScrollView(
        padding: Pad(top: 10, bottom: AppSize.safeBottom),
        child: Column(
          children: [
            $DataView(),
            Padding(
              padding: const Pad(top: 32, bottom: 5),
              child: TextButton(
                child: const Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 12, color: AppPalette.c9, fontWeight: fw$Regular),
                    children: [
                      TextSpan(text: 'ICP备案号:桂ICP备2023001721号-2A',),
                      WidgetSpan(child: RightArrowIcon(color: AppPalette.c9,), alignment: PlaceholderAlignment.middle,),
                    ],
                  ),
                ),
                onPressed: () => onItemClick('备案号'),
              ),
            ),
            Padding(
              padding: const Pad(horizontal: 32, bottom: 20),
              child: XTextBtn(
                label: '退出登录',
                color: Colors.white,
                textStyle: const TextStyle(fontSize: 16, color: Colors.black),
                onTap: () => onItemClick('退出登录'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget $DataView() {
    final data = [
      [
        '账号与安全',
        '消息提醒',
        '隐私',
        '青少年模式',
      ],
      [
        '清理缓存',
      ],
      [
        '用户协议',
        '隐私政策',
        '隐私政策摘要',
        '个人信息收集清单',
        '第三方信息共享清单',
        '申请注销',
        '关于',
      ],
    ];

    return TableView(
      divider: Some(PreferredSize(preferredSize: const Size.fromHeight(10), child: _divider)),
      data.map((it) {
        return TableGroup(
          itemColor: const Some(Colors.white),
          [
            for (final item in it)
              TableItem(
                title: item,
                onTap: () => onItemClick(item),
              ),
          ],
        );
      }).toList(growable: false),
    );
  }

  Future _doClean() async {
    try {
      Directory directory = await getTemporaryDirectory();
      //删除缓存目录
      await deleteDirectory(directory);
    } catch(e) {
    }
    //debugPrint("删除缓存目录 ==> ....");
    return Future.value(true);
  }

  /// 递归方式删除目录
  static Future<void> deleteDirectory(FileSystemEntity file) async {
    try {
      if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        for (final FileSystemEntity child in children) {
          await deleteDirectory(child);
        }
      }
      //debugPrint("删除缓存目录 ==> " + file.path);
      await file.delete();
    } catch(e) {
    }
  }


  void onItemClick(String action) {
    switch (action) {
      case '账号与安全':
        Get.to(() => const SettingAccountPage());
        break;
      case '消息提醒':
        Get.to(() => const SettingNotifyPage());
        break;
      case '隐私':
        Get.to(() => const SettingPrivacyPage());
        break;
      case '青少年模式':
        Get.dialog(const YoungDialog());
        break;
      case '清理缓存':
        Get.alertSub(
          _doClean,
          alert: '确定$action',
          callback: () => showToast('清理成功'),
        );
        break;
      case '用户协议':
        configCtrl.onTapLink(action, 'user_protocol');
        break;
      case '隐私政策':
        configCtrl.onTapLink(action, 'privacy_policy');
        break;
      case '隐私政策摘要':
        configCtrl.onTapLink(action, 'privacy_policy_summary');
        break;
      case '个人信息收集清单':
        configCtrl.onTapLink(action, 'personal_information_collection_list');
        break;
      case '第三方信息共享清单':
        configCtrl.onTapLink(action, 'third_party_information_share_list');
        break;
      case '申请注销':
        Get.to(() => const FreezeAccountPage());
        break;
      case '关于':
        Get.to(() => const SettingVersionPage());
        break;
      case '备案号':
        Get.to(() => WebPage(title: "ICP/IP地址/域名信息备案管理", uri: Uri.parse("https://beian.miit.gov.cn")));
        break;
      case '退出登录':
        Get.alertSub(
          alert: '确定$action',
          Get.find<OAuthCtrl>().doLogout,
        );
        break;
    }
  }
}
