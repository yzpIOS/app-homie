import 'package:app/common/theme.dart';
import 'package:app/store/user/user_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/guild_information_controller.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

/// 公会信息页面
class GuildInformationPage extends StatelessWidget {
  /// 公会号
  final String guildNumber;

  const GuildInformationPage({super.key, required this.guildNumber});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuildInformationController>(
        init: GuildInformationController(guildNumber: guildNumber),
        builder: (GuildInformationController controller) {
          return Scaffold(
            appBar: xAppBar(title: '公会信息'),
            body: ColoredBox(
              color: const Color(0xFFF5F5F5),
              child: Obx(() {
                return controller.loadedData.value == true
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          _headerWidget(controller),
                          _guildPresidentWidget(controller),
                          _guildIntroduceWidget(controller),
                        ],
                      )
                    : const SizedBox();
              }),
            ),
          );
        });
  }

  /// 头部
  Widget _headerWidget(GuildInformationController controller) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          Spacing.h20,
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacing.w20,
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: NetImage(controller.guildModel.value.icon ?? '',
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
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              controller.guildModel.value.guildName ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF000000),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Spacing.w4,
                          controller.guildModel.value.level != null &&
                                  controller.guildModel.value.level! > 0
                              ? GestureDetector(
                                  onTapDown: (TapDownDetails details) {
                                    var tapPosition = details.globalPosition;
                                    if (tapPosition != null) {
                                      tapPosition =
                                          tapPosition - const Offset(22, -5);
                                      Get.find<UserCtrl>().clickGuildLevel(
                                          anchorPoint: tapPosition!,
                                          level: controller
                                              .guildModel.value.level!);
                                    }
                                  },
                                  child: Image.asset(
                                    IMG.format(
                                        'my/guild_center_level_${controller.guildModel.value.level!}'),
                                    width: 53,
                                    height: 17,
                                    scale: 3,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                      Spacing.h1,
                      Row(
                        children: [
                          Text("ID:${controller.guildModel.value.guildNo}",
                              style: const TextStyle(
                                  fontSize: 12, color: Color(0xFF999999))),
                          Spacing.w2,
                          GestureDetector(
                            onTap: () {
                              controller.clickCopy();
                            },
                            child: Image.asset(
                                IMG.format('my/guild_center_copy_id_icon'),
                                width: 14,
                                height: 14,
                                scale: 3),
                          ),
                        ],
                      ),
                      Spacing.h1,
                      Text("创建时间:${controller.guildModel.value.createAt}",
                          style: const TextStyle(
                              fontSize: 12, color: Color(0xFF999999))),
                    ],
                  ),
                ),
                Spacing.w20,
              ],
            ),
          ),
          Spacing.h20,
        ],
      ),
    );
  }

  /// 公会会长
  Widget _guildPresidentWidget(GuildInformationController controller) {
    return GestureDetector(
      onTap: () {
        controller.clickGuildMaster();
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 50,
        margin: const Pad(horizontal: 10, top: 10),
        padding: const Pad(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        child: Row(
          children: [
            const Text("公会会长",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF000000),
                  fontWeight: fw$Bold,
                )),
            const Spacing(),
            ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: NetImage(controller.guildModel.value.masterAvatar ?? '',
                  width: 26, height: 26, fit: BoxFit.contain),
            ),
            Spacing.w4,
            Text(controller.guildModel.value.masterUsername ?? '',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF000000),
                )),
            Image.asset(
              IMG.format("wode_icon_right"),
              width: 20,
              height: 20,
              color: const Color(0xFF999999),
            ),
          ],
        ),
      ),
    );
  }

  /// 公会介绍
  Widget _guildIntroduceWidget(GuildInformationController controller) {
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
              "公会简介",
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
              controller.guildModel.value.introduction ?? '',
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
