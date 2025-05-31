import 'package:app/common/theme.dart';
import 'package:app/model/activity_lottery_model.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

/// 水果机开奖弹窗
class FruitMachineLotteryDrawingDialog extends StatelessWidget {
  List<ActivityLotteryModel> items;

  FruitMachineLotteryDrawingDialog({super.key, required this.items});

  final double fruitMachineLotteryDrawingDialogBackgroundWidth = 335;
  final double fruitMachineLotteryDrawingDialogBackgroundHeight = 383.5;
  final double fruitMachineLotteryDrawingDialogHeaderWidth = 291;
  final double fruitMachineLotteryDrawingDialogHeaderHeight = 103.5;
  final double fruitMachineLotteryDrawingDialogHeaderTopInset = 42.5;
  final double fruitMachineLotteryDrawingDialogConfirmButtonWidth = 169;
  final double fruitMachineLotteryDrawingDialogConfirmButtonHeight = 54.5;
  final double fruitMachineLotteryDrawingDialogConfirmButtonTopMargin = 14;
  final double fruitMachineLotteryDrawingDialogConfirmButtonBottomMargin = 4;

  @override
  Widget build(BuildContext context) {
    int totalAmount = 0;
    int totalMoney = 0;
    items.sort((a, b) {
      int value1 = (a.price ?? 0);
      int value2 = (b.price ?? 0);
      return value2 - value1;
    });
    items.forEach((element) {
      totalAmount += element.count ?? 0;
      totalMoney += (element.price ?? 0) * (element.count ?? 0);
    });
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            width: fruitMachineLotteryDrawingDialogBackgroundWidth,
            height: fruitMachineLotteryDrawingDialogBackgroundHeight,
            left: (Get.width -
                    fruitMachineLotteryDrawingDialogBackgroundWidth) /
                2.0,
            top: (Get.height -
                    fruitMachineLotteryDrawingDialogBackgroundHeight) /
                2.0,
            child: Container(
              width: fruitMachineLotteryDrawingDialogBackgroundWidth,
              height: fruitMachineLotteryDrawingDialogBackgroundHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    IMG.format(
                        "room/game/fruit_machine_lottery_drawing_dialog_background"),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 71,
                  ),
                  Expanded(
                    child: GridView(
                      padding: const Pad(
                        horizontal: 15,
                      ),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 6.5,
                        crossAxisSpacing: 6.5,
                      ),
                      children:
                          items.map(_itemBuilder).toList(growable: false),
                    ),
                  ),
                  Spacing.h6,
                  XRichText(TextSpan(children: [
                    const WidgetSpan(child: SizedBox(width: 15,)),
                    const TextSpan(
                      text: "共 ",
                      style: TextStyle(
                          color: Color(0xFFFF9D02),
                          fontWeight: FontWeight.normal,
                          fontSize: 14),
                    ),
                    TextSpan(
                      text: "$totalAmount",
                      style: const TextStyle(
                          color: Color(0xFFCB6100),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const TextSpan(
                      text: " 件礼物",
                      style: TextStyle(
                          color: Color(0xFFFF9D02),
                          fontWeight: FontWeight.normal,
                          fontSize: 14),
                    ),
                  ])),
                  Spacing.h6,
                  XRichText(
                    TextSpan(
                      children: [
                        const WidgetSpan(child: SizedBox(width: 15,)),
                        const TextSpan(
                          text: '总价值 ',
                          style: TextStyle(
                              color: Color(0xFFFF9D02),
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                        TextSpan(
                          text: "$totalMoney",
                          style: const TextStyle(
                              color: Color(0xFFCB6100),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const TextSpan(
                          text: ' 紫钻',
                          style: TextStyle(
                              color: Color(0xFFFF9D02),
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height:
                        fruitMachineLotteryDrawingDialogConfirmButtonTopMargin,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                        IMG.format(
                            'room/game/fruit_machine_lottery_drawing_dialog_confirm_button'),
                        width:
                            fruitMachineLotteryDrawingDialogConfirmButtonWidth,
                        height:
                            fruitMachineLotteryDrawingDialogConfirmButtonHeight,
                      ),
                    ),
                  ),
                  SizedBox(
                    height:
                        fruitMachineLotteryDrawingDialogConfirmButtonBottomMargin,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: (Get.width - fruitMachineLotteryDrawingDialogHeaderWidth) /
                2.0,
            top: (Get.height -
                        fruitMachineLotteryDrawingDialogBackgroundHeight) /
                    2.0 -
                fruitMachineLotteryDrawingDialogHeaderTopInset,
            width: fruitMachineLotteryDrawingDialogHeaderWidth,
            height: fruitMachineLotteryDrawingDialogHeaderHeight,
            child: Image.asset(
              IMG.format(
                  'room/game/fruit_machine_lottery_drawing_dialog_header'),
              width: fruitMachineLotteryDrawingDialogHeaderWidth,
              height: fruitMachineLotteryDrawingDialogHeaderHeight,
            ), // _SimpleWnRecord(widget.items),
          ),
        ],
      ),
    );
  }

  Widget _itemBuilder(ActivityLotteryModel activityLotteryModel) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color:const Color(0xFFFFA314),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [

          Positioned(
            left: 15,
            top: 15,
            width: 33,
            height: 33,
            child: NetImage(
              activityLotteryModel.prizeImage ?? "",
              width: 33,
              height: 33,
            ),
          ),

          Positioned(
            left: 3.0,
            top: 3.0,
            child: Container(
              alignment: Alignment.center,
              padding:const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color:const Color(0xFFFFC181),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                "x${activityLotteryModel.count ?? 0}",
                style:const TextStyle(
                    color: Color(0xFFCB6200),
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),

          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 6.0,
            child: Text(
              activityLotteryModel.prizeName ?? "",
              textAlign: TextAlign.center,
              style:const TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: fw$Medium,
                  fontSize: 12
              ),
            ),
          )
        ],
      ),
    );
  }
}
