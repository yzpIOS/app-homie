
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class TurntableItemView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 66,
          height: 66,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(IMG.format("room/game/turntable_pic_jlk"))
            )
          ),
          child: bodyView(),
        )
      ],
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
      ],
    );
  }

  Widget createGiftImage() {
    return SizedBox(
      width: double.infinity,
      height: 33,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 6,
            child: Image.network(
              width: 33,
              height: 33,
              "http://images.homieyy.com/image/3f7f7f9d-5f79-49b2-85bf-b21f8fbf9122",
            ),
          ),
          Positioned(
            right: 2,
            top: 3.5,
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
      "荷塘恋情",
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
      children: [
        Text(
          "10",
          style: TextStyle(
            fontSize: 10,
            color: Colors.white,
            fontWeight: FontWeight.normal
          ),
        ),
        MoneyIcon(type: MoneyType.diamond, size: 13,),
      ],
    );
  }
}