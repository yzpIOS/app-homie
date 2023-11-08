import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class VersionUpdatingDialog extends StatelessWidget {
  final Map versionData;

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
      const Positioned(
        top: 139,
        child: Text(
          '发现新版本！(1.9.0)',
          style: TextStyle(fontSize: 21, color: Colors.black, fontWeight: fw$Bold),
        ),
      ),
      const Positioned(
        top: 173,
        left: 41,
        right: 41,
        bottom: 100,
        child: SingleChildScrollView(
          child: Text(
            '1.修复已知的发热问题\n2.修复加载卡99%的问题',
            style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$Medium),
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
        toAppMarket();
        break;
      case '下次再说':
        Get.back();
        break;
    }
  }
}
