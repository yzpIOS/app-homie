import 'dart:convert';

import 'package:alipay_kit/alipay_kit.dart';
import 'package:app/3rd/tencent/wx.dart';
import 'package:app/exception.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/tools/statistic.dart';
import 'package:app/ui/common/web_page.dart';
import 'package:app/widgets.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PayPage extends StatefulWidget {
  final int payType;
  final Map data;

  const PayPage({super.key, required this.payType, required this.data});

  @override
  State<PayPage> createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  late final data = widget.data;


  @override
  void initState() {
    super.initState();


    doPay();
  }

  void doPay() {
    final safePop = context.safePop;

    final args = data['pay_params'];
    final type = data['pay_platform']; //1：app, 2：h5

    if (args != null && type != null) {
      switch (type) {
        case 1:
          switch (widget.payType) {
            case 1:
              doPayByAliKit(args);
              return;
            case 2:
              doPayByWx(args);
              return;
          }

          return;
        case 2:
          doPayByWeb(data['url']);
          return;
      }
    }

    post(() => Get.alertDialog('数据错误').whenComplete(safePop));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '支付'),
      body: Delayed(
        delay: const Duration(seconds: 2),
        builder: (BuildContext context, bool initialized) {
          return initialized
              ? Align(
                  alignment: const FractionalOffset(0.5, 0.4),
                  child: FractionallySizedBox(
                    widthFactor: 0.4,
                    child: XTextBtn(
                      label: '已完成付款',
                      onTap: doConfirm,
                    ),
                  ),
                )
              : Spacing.blank;
        },
      ),
    );
  }

  void doConfirm() {
    simpleSub(
      Api.Wallet.info(id: data['record_number']),
      callback1: (resp) {
        // 支付状态， 0：待支付， 1：支付成功， 2：支付失败， 3：审核中
        switch (resp?['pay_status']) {
          case 1:
            Get.back(result: true);
            break;
          default:
            Get.alertDialog('支付暂未完成').whenComplete(Get.back);
            break;
        }
      },
    );
  }

  Future<void> doPayByWeb(String url) async {
    Get.to(
      () => WebPage(title: '支付', uri: Uri.parse(url)),
    );
  }

  Future<void> doPayByWx(Map data) async {
    try {
      await Wx.doPay(data);

      _onSuccessful();
    } on CanceledException catch (_) {
      _onCancelled();
    } on LogicException catch (e) {
      showToast(e.msg);

      if (e.code == -999) Get.back(result: false);
    } catch (e, s) {
      errLog(e, s);

      showToast('服务异常');
    }
  }

  Future<void> doPayByAliKit(Map data) async {
    final ali = AlipayKitPlatform.instance;

    if (await ali.isInstalled()) {
      late final StreamSubscription sub;

      sub = ali.payResp().listen((event) {
        xlog(event);

        sub.cancel();

        _onAlipayResp(event);
      });

      try {
        await ali.pay(orderInfo: data['data']);
      } catch (e, s) {
        errLog(e, s);

        showToast('服务异常');
      }
    } else {
      doPayByWeb(data['url']);
    }
  }

  void _onAlipayResp(AlipayResp event) {
    switch (event.resultStatus) {
      // case 4000:
      //   doPayByWeb(data['url']);
      //   break;
      case 6001:
        _onCancelled();
        break;
      case 9000:
        _onSuccessful();
        break;
      default:
        String? subMsg() {
          final json = event.result;

          if (json != null && json.isNotEmpty) {
            try {
              final data = jsonDecode(json);

              if (data is Map) {
                final resp = data['alipay_trade_app_pay_response'];

                if (resp is Map && resp['sub_msg'] is String) {
                  return resp['sub_msg'];
                }
              }
            } catch (e, s) {
              errLog(e, s);
            }
          }

          return null;
        }

        String? tips = event.memo;

        if (tips == null || tips.isEmpty) {
          tips = subMsg();

          if (tips == null || tips.isEmpty) {
            tips = '支付失败';
          }
        }

        showToast(tips);
    }
  }

  void _onSuccessful() {
    showToast('支付成功');

    Get.back(result: true);
  }

  void _onCancelled() {
    showToast('支付取消');

    Get.back(result: false);

    Statistic.cancelPay(
        widget.payType, orderId: widget.data["record_number_string"] ?? "");
  }


}
