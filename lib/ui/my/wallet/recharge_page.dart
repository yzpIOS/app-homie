import 'dart:io';

import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/model/enum/money_type.dart';
import 'package:app/net/api.dart';
import 'package:app/store/config_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/tools/open_install_utils.dart';
import 'package:app/tools/statistic.dart';
import 'package:app/types.dart';
import 'package:app/ui/my/wallet/apple_purchase.dart';
import 'package:app/ui/my/wallet/money_card.dart';
import 'package:app/ui/my/wallet/pay_page.dart';
import 'package:app/ui/my/wallet/purple_diamond_details_page.dart';
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
  late final RxBool pactRx = RxBool(true);//是否选中充值及购买协议

  ApplePurchase applePurchase = ApplePurchase();

  static final _format = NumberFormat('0.##').format;
  static double bgHeight = AppSize.width / 375 * 374;//头部背景图高度

  @override
  void initState() {
    super.initState();
    PayPage.needSendFailStatistic = true;

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
      appBar: xAppBar(title: '充值', bgColor: AppPalette.appBarForegroundColorDark.withAlpha(0)),
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
                Padding(
                  padding: const Pad(horizontal: 8,),
                  child: OpacityButton(
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        XText('紫钻明细', style: TextStyle(fontSize: 12, color: Color(0xFFFF0000), fontWeight: fw$Regular),),
                        RightArrowIcon(color: Color(0xFFFF0000),),
                      ],
                    ),
                    onTap: () => Get.to(const PurpleDiamondDetailsPage()),
                  ),
                ),
                Box(
                  padding: const Pad(horizontal: 10, top: 8, bottom: 20),
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
            padding: Pad(
                horizontal: 40, top: 10, bottom: 40 + AppSize.safeBottom),
            child: Column(
              children: [
                $PactTxt(),
                Spacing.h10,
                $Btn(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget $Btn() {
    return XTextBtn(
      label: '立即充值',
      textStyle: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: fw$Medium),
      onTap: doSub,
    );
  }

  Widget $PactTxt() {
    return GetBuilder<ConfigCtrl>(
      initState: (state) => state.controller?.doRefresh(),
      builder: (ctrl) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return OpacityButton(
                child: Image.asset(IMG.format(
                    pactRx.value ? 'shop/协议选中' : 'shop/协议未选中'),
                    width: 13, height: 13, scale: 3, fit: BoxFit.contain),
                onTap: () {
                  pactRx.toggle();
                },
              );
            }),
            Spacing.w4,
            StyledText(
              text: '我已阅读并同意<c>《<a1>充值及购买协议</a1>》</c>',
              tags: {
                'c': StyledTextTag(style: const TextStyle(color: AppPalette.primary)),
                'a1': StyledTextActionTag((val, __) => ctrl.onTapLink(val!, 'recharge_agreement')),
              },
              style: const TextStyle(fontSize: 12, color: AppPalette.c9),
            ),
          ],
        );
      },
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
            style: const TextStyle(fontSize: 12, color: AppPalette.colorA9, fontWeight: fw$Regular),
          ),
          const Expanded(flex: 13, child: Spacing.blank),
        ],
      );

      return Obx(
        () {
          final b = selectRx() == item;

          return Material(
            color: const Color(0xFFEBEBFF),
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

  void doSub() async {
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

    if (pactRx.value == false) {
      showToast('请先阅读并同意《充值及购买协议》');
      return;
    }

    if(!(await OAuthCtrl.checkValid())) {
      return Future.value();
    }

    if(payType != null) {
      Statistic.userCharge(payType);
    }

    simpleSub(
      Api.Wallet.recharge(id: data['id'], payType: payType!),
      callback1: (resp) async {
        bool payResult;

        if(payType != null) {
          Statistic.risePay(payType, orderId: resp["record_number_string"] ?? "");
        }

        if(payType == 4) {
          payResult = await applePurchase.appPurchase(resp['pay_params']) ?? false;
        } else {
          payResult = await Get.to(() => PayPage(payType: payType!, data: resp));
        }

        if (payResult) {
          // 统计支付成功
          OpenInstallUtils.ins.reportPaySuccessEvent(data['pay_amount']);
          // 完成充值订单上报
          await Api.Wallet.rechargeRecordReportFinish(idList: [data['id']]);
          Get.back(result: true);
          MoneyChangeEvent({type: data['diamond_amount']}).fire();

          if(payType != null) {
            Statistic.paySuccess(
                payType, orderId: resp["record_number_string"] ?? "");
          }
        } else {
          if(payType != null && PayPage.needSendFailStatistic) {
            Statistic.payFail(
                payType, orderId: resp["record_number_string"] ?? "");
          }
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    applePurchase.dispose();
    PayPage.needSendFailStatistic = true;
  }
}
