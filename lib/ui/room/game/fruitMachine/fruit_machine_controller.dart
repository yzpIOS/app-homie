
import 'package:app/model/activity_info_model.dart';
import 'package:app/store/wallet_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/wallet/recharge_page.dart';

/// 水果机
class FruitMachineController extends GetxController {
  ActivityInfoModel activityInfoModel;
  FruitMachineController({required this.activityInfoModel});
  /// 菜单选中
  final menuSelectIndex = 0.obs;
  /// 模式id
  final modeId = 0.obs;
  /// 抽奖价格
  final lotteryPrice = 0.obs;
  /// 跳过动画
  final selectSkipAnimation = false.obs;

  @override
  void onInit() {
    super.onInit();
    modeId.value = activityInfoModel.lotteryItemList?.first.id ?? 0;
    lotteryPrice.value = activityInfoModel.lotteryItemList?.first.lotteryPrice ?? 0;
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