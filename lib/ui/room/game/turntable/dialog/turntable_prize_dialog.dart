
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
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            // 恭喜
            Image.asset(IMG.format("room/game/turntable_pic_gx")),

            // 价格
            createPrize(),

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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(IMG.format("room/game/turntable_icon_shine")),
        )
      ),
      child: Stack(
        children: [
          Image.asset(widget.items[index]["prize_image"]),

          // 数量
          Container(
            decoration: BoxDecoration(
              color: Color(0xffFFD9F2),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              widget.items[index]["count"],
              style: TextStyle(
                color: Color(0xffFF3291),
                fontWeight: FontWeight.w600,
                fontSize: 12
              ),
            ),
          ),


          // 名字
          Container(
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
    return Container(
      width: 378,
      height: 386,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(IMG.format("room/game/turntable_icon_shine")),
          )
      ),
      child: Text(
        widget.items[index]["prize_name"],
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12
        ),
      ),
    );
  }
}