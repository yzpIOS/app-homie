
import 'package:app/common/theme.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'purchase_header_base.dart';

///
/// 聊天气泡框
///
class PurchaseHeaderBackgroundView extends  PurchaseHeaderBase {

  PurchaseHeaderBackgroundView({super.key});

  @override
  Widget build(BuildContext context) {
    return createPurchaseView();
  }

  ///
  /// 购物view
  ///
  Widget createPurchaseView() {
    return Container(
      height: viewHeight(),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10)
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF191628),
            Color(0xFF262337),
            Color(0xFF38305F),
          ]
        )
      ),
      child: NetImage("", width: 188, height: 324,),
    );
  }

  @override
  double viewHeight() {
    return 358;
  }
}
