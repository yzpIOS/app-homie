
import 'package:app/common/theme.dart';
import 'package:app/model/enum/money_type.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'Purchase_base_view.dart';

class PurchaseDecorateView extends StatefulWidget {

  Map data;

  PurchaseDecorateView({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => PurchaseDecorateState();
}

///
/// 购买界面
///
class PurchaseDecorateState extends  State<PurchaseDecorateView> {

  late List skuList;

  PurchaseDecorateState();

  @override
  void initState() {
    super.initState();
    skuList = (widget.data["sku_list"] as List?) ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return createPurchaseView();
  }

  ///
  /// 购物view
  ///
  Widget createPurchaseView() {
    int colum = (skuList.length % 3 > 0 ? skuList.length / 3 + 1 : skuList.length / 3).toInt();
    return Container(
      width: double.infinity,
      height: (222 + 58 * colum).toDouble(),
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 商品名称，价格
          const SizedBox(height: 23,),
          _createTitle(widget.data, skuList.isNotEmpty),

          // 购买数量
          if(skuList.isNotEmpty)
            const SizedBox(height: 19,),
          if(skuList.isNotEmpty)
            buyTypeTitle(),

          // 购买的套餐列表
          if(skuList.isNotEmpty)
            const SizedBox(height: 15,),
          if(skuList.isNotEmpty)
            buyOptions(skuList),

          // 商品描述标题
          const SizedBox(height: 12,),
          createDesTitle(),

          // 商品描述
          const SizedBox(height: 5,),
          createDes(),

          Expanded(child: SizedBox()),

          if(skuList.isNotEmpty)
            createSubmit(),

          SizedBox(height: 10,)
        ],
      ),
    );
  }

  Widget _createTitle(Map data, bool canBuy) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 商品名称
        Text(
          data["name"] ?? "",
          style: TextStyle(
              fontSize: 16,
              color: AppPalette.txtDark,
              fontWeight: FontWeight.w700
          ),
        ),
        Expanded(child: SizedBox()),

        // 价格图标
        if(canBuy)
          MoneyIcon(type: MoneyType.diamond, size: 23),

        // 价格显示
        if(canBuy)
          SizedBox(width: 5,),
        if(canBuy)
          Text(
            "${skuList[curSelectedIndex]["price"]}",
            style: TextStyle(
                fontSize: 18,
                color: AppPalette.txtDark,
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
  Widget buyOptions(List skuList) {
    return GridView.builder(
        itemCount: skuList.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 19,
          childAspectRatio: 101.0 / 42.5,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              curSelectedIndex = index;
              setState(() { });
            },
            behavior: HitTestBehavior.opaque,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: curSelectedIndex == index ? Color(0xFFEBEBFF) : Color(0xFFF3F3F3),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                "${skuList[index]["effective_time_txt"]}",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: curSelectedIndex == index ? Color(0xFFBD7BE5) : Color(0xFF313131),
                ),
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
      widget.data["name"] ?? "",
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
              MoneyIcon(type: MoneyType.diamond, size: 23),
              SizedBox(width: 5,),
              Text(
                "${skuList[curSelectedIndex]["price"]}",
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
        GestureDetector(
          onTap: () async {
            var list = await Api.DressUp.buyGoods(skuList[curSelectedIndex]["id"]);
            if(list == null || (list?.length ?? 0) <= 0) {
              showToast("购买失败");
              return;
            }
            showToast("购买成功");
            Get.back();
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
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
          ),
        )
      ],
    );
  }
}
