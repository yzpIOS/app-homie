import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

/// 水果机规则
class FruitMachineRuleDialog extends StatelessWidget {
  const FruitMachineRuleDialog({super.key});

  final double fruitMachineRecordDialogBodyWidth = 312;
  final double fruitMachineRecordDialogBodyHeight = 449;
  final double fruitMachineRecordDialogHeaderHeight = 35;
  final double fruitMachineRecordDialogHeaderWidth = 158.5;
  final double fruitMachineRecordDialogHeaderInset = 10;
  final double fruitMachineRecordDialogCloseButtonTopMargin = 20;
  final double fruitMachineRecordDialogCloseButtonWidth = 33;

  @override
  Widget build(BuildContext context) {
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
                    image: AssetImage(IMG
                        .format("room/game/fruit_machine_record_dialog_body")),
                    fit: BoxFit.fill),
              ),
              child: Container(
                padding: const Pad(top: 40, left: 36, right: 32,bottom: 30),
                child:SingleChildScrollView(
                  child: RichText(
                    text:const TextSpan(
                      text: '''1.活动玩法:\n游乐场各场次将不定时开启限时任务，对应场次达到指定次数成就将有机会解锁额外奖励，奖励背包有效期均为3天，请在有效期内使用.\n\n2.注意事项:\n限时任务以任务发布时用户等级为准开启，活动期间发生等级变化，将会影响限时任务的参与，如活动于1月1日20:00开启，1月2日升级为4级，将无法参与进阶场限时任务。1.活动火热，若奖品发放延迟或发放有误，请及时联系魂淡君，将尽快为您补发哦~若遇奖池变更时，前端展示延迟或错位等问题，请以实际中奖记录为主\n\n3.奖品概率公示:(万分制)\n普通奖品(9000紫钻)8450%。\n高级奖品(90000紫钻)1300%。\n疯狂奖品(900000紫钻)250%。''',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
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
                '活动规则',
                style: TextStyle(
                    color: Colors.white, fontSize: 18, fontWeight: fw$Medium),
              ),
            ),
          ),
          Positioned(
            width: fruitMachineRecordDialogCloseButtonWidth,
            height: fruitMachineRecordDialogCloseButtonWidth,
            left: (Get.width - fruitMachineRecordDialogCloseButtonWidth) / 2.0,
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
  }
}
