import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class OpenRedPacketResultDialog extends StatelessWidget {
  RxString giftName;
  RxString giftImageName;

  OpenRedPacketResultDialog._({
    required this.giftName,
    required this.giftImageName,
  });

  static Future<void> show(String giftName, String giftImageName) async {
    return await Get.dialog(
      OpenRedPacketResultDialog._(giftName: RxString(giftName), giftImageName: RxString(giftImageName),),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned(
          child: Image.asset(IMG.format('my/pop_gongxihuode_result'), scale: 3),
        ),
        Positioned(
          top: 81,
          child: Obx(() {
            return NetImage(giftImageName.value, width: 113, height: 86);
          }),
        ),
        Positioned(
          top: 81 + 86 + 20,
          child: Obx(() {
            return XText(giftName.value, style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$Regular),);
          })
        ),
        Positioned(
          bottom: 36,
          child: XTextBtn(
            label: '收下了',
            width: 140,
            height: 34,
            color: const Color(0xFFFE4A27),
            textStyle: const TextStyle(fontSize: 16, color: Colors.white),
            onTap: () => onItemClick('收下了'),
          )
        ),
        Positioned(
            bottom: 36 + 48,
            child: XTextBtn(
              label: '再来一次',
              width: 140,
              height: 34,
              color: const Color(0xFFFE4A27),
              textStyle: const TextStyle(fontSize: 16, color: Colors.white),
              onTap: () => onItemClick('再来一次'),
            )
        ),
      ],
    );

    child = Box(
      width: 375,
      child: child,
    );

    child = FittedBox(fit: BoxFit.fitWidth, child: child);

    return Material(
      type: MaterialType.transparency,
      textStyle: const TextStyle(fontSize: 12, color: AppPalette.c9, fontWeight: fw$Medium),
      child: child,
    );
  }

  void onItemClick(String action) async {
    switch (action) {
      case '再来一次':
        var result = await Api.Activity.openEnvelope();
        var name = result["name"];
        var image = result["image"];
        if(name == null || image == null) {
          return;
        }
        giftName.value = name;
        giftImageName.value = image;
        break;
      case '收下了':
        Get.back();
        break;
    }
  }
}
