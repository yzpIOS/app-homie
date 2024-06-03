import 'package:app/tools.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:app/widgets.dart';

import 'package:app/net/api.dart';

import 'package:app/common/common_model.dart';

class TaskMainPageController extends GetxController {
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    dailyTaskAllItems = DailyTaskAllItems();
    await dailyTaskQuery();
  }
  /// 滚动控制器
  final ScrollController scrollController = ScrollController();

  @override
  void onClose() {
    super.onClose();
    refController.dispose();
  }
  /// 刷新控制器
  RefreshController refController = RefreshController();

  onRefresh() async {
    // pageNum = 1;
    // await baseController.flashcardDetails();
    // await userMine();
    // await userMineField();
    // await getMyAsset();

    await dailyTaskQuery();
    refController.refreshCompleted();
    // baseController.getPayType();

  }

  taskReceive({required int? id, required int taskType}) async {

    simpleTry(() async => await Api.Activity.taskReceive(id: id, taskType: taskType),
        callback: (data) {
          //  if (data == 1) {
          showToast('领取成功');
          dailyTaskQuery();
          // }
        }
    );
  }

  /// 一键领取
  oneKeyreceive(){
    simpleTry(() async => await Api.Activity.oneKeyReceive(taskType: 1),
        callback: (data) {
          showToast('领取成功');
          dailyTaskQuery();
        }
    );
  }

  onLoad() async {
    // pageNum++;
    //await getGoodsList();
  //  await dailyTaskQuery();
    refController.loadComplete();
  }
  DailyTaskAllItems dailyTaskAllItems = DailyTaskAllItems();

  dailyTaskQuery() async {
    Map<String, dynamic> data = await Api.Activity.dailyTaskQuery();
      DailyTaskAllItems Items = DailyTaskAllItems.fromJson(data);
      dailyTaskAllItems = Items;
      update(['taskMainPage']);

  }

}