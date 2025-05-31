import 'dart:convert';
import 'dart:io';

import 'package:alipay_kit/alipay_kit.dart';
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
import 'package:app/ui/my/wallet/recharge_confirm_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pay_plugin/pay_plugin.dart';

class RechargePage extends StatefulWidget {
  // 进入充值入口的页面是否显示了unity
  bool hasShowUnityView;

  RechargePage({super.key, this.hasShowUnityView = false});

  @override
  State<RechargePage> createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage> with WidgetsBindingObserver {
  final selectRx = Rxn<Map>();
  final payTypeRx = RxnInt();

  final type = MoneyType.diamond;

  late final api = Api.Wallet.rechargeCombo();
  late final RxBool pactRx = RxBool(false); //是否选中充值及购买协议
  int _currentPayOrderId = 0;
  bool _needConfirmPay = true;

  ApplePurchase applePurchase = ApplePurchase();

  static final _format = NumberFormat('0.##').format;
  static double bgHeight = AppSize.width / 375 * 374; //头部背景图高度

  @override
  void initState() {
    super.initState();
    PayPage.needSendFailStatistic = true;
    WidgetsBinding.instance.addObserver(this); //添加观察者
    _init();
  }

  void _init() async {
    final safePop = context.safePop;

    try {
      final val = await api;

      final items = val['items'];
      final types = val['pay_type_items'];

      if (items is List &&
          items.isNotEmpty &&
          types is List &&
          types.isNotEmpty) {
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
      appBar: xAppBar(
          title: '充值',
          bgColor: AppPalette.appBarForegroundColorDark.withAlpha(0)),
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
                // Padding(
                //   padding: const Pad(horizontal: 8,),
                //   child: OpacityButton(
                //     child: const Row(
                //       mainAxisAlignment: MainAxisAlignment.end,
                //       children: [
                //         XText('紫钻明细', style: TextStyle(fontSize: 12, color: Color(0xFFFF0000), fontWeight: fw$Regular),),
                //         RightArrowIcon(color: Color(0xFFFF0000),),
                //       ],
                //     ),
                //     onTap: () => Get.to(const PurpleDiamondDetailsPage()),
                //   ),
                // ),
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
                      onData: (data) =>
                          $BodyView(data['items'], data['pay_type_items']),
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
          Spacing.exp,
          Padding(
            padding:
                Pad(horizontal: 40, top: 10, bottom: 40 + AppSize.safeBottom),
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
      textStyle: const TextStyle(
          fontSize: 18, color: Colors.white, fontWeight: fw$Medium),
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
                child: Image.asset(
                    IMG.format(pactRx.value ? 'shop/协议选中' : 'shop/协议未选中'),
                    width: 13,
                    height: 13,
                    scale: 3,
                    fit: BoxFit.contain),
                onTap: () {
                  pactRx.toggle();
                },
              );
            }),
            Spacing.w4,
            StyledText(
              text: '我已阅读并同意<c>《<a1>充值及购买协议</a1>》</c>',
              tags: {
                'c': StyledTextTag(
                    style: const TextStyle(color: AppPalette.primary)),
                'a1': StyledTextActionTag(
                    (val, __) => ctrl.onTapLink(val!, 'recharge_agreement')),
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
            style: const TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: fw$Medium),
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
            style: const TextStyle(
                fontSize: 12,
                color: AppPalette.colorA9,
                fontWeight: fw$Regular),
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

    //1：支付宝，2：微信，4: 苹果内购  5 杉德宝支付
    int? payType = payTypeRx.value;

    if (Platform.isIOS) {
      // 苹果支付不传支付渠道，只允许使用苹果内购,所以强制写死4
      payType = 4;
    } else {
      // 安卓使用杉德宝
      payType = 5;
    }

    if (pactRx.value == false) {
      showToast('请先阅读并同意《充值及购买协议》');
      return;
    }

    // if(!(await OAuthCtrl.checkValid())) {
    //   return Future.value();
    // }

    if (payType != null) {
      Statistic.userCharge(payType);
    }

    simpleSub(
      Api.Wallet.recharge(id: data['id'], payType: payType!),
      callback1: (resp) async {
        bool payResult;
        _currentPayOrderId = resp['record_number'] ?? 0;
        if (payType != null) {
          Statistic.risePay(payType, orderId: '$_currentPayOrderId');
        }

        if (payType == 4) {
          _needConfirmPay = false;
          payResult =
              await applePurchase.appPurchase(resp['pay_params']) ?? false;
          _reportPayEvent(isSuccess: payResult);
        } else {
          _needConfirmPay = true;
          await PayPlugin()
              .startSandPay(cashierUrl: resp['pay_params']['sand_pay_url']);
          // final Map resultMap = await PayPlugin()
          //     .startSandPay(cashierUrl: resp['pay_params']['sand_pay_url']);
          // payResult = await Get.to(() => RechargeConfirmPage(recordNumber: resp['record_number']));
          // _reportPayEvent(isSuccess: payResult,errorMsg: resultMap['errMsg'] ?? '支付失败');
        }
      },
    );
  }

  /// 支付结果上报
  void _reportPayEvent({required bool isSuccess}) async {
    final data = selectRx();
    if (data == null) {
      showToast('请选择充值套餐');
      return;
    }

    //1：支付宝，2：微信，4: 苹果内购  5 杉德宝支付
    int? payType = payTypeRx.value;
    if (Platform.isIOS) {
      // 苹果支付不传支付渠道，只允许使用苹果内购,所以强制写死4
      payType = 4;
    } else {
      // 安卓使用杉德宝
      payType = 5;
    }
    if (isSuccess) {
      showToast('支付成功');
      // 统计支付成功
      OpenInstallUtils.ins.reportPaySuccessEvent(data['pay_amount']);
      // 完成充值订单上报
      await Api.Wallet.rechargeRecordReportFinish(idList: [data['id']]);
      Get.back(result: true);
      MoneyChangeEvent({type: data['diamond_amount']}).fire();

      if (payType != null) {
        Statistic.paySuccess(payType, orderId: '$_currentPayOrderId');
      }
    } else {
      showToast('支付失败');
      if (payType != null && PayPage.needSendFailStatistic) {
        Statistic.payFail(payType, orderId: '$_currentPayOrderId');
      }
    }
  }

  void checkOrder() async {
    final bool payResult = await Get.to(() => RechargeConfirmPage(recordNumber: _currentPayOrderId));
    _reportPayEvent(isSuccess: payResult);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
      //应用程序处于闲置状态并且没有收到用户的输入事件。
      //注意这个状态，在切换到后台时候会触发，所以流程应该是先冻结窗口，然后停止UI
        //print('didChangeAppLifecycleState----->AppLifecycleState.inactive');
        break;
      case AppLifecycleState.paused:
      //应用程序处于不可见状态
        //print('didChangeAppLifecycleState----->AppLifecycleState.paused');
        break;
      case AppLifecycleState.resumed:
      //进入应用时候不会触发该状态
      //应用程序处于可见状态，并且可以响应用户的输入事件。它相当于 Android 中Activity的onResume。
        //print('didChangeAppLifecycleState----->AppLifecycleState.resumed');
        if(_needConfirmPay == true){
          _needConfirmPay = false;
          checkOrder();
        }
        break;
      case AppLifecycleState.detached:
      //当前页面即将退出
        //print('didChangeAppLifecycleState----->AppLifecycleState.detached');
        break;
      default:
        break;
    }
  }

  @override
  void dispose() {
    super.dispose();
    applePurchase.dispose();
    PayPage.needSendFailStatistic = true;
    WidgetsBinding.instance.removeObserver(this); //添加观察者
  }
}
