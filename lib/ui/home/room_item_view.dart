import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'package:app/ui/common/room_card_view.dart';

class RoomItemView extends StatelessWidget {
  final Map data;
  final TextStyle textStyle;

  const RoomItemView({
    super.key,
    required this.data,
    this.textStyle = const TextStyle(fontSize: 14, color: Colors.black),
  });

  static const delegate = XGridDelegate(
    crossAxisCount: 3,
    mainAxisSpacing: 12,
    crossAxisSpacing: 12,
    childAspectRatio: RoomCardView.ratio,
    fixedHeight: 25,
  );

  @override
  Widget build(BuildContext context) {
    Widget child = RoomCardView(image: data['image'] ?? data['scene_image']);

    child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        child,
        Spacing.exp,
        XText(data['room_name'] ?? '', style: textStyle),
      ],
    );

    child = OpacityButton(onTap: toRoom, child: child);

    return child;
  }

  void toRoom() {
    Get.find<RoomManagerCtrl>().toRoom(roomId: data['room_id'] ?? data['id']);
  }
}
