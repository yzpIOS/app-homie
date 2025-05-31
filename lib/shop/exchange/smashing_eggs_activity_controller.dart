
import 'package:app/tools.dart';
import 'package:app/widgets.dart';

enum SegmentType {
  openOnce, //开一次
  openTen, //开十次
  openHundredTimes,//开一百次
}

/// 砸蛋活动
class SmashingEggsActivityController extends GetxController {
  /// segment
  final Rx<SegmentType> segmentType = SegmentType.openOnce.obs;

  /// 动态圆角
  final Rx<BorderRadius> dynamicBorder = const BorderRadius.only(
    topLeft: Radius.circular(20),
    bottomLeft: Radius.circular(20),
  ).obs;

  /// 点击关闭
  void clickClose(){
    Get.back();
  }

  /// 点击segment
  void clickSegment(SegmentType type) {
    segmentType.value = type;
    switch (type) {
      case SegmentType.openOnce:
        dynamicBorder.value = const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(0),
          topRight: Radius.circular(0),
        );
        break;
      case SegmentType.openTen:
        dynamicBorder.value = const BorderRadius.only(
          topLeft: Radius.circular(0),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topRight: Radius.circular(0),
        );
        break;
      case SegmentType.openHundredTimes:
        dynamicBorder.value = const BorderRadius.only(
          topLeft: Radius.circular(0),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(20),
        );
        break;
      default:
    }
  }

  /// 点击加锤子
  void clickAddHammer(){

  }

  /// 点击排行榜
  void clickRank(){

  }

  /// 点击奖池
  void clickGift(){

  }

  /// 点击设置
  void clickSetting(){

  }
}