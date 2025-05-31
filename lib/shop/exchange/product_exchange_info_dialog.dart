
import 'package:app/common/theme.dart';
import 'package:app/model/dress_up_product_model.dart';
import 'package:app/shop/exchange/product_exchange_info_controller.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

/// 商品兑换信息弹窗
class ProductExchangeInfoDialog extends StatelessWidget {
  final DressUpProductModel productModel;
  const ProductExchangeInfoDialog({super.key,
    required this.productModel,
  });

  final double exchangeInfoDialogBackgroundWidth = 284;
  final double exchangeInfoDialogBackgroundHeight = 303;
  final double exchangeInfoDialogCloseButtonHeight = 26.5;
  final double exchangeInfoDialogCloseButtonWidth = 26.5;
  final double exchangeInfoDialogCloseButtonBottomMargin = 12;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductExchangeInfoCtrl>(
        init: ProductExchangeInfoCtrl(productModel: productModel),
        builder: (ProductExchangeInfoCtrl controller) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Positioned(
                  width: exchangeInfoDialogBackgroundWidth,
                  height: exchangeInfoDialogBackgroundHeight,
                  left: (Get.width -
                      exchangeInfoDialogBackgroundWidth) /
                      2.0,
                  top: (Get.height -
                      exchangeInfoDialogBackgroundHeight) /
                      2.0,
                  child: Container(
                    width: exchangeInfoDialogBackgroundWidth,
                    height: exchangeInfoDialogBackgroundHeight,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          IMG.format(
                              "room/game/product_exchange_dialog_background"),
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacing.h36,
                        Text(
                          "${productModel.name}",
                          style:const TextStyle(
                              color: AppPalette.c0,
                              fontSize: 15,
                          ),
                        ),
                        Spacing.h12,
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:const Color(0xFFEBEBFF)
                          ),
                          child: NetImage(
                            productModel.image ?? "",
                            width: 72,
                            height: 72,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Spacing.h16,
                        XRichText(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: '${productModel.redemptionList!.first.name}:',
                                  style: const TextStyle(
                                    color: AppPalette.c0,
                                    fontSize: 15,
                                  )),
                              TextSpan(
                                  text:
                                  '${productModel.redemptionList!.first.haveRedemptionCardCount}/${productModel.redemptionList!.first.redemptionNeedCount}',
                                  style: const TextStyle(
                                    color: Color(0xFFF400E6),
                                    fontSize: 15,
                                  )),
                            ],
                          ),
                        ),
                        Spacing.h22,
                        Text(
                          "是否花费${productModel.redemptionList!.first.redemptionNeedCount}${productModel.redemptionList!.first.name}兑换${productModel.name}，一经兑换不得撤销",
                          style:const TextStyle(
                            color: AppPalette.c9,
                            fontSize: 11,
                          ),
                        ),
                        Spacing.h22,
                        Row(children: [
                          Spacing.w16,
                          _createCancelButton(controller),
                          const Spacing(),
                          _createAgreeButton(controller),
                          Spacing.w16,
                        ],),
                        const Spacing(),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: (Get.width - exchangeInfoDialogBackgroundWidth) /
                      2.0 + (exchangeInfoDialogBackgroundWidth - exchangeInfoDialogCloseButtonWidth),
                  top: (Get.height -
                      exchangeInfoDialogBackgroundHeight) /
                      2.0 -
                      exchangeInfoDialogCloseButtonBottomMargin - exchangeInfoDialogCloseButtonHeight,
                  width: exchangeInfoDialogCloseButtonWidth,
                  height: exchangeInfoDialogCloseButtonHeight,
                  child: GestureDetector(
                    onTap: (){
                      controller.clickClose();
                    },
                    child: Image.asset(
                      IMG.format(
                          'room/game/product_exchange_dialog_close'),
                      width: exchangeInfoDialogCloseButtonWidth,
                      height: exchangeInfoDialogCloseButtonHeight,
                    ),
                  ), // _SimpleWnRecord(widget.items),
                ),
              ],
            ),
          );
        });
  }

  Widget _createCancelButton(ProductExchangeInfoCtrl controller) {
    return GestureDetector(
      onTap: () {
        controller.clickClose();
      },
      child: Container(
        width: 117,
        height: 30,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF7F95F7),
                  Color(0xFF9ABCFF),
                ]
            ),
            borderRadius: AppBorderRadius.max,
            boxShadow: [
              BoxShadow(
                color: Color(0xFF7F95F7),
                offset: Offset(0.0, 3.0),
                spreadRadius: 0,
                blurRadius: 5,
              )
            ]
        ),
        child:const Text(
            "取消",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }


  Widget _createAgreeButton(ProductExchangeInfoCtrl controller) {
    return GestureDetector(
      onTap: () {
        controller.clickConfirm();
      },
      child: Container(
        width: 117,
        height: 30,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFFF7A665),
                  Color(0xFFFFC893),
                ]
            ),
            borderRadius: AppBorderRadius.max,
            boxShadow: [
              BoxShadow(
                color: Color(0xFFFFC394),
                offset: Offset(0.0, 3.0),
                spreadRadius: 0,
                blurRadius: 5,
              )
            ]
        ),
        child:const Text(
          "确认",
          style:  TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}