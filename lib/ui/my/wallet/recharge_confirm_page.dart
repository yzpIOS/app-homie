
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

class RechargeConfirmPage extends StatefulWidget {
  final int recordNumber;
  const RechargeConfirmPage({super.key, required this.recordNumber});

  @override
  State<RechargeConfirmPage> createState() => _RechargeConfirmPageState();
}

class _RechargeConfirmPageState extends State<RechargeConfirmPage> {
  late final recordNum = widget.recordNumber;

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
      Api.Wallet.info(id: recordNum),
      callback1: (resp) {
        // 支付状态， 0：待支付， 1：支付成功， 2：支付失败， 3：审核中
        switch (resp?['pay_status']) {
          case 1:
            Get.back(result: true);
            break;
          case 2:
            Get.back(result: false);
            break;
          default:
            showToast('支付暂未完成');
            break;
        }
      },
    );
  }
}