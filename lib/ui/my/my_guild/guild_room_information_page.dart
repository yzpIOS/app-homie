import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/my_guild/guild_room_information_controller.dart';
import 'package:app/widgets/app_bar.dart';
import 'package:app/widgets/image/network_cache_image.dart';
import 'package:app/widgets/spacing.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

/// 公会房间信息
class GuildRoomInformationPage extends StatelessWidget {
  final int roomId;
  final bool isGuildMaster;
  const GuildRoomInformationPage({super.key, required this.roomId,required this.isGuildMaster});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuildRoomInformationController>(
        init: GuildRoomInformationController(roomId: roomId),
        builder: (GuildRoomInformationController controller) {
          return Scaffold(
            appBar: xAppBar(title: '房间信息'),
            body: ColoredBox(
              color: const Color(0xFFF5F5F5),
              child: Column(
                children: [
                  _buildHeader(controller),
                  if(isGuildMaster) _buildRoomSettingWidget(controller),
                  _roomNoticeWidget(controller)
                ],
              ),
            ),
          );
        });
  }

  /// 头部
  Widget _buildHeader(GuildRoomInformationController controller) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          Spacing.h20,
          SizedBox(
            height: 60,
            child: Obx(() {
              return Row(children: [
                Spacing.w20,
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: NetImage(controller.roomInfoModel.value.image,
                      placeholderImage: Image.asset(
                          IMG.format('my/guild_center_normal_icon'),
                          width: 60,
                          height: 60),
                      width: 60,
                      height: 60,
                      fit: BoxFit.contain),
                ),
                Spacing.w10,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacing.h8,
                      Text(
                        controller.roomInfoModel.value.roomName ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF000000),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Spacing.h6,
                      Text("ID:${controller.roomInfoModel.value.roomNo ?? ''}",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF999999),
                          )),
                      const Spacing(),
                    ],
                  ),
                ),
                Spacing.w20,
              ]);
            }),
          ),
          Spacing.h20,
        ],
      ),
    );
  }

  /// 房间设置
  Widget _buildRoomSettingWidget(GuildRoomInformationController controller){
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        controller.clickRoomSetting();
      },
      child: Container(
        height: 50,
        margin: const Pad(horizontal: 10, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Spacing.w10,
            Text(
              "房间设置",
              style: const Color(0xFF000000).ptB(14),
            ),
            const Spacing(),
            Image.asset(
              IMG.format("wode_icon_right"),
              width: 24,
              height: 24,
            ),
            Spacing.w10,
          ],
        ),
      ),
    );
  }

  /// 房间公告
  Widget _roomNoticeWidget(GuildRoomInformationController controller) {
    return Container(
      width: Get.width - 2 * 10,
      margin: const Pad(horizontal: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacing.h10,
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "房间公告",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF000000),
                fontWeight: fw$Bold,
              ),
            ),
          ),
          Spacing.h10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              controller.roomInfoModel.value.noticeMessage ?? '目前暂无公告',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF999999),
              ),
            ),
          ),
          Spacing.h10,
        ],
      ),
    );
  }
}
