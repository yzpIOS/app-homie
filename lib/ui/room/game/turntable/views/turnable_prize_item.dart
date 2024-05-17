
import 'package:app/model/activity_lottery_model.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class TurnablePrizeItem extends StatelessWidget {
  ActivityLotteryModel activityLotteryModel;

  TurnablePrizeItem({super.key, required this.activityLotteryModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color:const Color(0xFFFFBDEE),
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
              activityLotteryModel.prizeImage ?? "",
              width: 33,
              height: 33,
            ),
          ),

          Positioned(
            left: 2.0,
            top: 2.0,
            child: Container(
              alignment: Alignment.center,
              padding:const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color:const Color(0xFFFFD9F2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "x${activityLotteryModel.count ?? 0}",
                style:const TextStyle(
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
              activityLotteryModel.prizeName ?? "",
              textAlign: TextAlign.center,
              style:const TextStyle(
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