import 'package:app/common/theme.dart';
import 'package:app/store/user/setting_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/setting/setting_blacklist_page.dart';
import 'package:app/ui/my/setting/setting_permission_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class SettingPrivacyPage extends StatefulWidget {
  const SettingPrivacyPage({super.key});

  @override
  State<SettingPrivacyPage> createState() => _SettingPrivacyPageState();
}

class _SettingPrivacyPageState extends State<SettingPrivacyPage> {
  final _divider = const Divider(height: 10, thickness: 10, color: AppPalette.background2);

  late final settingRx = Get.find<SettingCtrl>().dataRx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.background2,
      appBar: xAppBar(title: '隐私'),
      body: SingleChildScrollView(
        padding: Pad(top: 10, bottom: AppSize.safeBottom),
        child: $DataView(),
      ),
    );
  }

  Widget $DataView() {
    final items1 = [
      '通讯录黑名单',
      '系统权限管理',
    ];

    final items2 = [
      (label: '不允许被推荐', key: '隐私-不允许被推荐', orElse: false),
      (label: '关闭个性化推荐', key: '隐私-关闭个性化推荐', orElse: false),
      (label: '隐藏位置信息', key: '隐私-隐藏位置信息', orElse: false),
      (label: '屏蔽陌生人信息', key: '隐私-屏蔽陌生人信息', orElse: false),
    ];

    return TableView(
      divider: Some(PreferredSize(preferredSize: const Size.fromHeight(10), child: _divider)),
      [
        TableGroup(
          itemColor: const Some(Colors.white),
          [
            for (final item in items1)
              TableItem(
                title: item,
                onTap: () => onItemClick(item),
              ),
          ],
        ),
        TableGroup(
          itemColor: const Some(Colors.white),
          [
            for (final item in items2)
              Obx(
                () {
                  final b = settingRx[item.key] ?? item.orElse;

                  return TableItem$Switch(
                    title: item.label,
                    isChecked: b,
                    onChanged: (val) => settingRx[item.key] = val,
                  );
                },
              ),
          ],
        ),
      ],
    );
  }

  void onItemClick(String action) {
    switch (action) {
      case '通讯录黑名单':
        Get.to(() => const SettingBlackListPage());
        break;
      case '系统权限管理':
        Get.to(() => const SettingPermissionPage());
        break;
    }
  }
}
