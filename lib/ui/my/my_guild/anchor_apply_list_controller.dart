
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/my_guild/model/anchor_model.dart';
import 'package:app/widgets.dart';
import 'package:easy_refresh/easy_refresh.dart';

/// 主播申请列表控制器
class AnchorApplyListController extends GetxController {
  /// 数据列表
  RxList<AnchorModel> dataList = <AnchorModel>[].obs;
  /// 刷新控制器
  final EasyRefreshController easyRefreshController = EasyRefreshController(
    controlFinishRefresh: false,
    controlFinishLoad: true,
  );
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
          easyRefreshController.finishLoad(anchorModelList.length < pageNum.size ? IndicatorResult.noMore : IndicatorResult.success);
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
  }

  /// 点击同意
  void clickAgree(int index){
    final anchorModel = dataList[index];

  }
}