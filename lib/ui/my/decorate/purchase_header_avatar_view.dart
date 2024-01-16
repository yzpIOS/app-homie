
import 'package:app/common/theme.dart';
import 'package:app/model/enum/money_type.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'purchase_header_base.dart';

///
/// 头像框
///
class PurchaseHeaderAvatarView extends  PurchaseHeaderBase {

  const PurchaseHeaderAvatarView({super.key});

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
      padding: EdgeInsets.symmetric(vertical: 33),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFCBCBFB),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10)
        ),
      ),
      child: NetImage("", width: 114, height: 114,),
    );
  }

  @override
  double viewHeight() {
    return 181;
  }

}
