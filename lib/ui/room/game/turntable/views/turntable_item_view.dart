
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class TurntableItemView extends StatelessWidget {

  Map data;

  // 背景
  String background;

  bool showNumber;

  TurntableItemView(this.data, {super.key, this.background = "turntable_pic_jlk", this.showNumber = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(IMG.format("room/game/${background}"))
        )
      ),
      child: bodyView(),
    );
  }

  Widget bodyView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 礼物图像
        createGiftImage(),
        // 礼物名字
        createGiftName(),
        // 礼物价格
        createGiftPrize(),
        SizedBox(height: 1,),
      ],
    );
  }

  Widget createGiftImage() {
    return SizedBox(
      width: double.infinity,
      height: 31,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Image.network(
              data["image"] ?? "",
              width: 33,
              height: 33,
            ),
          ),

          if(showNumber)
            Positioned(
              right: 2,
              top: 3.0,
              child: Container(
                height: 15,
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 5.0, right: 5.5),
                decoration: BoxDecoration(
                    color: Color(0xFFFFD9F2),
                    borderRadius: BorderRadius.circular(100)
                ),
                child: Text(
                  "x10",
                  style: TextStyle(
                      fontSize: 10,
                      color: Color(0xffFF3291),
                      fontWeight: FontWeight.normal
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget createGiftName() {
    return Text(
      data["prize_name"] ?? "",
      style: TextStyle(
        color: Colors.white,
        fontSize: 10,
        shadows: [
          BoxShadow(
            offset: Offset(1, 1),
            blurRadius: 2,
            color: Color(0xFF75003F).withAlpha(60),
          )
        ]
      ),
    );
  }

  Widget createGiftPrize() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data["price"].toString(),
          style: TextStyle(
            fontSize: 10,
            color: Colors.white,
            fontWeight: FontWeight.normal
          ),
        ),
        MoneyIcon(type: data["currency"] == 0 ? MoneyType.diamond : MoneyType.gold, size: 13,),
      ],
    );
  }
}