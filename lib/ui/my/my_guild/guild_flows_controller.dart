
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/my_guild/flow_details_page.dart';
import 'package:app/ui/my/my_guild/model/guild_flow_model.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/custom_date_picker.dart';
import 'package:easy_refresh/easy_refresh.dart';

/// 公会流水控制器
class GuildFlowsController extends GetxController {
  /// 搜索房间号
  final TextEditingController searchRoomIdController = TextEditingController();
  /// 搜索房间号焦点
  FocusNode searchRoomIdFocus = FocusNode();
  /// 搜索开始时间
  final searchStartTime = ''.obs;
  /// 搜索开始时间戳
  int searchStartTimeStamp = 0;
  /// 搜索结束时间
  final searchEndTime = ''.obs;
  /// 搜索结束时间戳
  int searchEndTimeStamp = 0;
  /// 数据列表
  RxList<GuildFlowModel> dataList = <GuildFlowModel>[].obs;
  /// 刷新控制器
  final EasyRefreshController easyRefreshController = EasyRefreshController(
    controlFinishRefresh: false,
    controlFinishLoad: true,
  );
  /// 滚动控制器
  final ScrollController scrollController = ScrollController();
  /// 分页
  PageNum pageNum = const PageNum();
  /// 总金额
  final totalAmount = 0.obs;

  var canLoadMore = true;


  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  /// 加载数据
  void loadData(){
    if(canLoadMore){
      Future.delayed(const Duration(microseconds: 200),(){
        simpleTry(
                () => Api.Guild.guildFlowList(page: pageNum, startTimeStamp: searchStartTimeStamp, endTimeStamp: searchEndTimeStamp,roomNo: searchRoomIdController.text),showProgress: true, callback: (result) {
          if(result != null && result is Map){
            final List items = result['items'];
            totalAmount.value = result['total_amount'];
            final List<GuildFlowModel> flowList = [];
            for (final Map item in items){
              final guildModel = GuildFlowModel.fromJson(item);
              flowList.add(guildModel);
            }
            dataList.addAll(flowList);
            canLoadMore = flowList.length >= pageNum.size;
            easyRefreshController.finishLoad(canLoadMore ? IndicatorResult.success : IndicatorResult.noMore);
            // easyRefreshController.finishLoad(flowList.length < pageNum.size ? IndicatorResult.noMore : IndicatorResult.success);
          }
        });
      });
    }else{
      easyRefreshController.finishLoad(IndicatorResult.noMore);
    }
  }

  /// 加载更多
  void loadMoreData(){
    pageNum.nextPage();
    loadData();
  }

  /// 点击开始时间
  void clickSearchStartTime(){
    searchRoomIdFocus.unfocus();
    CustomDatePicker.show(
      Get.context!,
      startDate: DateTime(DateTime.now().year-2, 1, 1),
      selectedDate: DateTime.now(),
      endDate: DateTime(DateTime.now().year+2, 1, 1),
      title: '起始时间',
      onSelected: (DateTime date) {
        searchStartTime.value = '${date.year}-${date.month}-${date.day}';
        searchStartTimeStamp = date.millisecondsSinceEpoch;
      },
    );
  }

  /// 点击结束时间
  void clickSearchEndTime(){
    searchRoomIdFocus.unfocus();
    CustomDatePicker.show(
      Get.context!,
      startDate: DateTime(DateTime.now().year-2, 1, 1),
      selectedDate: DateTime.now(),
      endDate: DateTime(DateTime.now().year+2, 1, 1),
      title: '终止时间',
      onSelected: (DateTime date) {
        searchEndTime.value = '${date.year}-${date.month}-${date.day}';
        searchEndTimeStamp = date.millisecondsSinceEpoch;
      },
    );
  }

  /// 点击搜索
  void clickSearch(){
    searchRoomIdFocus.unfocus();
    dataList.clear();
    pageNum = const PageNum();
    loadData();
  }

  /// 点击流水详情
  void clickFlowDetail(int index){
    searchRoomIdFocus.unfocus();
    final GuildFlowModel model = dataList[index];
    Get.to(()=>FlowDetailsPage(roomNumber: model.roomNo ?? '0',));
  }
}