
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/custom_date_picker.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

/// 公会流水控制器
class GuildFlowsController extends GetxController {
  final TextEditingController searchRoomIdController = TextEditingController();
  final searchStartTime = ''.obs;
  final searchEndTime = ''.obs;

  /// 点击开始时间
  void clickSearchStartTime(){
    CustomDatePicker.show(
      Get.context!,
      startDate: DateTime(DateTime.now().year-2, 1, 1),
      selectedDate: DateTime.now(),
      endDate: DateTime(DateTime.now().year+2, 1, 1),
      title: '起始时间',
      onSelected: (DateTime date) {
        searchStartTime.value = '${date.year}-${date.month}-${date.day}';
      },
    );
  }

  /// 点击结束时间
  void clickSearchEndTime(){
    CustomDatePicker.show(
      Get.context!,
      startDate: DateTime(DateTime.now().year-2, 1, 1),
      selectedDate: DateTime.now(),
      endDate: DateTime(DateTime.now().year+2, 1, 1),
      title: '终止时间',
      onSelected: (DateTime date) {
        searchEndTime.value = '${date.year}-${date.month}-${date.day}';
      },
    );
  }

  /// 点击搜索
  void clickSearch(){

  }

}