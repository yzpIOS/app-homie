
import 'package:app/common/theme.dart';
import 'package:app/model/enum/money_type.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'Purchase_base_view.dart';

///
/// 购买界面
///
class PurchaseDecorateView extends  PurchaseBaseView {

  PurchaseDecorateView({super.key});

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

          // 购买数量
          SizedBox(height: 19,),
          buyTypeTitle(),

          // 购买的套餐列表
          SizedBox(height: 15,),
          buyOptions(),

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
      children: [
        // 商品名称
        Text(
          "聊天气泡",
          style: TextStyle(
              fontSize: 16,
              color: AppPalette.txtDark,
              fontWeight: FontWeight.w700
          ),
        ),
        Expanded(child: SizedBox()),

        // 价格图标
        MoneyIcon(type: MoneyType.gold, size: 23),

        // 价格显示
        SizedBox(width: 5,),
        Text(
          "900",
          style: TextStyle(
              fontSize: 18,
              color: Color(0xFFED8757),
              fontWeight: FontWeight.w700
          ),
        ),
      ],
    );
  }

  ///
  /// 购买数量标题
  ///
  Widget buyTypeTitle() {
    return Text(
      "选择购买时长",
      style: TextStyle(
          fontSize: 13,
          color: AppPalette.txtDark,
          fontWeight: FontWeight.w700
      ),
    );
  }

  var curSelectedIndex = 0;

  ///
  /// 购买选项
  ///
  Widget buyOptions() {
    return GridView.builder(
        itemCount: 3,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 19,
          childAspectRatio: 101.0 / 42.5,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: curSelectedIndex == index ? Color(0xFFEBEBFF) : Color(0xFFF3F3F3),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              "4天",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: curSelectedIndex == index ? Color(0xFFBD7BE5) : Color(0xFF313131),
              ),
            ),
          );
        }
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
      "聊天气泡",
      style: TextStyle(
          fontSize: 12,
          color: Color(0xFF7A7A7A),
          fontWeight: FontWeight.w700
      ),
    );
  }

  Widget createSubmit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 金额
        Container(
          height: 27,
          decoration: BoxDecoration(
            color: Color(0xFFEBEBFF),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 6,),
              MoneyIcon(type: MoneyType.gold, size: 23),
              SizedBox(width: 5,),
              Text(
                "100011",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppPalette.txtDark,
                ),
              ),
              SizedBox(width: 11,),
            ],
          ),
        ),

        Expanded(child: SizedBox()),

        // 立即购买
        Container(
          width: 130,
          height: 42,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppPalette.primary,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            "立即购买",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppPalette.txtWhite,
            ),
          ),
        )
      ],
    );
  }
}
