import 'package:app/common/theme.dart';
import 'package:app/model/activity_info_model.dart';
import 'package:app/model/activity_lottery_model.dart';
import 'package:app/store/wallet_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/tools/text_extension.dart';
import 'package:app/ui/room/game/fruitMachine/fruit_machine_controller.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

/// 水果机
class FruitMachinePage extends StatelessWidget {
  /// 活动信息
  ActivityInfoModel activityInfoModel;

  FruitMachinePage({required this.activityInfoModel, super.key});

  final double fruitMachineCloseWidgetBottomMargin = 642.5;
  final double fruitMachineCloseWidgetLeftMargin = 15.5;
  final double fruitMachineCloseWidgetWidth = 25.0;
  final double fruitMachineCloseWidgetHeight = 25.0;
  final double fruitMachineBodyTitleWidgetBottomMargin = 623.5;
  final double fruitMachineBodyTitleWidgetHeight = 50.5;
  final double fruitMachineBodyTitleWidgetWidth = 205.5;
  final double fruitMachineBodyHeaderWidgetBottomMargin = 433.5;
  final double fruitMachineBodyHeaderWidgetHeight = 205.5;
  final double fruitMachineBodyHeaderWidgetWidth = 366.0;
  final double fruitMachineBodyBottomWidgetHeight = 465.5;
  final double fruitMachineBodyBottomWidgetWidth = 499.5;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FruitMachineController>(
        init: FruitMachineController(activityInfoModel: activityInfoModel),
        builder: (FruitMachineController controller) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Positioned(
                  left: (Get.width - fruitMachineBodyBottomWidgetWidth) / 2.0,
                  bottom: 0,
                  width: fruitMachineBodyBottomWidgetWidth,
                  height: fruitMachineBodyBottomWidgetHeight,
                  child: Container(
                    width: fruitMachineBodyBottomWidgetWidth,
                    height: fruitMachineBodyBottomWidgetHeight,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(IMG.format(
                            "room/game/fruit_machine_body_bottom_icon")),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Spacing.h32,
                        Container(
                          width: 314,
                          height: 284,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(IMG.format(
                                  "room/game/fruit_machine_rotate_column_icon")),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Spacing.h14,
                        _createBottomButton(controller: controller),
                        Spacing.h32,
                        SizedBox(
                          width: Get.width,
                          child: _balanceWidget(controller: controller),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: (Get.width - fruitMachineBodyHeaderWidgetWidth) / 2.0,
                  bottom: fruitMachineBodyHeaderWidgetBottomMargin,
                  width: fruitMachineBodyHeaderWidgetWidth,
                  height: fruitMachineBodyHeaderWidgetHeight,
                  child: Container(
                    width: fruitMachineBodyHeaderWidgetWidth,
                    height: fruitMachineBodyHeaderWidgetHeight,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(IMG.format(
                            "room/game/fruit_machine_body_header_icon")),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: [
                        Spacing.h22,
                        Container(
                          margin: const Pad(horizontal: 12),
                          height: 55,
                          width: 342,
                          child: Obx(() {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.currentShowLotteryList
                                  .length,
                              itemExtent: 55,
                              itemBuilder: (context, index) {
                                final ActivityLotteryModel activityLotteryModel = controller
                                    .currentShowLotteryList[index];
                                return Container(
                                  width: 55,
                                  height: 55,
                                  margin: const Pad(left: 10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF894693).withOpacity(
                                        0.2),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0xFFECCAF2),
                                        width: 1.0),
                                  ),
                                  child: Column(
                                    children: [
                                      Spacing.h4,
                                      NetImage(
                                          activityLotteryModel.image, width: 33,
                                          height: 33,
                                          fit: BoxFit.contain),
                                      Spacing.h2,
                                      Text(
                                        '${activityLotteryModel.probability != null && activityLotteryModel.probability! > 0 ? activityLotteryModel.probability! /10.0 : 0}%',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          height: 1
                                        ),
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }),
                        ),
                        Spacing.h32,
                        Row(
                          children: [
                            const Spacing(),
                            _createButton(
                                controller: controller, isRecord: false),
                            Spacing.w70,
                            _createButton(
                                controller: controller, isRecord: true),
                            const Spacing(),
                          ],
                        ),
                        Spacing.h28,
                        Obx(() {
                          return _createMenu(controller: controller);
                        }),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: (Get.width - fruitMachineBodyTitleWidgetWidth) / 2.0,
                  bottom: fruitMachineBodyTitleWidgetBottomMargin,
                  width: fruitMachineBodyTitleWidgetWidth,
                  height: fruitMachineBodyTitleWidgetHeight,
                  child: Container(
                    width: fruitMachineBodyTitleWidgetWidth,
                    height: fruitMachineBodyTitleWidgetHeight,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(IMG.format(
                            "room/game/ fruit_machine_body_title_icon")),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: (Get.width - fruitMachineBodyTitleWidgetWidth) / 2.0 +
                      fruitMachineBodyTitleWidgetWidth +
                      fruitMachineCloseWidgetLeftMargin,
                  bottom: fruitMachineCloseWidgetBottomMargin,
                  width: fruitMachineCloseWidgetWidth,
                  height: fruitMachineCloseWidgetHeight,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Image.asset(
                      IMG.format("room/game/turntable_rule_close"),
                      width: fruitMachineCloseWidgetWidth,
                      height: fruitMachineCloseWidgetHeight,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  /// 创建按钮
  Widget _createButton(
      {required FruitMachineController controller, required bool isRecord}) {
    return GestureDetector(
      onTap: () {
        isRecord ? controller.clickRecord() : controller.clickRule();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: 49,
        height: 22.5,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  IMG.format("room/game/fruit_machine_button_icon")),
            )),
        child: Text(
          isRecord ? "记录" : "规则",
          style: Colors.white.ptB(12),
        ),
      ),
    );
  }

  /// 创建菜单
  Widget _createMenu({required FruitMachineController controller}) {
    var itemList = activityInfoModel.lotteryItemList ?? [];
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: itemList.map((e) {
        String modeName = "";
        if (e.mode == 1) {
          modeName = "普通场";
        } else if (e.mode == 2) {
          modeName = "高级场";
        } else if (e.mode == 3) {
          modeName = "疯狂场";
        } else {
          return const SizedBox();
        }
        return _createMenuButton(
            controller: controller,
            label: modeName,
            index: itemList.indexOf(e));
      }).toList(),
    );
  }

  /// 创建菜单按钮
  Widget _createMenuButton({required FruitMachineController controller,
    required String label,
    required int index}) {
    final bool menuSelect = index == controller.menuSelectIndex.value;
    final String imagePath = IMG.format(menuSelect
        ? "room/game/fruit_machine_menu_selected_icon"
        : "room/game/fruit_machine_menu_default_icon");
    final TextStyle style = TextStyle(
      color: menuSelect ? const Color(0XFF6D2F81) : const Color(0XFFA7A7BD),
      fontSize: 15,
      fontWeight: FontWeight.bold,
    );

    return GestureDetector(
      onTap: () {
        controller.changeMenu(index);
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: 74,
        height: 30,
        margin: const Pad(horizontal: 7.5),
        alignment: Alignment.center,
        decoration:
        BoxDecoration(image: DecorationImage(image: AssetImage(imagePath))),
        child: Text(
          label,
          style: style,
        ),
      ),
    );
  }

  /// 底部按钮组
  Widget _createBottomButton({required FruitMachineController controller}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _createSingleBottomButton(
            controller: controller,
            prizeLabel: "${controller.lotteryPrice.value}紫钻",
            prizeTxtColor: const Color(0xFF9A3200),
            imagePath:
            IMG.format("room/game/fruit_machine_button_rotate_once_icon"),
            count: 1),
        Spacing.w6,
        _createSingleBottomButton(
            controller: controller,
            prizeLabel: "${controller.lotteryPrice.value * 10}紫钻",
            prizeTxtColor: const Color(0xFF990072),
            imagePath:
            IMG.format("room/game/fruit_machine_button_rotate_ten_icon"),
            count: 10),
        Spacing.w6,
        _createSingleBottomButton(
            controller: controller,
            prizeLabel: "${controller.lotteryPrice.value * 100}紫钻",
            prizeTxtColor: const Color(0xFF007193),
            imagePath: IMG
                .format("room/game/fruit_machine_button_rotate_hundred_icon"),
            count: 100),
      ],
    );
  }

  /// 单个按钮
  Widget _createSingleBottomButton({required FruitMachineController controller,
    required String prizeLabel,
    required Color prizeTxtColor,
    required String imagePath,
    required int count}) {
    return GestureDetector(
      onTap: () {
        controller.startSpin(count: count);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 102.5,
        height: 39,
        transformAlignment: Alignment.center,
        padding: const Pad(top: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
            )),
        child: Text(
          prizeLabel,
          style: TextStyle(
            color: prizeTxtColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  /// 余额
  Widget _balanceWidget({required FruitMachineController controller}) {
    return Row(
      children: [
        Spacing.w16,
        WalletCtrl.use(
          builder: (it) {
            return XRichText(TextSpan(children: [
              TextSpan(
                text: '紫钻:${it[MoneyType.diamond] ?? '--'} ',
                style: const TextStyle(
                    fontSize: 16, color: Colors.white, fontWeight: fw$Bold),
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Image.asset(
                    IMG.format('room/game/fruit_machine_diamon_icon'),
                    width: 23,
                    height: 23,
                    scale: 3),
              )
            ]));
          },
        ),
        Spacing.w4,
        XRichText(TextSpan(children: [
          const TextSpan(
            text: '充值',
            style: TextStyle(
                fontSize: 16, color: Color(0xFFFF2B6B), fontWeight: fw$Medium),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Image.asset(IMG.format('room/game/fruit_machine_right_icon'),
                width: 11, height: 11, scale: 3),
          )
        ])),
        const Spacing(),
        Obx(() {
          return GestureDetector(
              onTap: () {
                controller.clickSkipAnimation();
              },
              child: Image.asset(
                  IMG.format(controller.selectSkipAnimation.value
                      ? 'room/game/fruit_machine_skip_animation_selected_icon'
                      : 'room/game/fruit_machine_skip_animation_default_icon'),
                  width: 72,
                  height: 22,
                  scale: 3));
        }),
        Spacing.w16,
      ],
    );
  }
}
