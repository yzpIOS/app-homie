import 'package:app/common/theme.dart';
import 'package:app/store/wallet_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/ui/my/wallet/exchange_page.dart';
import 'package:app/ui/my/wallet/money_card.dart';
import 'package:app/ui/my/wallet/recharge_page.dart';
import 'package:app/ui/my/wallet/revenue_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  void initState() {
    super.initState();

    Get.find<WalletCtrl>().doRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD89BFE),
      appBar: xAppBar(title: '我的钱包', bgColor: Colors.transparent),
      body: Column(
        children: [
          Box(
            padding: const Pad(horizontal: 10, top: 28, bottom: 20),
            child: Column(
              children: [
                MoneyCard(
                  type: MoneyType.diamond,
                  tips: '用于直播间内礼物打赏',
                  action: '充值',
                  onItemClick: onItemClick,
                ),
                Spacing.h10,
                MoneyCard(
                  type: MoneyType.gold,
                  tips: '用于购买服装、道具等',
                  action: '兑换',
                  onItemClick: onItemClick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Material(
              borderRadius: AppBorderRadius.t12,
              color: Colors.white,
              child: $MoreView(),
            ),
          ),
        ],
      ),
    );
  }

  Widget $MoreView() {
    Widget $TitleView() {
      return const Box(
        width: double.infinity,
        padding: Pad(all: 20),
        child: XText(
          '我的收益',
          style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$SemiBold),
        ),
      );
    }

    Widget itemBuilder(MoneyType type, String tips) {
      Widget child = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WalletCtrl.use(
            builder: (it) {
              return XText(
                '${it[type] ?? '--'}',
                style: const TextStyle(fontSize: 22, color: Colors.black, fontWeight: fw$SemiBold),
              );
            },
          ),
          XText(
            '${type.label} | $tips',
            style: const TextStyle(fontSize: 12, color: AppPalette.c9),
          ),
        ],
      );

      child = Row(
        children: [
          MoneyIcon(type: type, size: 60, variant: 1),
          Expanded(child: child),
          const RightArrowIcon(),
        ].separator(Spacing.w10).toList(growable: false),
      );

      child = Box(
        padding: const Pad(horizontal: 20),
        child: child,
      );

      child = InkWell(
        onTap: () => onItemClick('我的收益'),
        child: child,
      );

      return child;
    }

    return Column(
      children: [
        $TitleView(),
        Expanded(
          child: ListView(
            itemExtent: 50 + 2 * 2,
            children: [
              itemBuilder(MoneyType.homie, '用于直播间内结算'),
            ],
          ),
        ),
      ],
    );
  }

  void onItemClick(String action) {
    switch (action) {
      case '充值':
        Get.to(() => const RechargePage());
        break;
      case '兑换':
        Get.to(() => const ExchangePage());
        break;
      case '我的收益':
        Get.to(() => const RevenuePage());
        break;
    }
  }
}
