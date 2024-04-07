
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class TurnablePrizeItem extends StatelessWidget {

  Map data;

  TurnablePrizeItem(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFFFBDEE),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [

          Positioned(
            left: 13.6,
            right: 5,
            top: 7.5,
            bottom: 20,
            child: NetImage(
              data["prize_image"] ?? "",
              width: 33,
              height: 33,
            ),
          ),

          Positioned(
            left: 2.0,
            top: 2.0,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: Color(0xFFFFD9F2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "x${data["count"] ?? 0}",
                style: TextStyle(
                    color: Color(0xFFFF3291),
                    fontSize: 10,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),

          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Text(
              data["prize_name"] ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12
              ),
            ),
          )
        ],
      ),
    );
  }

}