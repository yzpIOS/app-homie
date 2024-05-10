
import 'package:app/tools.dart';
import 'package:app/ui/my/my_guild/flow_details_page.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/custom_date_picker.dart';

/// 公会流水控制器
class GuildFlowsController extends GetxController {
  /// 搜索房间号
  final TextEditingController searchRoomIdController = TextEditingController();
  /// 搜索开始时间
  final searchStartTime = ''.obs;
  /// 搜索结束时间
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

  /// 点击流水详情
  void clickFlowDetail(int index){
    Get.to(()=>const FlowDetailsPage());
  }

}