
import 'dart:math';
import 'package:app/store/user/user_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/model/guild_model.dart';
import 'package:app/widgets/spacing.dart';
import 'package:flutter/material.dart';

/// 公会名称和等级Widget
class GuildNameAndLevelWidget extends StatelessWidget {
  GuildNameAndLevelWidget({
    super.key,
    required this.guildModel,
    this.textStyle,
  });
  final GuildModel guildModel;
  TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          guildModel.showGuildName,
          style:textStyle ?? const TextStyle(
            fontSize: 16,
            color: Color(0xFF000000),
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
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
                  level: guildModel.level!);
            }
          },
          child: Image.asset(
            IMG.format(
                'my/guild_center_level_${min(guildModel.level!, 5)}'),
            width: 53,
            height: 17,
            scale: 3,
          ),
        )
            : const SizedBox(),
      ],
    );
  }
}
