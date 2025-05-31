import 'package:app/common/theme.dart';
import 'package:app/model/activity_lottery_model.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/ui/room/game/fruitMachine/fruit_machine_record_dialog_controller.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

/// 水果机记录弹窗
class FruitMachineRecordDialog extends StatelessWidget {
  final int modeId;

  const FruitMachineRecordDialog({required this.modeId, super.key});

  final double fruitMachineRecordDialogBodyWidth = 312;
  final double fruitMachineRecordDialogBodyHeight = 449;
  final double fruitMachineRecordDialogHeaderHeight = 35;
  final double fruitMachineRecordDialogHeaderWidth = 158.5;
  final double fruitMachineRecordDialogHeaderInset = 10;
  final double fruitMachineRecordDialogCloseButtonTopMargin = 20;
  final double fruitMachineRecordDialogCloseButtonWidth = 33;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FruitMachineRecordDialogController>(
        init: FruitMachineRecordDialogController(modeId: modeId),
        builder: (FruitMachineRecordDialogController controller) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Positioned(
                  width: fruitMachineRecordDialogBodyWidth,
                  height: fruitMachineRecordDialogBodyHeight,
                  left: (Get.width - fruitMachineRecordDialogBodyWidth) / 2.0,
                  top: (Get.height - fruitMachineRecordDialogBodyHeight) / 2.0,
                  child: Container(
                    width: fruitMachineRecordDialogBodyWidth,
                    height: fruitMachineRecordDialogBodyHeight,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(IMG.format(
                              "room/game/fruit_machine_record_dialog_body")),
                          fit: BoxFit.fill),
                    ),
                    child: Obx(() {
                      return controller.lotteryList.isNotEmpty ? bodyView(controller) : const SizedBox();
                    }),
                  ),
                ),
                Positioned(
                  width: fruitMachineRecordDialogHeaderWidth,
                  height: fruitMachineRecordDialogHeaderHeight,
                  left: (Get.width - fruitMachineRecordDialogHeaderWidth) / 2.0,
                  top: (Get.height - fruitMachineRecordDialogBodyHeight) / 2.0 -
                      fruitMachineRecordDialogHeaderInset,
                  child: Container(
                    width: fruitMachineRecordDialogHeaderWidth,
                    height: fruitMachineRecordDialogHeaderHeight,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            IMG.format(
                                "room/game/fruit_machine_record_dialog_header"),
                          ),
                          fit: BoxFit.fill),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      '中奖记录',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: fw$Medium),
                    ),
                  ),
                ),
                Positioned(
                  width: fruitMachineRecordDialogCloseButtonWidth,
                  height: fruitMachineRecordDialogCloseButtonWidth,
                  left: (Get.width - fruitMachineRecordDialogCloseButtonWidth) /
                      2.0,
                  top: (Get.height - fruitMachineRecordDialogBodyHeight) / 2.0 +
                      fruitMachineRecordDialogBodyHeight +
                      fruitMachineRecordDialogCloseButtonTopMargin,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Image.asset(
                      IMG.format("room/game/turntable_rule_close"),
                      width: fruitMachineRecordDialogCloseButtonWidth,
                      height: fruitMachineRecordDialogCloseButtonWidth,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  /// body
  Widget bodyView(FruitMachineRecordDialogController controller) {
    int totalMoney = 0;
    controller.lotteryList.forEach((element) {
      totalMoney += element.price ?? 0;
    });
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView(
              padding: const Pad(top: 44),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                mainAxisExtent: 100
              ),
              children: controller.lotteryList
                  .map(_itemBuilder)
                  .toList(growable: false),
            ),
          ),
          Text(
            "共${controller.lotteryList.length}礼物",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          // 奖品
          const SizedBox(
            height: 8,
          ),
          XRichText(
            TextSpan(
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Text(
                    '总价值$totalMoney',
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: fw$SemiBold),
                  ),
                ),
                const WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: MoneyIcon(type: MoneyType.diamond, size: 14),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 28,
          ),
        ],
      ),
    );
  }

  /// item
  Widget _itemBuilder(ActivityLotteryModel activityLotteryModel) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 61,
          height: 61,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF5149E4), width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Stack(children: [
            Positioned(
              width: 48,
              height: 48,
              left: (61 - 48) / 2.0,
              top: (61 - 48) / 2.0,
              child: NetImage(activityLotteryModel.image,
                  width: 48, height: 48, fit: BoxFit.contain),
            ),
            if (activityLotteryModel.count != null &&
                activityLotteryModel.count! > 1)
              Positioned(
                left: 1,
                top: 1,
                child: Container(
                  padding: const Pad(horizontal: 4, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFE8F2).withOpacity(0.3),
                    borderRadius: const BorderRadius.all(Radius.circular(3.0)),
                  ),
                  child: Text('x${activityLotteryModel.count}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: fw$Medium)),
                ),
              ),
          ]),
        ),
        const SizedBox(height: 4,),
        Text(
          activityLotteryModel.prizeName ?? '',
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
        XRichText(
          TextSpan(
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Text(
                  '${activityLotteryModel.price ?? 0}',
                  style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                  ),
                ),
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: MoneyIcon(
                  type: (activityLotteryModel.currency ?? 0) == 0 ? MoneyType
                      .diamond : MoneyType.gold, size: 11,),
              )
            ],
          ),
        ),
      ],
    );
  }
}
