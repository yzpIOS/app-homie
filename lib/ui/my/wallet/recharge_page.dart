import 'dart:io';

import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/model/enum/money_type.dart';
import 'package:app/net/api.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/my/wallet/apple_purchase.dart';
import 'package:app/ui/my/wallet/money_card.dart';
import 'package:app/ui/my/wallet/pay_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RechargePage extends StatefulWidget {

  // 进入充值入口的页面是否显示了unity
  bool hasShowUnityView;

  RechargePage({super.key, this.hasShowUnityView = false});

  @override
  State<RechargePage> createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage> {
  final selectRx = Rxn<Map>();
  final payTypeRx = RxnInt();

  final type = MoneyType.diamond;

  late final api = Api.Wallet.rechargeCombo();

  ApplePurchase applePurchase = ApplePurchase();

  static final _format = NumberFormat('0.##').format;

  @override
  void initState() {
    super.initState();

    if(widget.hasShowUnityView) {
      UnityCtrl.ins.sendCmd(App2UnityEnum.FTU_TEST,
          data: {UnityCtrl.UNITY_STOP_EVENT:UnityCtrl.UNITY_STOP_EVENT});
    }

    _init();
  }

  void _init() async {
    final safePop = context.safePop;

    try {
      final val = await api;

      final items = val['items'];
      final types = val['pay_type_items'];

      if (items is List && items.isNotEmpty && types is List && types.isNotEmpty) {
        payTypeRx(types.first['pay_type']);

        return;
      }
    } catch (e, s) {
      errLog(e, s);

      Get.alertDialog('数据错误').whenComplete(safePop);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD89BFE),
      appBar: xAppBar(title: '充值', bgColor: Colors.transparent),
      body: Column(
        children: [
          Box(
            padding: const Pad(horizontal: 10, top: 28, bottom: 20),
            child: MoneyCard(
              type: type,
              tips: '用于直播间内礼物打赏',
            ),
          ),
          Expanded(
            child: Material(
              borderRadius: AppBorderRadius.t12,
              color: Colors.white,
              child: XFutureBuilder<dynamic>(
                api,
                onData: (data) => $BodyView(data['items'], data['pay_type_items']),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget $BodyView(List items, List types) {
    return Box(
      width: double.infinity,
      padding: const Pad(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacing.h20,
          $ComboView(items),
          Spacing.h20,
          // 只有android才显示支付方式
          if(Platform.isAndroid)
            $PayTypeView(types),
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
    return XTextBtn(
      label: '立即充值',
      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$Medium),
      onTap: doSub,
    );
  }

  Widget $InfoView() {
    return DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 12, color: AppPalette.c9),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          XText('充值说明'),
          XText('1、使用苹果系统充值可参考充值流程说明'),
          XText('2、切勿轻信刷单、低价充值等类似的言论，谨防上当受骗'),
        ],
      ),
    );
  }

  Widget $ComboView(List data) {
    Widget itemBuilder(item) {
      final child = Column(
        children: [
          const Expanded(flex: 12, child: Spacing.blank),
          SvgView(
            SVG.$('cz/${type.label}'),
            width: 34,
            height: 34,
          ),
          XRichText(
            style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: fw$Medium),
            TextSpan(
              text: '${item['diamond_amount']}',
              children: [
                const TextSpan(text: ' '),
                TextSpan(
                  text: type.label,
                  style: const TextStyle(fontSize: 12, fontWeight: fw$Regular),
                ),
              ],
            ),
          ),
          const Expanded(flex: 3, child: Spacing.blank),
          XText(
            '¥${_format(item['pay_amount'] / 100)}',
            style: const TextStyle(fontSize: 12, color: AppPalette.c9, fontWeight: fw$Medium),
          ),
          const Expanded(flex: 13, child: Spacing.blank),
        ],
      );

      return Obx(
        () {
          final b = selectRx() == item;

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
              onTap: () => selectRx(item),
            ),
          );
        },
      );
    }

    return GridLayout(
      childAspectRatio: 112 / 104,
      crossAxisCount: 3,
      mainAxisSpacing: 20,
      crossAxisSpacing: 10,
      children: data.map(itemBuilder).toList(growable: false),
    );
  }

  Widget $PayTypeView(List data) {
    Widget itemBuilder(item) {
      final type = item['pay_type'];

      Widget child = Row(
        children: [
          NetImage(item['cover'], width: 24, height: 24),
          Spacing.w10,
          Expanded(
            child: XText(
              item['name'],
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          IgnorePointer(
            child: Obx(() => XRadio(value: payTypeRx() == type, size: 20)),
          ),
        ],
      );

      child = Box(
        height: AppSize.btnLarge,
        padding: const Pad(horizontal: 10),
        child: child,
      );

      child = InkWell(
        onTap: () => payTypeRx(type),
        child: child,
      );

      return child;
    }

    return Column(
      children: data.map(itemBuilder).toList(growable: false),
    );
  }

  void doSub() {
    final data = selectRx();

    if (data == null) {
      showToast('请选择充值套餐');
      return;
    }

    //1：支付宝，2：微信，4: 苹果内购
    int? payType = payTypeRx.value;
    // 苹果支付不传支付渠道，所以强制写死4
    if(Platform.isIOS) {
      payType = 4;
    }

    if(payType == null) {
      showToast('请选择支付方式');
      return;
    }

    simpleSub(
      Api.Wallet.recharge(id: data['id'], payType: payType!),
      callback1: (resp) async {
        bool payResult;
        if(payType == 4) {
          payResult = await applePurchase.appPurchase(resp['pay_params']) ?? false;
        } else {
          payResult = await Get.to(() => PayPage(payType: payType!, data: resp));
        }

        if (payResult) {
          Get.back(result: true);

          MoneyChangeEvent({type: data['diamond_amount']}).fire();
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    applePurchase.dispose();
    if(widget.hasShowUnityView) {
      UnityCtrl.ins.sendCmd(App2UnityEnum.FTU_TEST,
          data: {UnityCtrl.UNITY_RESUME_EVENT:UnityCtrl.UNITY_RESUME_EVENT});
    }
  }
}
