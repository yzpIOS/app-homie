import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class VersionUpdatingDialog extends StatelessWidget {
  final Map versionData;
  // "version": "1.2.2", 版本号
  // "update_url": "http://www.baidu.com", 更新地址
  // "update_content": "", 更新内容
  // "is_force_update": false 是否强制更新

  const VersionUpdatingDialog({super.key, required this.versionData});


  @override
  Widget build(BuildContext context) {
    Widget child = Stack(
      alignment: Alignment.center,
      children: $Body(),
    );

    child = DefaultTextStyle(
      style: const TextStyle(fontSize: 12, color: Colors.black),
      child: child,
    );

    child = Container(
      width: 300.5,
      height: 390.5,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(IMG.format('版本更新')), scale: 3),
      ),
      margin: const Pad(horizontal: 37),
      child: child,
    );

    child = FittedBox(
      fit: BoxFit.contain,
      // alignment: const FractionalOffset(0.5, (224 + 327 / 2) / 812),
      child: child,
    );

    return child;
  }

  List<Positioned> $Body() {
    return [
      Positioned(
        top: 139,
        child: Text(
          '发现新版本！(${versionData['version'] ?? ''})',
          style: const TextStyle(fontSize: 21, color: Colors.black, fontWeight: fw$Bold),
        ),
      ),
      Positioned(
        top: 173,
        left: 41,
        right: 41,
        bottom: 100,
        child: SingleChildScrollView(
          child: Text(
            versionData['update_content'] ?? '',
            style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$Medium),
          ),
        ),
      ),
      Positioned(
        bottom: 58,
        left: 41,
        right: 41,
        child: XTextBtn(
          height: 35,
          label: '立即升级',
          textStyle: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: fw$Medium),
          onTap: () => onItemClick('立即升级'),
        ),
      ),
      if (versionData['is_force_update'] == false) //是否强制更新
        Positioned(
          bottom: 7,
          child: TextButton(
            child: const Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$Medium),
                children: [
                  TextSpan(text: '下次再说',),
                  WidgetSpan(child: RightArrowIcon(color: Colors.black,), alignment: PlaceholderAlignment.middle),
                ],
              ),
            ),
            onPressed: () => onItemClick('下次再说'),
          ),
        ),
    ];
  }

  void onItemClick(String action) {
    switch (action) {
      case '立即升级':
        toAppMarket(versionData['update_url']);
        break;
      case '下次再说':
        Get.back();
        break;
    }
  }
}
