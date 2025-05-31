import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/store/wallet_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/ui/my/wallet/recharge_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class ActBuySheet extends ISheetWidget {
  final RxInt balanceRx;

  ActBuySheet(this.balanceRx, {super.key});

  @override
  late final Widget title = const Text('锤子获得');
  @override
  late final Tuple2<Widget, VoidCallback>? leading = null;
  @override
  late final Tuple2<Widget, VoidCallback>? trailing = closeBtn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Pad(top: 16, bottom: AppSize.safeBottom),
      child: XFutureBuilder<dynamic>(
        Api.Lottery.list(),
        onData: (it) {
          final data = it['items'][0];
          final price = data['price'];

          return Column(
            children: [
              Expanded(child: $GiftView(data)),
              $BuyBtn(
                price,
                (it) => _doBuy(data['product_id'], price: price, count: it),
              ),
              $BalanceView(),
            ],
          );
        },
      ),
    );
  }

  Widget $GiftView(Map data) {
    Widget itemBuilder({required String tips, required String name, required String image, required int count}) {
      Widget child = Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -6,
            left: -6,
            right: -6,
            bottom: -6,
            child: Image.asset(IMG.format('activity/锤子背景'), scale: 3, fit: BoxFit.contain),
          ),
          Positioned(
            bottom: 9,
            child: NetImage(image, width: 88, height: 88),
          ),
          Positioned(
            top: 8,
            right: 8,
            width: 26,
            height: 26,
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Color(0xFFEADEFE), shape: BoxShape.circle),
              child: Center(
                child: Text(
                  tips,
                  style: const TextStyle(fontSize: 14, color: Color(0xFFBC7BE7), fontWeight: fw$Medium),
                ),
              ),
            ),
          ),
        ],
      );

      child = FittedBox(
        child: Box(width: 124, height: 124, child: child),
      );

      child = Column(
        children: [
          const Spacing(flex: 13),
          Expanded(flex: 124, child: child),
          Expanded(
            flex: 45,
            child: Center(
              child: Text(
                '$name*$count',
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
        ],
      );

      child = DecoratedBox(
        decoration: const ShapeDecoration(color: Color(0xFFF5F5F5), shape: AppShape.a6),
        child: child,
      );

      return child;
    }

    return Padding(
      padding: const Pad(horizontal: 26, bottom: 30),
      child: GiftImgState(
        child: LayoutBuilder(
          builder: (_, c) {
            final delegate = SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisExtent: c.maxHeight,
            );

            return GridView(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: delegate,
              children: [
                itemBuilder(
                  name: data['product_name'],
                  image: data['product_image'],
                  tips: '买',
                  count: 1,
                ),
                itemBuilder(
                  name: data['name'],
                  image: data['image'],
                  tips: '赠',
                  count: data['medium_count'],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget $BalanceView() {
    Widget child = WalletCtrl.use(
      builder: (data) {
        const type = MoneyType.diamond;

        return XRichText(
          TextSpan(
            children: [
              TextSpan(text: '我的${type.label}余额：${data[type] ?? '--'}'),
              const WidgetSpan(
                child: MoneyIcon(type: type, size: 20),
                alignment: PlaceholderAlignment.middle,
              ),
            ],
          ),
          style: const TextStyle(fontSize: 10, color: Colors.black),
        );
      },
    );

    child = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: child),
        Spacing.w4,
        const Text(
          '充值',
          style: TextStyle(fontSize: 12, color: Color(0xFFFF6161), fontWeight: fw$SemiBold),
        ),
        const SizedBox(
          width: 12,
          height: 12,
          child: RightArrowIcon(color: Color(0xFFFF6161)),
        ),
      ],
    );

    child = Box(
      height: 28,
      alignment: Alignment.center,
      child: child,
    );

    child = OpacityButton(
      child: child,
      onTap: () => Get.to(() => RechargePage(hasShowUnityView: true,)),
    );

    return child;
  }

  Widget $BuyBtn(num price, ValueChanged<int> doBuy) {
    Widget child = XRichText(
      TextSpan(
        children: [
          const TextSpan(
            text: '购买',
            style: TextStyle(fontSize: 14, fontWeight: fw$SemiBold),
          ),
          const WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Padding(
              padding: Pad(left: 5),
              child: MoneyIcon(type: MoneyType.diamond, size: 20),
            ),
          ),
          TextSpan(text: '$price'),
        ],
        style: const TextStyle(fontSize: 12, color: Colors.white),
      ),
    );

    const decor = ShapeDecoration(
      shape: XStadiumBorder(),
      gradient: LinearGradient(
        colors: [Color(0xFFFFD064), Color(0xFFFFA779)],
      ),
    );

    child = Container(
      height: 32,
      decoration: decor,
      alignment: Alignment.center,
      child: child,
    );

    child = OpacityButton(
      onTap: () => doBuy(1),
      onLongPress: () {
        const items = [10, 50, 100, 500, 1000];

        Get.showSheet(items, toTitle: (it) => Tuple2('买$it个', null)).onNotNull(doBuy);
      },
      child: child,
    );

    child = FractionallySizedBox(
      widthFactor: 220 / 375,
      child: child,
    );

    return child;
  }

  void _doBuy(int id, {required num price, required int count}) {
    simpleSub(
      Api.Lottery.buy(id: id, count: count),
      callback: () {
        balanceRx.value += count;

        MoneyChangeEvent({MoneyType.diamond: -(count * price)}).fire();
      },
    );
  }
}
