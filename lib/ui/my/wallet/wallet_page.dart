import 'package:app/common/theme.dart';
import 'package:app/store/wallet_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/ui/my/wallet/exchange_page.dart';
import 'package:app/ui/my/wallet/gold_diamond_details_page.dart';
import 'package:app/ui/my/wallet/money_card.dart';
import 'package:app/ui/my/wallet/purple_diamond_details_page.dart';
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
  static double bgHeight = AppSize.width / 375 * 374;//头部背景图高度

  @override
  void initState() {
    super.initState();

    Get.find<WalletCtrl>().doRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '我的钱包', bgColor: AppPalette.appBarForegroundColorDark.withAlpha(0)),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: bgHeight,
            child: $BgView(),
          ),
          Positioned.fill(
            top: AppSize.appBar + AppSize.safeTop,
            child: Column(
              children: [
                Box(
                  padding: const Pad(horizontal: 10, top: 28, bottom: 20),
                  child: Column(
                    children: [
                      MoneyCard(
                        type: MoneyType.diamond,
                        tips: '用于直播间内礼物打赏',
                        action: '充值',
                        detail: "紫钻明细",
                        onItemClick: onItemClick,
                      ),
                      Spacing.h10,
                      MoneyCard(
                        type: MoneyType.gold,
                        tips: '用于购买服装或道具等',
                        action: '兑换',
                        detail: "黄钻明细",
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
          ),
        ],
      ),
    );
  }

  Widget $BgView() {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(IMG.format('gradient_head_bgimage')),
          scale: 3,
          fit: BoxFit.cover,
        ),
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
                style: const TextStyle(fontSize: 24, color: AppPalette.txtDark, fontWeight: fw$SemiBold),
              );
            },
          ),
          XRichText(
            TextSpan(
              children: [
                TextSpan(
                  text: type.label,
                  style: const TextStyle(fontSize: 12, color: AppPalette.txtDark),
                ),
                const TextSpan(text: ' | ',),
                TextSpan(text: tips),
              ],
            ),
            style: const TextStyle(fontSize: 12, color: AppPalette.colorA9),
          ),
        ],
      );

      child = Row(
        children: [
          MoneyIcon(type: type, size: 51,),
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
            padding: Pad(bottom: 10 + AppSize.safeBottom),
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
        Get.to(() => RechargePage());
        break;
      case '兑换':
        Get.to(() => const ExchangePage());
        break;
      case '我的收益':
        Get.to(() => const RevenuePage());
        break;
      case '紫钻明细':
        Get.to(() => const PurpleDiamondDetailsPage());
        break;
      case '黄钻明细':
        Get.to(() => const GoldDiamondDetailsPage());
        break;
    }
  }
}
