import 'package:app/common/theme.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'package:app/ui/common/room_card_view.dart';

class RoomItemView extends StatelessWidget {
  final Map data;
  final TextStyle textStyle;
  final bool isShowMore;// 是否显示x人在线和关注标识

  const RoomItemView({
    super.key,
    required this.data,
    this.isShowMore = true,
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            child,
            if(isShowMore && data.containsKey("online_num") && (data["online_num"] as int) > 0)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF000000).withAlpha(100),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    margin: EdgeInsets.only(left: 3, bottom: 3),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Text(
                      "${data["online_num"]}人在线",
                      maxLines: 1,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  // Container(
                  //   width: 16,
                  //   height: 16,
                  //   margin: EdgeInsets.only(right: 5),
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(
                  //     color: Colors.black.withAlpha(80),
                  //     borderRadius: BorderRadius.circular(100),
                  //   ),
                  //   child: Image.asset(IMG.format("room/room_persion"), width: 12, height: 12,),
                  // )
                ],
              )
          ],
        ),
        Spacing.exp,
        XText(data['room_name'] ?? '', style: textStyle),
      ],
    );

    child = OpacityButton(onTap: toRoom, child: child);

    return child;
  }

  void toRoom() {
    if(Env.isDebug) {
      Get.find<RoomManagerCtrl>().toRoom(roomId: data['room_id'] ?? data['id']);
      return;
    }
    Get.find<RoomManagerCtrl>().toRoom(roomId: data['room_id'] ?? data['id']);
  }
}
