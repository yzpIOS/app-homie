import 'package:app/tools.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:app/widgets.dart';

import 'package:app/net/api.dart';

import 'package:app/common/common_model.dart';

class GrowthTaskController extends GetxController {
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    // dailyTaskAllItems = DailyTaskAllItems();
    // await dailyTaskQuery();
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

  int pageNum = 0;
  int offset = 0;
  int limit = 20;
  onRefresh() async {
     pageNum = 0;
     offset = 0;
     hasMoreData = true;
    // await baseController.flashcardDetails();
    // await userMine();
    // await userMineField();
    // await getMyAsset();
     itemList.clear();
    await dailyTaskQuery(offset: offset, limit: limit);
    refController.refreshCompleted();
    // baseController.getPayType();

  }

  oneKeyreceive(){
    simpleTry(() async => await Api.Activity.oneKeyReceive(taskType: 2),
        callback: (data) {
            showToast('领取成功');
             onRefresh();
        }
    );
  }

  taskReceive({required int? id, required int taskType}) async {

    simpleTry(() async => await Api.Activity.taskReceive(id: id, taskType: taskType),
    callback: (data) {
    //  if (data == 1) {
        showToast('领取成功');
      //  dailyTaskQuery();
        onRefresh();
     // }
    }
    );
  }
  bool hasMoreData = true;
  List itemList = [];
  onLoad() async {
     pageNum++;
     offset += pageNum * limit;
    //await getGoodsList();
     await dailyTaskQuery(offset: offset, limit: limit);
   // refController.loadComplete();
  }
 // DailyTaskAllItems dailyTaskAllItems = DailyTaskAllItems();

  dailyTaskQuery({required int? offset, required int limit}) async {
    if(hasMoreData){
      Map<String, dynamic> data = await Api.Activity.growUpTaskQuery(offset: offset, limit: limit);
      DailyTaskAllItems dailyTaskAllItems = DailyTaskAllItems.fromJson(data);
      // dailyTaskAllItems = Items;
      if(dailyTaskAllItems.data!.items!.isEmpty){
        //  refController.loadComplete();
        hasMoreData = false;
        refController.loadNoData();
      }else{
        itemList.addAll(dailyTaskAllItems.data!.items!);
      }
      refController.loadComplete();
      update(['growthTaskPage']);
    }else{
      refController.loadNoData();
    }

  }

}