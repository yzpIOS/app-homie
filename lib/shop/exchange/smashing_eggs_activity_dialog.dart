import 'package:app/shop/exchange/smashing_eggs_activity_controller.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

/// 砸蛋活动
class SmashingEggsActivityDialog extends StatelessWidget {
  final double smashingEggsActivityContentWidth = 375;
  final double smashingEggsActivityBackgroundWidth = 311.5;
  final double smashingEggsActivityBackgroundHeight = 436;
  final double smashingEggsActivityCloseButtonHeight = 26.5;
  final double smashingEggsActivityCloseButtonWidth = 26.5;
  final double smashingEggsActivityCloseButtonTopMargin = 12;

  const SmashingEggsActivityDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SmashingEggsActivityController>(
        init: SmashingEggsActivityController(),
        builder: (SmashingEggsActivityController controller) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              width: smashingEggsActivityContentWidth,
              height: Get.height,
              alignment: Alignment.center,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _buildContent(controller),
                  Positioned(
                    left: (smashingEggsActivityContentWidth - smashingEggsActivityCloseButtonWidth) /
                        2.0,
                    top: Get.height /
                        2.0 + smashingEggsActivityBackgroundHeight / 2.0 +
                        smashingEggsActivityCloseButtonTopMargin,
                    width: smashingEggsActivityCloseButtonWidth,
                    height: smashingEggsActivityCloseButtonHeight,
                    child: GestureDetector(
                      onTap: () {
                        controller.clickClose();
                      },
                      child: Image.asset(
                        IMG.format(
                            'room/game/product_exchange_dialog_close'),
                        width: smashingEggsActivityCloseButtonWidth,
                        height: smashingEggsActivityCloseButtonHeight,
                      ),
                    ), // _SimpleWnRecord(widget.items),
                  ),
                ],
              ),
            ),
          );
        });
  }

  /// 内容
  Widget _buildContent(SmashingEggsActivityController controller){
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: smashingEggsActivityBackgroundWidth,
        height: smashingEggsActivityBackgroundHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF6F51E2), Color(0xFF6CA4FF)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacing.h14,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const Pad(horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.5),
                        color: const Color(0xFFBFDBFF),
                        border: Border.all(
                          color: Colors.white,
                          width: 0.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            IMG.format(
                                'room/game/smashing_eggs_hammer_small_icon'),
                            width: 21,
                            height: 21,
                          ),
                          Spacing.w4,
                          const Text(
                            "100000",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          Spacing.w8,
                          Image.asset(
                            IMG.format(
                                'room/game/smashing_eggs_add_icon'),
                            width: 18,
                            height: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      IMG.format(
                          'room/game/smashing_eggs_record_icon'),
                      width: 30,
                      height: 30,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      IMG.format(
                          'room/game/smashing_eggs_gift_icon'),
                      width: 30,
                      height: 30,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      IMG.format(
                          'room/game/smashing_eggs_setting_icon'),
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 76,
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                IMG.format('room/game/smashing_eggs_opened_icon'),
                width: 148,
                height: 165,
              ),
            ),
            Spacing.h18,
            Container(
              width: 169,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFFFAB5), Color(0xFFF7C94D)],
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                "马上开启",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Spacing.h18,
            SizedBox(
              height: 35,
              child: Obx(() {
                return CustomSlidingSegmentedControl<SegmentType>(
                  fromMax: true,
                  height: 35,
                  innerPadding: EdgeInsets.zero,
                  initialValue: controller.segmentType.value,
                  children: const {
                    SegmentType.openOnce: Text("开一次",style: TextStyle(fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),),
                    SegmentType.openTen: Text("开十次",style: TextStyle(fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),),
                    SegmentType.openHundredTimes: Text("开百次",style: TextStyle(fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),),
                  },
                  thumbDecoration: BoxDecoration(
                    color:const Color(0xFF5D91FF),
                    borderRadius: controller.dynamicBorder.value,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white,
                      width: 0.5,
                    ),
                    color: const Color(0xFF8797AD),
                  ), onValueChanged: (SegmentType value) {
                  controller.clickSegment(value);
                },
                );
              }),
            ),
            Spacing.h10,
            const Text('理性游戏， 娱乐为主，适度消费',style: TextStyle(fontSize: 12,
              color: Color(0xFFFEFEFE),
            ),),
            const Spacing(),
          ],
        ),
      ),
    );
  }
}
