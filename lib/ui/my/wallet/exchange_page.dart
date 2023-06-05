import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/model/enum/money_type.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/my/wallet/money_card.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({super.key});

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  static const combo = [100, 500, 1000];

  final inputRx = Rx(false);
  final diamondRx = Rxn<int>(combo.first);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD89BFE),
      appBar: xAppBar(title: '兑换', bgColor: Colors.transparent),
      body: Column(
        children: [
          const Box(
            padding: Pad(horizontal: 10, top: 28, bottom: 20),
            child: MoneyCard(
              type: MoneyType.gold,
              tips: '用于购买服装、道具等',
            ),
          ),
          Expanded(
            child: Material(
              borderRadius: AppBorderRadius.t12,
              color: Colors.white,
              child: $BodyView(),
            ),
          ),
        ],
      ),
    );
  }

  Widget $BodyView() {
    return Box(
      padding: const Pad(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacing.h20,
          $ComboView(combo),
          Spacing.h32,
          const Text(
            '自定义兑换',
            style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$Medium),
          ),
          Spacing.h10,
          $InputView(),
          Spacing.exp,
          Padding(
            padding: Pad(horizontal: 40, top: 10, bottom: 40 + AppSize.safeBottom),
            child: $Btn(),
          ),
        ],
      ),
    );
  }

  Widget $Btn() {
    return Obx(
      () {
        final diamond = diamondRx();

        return XTextBtn(
          label: '兑换${diamond == null ? '' : '${diamond * 10}${MoneyType.gold.label}'}',
          textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$Medium),
          onTap: doSub,
        );
      },
    );
  }

  Widget $InputView() {
    return FormInputView(
      hint: '兑换数量',
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'\d+'))],
      onChanged: (it) {
        inputRx(true);

        try {
          diamondRx(int.parse(it));
        } catch (_) {
          diamondRx.nil();
        }
      },
    );
  }

  Widget $ComboView(List<int> data) {
    Widget itemBuilder(int item) {
      final child = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgView(
            SVG.$('cz/${MoneyType.diamond.label}'),
            width: 34,
            height: 34,
          ),
          XRichText(
            style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: fw$Medium),
            TextSpan(
              text: '$item',
              children: [
                const TextSpan(text: ' '),
                TextSpan(
                  text: MoneyType.diamond.label,
                  style: const TextStyle(fontSize: 12, fontWeight: fw$Regular),
                ),
              ],
            ),
          ),
        ],
      );

      return Obx(
        () {
          final b = inputRx.isFalse && diamondRx() == item;

          return Material(
            color: b ? const Color(0x4DDCD2FE) : const Color(0xFFF5F5F5),
            shape: XRectangleBorder(
              borderRadius: AppBorderRadius.a8,
              side: b //
                  ? const BorderSide(color: AppPalette.primary)
                  : BorderSide.none,
            ),
            child: InkWell(
              child: child,
              onTap: () {
                diamondRx(item);

                inputRx(false);
                controller.text = '';
              },
            ),
          );
        },
      );
    }

    return GridLayout(
      childAspectRatio: 112 / 91,
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: data.map(itemBuilder).toList(growable: false),
    );
  }

  void doSub() {
    final diamond = diamondRx();

    if (diamond != null) {
      final gold = diamond * 10;

      simpleSub(
        Api.Wallet.exchangeGold(diamond),
        msg: '兑换成功',
        callback: () {
          MoneyChangeEvent({MoneyType.diamond: -diamond, MoneyType.gold: gold}).fire();

          Get.back();
        },
      );
    }
  }
}
