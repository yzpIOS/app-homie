
import 'package:app/tools.dart';
import 'package:app/tools/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TurntablePrizeDialog extends StatefulWidget {

  List items;

  TurntablePrizeDialog(this.items, {super.key});

  static Future<void> showDialog(List items) async {
    var dialog = TurntablePrizeDialog(items);
    await Get.dialog(
      dialog,
      useSafeArea: false,
      routeSettings: dialog.toRouteSettings(),
    );
  }

  @override
  State<StatefulWidget> createState() => _TurntablePrizeDialogState();
}

class _TurntablePrizeDialogState extends State<TurntablePrizeDialog> {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // 价格
            createPrize(),
            // 恭喜
            Image.asset(IMG.format("room/game/turntable_pic_gx")),

            createBottomButton(),
          ],
        ),
      ),
    );
  }

  Widget createPrize() {
    return Container(
      width: 378,
      height: 386,
      child: Stack(
        alignment: Alignment.center,
        children: [

          Image.asset(IMG.format("room/game/turntable_icon_shine")),

          Positioned(
            top: (386 - 165) / 2,
            left: 0,
            right: 0,
            child: Image.network(widget.items[index]["prize_image"], width: 165, height: 165,),
          ),

          // 数量
          Positioned(
            top: (386 - 165) / 2 + 30,
            left: (378 - 165) / 2 + 120,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              decoration: BoxDecoration(
                color: Color(0xffFFD9F2),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                "x${widget.items[index]["count"].toString()}",
                style: TextStyle(
                    color: Color(0xffFF3291),
                    fontWeight: FontWeight.w600,
                    fontSize: 12
                ),
              ),
            ),
          ),


          // 名字
          Container(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
            margin: EdgeInsets.only(top: 150),
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(60),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              widget.items[index]["prize_name"],
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 12
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget createBottomButton() {
    return GestureDetector(
      onTap: () {
        if(index >= widget.items.length - 1) {
          Get.back();
          return;
        }
        index += 1;
        setState(() { });
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: 169,
        height: 54,
        padding: EdgeInsets.only(top: 5),
        margin: EdgeInsets.only(top: 333),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(IMG.format("room/game/turntable_button_qd")),
            )
        ),
        child: Text(
          "确定",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 24
          ),
        ),
      ),
    );
  }
}