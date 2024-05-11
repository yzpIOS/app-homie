import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/guild_business_card_page.dart';
import 'package:app/ui/my/guild_center/model/guild_model.dart';
import 'package:app/widgets.dart';
import 'package:easy_refresh/easy_refresh.dart';

/// 公会中心列表控制器
class GuildCenterListController extends GetxController {
  /// 搜索框控制器
  final textController = TextEditingController();
  /// 搜索框焦点
  FocusNode keywordFocus = FocusNode();
  /// 数据列表
  RxList<GuildModel> dataList = <GuildModel>[].obs;
  /// 是否加载数据
  final loadedData = false.obs;
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
  void loadData() {
    Future.delayed(const Duration(microseconds: 200), () {
      simpleTry(
              () => Api.Guild.guildRankList(page: pageNum,roomNoOrRoomIdString:textController.text),showProgress: true, callback: (result) {
        loadedData.value = true;
        if(result != null && result is List){
          final List<GuildModel> guildList = [];
          for (final Map item in result){
            final guildModel = GuildModel.fromJson(item);
            guildList.add(guildModel);
          }
          dataList.addAll(guildList);
          easyRefreshController.finishLoad(guildList.length < pageNum.size ? IndicatorResult.noMore : IndicatorResult.success);
        }
      });
    });
  }

  /// 加载更多
  void loadMoreData(){
    pageNum.nextPage();
    loadData();
  }

  /// 点击搜索
  void clickSearch(){
    keywordFocus.unfocus();
    dataList.clear();
    pageNum = const PageNum();
    loadData();
  }

  /// 点击列表项
  void clickItem(int index) {
    keywordFocus.unfocus();
    Get.to(() => GuildBusinessCardPage(guildModel: dataList[index],));
  }
}