import 'dart:math';

import 'package:app/model/activity_info_model.dart';
import 'package:app/model/activity_lottery_model.dart';
import 'package:app/net/api.dart';
import 'package:app/store/wallet_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/wallet/recharge_page.dart';
import 'package:app/ui/room/game/fruitMachine/fruit_machine_record_dialog.dart';
import 'package:app/ui/room/game/fruitMachine/fruit_machine_rule_dialog.dart';
import 'package:app/ui/room/game/fruitMachine/roll_slot_controller.dart';
import 'package:app/ui/room/game/turntable/dialog/turntable_prize_dialog.dart';
import 'package:app/ui/room/persion/common_dialog.dart';
import 'package:flutter/material.dart';

/// 水果机
class FruitMachineController extends GetxController {
  ActivityInfoModel activityInfoModel;

  FruitMachineController({required this.activityInfoModel});

  /// 菜单选中
  final menuSelectIndex = (-1).obs;

  /// 模式id
  final modeId = 0.obs;

  /// 抽奖价格
  final lotteryPrice = 0.obs;

  /// 跳过动画
  final selectSkipAnimation = false.obs;

  /// 普通场奖品列表
  final normalLotteryList = <ActivityLotteryModel>[].obs;

  /// 高级场奖品列表
  final advancedLotteryList = <ActivityLotteryModel>[].obs;

  /// 疯狂场奖品列表
  final crazyLotteryList = <ActivityLotteryModel>[].obs;

  /// 当前展示奖品列表
  final currentShowLotteryList = <ActivityLotteryModel>[].obs;

  /// 当前展示奖品图片列表
  final currentShowLotteryImageUrlList = <String>[].obs;

  /// 是否播放动画
  bool isPlayAnimation = false;
  /// 左边滚动槽 (1s后后停止)
  final leftRollSlotController = RollSlotController(secondsBeforeStop: 1);
  /// 中间滚动槽 (2s后后停止)
  final centerRollSlotController = RollSlotController(secondsBeforeStop: 2);
  /// 右边滚动槽 (3s后后停止)
  final rightRollSlotController = RollSlotController(secondsBeforeStop: 3);

  @override
  void onInit() {
    super.onInit();
    modeId.value = activityInfoModel.lotteryItemList?.first.id ?? 0;
    lotteryPrice.value =
        activityInfoModel.lotteryItemList?.first.lotteryPrice ?? 0;
    requestLottery();
  }

  /// 获取商品列表
  void requestLottery() async {
    simpleTry(
      () => Api.Activity.getFruitMachineLotteryList(),
      callback: (result) {
        if (result != null) {
          if (result["normal"] != null) {
            final List list = result["normal"];
            normalLotteryList.value =
                list.map((e) => ActivityLotteryModel.fromJson(e)).toList();
          }
          if (result["advanced"] != null) {
            final List list = result["advanced"];
            advancedLotteryList.value =
                list.map((e) => ActivityLotteryModel.fromJson(e)).toList();
          }
          if (result["crazy"] != null) {
            final List list = result["crazy"];
            crazyLotteryList.value =
                list.map((e) => ActivityLotteryModel.fromJson(e)).toList();
          }
          menuSelectIndex.value = 0;
          currentShowLotteryImageUrlList.value =
              normalLotteryList.map((e) => e.image ?? '').toList();
          currentShowLotteryList.value = normalLotteryList;
        }
      },
    );
  }

  /// 点击规则
  void clickRule() {
    Get.dialog(
      const FruitMachineRuleDialog(),
      useSafeArea: false,
    );
  }

  /// 点击记录
  void clickRecord() {
    Get.dialog(
      FruitMachineRecordDialog(modeId:modeId.value),
      useSafeArea: false,
    );
  }

  /// 点击菜单
  void changeMenu(int index) {
    if (index == menuSelectIndex.value) {
      //同一个menu
      return;
    }
    if (isPlayAnimation) {
      // 动画没有播放完
      return;
    }
    menuSelectIndex.value = index;
    var itemList = activityInfoModel.lotteryItemList ?? [];
    modeId.value = itemList[index].id ?? 0;
    lotteryPrice.value = itemList[index].lotteryPrice ?? 0;
    final List<ActivityLotteryModel> list = index == 0
        ? normalLotteryList
        : index == 1
            ? advancedLotteryList
            : crazyLotteryList;
    currentShowLotteryImageUrlList.value =
        list.map((e) => e.image ?? '').toList();
    currentShowLotteryList.value = list;
  }

  /// 点击跳过动画
  void clickSkipAnimation() {
    selectSkipAnimation.value = !selectSkipAnimation.value;
  }

  /// 点击充值
  void clickRecharge() async {
    await Get.to(() => RechargePage(
          hasShowUnityView: false,
        ));
    // 刷新
    await WalletCtrl.ins.doRefresh();
  }

  ///
  /// 开始转动
  ///
  void startSpin({required int count}) async {
    if (isPlayAnimation) {
      // 动画没有播放完
      return;
    }
    isPlayAnimation = selectSkipAnimation.value ? false : true;
    if(isPlayAnimation){
      startRollFruitMachine();
    }
    simpleTry(() => Api.Activity.getStartSpin(modeId.value, count),
        callback: (result) async {
      await WalletCtrl.ins.doRefresh();
      // 奖品列表
      var windList = result != null ? result["items"] as List : [];
      if (windList.isEmpty) {
        stopFruitMachine();
        showToast(result["msg"] ?? "数据错误");
        return;
      }
      final itemModelList =
          windList.map((e) => ActivityLotteryModel.fromJson(e)).toList();
      // 查找出价格最大的值
      ActivityLotteryModel? maxPrizeActivityLotteryModel;
      itemModelList.forEach((element) {
        if (maxPrizeActivityLotteryModel == null) {
          maxPrizeActivityLotteryModel = element;
        } else if (maxPrizeActivityLotteryModel != null &&
            maxPrizeActivityLotteryModel!.price != null &&
            maxPrizeActivityLotteryModel!.price! > 0 &&
            element.price != null &&
            element.price! > 0 &&
            maxPrizeActivityLotteryModel!.price! < element.price!) {
          maxPrizeActivityLotteryModel = element;
        }
      });

      if (selectSkipAnimation.value) {
        // 选择了跳过动画,不播放动画,停止水果机
        stopFruitMachine();
        // 打开奖品弹窗
        openPrizeDialog(list: itemModelList);
        return;
      }

      // 要转到的位置
      int targetIndex = -1;
      if (maxPrizeActivityLotteryModel != null) {
        // 找到奖品
        var targetItem = currentShowLotteryList.firstWhereOrNull((element) =>
            element.prizeId == maxPrizeActivityLotteryModel!.prizeId);
        targetIndex = currentShowLotteryList.indexOf(targetItem);
      }
      if (targetIndex < 0) {
        showToast(result["msg"] ?? "数据错误2");
        return;
      }
      if (Env.isDebug) {
        var targetItem = currentShowLotteryList[targetIndex];
        showToast(targetItem.prizeName != null ? targetItem.prizeName! : '');
        print("FruitMachineController 开奖targetIndex:$targetIndex");
      }
      final listLength = currentShowLotteryList.length - 1;
      leftRollSlotController.animateRandomly(
          topIndex: Random().nextInt(listLength),
          centerIndex: targetIndex,
          bottomIndex: Random().nextInt(listLength));
      centerRollSlotController.animateRandomly(
          topIndex: Random().nextInt(listLength),
          centerIndex: targetIndex,
          bottomIndex: Random().nextInt(listLength));
      rightRollSlotController.animateRandomly(
          topIndex: Random().nextInt(listLength),
          centerIndex: targetIndex,
          bottomIndex: Random().nextInt(listLength));
      // rightRollSlotController是延迟3s停止的,所以延迟3+3s展示奖品弹窗
      Future.delayed(const Duration(seconds: 6), () {
        openPrizeDialog(list: itemModelList);
      });
    }, codeCallBack: (code, e) {
      stopFruitMachine();
      // 余额不足，弹窗去充值
      if (code == 11001) {
        showDialog(
            context: Get.context!,
            builder: (context) {
              return CommonDialog(
                  title: "余额不足",
                  confirmLabel: "去充值",
                  confirm: () async {
                    await Get.to(() => RechargePage(
                          hasShowUnityView: false,
                        ));
                    // 刷新
                    await WalletCtrl.ins.doRefresh();
                  });
            });
        return;
      }
      showToast("操作失败");
    }, showProgress: selectSkipAnimation.value);
  }

  /// 开始转动
  void startRollFruitMachine(){
    leftRollSlotController.startRoll();
    rightRollSlotController.startRoll();
    centerRollSlotController.startRoll();

    if(leftRollSlotController.state.isNone || leftRollSlotController.state.isStopped){
    }
    if(rightRollSlotController.state.isNone || rightRollSlotController.state.isStopped){
    }
    if(centerRollSlotController.state.isNone || centerRollSlotController.state.isStopped){
    }
  }

  /// 重置水果机
  void stopFruitMachine() {
    isPlayAnimation = false;
    if(!leftRollSlotController.state.isStopped){
      leftRollSlotController.stop();
    }
    if(!rightRollSlotController.state.isStopped){
      rightRollSlotController.stop();
    }
    if(!centerRollSlotController.state.isStopped){
      centerRollSlotController.stop();
    }
  }

  /// 开奖结果
  void openPrizeDialog({required List<ActivityLotteryModel> list}) {
    isPlayAnimation = false;
    delay(milliseconds:10,callBack: () {
      TurntablePrizeDialog.showDialog(list);
    });
  }
}
