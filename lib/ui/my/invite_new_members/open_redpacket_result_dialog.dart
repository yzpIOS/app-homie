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
          top: 165,
          child: Obx(() {
            return NetImage(giftImageName.value, width: 126, height: 126);
          }),
        ),
        Positioned(
          top: 309,
          child: Obx(() {
            return XText(giftName.value, style: TextStyle(fontSize: 24, color: Color(0xFFFF0000), fontWeight: FontWeight.w900),);
          })
        ),

        Positioned(
          top: 439,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  onItemClick('再来一次');
                },
                child: Expanded(
                  child: Container(
                    width: 158,
                    height: 50,
                    padding: EdgeInsets.only(bottom: 7),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(IMG.format('my/invite_button_1'))
                        )
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "再来一次",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),

              SizedBox(width: 5,),

              GestureDetector(
                onTap: () {
                  onItemClick('收下了');
                },
                child: Expanded(
                  child: Container(
                    width: 158,
                    height: 50,
                    padding: EdgeInsets.only(bottom: 7),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(IMG.format('my/invite_button_1'))
                        )
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "收下了",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
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
