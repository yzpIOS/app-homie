import 'package:app/common/theme.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/level_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class RoomUserItemView extends StatelessWidget {
  final UID uid;
  final EdgeInsetsGeometry? padding;

  const RoomUserItemView({super.key, required this.uid, this.padding = const Pad(horizontal: 20)});

  @override
  Widget build(BuildContext context) {
    return Box(
      height: 70,
      padding: padding,
      child: UserInfoCtrl.use(
        uid,
        builder: (it) => it == null ? Spacing.blank : itemBuilder(it),
      ),
    );
  }

  Widget itemBuilder(UserInfoDto data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AvatarView(data.avatar, blur: data.avatarEx, size: 40),
        Spacing.w10,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.showName(),
                style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$Medium),
              ),
              Spacing.h4,
              LevelView(level: data.level, height: 13),
            ],
          ),
        ),
      ],
    );
  }
}
