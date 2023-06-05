import 'package:app/common/theme.dart';
import 'package:app/shop/cart_sheet.dart';
import 'package:app/store/shopping_cart_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class CartMiniView extends GetView<ShoppingCartCtrl> {
  const CartMiniView({super.key});

  static const height = 58.0;

  @override
  Widget build(BuildContext context) {
    Widget child = Obx(() {
      final group = controller.autoGet().groupListsBy((it) => it['currency']);

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          XText(
            '${controller.count()}件商品，共',
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
          Spacing.w10,
          Column(
            children: group.entries.map((it) {
              final type = MoneyType.fromVal(it.key);
              final total = it.value.map<num>((it) => it['price'] * it['count']).sum;

              return XRichText(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '$total',
                      style: const TextStyle(fontSize: 18, color: Color(0xFFFE4848), fontWeight: fw$SemiBold),
                    ),
                    if (type != null)
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: MoneyIcon(type: type, size: 24),
                      ),
                  ],
                ),
              );
            }).toList(growable: false),
          ),
        ],
      );
    });

    child = SizedBox(
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 20,
            child: Image.asset(IMG.$('购物车'), width: 40, height: 40, scale: 3, fit: BoxFit.contain),
          ),
          Positioned(
            left: 77,
            right: 80,
            child: child,
          ),
          Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            width: 80,
            child: $BuyView(),
          ),
        ],
      ),
    );

    child = OpacityButton(onTap: CartSheet.show, child: child);

    child = Material(
      elevation: 6,
      color: Colors.white,
      shape: const XStadiumBorder(),
      clipBehavior: Clip.antiAlias,
      shadowColor: const Color(0x7F000000),
      child: child,
    );

    return child;
  }

  Widget $BuyView() {
    Widget child = const Box(
      color: AppPalette.primary,
      alignment: Alignment.center,
      child: XText(
        '去购买',
        style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$Medium),
      ),
    );

    child = OpacityButton(
      onTap: _doBuy,
      child: child,
    );

    return child;
  }

  void _doBuy() {
    Get.simpleDialog(msg: '立即结算${controller.count()}件物品') //
        .onResult(okCall: controller.doBuy);
  }
}
