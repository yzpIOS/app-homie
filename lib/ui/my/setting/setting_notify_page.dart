import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/store/user/setting_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SettingNotifyPage extends StatefulWidget {
  const SettingNotifyPage({super.key});

  @override
  State<SettingNotifyPage> createState() => _SettingNotifyPageState();
}

class _SettingNotifyPageState extends State<SettingNotifyPage> with BusStateMixin {
  final _divider = const Divider(height: 10, thickness: 10, color: AppPalette.background2);

  late final settingRx = Get.find<SettingCtrl>().dataRx;

  @override
  void initState() {
    super.initState();

    on<AppLifecycleEvent>(
      test: (event) => event.state == AppLifecycleState.resumed,
      (_) {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.background2,
      appBar: xAppBar(title: '消息提醒'),
      body: SingleChildScrollView(
        padding: Pad(top: 10, bottom: AppSize.safeBottom),
        child: XFutureBuilder<bool>(
          Permission.notification.isGranted,
          onData: $DataView,
        ),
      ),
    );
  }

  Widget $DataView(bool isGranted) {
    final items1 = [
      '接收新消息通知',
    ];

    final items2 = [
      (label: '声音', key: '消息通知-声音', orElse: true),
      (label: '震动', key: '消息通知-震动', orElse: true),
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
                tips: isGranted ? '已开启' : '已关闭',
                onTap: () => onItemClick(item),
              ),
          ],
        ),
        const TableGroupX(
          child: Box(
            height: 42,
            padding: Pad(horizontal: 10, vertical: 4),
            child: Text(
              '如果要关闭新消息通知，请在手机的“设置”-“通知中心”里，找到“HOMIE"进行 更改',
              style: TextStyle(fontSize: 10, color: AppPalette.c6),
            ),
          ),
        ),
        if (isGranted)
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
      case '接收新消息通知':
        openAppSettings();
        break;
    }
  }
}
