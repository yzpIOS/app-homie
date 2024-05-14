import 'dart:ui';
import 'package:app/common/theme.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/user/user_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/guild_business_card_controller.dart';
import 'package:app/ui/my/guild_center/model/guild_model.dart';
import 'package:app/ui/room/model/room_info_model.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/blurred_network_image.dart';
import 'package:flutter/material.dart';

/// 公会名片页面
class GuildBusinessCardPage extends StatelessWidget {
  /// 公会信息
  final GuildModel guildModel;

  const GuildBusinessCardPage({super.key, required this.guildModel});

  /// 名片高度
  final double businessCardHeight = 202.0;
  /// 房间容器距离顶部距离
  final double roomContainerTopMargin = 144.0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuildBusinessCardController>(
        init: GuildBusinessCardController(guildModel: guildModel),
        builder: (GuildBusinessCardController controller) {
          return Scaffold(
            body: Stack(
              children: [
                /// 背景图片
                Positioned(
                  left: 0,
                  top: 0,
                  height: businessCardHeight + MediaQueryData.fromView(window).padding.top,
                  width: Get.width,
                  child: BlurredNetworkImage(
                      height: businessCardHeight + MediaQueryData.fromView(window).padding.top,
                      width: Get.width,
                      blurSigma: 10,
                      imageUrl: guildModel.icon ?? ""),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  height: businessCardHeight + MediaQueryData.fromView(window).padding.top,
                  width: Get.width,
                  child: _buildBusinessCard(controller),
                ),
                Positioned(
                  left: 0,
                  top: roomContainerTopMargin + MediaQueryData.fromView(window).padding.top,
                  height: Get.height -
                      (roomContainerTopMargin + MediaQueryData.fromView(window).padding.top),
                  width: Get.width,
                  child: _roomContainer(controller),
                ),
              ],
            ),
          );
        });
  }

  /// 公会名片
  Widget _buildBusinessCard(GuildBusinessCardController controller) {
    return SizedBox(
      height: businessCardHeight + Get.statusBarHeight,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: MediaQueryData.fromView(window).padding.top),
          SizedBox(
            height: 44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Spacing.w10,
                GestureDetector(
                  onTap: () {
                    controller.clickBack();
                  },
                  child: Image.asset(
                    IMG.format("icon_back_baise"),
                    fit: BoxFit.cover,
                    width: 24,
                    height: 24,
                  ),
                ),
                const Spacing(),
                Text("公会名片", style: Colors.white.ptB(18)),
                const Spacing(),
                Spacing.w24,
                Spacing.w10,
              ],
            ),
          ),
          Spacing.h20,
          _buildGuildInfoWidget(controller),
        ],
      ),
    );
  }

  /// 公会信息
  Widget _buildGuildInfoWidget(GuildBusinessCardController controller) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        controller.clickRoomInfo();
      },
      child: SizedBox(
        height: 60,
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacing.w10,
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: NetImage(
                guildModel.icon ?? "",
                placeholderImage: Image.asset(
                    IMG.format('my/guild_center_normal_icon'),
                    width: 60,
                    height: 60),
                width: 60,
                height: 60,
                fit: BoxFit.contain,
              ),
            ),
            Spacing.w10,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          guildModel.guildName ?? "",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Spacing.w4,
                      guildModel.level != null && guildModel.level! > 0
                          ? GestureDetector(
                              onTapDown: (TapDownDetails details) {
                                var tapPosition = details.globalPosition;
                                if (tapPosition != null) {
                                  tapPosition =
                                      tapPosition - const Offset(22, -5);
                                  Get.find<UserCtrl>().clickGuildLevel(
                                      anchorPoint: tapPosition!,
                                      level: guildModel.level! + 1);
                                }
                              },
                              child: Image.asset(
                                IMG.format(
                                    'my/guild_center_level_${guildModel.level! + 1}'),
                                width: 53,
                                height: 17,
                                scale: 3,
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  Spacing.h1,
                  Text("ID:${guildModel.guildNo}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFFDDDDDD),
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
                              color: const Color(0xFFDDDDDD),
                            ),
                          ),
                          alignment: PlaceholderAlignment.middle,
                        ),
                        TextSpan(
                          text: '${guildModel.anchorNum ?? '0'}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFFDDDDDD),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              IMG.format("my/icon_right_white"),
              width: 24,
              height: 24,
            ),
            Spacing.w10,
          ],
        ),
      ),
    );
  }

  /// 房间列表
  Widget _roomContainer(GuildBusinessCardController controller) {
    return Container(
      height: Get.height - (roomContainerTopMargin + MediaQueryData.fromView(window).padding.top),
      width: Get.width,
      decoration: const BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headerWidget(controller),
          _roomGridViewWidget(controller),
          controller.userIsExistGuild == false && (guildModel.anchorType == null || guildModel.anchorType! < 1)
              ? _joinGuildWidget(controller)
              : const SizedBox(
                  height: 1,
                ),
          _safeBottomWidget(),
        ],
      ),
    );
  }

  /// 头部widget
  Widget _headerWidget(GuildBusinessCardController controller) {
    return Padding(
      padding: const Pad(left: 15, top: 15, bottom: 5),
      child: Obx(() {
        return Text(controller.roomList.isNotEmpty ? "公会房间(${controller.roomList.length})" : "公会房间",
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF000000),
              fontWeight: fw$Bold,
            ));
      }),
    );
  }

  /// 房间列表widget
  Widget _roomGridViewWidget(GuildBusinessCardController controller) {
    return Obx(() {
      return Expanded(
        child: GridView(
          padding: const Pad(horizontal: 20, bottom: 10, top: 5),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 147,
            mainAxisSpacing: 20,
            crossAxisSpacing: 22,
          ),
          children:
              controller.roomList.map(_roomItemBuilder).toList(growable: false),
        ),
      );
    });
  }

  /// 加入公会widget
  Widget _joinGuildWidget(GuildBusinessCardController controller) {
    return GestureDetector(
      onTap: () {
        controller.clickApplyJoinGuild();
      },
      child: Container(
        padding: const Pad(top: 10, bottom: 2),
        alignment: Alignment.center,
        child: Image.asset(
          IMG.format('my/guild_center_apply_join_icon'),
          width: 280,
          height: 38,
          scale: 3,
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

  /// 房间item
  Widget _roomItemBuilder(RoomInfoModel roomInfoModel) {
    return InkWell(
      onTap: () {
        Get.find<RoomManagerCtrl>().toRoom(roomId: roomInfoModel.roomId ?? 0);
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (roomInfoModel.classifyName != null &&
                    roomInfoModel.classifyName!.isNotEmpty)
                ? Container(
                    padding: const Pad(vertical: 1, horizontal: 7),
                    margin: const Pad(left: 3, top: 3),
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
}
