import 'dart:ui';
import 'package:app/common/theme.dart';
import 'package:app/store/user/user_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/guild_business_card_controller.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/blurred_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// 公会名片页面
class GuildBusinessCardPage extends StatelessWidget {
  const GuildBusinessCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuildBusinessCardController>(
        init: GuildBusinessCardController(),
        builder: (GuildBusinessCardController controller) {
          return Scaffold(
            body: Stack(
              children: [
                /// 背景图片
                Positioned(
                  left: 0,
                  top: 0,
                  height: 202 + MediaQueryData.fromView(window).padding.top,
                  width: Get.width,
                  child: BlurredNetworkImage(
                      height: 202 + MediaQueryData.fromView(window).padding.top,
                      width: Get.width,
                      imageUrl:
                          'https://t7.baidu.com/it/u=1595072465,3644073269&fm=193&f=GIF'),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  height: 202 + MediaQueryData.fromView(window).padding.top,
                  width: Get.width,
                  child: _buildBusinessCard(controller),
                ),
                Positioned(
                  left: 0,
                  top: 144 + MediaQueryData.fromView(window).padding.top,
                  height: Get.height -
                      (144 + MediaQueryData.fromView(window).padding.top),
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
      height: 202 + Get.statusBarHeight,
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
          GestureDetector(
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
                    child: const NetImage(
                        'https://t7.baidu.com/it/u=1595072465,3644073269&fm=193&f=GIF',
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
                        Row(
                          children: [
                            Text(
                              "公会名称",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Spacing.w4,
                            GestureDetector(
                              onTapDown:(TapDownDetails details) {
                                var tapPosition = details.globalPosition;
                                if (tapPosition != null) {
                                  tapPosition = tapPosition -
                                      const Offset(22, -5);
                                  Get.find<UserCtrl>().clickGuildLevel(
                                      anchorPoint: tapPosition!, level: 2);
                                }
                              },
                              child: Image.asset(
                                IMG.format('my/guild_center_level_1'),
                                width: 53,
                                height: 17,
                                scale: 3,
                              ),
                            ),
                          ],
                        ),
                        Text("ID:1234567",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            )),
                        XRichText(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                child: Padding(
                                  padding:const Pad(right: 4),
                                  child: Image.asset(
                                    IMG.format('my/guild_center_user_count'),
                                    width: 14,
                                    height: 14,
                                    scale: 3,
                                    color: Colors.white,
                                  ),
                                ),
                                alignment: PlaceholderAlignment.middle,
                              ),
                              const TextSpan(
                                text: '1111',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    IMG.format("wode_icon_right"),
                    width: 24,
                    height: 24,
                    color: Colors.white,
                  ),
                  Spacing.w10,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// 房间列表
  Widget _roomContainer(GuildBusinessCardController controller) {
    return GestureDetector(
      onTap: (){},
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: Get.height - (144 + MediaQueryData.fromView(window).padding.top),
        width: Get.width,
        decoration: const BoxDecoration(
          color: Colors.white,
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
            _joinGuildWidget(controller),
            _safeBottomWidget(),
          ],
        ),
      ),
    );
  }

  /// 头部widget
  Widget _headerWidget(GuildBusinessCardController controller) {
    return Padding(
      padding: Pad(left: 15, top: 15, bottom: 5),
      child: Text("公会房间(${controller.roomList.length})",
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF000000),
            fontWeight: fw$Bold,
          )),
    );
  }

  /// 房间列表widget
  Widget _roomGridViewWidget(GuildBusinessCardController controller) {
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
  Widget _roomItemBuilder(String item) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 147,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
            Container(
              padding: const Pad(vertical: 1, horizontal: 7),
              margin: const Pad(left: 3, top: 3),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFFBBAC), Color(0xFFFF7154)],
                ),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Text(item,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  )),
            ),
            Spacing.h2,
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: const NetImage(
                    'https://t7.baidu.com/it/u=1595072465,3644073269&fm=193&f=GIF',
                    width: 60,
                    height: 60,
                    fit: BoxFit.contain),
              ),
            ),
            Spacing.h10,
            Center(
              child: Text(
                "男女免费相亲",
                style: Color(0xFF000000).ptB(14),
              ),
            ),
            Spacing.h10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacing.w10,
                Text(
                  "ID:1234567",
                  style: Color(0xFF999999).pt(12),
                ),
                const Spacing(),
                Row(
                  children: [
                    Image.asset(
                      IMG.format('my/guild_center_room_hot_icon'),
                      width: 12,
                      height: 12,
                      scale: 3,
                    ),
                    Text(
                      "12345",
                      style: Color(0xFF999999).pt(12),
                    ),
                  ],
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
