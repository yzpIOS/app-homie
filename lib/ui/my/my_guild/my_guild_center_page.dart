import 'dart:ui';

import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/model/guild_model.dart';
import 'package:app/ui/my/guild_center/widget/guild_name_and_level_widget.dart';
import 'package:app/ui/my/my_guild/my_guild_center_controller.dart';
import 'package:app/ui/room/model/room_info_model.dart';
import 'package:app/ui/room/updateLevel/charm_level_update_marquee_view.dart';
import 'package:app/ui/room/updateLevel/wealth_level_update_marquee_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

/// 我的公会页面
class MyGuildCenterPage extends StatelessWidget {
  final GuildModel guildModel;

  const MyGuildCenterPage({super.key, required this.guildModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyGuildCenterController>(
        init: MyGuildCenterController(guildModel: guildModel),
        builder: (MyGuildCenterController controller) {
          return ColoredBox(
            color: const Color(0xFFF5F5F5),
            child: Column(
              children: [
                _buildHeader(controller),
                // WealthLevelUpdateMarqueeView(data: S_UpdateLevel_All(avatarUrl:'https://img0.baidu.com/it/u=4100494086,838221599&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=800',userName:'四川自贡男子',level:60,type:1),),
                // CharmLevelUpdateMarqueeView(data: S_UpdateLevel_All(avatarUrl:'https://img0.baidu.com/it/u=4100494086,838221599&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=800',userName:'四川自贡男子',level:10,type:2),),
                _buildMyProfitSharingItem(),
                if (guildModel.isMaster) ...[
                  _buildGuildFlowsItem(controller),
                  _buildAnchorListItem(controller),
                ],
                _roomGridViewWidget(controller),
                _safeBottomWidget()
              ],
            ),
          );
        });
  }

  /// 头部
  Widget _buildHeader(MyGuildCenterController controller) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          Spacing.h20,
          SizedBox(
            height: 60,
            child: Row(children: [
              Spacing.w20,
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: NetImage(guildModel.icon,
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
                    GuildNameAndLevelWidget(guildModel: guildModel),
                    Spacing.h1,
                    Text("ID:${guildModel.guildNo}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF999999),
                        )),
                    Spacing.h1,
                    XRichText(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: Padding(
                              padding: const Pad(right: 4),
                              child: Image.asset(
                                IMG.format('my/guild_center_user_count'),
                                width: 14,
                                height: 14,
                                scale: 3,
                                color: const Color(0xFF999999),
                              ),
                            ),
                            alignment: PlaceholderAlignment.middle,
                          ),
                          TextSpan(
                            text: '${guildModel.anchorNum ?? 0}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF999999),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacing.w20,
            ]),
          ),
          Spacing.h20,
        ],
      ),
    );
  }

  /// 我的收益分成
  Widget _buildMyProfitSharingItem() {
    return Container(
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
            "我的收益分成",
            style: const Color(0xFF000000).ptB(14),
          ),
          const Spacing(),
          Text(
            guildModel.anchorLedgerRatio ?? '',
            style: const Color(0xFF000000).pt(14),
          ),
          Spacing.w10,
        ],
      ),
    );
  }

  /// 公会流水
  Widget _buildGuildFlowsItem(MyGuildCenterController controller) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        controller.clickGuildFlows();
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
              "公会流水",
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

  /// 主播列表
  Widget _buildAnchorListItem(MyGuildCenterController controller) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        controller.clickAnchorList();
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
              "主播列表",
              style: const Color(0xFF000000).ptB(14),
            ),
            const Spacing(),
            Obx(() {
              if (controller.anchorApplyCount.value == 0) {
                return Image.asset(
                  IMG.format("wode_icon_right"),
                  width: 24,
                  height: 24,
                );
              } else if (controller.anchorApplyCount.value >= 10) {
                return Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFFFE3D3D), // 背景颜色
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10.0), // 左圆角
                        right: Radius.circular(10.0), // 右圆角
                      )),
                  padding: const Pad(horizontal: 4, vertical: 2),
                  child: Obx(() {
                    return Text(
                      controller.anchorApplyCount.value > 99
                          ? "99+"
                          : controller.anchorApplyCount.string,
                      style: Colors.white.pt(10),
                    );
                  }),
                );
              } else {
                return Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFE3D3D), // 背景颜色
                    borderRadius: BorderRadius.circular(7.0), // 圆角
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    controller.anchorApplyCount.string,
                    style: Colors.white.pt(10),
                  ),
                );
              }
            }),
            Spacing.w10,
          ],
        ),
      ),
    );
  }

  /// 房间列表widget
  Widget _roomGridViewWidget(MyGuildCenterController controller) {
    return Expanded(
      child: Container(
          padding: const Pad(left: 5, right: 5),
          margin: const Pad(
            left: 10,
            right: 10,
            top: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacing.h10,
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                      controller.roomList.isNotEmpty
                          ? "公会房间(${controller.roomList.length})"
                          : "公会房间",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF000000),
                        fontWeight: fw$Bold,
                      )),
                ),
                Spacing.h6,
                controller.roomList.isEmpty
                    ? SizedBox(width: Get.width,)
                    : Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 147,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 22,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return _roomItemBuilder(
                                controller, controller.roomList[index]);
                          },
                          itemCount: controller.roomList.length,
                          padding: const Pad(horizontal: 5, bottom: 10, top: 5),
                          shrinkWrap: true,
                        ),
                      )
              ],
            );
          })),
    );
  }

  /// 房间item
  Widget _roomItemBuilder(
      MyGuildCenterController controller, RoomInfoModel roomInfoModel) {
    return InkWell(
      onTap: () {
        controller.clickRoomInfo(roomInfoModel);
      },
      child: Container(
        height: 147,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
                color: const Color(0xFF000000).withOpacity(0.1),
                offset: const Offset(0.0, 2.0), //阴影y轴偏移量
                blurRadius: 4, //阴影模糊程度
                spreadRadius: 1 //阴影扩散程度
                )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 5,),
            Row(
              children: [
                const SizedBox(width: 5,),
                (roomInfoModel.classifyName != null &&
                    roomInfoModel.classifyName!.isNotEmpty)
                    ? Container(
                  padding: const Pad(vertical: 1, horizontal: 7),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors:roomInfoModel.classifyIconColorList,
                    ),
                    borderRadius:const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Text(roomInfoModel.classifyName ?? "",
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      )),
                )
                    : const SizedBox(
                  width: 34,
                  height: 16,
                ),
                const Spacing(),
                Container(
                  padding: const Pad(vertical: 1, horizontal: 7),
                  decoration: BoxDecoration(
                    color: roomInfoModel.isRoomOpenLive
                        ? const Color(0xFF7E8BFF)
                        : const Color(0xFFD8D8D8),
                    borderRadius:
                    const BorderRadius.all(Radius.circular(3.0)),
                  ),
                  child: Text(roomInfoModel.isRoomOpenLive ? "开播" : "关播",
                      style: TextStyle(
                        fontSize: 10,
                        color: roomInfoModel.isRoomOpenLive
                            ? Colors.white
                            : const Color(0xFF333333),
                      )),
                ),
                const SizedBox(width: 5,),
              ],
            ),
            Spacing.h2,
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: NetImage(roomInfoModel.image,
                    width: 60, height: 60, fit: BoxFit.contain),
              ),
            ),
            Spacing.h10,
            Center(
              child: Text(
                roomInfoModel.roomName ?? "",
                style: const Color(0xFF000000).ptB(14).copyWith(height: 1.5),
              ),
            ),
            Spacing.h10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacing.w10,
                Text(
                  "ID:${roomInfoModel.roomNo}",
                  style: const Color(0xFF999999).pt(12),
                ),
                const Spacing(),
                XRichText(
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: Image.asset(
                          IMG.format('my/guild_center_room_hot_icon'),
                          width: 14,
                          height: 14,
                        ),
                        alignment: PlaceholderAlignment.middle,
                      ),
                      TextSpan(
                        text: '${roomInfoModel.hotValue ?? 0}',
                        style: const Color(0xFF999999).pt(12),
                      ),
                    ],
                  ),
                ),
                Spacing.w10,
              ],
            )
          ],
        ),
      ),
    );
  }

  /// 安全底部widget
  Widget _safeBottomWidget() {
    return SizedBox(
      height: MediaQueryData.fromView(window).padding.bottom,
    );
  }
}
