
import 'package:app/model/activity_info_model.dart';
import 'package:app/model/activity_lottery_model.dart';
import 'package:app/net/api.dart';
import 'package:app/store/wallet_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/wallet/recharge_page.dart';
import 'package:app/ui/room/game/fruitMachine/roll_slot_controller.dart';

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

  final leftRollSlotController = RollSlotController(secondsBeforeStop: 10);
  final centerRollSlotController = RollSlotController(secondsBeforeStop: 10);
  final rightRollSlotController = RollSlotController(secondsBeforeStop: 10);

  @override
  void onInit() {
    super.onInit();
    modeId.value = activityInfoModel.lotteryItemList?.first.id ?? 0;
    lotteryPrice.value = activityInfoModel.lotteryItemList?.first.lotteryPrice ?? 0;
    requestLottery();
  }

  /// 获取商品列表
  void requestLottery() async {
    simpleTry(() => Api.Activity.getFruitMachineLotteryList(), callback: (result) {
      if(result != null){
        if(result["normal"] != null){
         final List list = result["normal"];
         normalLotteryList.value = list.map((e) => ActivityLotteryModel.fromJson(e)).toList();
        }
        if(result["advanced"] != null){
         final List list = result["advanced"];
         advancedLotteryList.value = list.map((e) => ActivityLotteryModel.fromJson(e)).toList();
        }
        if(result["crazy"] != null){
         final List list = result["crazy"];
         crazyLotteryList.value = list.map((e) => ActivityLotteryModel.fromJson(e)).toList();
        }
        menuSelectIndex.value = 0;
        currentShowLotteryImageUrlList.value = normalLotteryList.map((e) => e.image ?? '').toList();
        currentShowLotteryList.value = normalLotteryList;
      }
    },);
  }

  /// 点击规则
  void clickRule() {

  }

  /// 点击记录
  void clickRecord(){

  }

  /// 点击菜单
  void changeMenu(int index) {
    if(index == menuSelectIndex.value){
      return;
    }
    // 动画没有播放完
    // if(currentPrizeList.isNotEmpty || _timer != null) {
    //   return;
    // }
    // debugPrint("GestureDetector .......");
    // curSelectedIndex = index;
    //
    // var itemList = widget.infoModel.lotteryItemList ?? [];
    // modeId = itemList[curSelectedIndex].id;
    // lotteryPrice = itemList[curSelectedIndex].lotteryPrice ?? 0;
    // requestLottery();
    menuSelectIndex.value = index;
    var itemList = activityInfoModel.lotteryItemList ?? [];
    modeId.value = itemList[index].id ?? 0;
    lotteryPrice.value = itemList[index].lotteryPrice ?? 0;
    final List<ActivityLotteryModel> list = index == 0 ? normalLotteryList : index == 1 ? advancedLotteryList : crazyLotteryList;
    currentShowLotteryImageUrlList.value = list.map((e) => e.image ?? '').toList();
    currentShowLotteryList.value = list;
  }

  /// 点击跳过动画
  void clickSkipAnimation() {
    selectSkipAnimation.value = !selectSkipAnimation.value;
  }

  /// 点击充值
  void clickRecharge() async {
    await Get.to(() => RechargePage(hasShowUnityView: false,));
    // 刷新
    await WalletCtrl.ins.doRefresh();
  }

  ///
  /// 开始转动
  ///
  void startSpin({required int count}) async {

  }
}