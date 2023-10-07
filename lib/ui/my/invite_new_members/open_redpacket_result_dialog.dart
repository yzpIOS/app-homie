import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class OpenRedPacketResultDialog extends StatelessWidget {
  final int type;
  final int num;

  const OpenRedPacketResultDialog._({
    required this.type,
    required this.num,
  });

  static Future<void> show() async {
    await Get.dialog(
      const OpenRedPacketResultDialog._(type: 1, num: 888),
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
        Positioned(top: 81, child: Image.asset(IMG.format('my/invite_new_members_zizuan'), width: 113, height: 86, scale: 3,),),
        const Positioned(top: 81 + 86 + 20, child: XText('888紫钻', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$Regular),),),
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

  void onItemClick(String action) {
    switch (action) {
      case '再来一次':

        break;
      case '收下了':
        Get.back();
        break;
    }
  }
}
