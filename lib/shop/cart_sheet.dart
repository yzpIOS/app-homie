import 'package:app/common/theme.dart';
import 'package:app/store/shopping_cart_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class CartSheet extends StatefulWidget {
  const CartSheet._();

  static void show() {
    const shape = XRectangleBorder(
      borderRadius: AppBorderRadius.t10,
    );

    Get.showBottomSheet(const CartSheet._(), shape: shape, isScrollControlled: false);
  }

  @override
  State<CartSheet> createState() => _CartSheetState();
}

class _CartSheetState extends State<CartSheet> {
  final ctrl = Get.find<ShoppingCartCtrl>();

  @override
  void initState() {
    super.initState();

    ctrl.doRefresh();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = SimpleRxListView(
      ctrl.autoGet,
      padding: const Pad(horizontal: 10),
      divider: const Divider(),
      itemBuilder: itemBuilder,
    );

    return DefaultTextStyle(
      style: const TextStyle(fontSize: 14, color: Colors.black),
      child: Column(
        children: [
          $TitleView(),
          Expanded(child: child),
          Obx(() {
            return ctrl.dataRx.isEmpty
                ? Spacing.blank
                : Padding(
                    padding: const Pad(horizontal: 10, vertical: 10),
                    child: XTextBtn(
                      label: '立即购买',
                      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$SemiBold),
                      onTap: () => ctrl.doBuy(callback: Get.back),
                    ),
                  );
          }),
        ],
      ),
    );
  }

  Widget itemBuilder(_, Map data, __) {
    const double size = 70;

    final productId = data['product_id'];
    final type = MoneyType.fromVal(data['currency']);

    final numView = NumberSettingView(
      key: ValueKey(productId),
      initValue: data['count'],
      size: 24,
      btnBG: const Color(0xFFF5F5F5),
      textColor: Colors.black,
      doChange: (val, b) {
        if (b) {
          if (val < 1) {
            final api = ctrl.doDel(productId);

            simpleSub(api);

            return api;
          } else {
            return Future.value(false);
          }
        } else {
          return ctrl.doUpdate(productId, val);
        }
      },
    );

    Widget child = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        XText(
          data['name'],
          style: const TextStyle(fontWeight: fw$Regular),
        ),
        Spacing.h4,
        Row(
          children: [
            if (type != null) MoneyIcon(type: type, size: 24),
            XText(
              '${data['price']}',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ],
    );

    child = Row(
      children: [
        NetImage(data['image'], width: size, height: size),
        Spacing.w10,
        Expanded(child: child),
        Spacing.w10,
        numView,
      ],
    );

    return Box(height: 90, child: child);
  }

  Widget $TitleView() {
    Widget child = Obx(
      () {
        return Row(
          children: [
            const XText(
              '购物车',
              style: TextStyle(fontSize: 16, fontWeight: fw$Medium),
            ),
            XText(
              '（共${ctrl.count()}件商品）',
              style: const TextStyle(fontSize: 12, color: AppPalette.c9),
            ),
            Spacing.exp,
            if (ctrl.autoGet.isNotEmpty)
              OpacityButton(
                onTap: ctrl.doClean,
                child: const XRichText(
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.delete_outline_rounded, size: 16, color: AppPalette.c6),
                        alignment: PlaceholderAlignment.middle,
                      ),
                      TextSpan(text: '清空'),
                    ],
                  ),
                  style: TextStyle(fontSize: 12, color: AppPalette.c6),
                ),
              ),
          ],
        );
      },
    );

    return Box(
      height: 42,
      padding: const Pad(horizontal: 10),
      child: child,
    );
  }
}
