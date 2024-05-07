import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/guild_information_controller.dart';
import 'package:app/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// 公会信息页面
class GuildInformationPage extends StatelessWidget {
  const GuildInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '公会信息'),
      body: GetBuilder<GuildInformationController>(
          init: GuildInformationController(),
          builder: (GuildInformationController controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacing.h20,
                _headerWidget(),
                Spacing.h30,
                _guildPresidentWidget(controller),
                Spacing.h20,
                _guildIntroduceWidget(),
              ],
            );
          }),
    );
  }

  /// 头部
  Widget _headerWidget() {
    return SizedBox(
      height: 60,
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
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
                          fontSize: 16, color: Color(0xFF000000)),
                    ),
                    Spacing.w4,
                    Image.asset(IMG.format('my/guild_center_level_1'),
                        width: 53, height: 17, scale: 3),
                  ],
                ),
                Row(
                  children: [
                    const Text("ID:1234567",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF999999))),
                    Spacing.w2,
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                          IMG.format('my/guild_center_copy_id_icon'),
                          width: 14,
                          height: 14,
                          scale: 3),
                    ),
                  ],
                ),
                const Text("创建时间:2024.3.28",
                    style: TextStyle(
                        fontSize: 12, color: Color(0xFF999999))),
              ],
            ),
          ),
          Spacing.w20,
        ],
      ),
    );
  }

 /// 公会会长
  Widget _guildPresidentWidget(GuildInformationController controller) {
    return Container(
      height: 50,
      padding: const Pad(horizontal: 20),
      child: Row(
        children: [
          const Text("公会会长",
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF000000),
                  fontWeight: fw$Bold,
                  )),
          const Spacing(),
          CachedNetworkImage(
            imageUrl:
                'https://t7.baidu.com/it/u=1595072465,3644073269&fm=193&f=GIF',
            width: 26,
            height: 26,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.0),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Spacing.w4,
          const Text("叮叮猫",
              style: TextStyle(
                  fontSize: 14, color: Color(0xFF000000),)),
          Image.asset(
            IMG.format("wode_icon_right"),
            width: 20,
            height: 20,
            color: Color(0xFF999999),
          ),
        ],
      ),
    );
  }

  /// 公会介绍
  Widget _guildIntroduceWidget() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "公会简介",
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF000000),
                  fontWeight: fw$Bold,
                  ),
            ),
            Spacing.h10,
            Text(
              "无忧传媒啦啦啦啦啦啦~无忧传媒啦啦啦啦啦啦~无忧传媒啦啦啦啦啦啦~无忧传媒啦啦啦啦啦啦~无忧传媒啦啦啦啦啦啦~无忧传媒啦啦啦啦啦啦~无忧传媒啦啦啦啦啦啦~无忧传媒啦啦啦啦啦啦~无忧传媒啦啦啦啦啦啦~",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF999999),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
