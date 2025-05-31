import 'package:app/common/theme.dart';
import 'package:app/store/config_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class SettingVersionPage extends StatefulWidget {
  const SettingVersionPage({super.key});

  @override
  State<SettingVersionPage> createState() => _SettingVersionPageState();
}

class _SettingVersionPageState extends State<SettingVersionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '版本信息'),
      body: GetX<ConfigCtrl>(
        initState: (state) => state.controller?.doRefresh(),
        builder: (ctrl) => $BodyView(ctrl.dataRx()),
      ),
    );
  }

  Widget $BodyView(Map data) {
    final items = {
      '商务合作': data['information_cooperate'] ?? '',
      '官方网址': data['official_url'] ?? '',
      '版本号': 'V${appInfo.version}',
    };

    Widget itemBuilder(MapEntry item) {
      return Box(
        height: 82,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            XText(item.key),
            Flexible(
              child: XText(
                item.value,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      );
    }

    return Box(
      padding: const Pad(horizontal: 30),
      alignment: const FractionalOffset(0.5, 0.2),
      child: DefaultTextStyle.merge(
        style: const TextStyle(fontSize: 16, color: AppPalette.c9, fontWeight: fw$Medium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: items.entries //
              .map(itemBuilder)
              .separator(const Divider())
              .toList(growable: false),
        ),
      ),
    );
  }
}
