
import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/my_guild/model/anchor_model.dart';
import 'package:app/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 主播申请列表控制器
class AnchorApplyListController extends GetxController {
  /// 数据列表
  RxList<AnchorModel> dataList = <AnchorModel>[].obs;
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
              () => Api.Guild.guildAnchorApplyList(page: pageNum),showProgress: true, callback: (result) {
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
    pageNum.nextPage();
    loadData();
  }

  /// 点击拒绝
  void clickRefuse(int index){
    final anchorModel = dataList[index];
    handleApply(index: index, userId: anchorModel.publicId ?? '', isAgree: false);
  }

  /// 点击同意
  void clickAgree(int index){
    final anchorModel = dataList[index];
    handleApply(index: index, userId: anchorModel.publicId ?? '', isAgree: true);
  }

  /// 处理申请
  void handleApply({required int index, required String userId,required bool isAgree}){
    Future.delayed(const Duration(microseconds: 200),(){
      simpleTry(
              () => Api.Guild.handleGuildAnchorApply(userId: userId,isAgree: isAgree),showProgress: true, callback: (result) {
        showToast("处理成功");
        const HandleGuildAnchorApplyEvent().fire();
        dataList.removeAt(index);
      });
    });
  }
}