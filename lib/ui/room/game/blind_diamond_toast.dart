
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import '../../../common/nets/commons/proto/Message.pb.dart';

void showDiamondToast(S_BlindBox? event) {
  if(event == null) {
    return;
  }

  int count = 0;
  event.items.forEach((element) {
    count += (element.count * element.price.toInt());
  });

  showToastWidget(
    Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      decoration: BoxDecoration(
        color: Color(0xFF656565),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "恭喜你获得",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.normal
              )
            ),

            TextSpan(
              text: "$count",
              style: TextStyle(
                color: Color(0xFFFFDD79),
                fontSize: 12,
                fontWeight: FontWeight.normal
              )
            ),

            TextSpan(
              text: "紫钻",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.normal
              )
            ),
          ]
        )
      ),
    )
  );
}