
import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/my_guild/anchor_apply_list_page.dart';
import 'package:app/ui/my/my_guild/model/anchor_model.dart';
import 'package:app/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 主播列表控制器
class AnchorListController extends GetxController with BusGetLifeMixin{
  /// 数据列表
  RxList <AnchorModel>dataList = <AnchorModel>[].obs;
  /// 刷新控制器
  RefreshController refreshController =
  RefreshController(initialRefresh: false);
  /// 滚动控制器
  final ScrollController scrollController = ScrollController();
  /// 分页
  PageNum pageNum = const PageNum();
  /// 主播申请数量
  final anchorApplyCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
    loadGuildAnchorApplyCount();
    /// 处理公会主播申请事件
    on<HandleGuildAnchorApplyEvent>(
          (_) {
            int count = anchorApplyCount.value;
            count--;
            if(count <= 0){
              count = 0;
            }
            anchorApplyCount.value = count;
          },
    );
    /// 处理公会主播同意事件
    on(<AgreeGuildAnchorApplyEvent>(event) {
      pageNum = const PageNum();
      dataList.clear();
      loadData();
    });
  }

  /// 加载数据
  void loadData(){
    Future.delayed(const Duration(microseconds: 200),(){
      simpleTry(
              () => Api.Guild.guildAnchorList(page: pageNum),showProgress: true, callback: (result) {
        if(result != null && result is List){
          final List<AnchorModel> anchorModelList = [];
          for (final Map item in result){
            final anchorModel = AnchorModel.fromJson(item);
            anchorModelList.add(anchorModel);
          }
          dataList.addAll(anchorModelList);
          anchorModelList.length >= pageNum.size ? refreshController.loadComplete() : refreshController.loadNoData();
        }
      });
    });
  }

  /// 加载更多
  void loadMoreData(){
    pageNum = pageNum.nextPage();
    loadData();
  }

  /// 加载公会主播申请数量
  void loadGuildAnchorApplyCount(){
    Future.delayed(const Duration(microseconds: 300),(){
      simpleTry(
              () => Api.Guild.getGuildAnchorApplyCount(), callback: (result) {
        if(result != null && result is Map){
          final int total = result['total'];
          anchorApplyCount.value = total;
        }
      });
    });
  }

  /// 点击主播申请列表
  void clickAnchorApplyList() {
    Get.to(() => const AnchorApplyListPage());
  }
}