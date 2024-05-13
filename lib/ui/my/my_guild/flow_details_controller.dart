import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/my_guild/model/guild_room_flow_model.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/custom_date_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 流水详情
class FlowDetailsController extends GetxController {
  /// 房间号
  final String roomNumber;
  FlowDetailsController({required this.roomNumber});
  final totalAmount = 0.obs;
  /// 搜索开始时间
  final searchStartTime = ''.obs;
  /// 搜索开始时间戳
  int searchStartTimeStamp = 0;
  /// 搜索结束时间
  final searchEndTime = ''.obs;
  /// 搜索结束时间戳
  int searchEndTimeStamp = 0;
  /// 数据列表
  RxList<GuildRoomFlowModel> dataList = <GuildRoomFlowModel>[].obs;
  /// 刷新控制器
  RefreshController refreshController =
  RefreshController(initialRefresh: false);
  /// 滚动控制器
  final ScrollController scrollController = ScrollController();
  /// 分页
  PageNum pageNum = const PageNum();

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  /// 加载数据
  void loadData(){
    Future.delayed(const Duration(microseconds: 200),(){
      simpleTry(
              () => Api.Guild.guildRoomFlowList(page: pageNum,roomNo: roomNumber, startTimeStamp: searchStartTimeStamp, endTimeStamp: searchEndTimeStamp),showProgress: true, callback: (result) {
        if(result != null && result is Map){
          totalAmount.value = result['total_amount'] ?? 0;
          if(result['items'] is List){
            final List items = result['items'];
            final List<GuildRoomFlowModel> flowList = [];
            for (final Map item in items){
              final guildModel = GuildRoomFlowModel.fromJson(item);
              flowList.add(guildModel);
            }
            dataList.addAll(flowList);
            flowList.length >= pageNum.size ? refreshController.loadComplete() : refreshController.loadNoData();
          }else{
            refreshController.loadNoData();
          }
        }
      });
    });
  }

  /// 加载更多
  void loadMoreData(){
    pageNum.nextPage();
    loadData();
  }

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
    dataList.clear();
    pageNum = const PageNum();
    loadData();
  }
}