import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/tools/text_extension.dart';
import 'package:app/ui/my/guild_center/apply_join_guild_controller.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

/// 申请加入公会页面
class ApplyJoinGuildPage extends StatelessWidget {
  const ApplyJoinGuildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApplyJoinGuildController>(
        init: ApplyJoinGuildController(),
        builder: (ApplyJoinGuildController controller) {
          return Scaffold(
            appBar: xAppBar(title: '申请加入'),
            body: Column(
              children: [
                Spacing.h20,
                _headerWidget(controller),
                Spacing.h40,
                _giftSharingWidget(controller),
                Spacing.h70,
                _bottomWidget(controller),
              ],
            ),
          );
        });
  }

  /// 头部
  Widget _headerWidget(ApplyJoinGuildController controller) {
    return Container(
        height: 60,
        color: Colors.white,
        padding: const Pad(horizontal: 20),
        child: Row(
          children: [
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
                          color: Color(0xFF000000),
                        ),
                      ),
                      Spacing.w4,
                      GestureDetector(
                        onTap: () {
                          RenderBox? renderBox = controller
                              .anchorKey.currentContext
                              ?.findRenderObject() as RenderBox?;
                          //获得控件正下方的坐标
                          var offset = renderBox?.localToGlobal(
                              Offset(0.0, renderBox.size.height));
                          if (offset != null) {
                            controller.clickGuildLevel(
                                anchorPoint: offset!, level: 2);
                          }
                        },
                        child: Image.asset(
                          IMG.format('my/guild_center_level_1'),
                          width: 53,
                          height: 17,
                          scale: 3,
                          key: controller.anchorKey,
                        ),
                      ),
                    ],
                  ),
                  Spacing.h2,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("ID:1234567",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF999999),
                          )),
                      Spacing.w6,
                      Container(
                        width: 1,
                        height: 6,
                        color: Color(0xFFCCCCCC),
                      ),
                      Spacing.w6,
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
                  Spacing.h2,
                  Text("创建时间:2024.3.28",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF999999),
                      )),
                ],
              ),
            ),
          ],
        ));
  }

  /// 收益分成
  Widget _giftSharingWidget(ApplyJoinGuildController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        XRichText(
          TextSpan(
            children: [
              WidgetSpan(
                child: Padding(
                  padding: const Pad(left: 20, right: 4),
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text("礼物抽佣比例",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF000000),
                  )),
              Spacing(),
              Text("40%",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF000000),
                  )),
            ],
          ),
        )
      ],
    );
  }

  /// 底部
  Widget _bottomWidget(ApplyJoinGuildController controller) {
    return Column(
      children: [
        const Text(
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
            onTap: () {}),
        Spacing.h4,
        const Text(
          "《公会入驻服务协议》",
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF819AFF),
          ),
        ).toBtn(width: 140, height: 27, onTap: () {}),
      ],
    );
  }
}
