import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/my_guild_center_controller.dart';
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
          return Column(
            children: [
              Spacing.h18,
              _buildHeader(),
              Spacing.h30,
              _buildMyProfitSharingItem(),
              Spacing.h10,
              _buildGuildFlowsItem(),
              Spacing.h10,
              _buildAnchorListItem()
            ],
          );
        });
  }

  /// 头部
  Widget _buildHeader() {
    return SizedBox(
        height: 60,
        child: Row(children: [
          Spacing.w20,
          CachedNetworkImage(
            imageUrl:
                'https://t7.baidu.com/it/u=1595072465,3644073269&fm=193&f=GIF',
            width: 60,
            height: 60,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
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
                      style: const TextStyle(fontSize: 16, color: Color(0xFF000000),height: 1.5),
                    ),
                    Spacing.w4,
                    Image.asset(IMG.format('my/guild_center_level_1'),
                        width: 53, height: 17, scale: 3)
                  ],
                ),
                Text("ID:1234567",
                    style: const TextStyle(fontSize: 12, color: Color(0xFF999999),height: 1.5)),
                Row(
                  children: [
                    Image.asset(IMG.format('my/guild_center_user_count'),
                        width: 14, height: 14, scale: 3),
                    Spacing.w4,
                    Text("1111",
                        style:
                            const TextStyle(fontSize: 12, color: Color(0xFF000000),height: 1.5)),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                )
              ],
            ),
          ),
          Spacing.w20,
        ]));
  }

  /// 我的收益分成
  Widget _buildMyProfitSharingItem() {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Spacing.w20,
            Text(
              "我的收益分成",
              style: Color(0xFF000000).ptB(14),
            ),
            const Spacing(),
            Text(
              "63%",
              style: Color(0xFF000000).pt(14),
            ),
            Spacing.w20,
          ],
        ),
      ),
    );
  }

  /// 公会流水
  Widget _buildGuildFlowsItem() {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Spacing.w20,
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
            Spacing.w20,
          ],
        ),
      ),
    );
  }

  /// 主播列表
  Widget _buildAnchorListItem() {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Spacing.w20,
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
              padding: const Pad(horizontal: 4),
              child: Text(
                "99+",
                style: Colors.white.pt(10),
              ),
            ),
            Spacing.w20,
          ],
        ),
      ),
    );
  }
}
