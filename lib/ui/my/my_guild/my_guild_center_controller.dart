
import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/model/guild_model.dart';
import 'package:app/ui/my/my_guild/anchor_list_page.dart';
import 'package:app/ui/my/my_guild/guild_flows_page.dart';
import 'package:app/ui/my/my_guild/guild_room_information_page.dart';
import 'package:app/ui/room/model/room_info_model.dart';

/// 我的公会控制器
class MyGuildCenterController extends GetxController with BusGetLifeMixin{
  /// 公会信息
  final GuildModel guildModel;
  MyGuildCenterController({required this.guildModel});
  /// 主播申请数量
  final anchorApplyCount = 0.obs;
  /// 公会房间列表
  RxList<RoomInfoModel> roomList = <RoomInfoModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    if(guildModel.isMaster){
      /// 会长身份
      loadGuildAnchorApplyCount();
      loadData();
    }

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

    /// 处理房间直播状态事件
    on<RoomLiveStatusChangeEvent>((event) {
      roomList.forEach((element) {
        if(element.roomId == event.roomId){
          element.status = event.isLive ? 1 : 2;
        }
      });
      update();
    });
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

  /// 加载数据
  void loadData() {
    Future.delayed(const Duration(microseconds:400),(){
      simpleTry(
              () => Api.Room.getGuildRoomList(guildNumber:guildModel.guildNo ?? "",statusList: [1,2]),
          showProgress: true,
          callback: (resp) {
            if (resp != null && resp is List) {
              final List itemList = resp;
              final List<RoomInfoModel> roomInfoModelList = [];
              for (final Map item in itemList) {
                final roomInfoModel = RoomInfoModel.fromJson(item);
                roomInfoModelList.add(roomInfoModel);
              }
              roomList.addAll(roomInfoModelList);
            }
          });
    });
  }

  /// 点击公会流水
  void clickGuildFlows(){
    Get.to(() => const GuildFlowsPage());
  }

  /// 点击主播列表
  void clickAnchorList(){
    Get.to(() => const AnchorListPage());
  }

  /// 点击房间信息
  void clickRoomInfo(RoomInfoModel infoModel){
    Get.to(() => GuildRoomInformationPage(roomId: infoModel.roomId ?? 0, isGuildMaster: guildModel.isMaster,));
  }
}