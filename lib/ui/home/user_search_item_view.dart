import 'package:app/common/theme.dart';
import 'package:app/ui/common/wealthy_level_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class UserSearchItemView extends StatelessWidget {
  final Map data;

  const UserSearchItemView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            WealthyLevelView(level: data['level']),
            Spacing.w4,
            Expanded(
              child: XText(
                '${data['username']}',
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
          ],
        ),
        Spacing.h4,
        XText(
          'ID ${data['public_id']}',
          style: const TextStyle(fontSize: 12, color: AppPalette.c6),
        ),
      ],
    );

    child = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const Pad(horizontal: 10),
          child: AvatarView(data['avatar_url'], blur: data['avatar_extra'], size: 40),
        ),
        Expanded(child: child),
      ],
    );

    child = InkWell(
      onTap: toUserPage(data['uid']),
      child: child,
    );

    child = Box(height: 40 + 8 * 2, child: child);

    return child;
  }
}
