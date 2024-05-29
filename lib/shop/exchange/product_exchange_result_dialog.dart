import 'package:app/common/theme.dart';
import 'package:app/shop/exchange/product_exchange_result_controller.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

/// 商品兑换结果弹窗
class ProductExchangeResultDialog extends StatelessWidget {
  final bool isExchangeSuccess;

  const ProductExchangeResultDialog(
      {super.key, required this.isExchangeSuccess});

  final double productExchangeResultDialogBackgroundWidth = 293;
  final double productExchangeResultDialogBackgroundHeight = 35;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductExchangeResultController>(
        init: ProductExchangeResultController(
            isExchangeSuccess: isExchangeSuccess),
        builder: (ProductExchangeResultController controller) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                width: productExchangeResultDialogBackgroundWidth,
                height: productExchangeResultDialogBackgroundHeight,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFAFDFE),
                      Color(0xFFEBF5FD),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  children: [
                    Spacing.w8,
                    Text(
                      isExchangeSuccess
                          ? '兑换成功，请进入把背包查看或使用'
                          : '兑换卡数不足，请去抽奖获得兑换卡',
                      style:
                          const TextStyle(color: AppPalette.c0, fontSize: 12),
                    ),
                    const Spacing(),
                    GestureDetector(
                      onTap: () {
                        controller.clickButton();
                      },
                      child: Container(
                        width: 78,
                        height: 33,
                        // padding: const Pad(top: 3),
                        // margin: const Pad(top: 3),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              IMG.format(
                                  "room/game/product_exchange_dialog_button"),
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: Text(isExchangeSuccess
                            ? '进入背包'
                            : '去抽奖',
                          style:
                          const TextStyle(color: Colors.white, fontSize: 12),),
                      ),
                    ),
                    Spacing.w8,
                  ],
                ),
              ),
            ),
          );
        });
  }
}
