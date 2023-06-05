import 'dart:math';

import 'package:app/common/theme.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/ui/room/widgets/room_get_widget.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class NoticeOverlay extends RoomGetView<RoomCtrl> {
  const NoticeOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final notice = controller.noticeRx();

    Widget child = SingleChildScrollView(
      padding: const Pad(horizontal: 10, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const XText('房间公告', style: TextStyle(fontSize: 14, fontWeight: fw$Medium)),
          Spacing.h4,
          Text(
            notice.isEmpty ? '目前暂无公告。' : notice,
          ),
        ],
      ),
    );

    child = AspectRatio(
      aspectRatio: 300 / 220,
      child: child,
    );

    child = SizedBox(
      width: min(AppSize.width * (300 / 375), 300),
      child: child,
    );

    child = Material(
      color: Colors.white,
      borderRadius: AppBorderRadius.a10,
      textStyle: const TextStyle(fontSize: 12, color: Colors.black),
      child: child,
    );

    return child;
  }
}
