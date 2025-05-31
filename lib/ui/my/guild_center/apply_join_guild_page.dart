import 'package:app/common/theme.dart';
import 'package:app/store/config_ctrl.dart';
import 'package:app/store/user/user_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/tools/text_extension.dart';
import 'package:app/ui/my/guild_center/apply_join_guild_controller.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

/// 申请加入公会页面
class ApplyJoinGuildPage extends StatelessWidget {
  /// 公会号
  final String guildNumber;
  const ApplyJoinGuildPage({super.key, required this.guildNumber});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApplyJoinGuildController>(
        init: ApplyJoinGuildController(guildNumber: guildNumber),
        builder: (ApplyJoinGuildController controller) {
          return Scaffold(
            appBar: xAppBar(title: '申请加入'),
            body: ColoredBox(
              color: const Color(0xFFF5F5F5),
              child: Obx(() {
                return controller.loadedData.value == true
                    ? Column(
                        children: [
                          _headerWidget(controller),
                          _giftSharingWidget(controller),
                        ],
                      )
                    : const SizedBox();
              }),
            ),
          );
        });
  }

  /// 头部
  Widget _headerWidget(ApplyJoinGuildController controller) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          Spacing.h20,
          Container(
              height: 60,
              color: Colors.white,
              padding: const Pad(horizontal: 20),
              child: Row(
                children: [
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("ID:${controller.guildModel.value.guildNo}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF999999),
                                )),
                            Spacing.w6,
                            Container(
                              width: 1,
                              height: 6,
                              color: const Color(0xFFCCCCCC),
                            ),
                            Spacing.w6,
                            XRichText(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const Pad(right: 4),
                                      child: Image.asset(
                                        IMG.format(
                                            'my/guild_center_user_count'),
                                        width: 14,
                                        height: 14,
                                        scale: 3,
                                        color: const Color(0xFF999999),
                                      ),
                                    ),
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                  TextSpan(
                                    text:
                                        '${controller.guildModel.value.anchorNum ?? 0}',
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
                        Spacing.h1,
                        Text('创建时间:${controller.guildModel.value.createAt}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF999999),
                            )),
                      ],
                    ),
                  ),
                ],
              )),
          Spacing.h20,
        ],
      ),
    );
  }

  /// 收益分成
  Widget _giftSharingWidget(ApplyJoinGuildController controller) {
    return Container(
      margin: const Pad(horizontal: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacing.h10,
          XRichText(
            TextSpan(
              children: [
                WidgetSpan(
                  child: Padding(
                    padding: const Pad(left: 10, right: 4),
                    child: Image.asset(
                      IMG.format('my/guild_center_gift_sharing_line'),
                      width: 4,
                      height: 12,
                      scale: 3,
                    ),
                  ),
                  alignment: PlaceholderAlignment.middle,
                ),
                const TextSpan(
                  text: '收益分成',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF000000),
                      fontWeight: fw$Bold),
                ),
              ],
            ),
          ),
          Spacing.h10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                const Text("礼物抽佣比例",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF000000),
                    )),
                const Spacing(),
                Text(controller.guildModel.value.anchorLedgerRatio ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF000000),
                    )),
              ],
            ),
          ),
          Spacing.h70,
          Center(
            child: const Text(
              "申请加入",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ).toBtn(
                width: 280,
                height: 38,
                radius: 21,
                colors: const [Color(0xFFE3B5FF), Color(0xFFBA4EFB)],
                onTap: () {
                  controller.clickApplyJoinGuild();
                }),
          ),
          Spacing.h4,
          Center(
            child: const Text(
              "《公会入驻服务协议》",
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF819AFF),
              ),
            ).toBtn(width: 140, height: 27, onTap: () {
              Get.find<ConfigCtrl>().onTapLink('公会入驻服务协议', 'guild_protocol');
            }),
          ),
          Spacing.h16,
        ],
      ),
    );
  }
}
