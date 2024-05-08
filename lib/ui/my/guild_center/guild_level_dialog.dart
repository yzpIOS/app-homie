import 'package:app/tools.dart';
import 'package:app/tools/text_extension.dart';
import 'package:app/ui/my/guild_center/guild_level_dialog_controller.dart';
import 'package:app/ui/my/guild_center/guild_level_info_model.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

/// 公会等级弹窗
class GuildLevelDialog extends StatelessWidget {
  Offset showAnchorPoint;
  GuildLevelInfoModel guildLevelInfoModel;

  GuildLevelDialog(
      {super.key,
      required this.showAnchorPoint,
      required this.guildLevelInfoModel});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<GuildLevelDialogController>(
        init: GuildLevelDialogController(),
        builder: (GuildLevelDialogController controller) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              alignment: Alignment.topLeft,
              children: [
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () {
                      controller.clickBack();
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      color: Colors.black.withAlpha(80),
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
                Positioned(
                  left: showAnchorPoint.dx - 15,
                  top: (showAnchorPoint.dy ?? 0) + 5,
                  child: Container(
                    width: 214,
                    height: 221,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              IMG.format('my/guild_center_level_dialog_background')),
                          fit: BoxFit.fill,
                        )),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 14,
                          top: 12,
                          width: 80,
                          height: 80,
                          child: Image.asset(
                            IMG.format(guildLevelInfoModel.levelImageName),
                            width: 80,
                            height: 80,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Spacing.h18,
                              const Text(
                                "当前评级",
                                style:
                                TextStyle(color: Color(0XFFCD8E00), fontSize: 16),
                              ),
                              Spacing.h2,
                              const Text(
                                "每月1日刷新评级",
                                style: TextStyle(
                                  color: Color(0XFF999999),
                                  fontSize: 12,
                                ),
                              ),
                              Spacing.h20,
                              const Text(
                                "公会规模要求",
                                style: TextStyle(
                                  color: Color(0XFF999999),
                                  fontSize: 14,
                                ),
                              ),
                              Spacing.h4,
                              Text(
                                guildLevelInfoModel.fireString,
                                style: const TextStyle(
                                  color: Color(0XFFCD8E00),
                                  fontSize: 14,
                                ),
                              ),
                              Spacing.h4,
                              Text(
                                guildLevelInfoModel.userCountString,
                                style: const TextStyle(
                                  color: Color(0XFFCD8E00),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          width: 126,
                          height: 24,
                          bottom: 20,
                          left: (214 - 126)/2.0,
                          child: Text(
                            '查看等级说明',
                            style: const Color(0xFFCD8E00).pt(12),
                          ).toBtn(
                              width: 126,
                              height: 24,
                              radius: 12,
                              bg: const Color(0xFFFFF9DC),
                              onTap: () {
                                controller.clickLevelIntroduce();
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
