
import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'Purchase_base_view.dart';

///
/// 活动获得界面
///
class PurchaseActivityView extends  PurchaseBaseView {

  final Map data;

  PurchaseActivityView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return createPurchaseView();
  }

  ///
  /// 购物view
  ///
  Widget createPurchaseView() {
    return Container(
      height: 280,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 商品名称，价格
          SizedBox(height: 23,),
          _createTitle(),

          // 商品描述标题
          SizedBox(height: 12,),
          createDesTitle(),

          // 商品描述
          SizedBox(height: 5,),
          createDes(),

          Expanded(child: SizedBox()),
          createSubmit(),

          SizedBox(height: 32,),
        ],
      ),
    );
  }

  Widget _createTitle() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 商品名称
        Expanded(
          child: Text(
            data["name"] ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                color: AppPalette.txtDark,
                fontWeight: FontWeight.w700
            ),
          ),
        ),
      ],
    );
  }


  Widget createDesTitle() {
    return Text(
      "商品描述",
      style: TextStyle(
          fontSize: 13,
          color: AppPalette.txtDark,
          fontWeight: FontWeight.w700
      ),
    );
  }

  Widget createDes() {
    return Text(
      data["name"] ?? "",
      style: TextStyle(
          fontSize: 12,
          color: Color(0xFF7A7A7A),
          fontWeight: FontWeight.w700
      ),
    );
  }

  Widget createSubmit() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: 173,
            height: 42,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppPalette.primary,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              "活动获得",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppPalette.txtWhite,
              ),
            ),
          ),
        )
      ],
    );
  }
}
