import 'package:app/store/user/user_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/my_guild/my_guild_center_controller.dart';
import 'package:app/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// 我的公会页面
class MyGuildCenterPage extends StatelessWidget {
  const MyGuildCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyGuildCenterController>(
        init: MyGuildCenterController(),
        builder: (MyGuildCenterController controller) {
          return ColoredBox(
            color:const Color(0xFFF5F5F5),
            child: Column(
              children: [
                _buildHeader(controller),
                _buildMyProfitSharingItem(),
                _buildGuildFlowsItem(controller),
                _buildAnchorListItem(controller)
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
                            style: const TextStyle(fontSize: 16, color: Color(0xFF000000),),
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
                          style: const TextStyle(fontSize: 12, color: Color(0xFF999999),)),
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
                                  color: Color(0xFF999999),
                                ),
                              ),
                              alignment: PlaceholderAlignment.middle,
                            ),
                            const TextSpan(
                              text: '1111',
                              style: TextStyle(
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
              ]),),
          Spacing.h20,
        ],
      ),
    );
  }

  /// 我的收益分成
  Widget _buildMyProfitSharingItem() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        margin: const Pad(horizontal: 10,top: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),
          color: Colors.white,),
        child: Row(
          children: [
            Spacing.w10,
            Text(
              "我的收益分成",
              style: Color(0xFF000000).ptB(14),
            ),
            const Spacing(),
            Text(
              "63%",
              style: Color(0xFF000000).pt(14),
            ),
            Spacing.w10,
          ],
        ),
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
        margin: const Pad(horizontal: 10,top: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),
          color: Colors.white,),
        child: Row(
          children: [
            Spacing.w10,
            Text(
              "公会流水",
              style: Color(0xFF000000).ptB(14),
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
        margin: const Pad(horizontal: 10,top: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),
          color: Colors.white,),
        child: Row(
          children: [
            Spacing.w10,
            Text(
              "主播列表",
              style: Color(0xFF000000).ptB(14),
            ),
            const Spacing(),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFE3D3D), // 背景颜色
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(10.0), // 左圆角
                    right: Radius.circular(10.0), // 右圆角
                  )
              ),
              padding: const Pad(horizontal: 4,vertical: 2),
              child: Text(
                "99+",
                style: Colors.white.pt(10),
              ),
            ),
            Spacing.w10,
          ],
        ),
      ),
    );
  }
}
