import 'package:app/model/activity_lottery_model.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';

/// 水果机记录弹窗控制器
class FruitMachineRecordDialogController extends GetxController {
  final int modeId;
  FruitMachineRecordDialogController({required this.modeId});

  /// 奖品列表
  final lotteryList = <ActivityLotteryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getLotteryList();
  }

  /// 获取奖品列表
  void getLotteryList() async {
    Map result = await Api.Activity.getLotteryRecord(modeId);
    if(result["items"] != null){
      final List<dynamic> list = result["items"];
      if (list.isNotEmpty) {
        final List<ActivityLotteryModel> modelList = [];
        list.forEach((element) {
          modelList.add(ActivityLotteryModel.fromJson(element));
        });
        lotteryList.value = modelList;
      }
    }
  }
}
