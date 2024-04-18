import 'package:app/store/room/room_chat_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/room/overlay/big_gift_overlay.dart';
import 'package:app/ui/room/overlay/welcome_overlay.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class RoomChatView extends GetView<RoomChatCtrl> {
  const RoomChatView({super.key});

  @override
  Widget build(BuildContext context) {
    const padding = 10.0;

    return Container(
      padding: EdgeInsets.all(padding),
      width: 190 + padding * 2,
      height: 350,
      margin: EdgeInsets.only(right: 126),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Positioned.fill(
            child: _DataView(),
          ),

          Positioned(
            top: 25.0,
            left: 0.0,
            child: BigGiftOverlay(padding: padding),
          ),

          Positioned(
            top: 25.0,
            left: 0.0,
            child: WelcomeOverlay(padding: padding),
          ),
        ],
      ),
    );
  }
}

class _DataView extends GetView<RoomChatCtrl> {
  const _DataView();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        String select = controller.selected.value;
        final data = controller.dataSet;
        final length = data[select]?.length ?? 0;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: controller.dataSet
                  .keys.map((key) => createButton(key, select))
                  .toList(),
            ),

            SizedBox(height: 8,),
            Expanded(
              child: ScrollablePositionedList.separated(
                shrinkWrap: true,
                reverse: true,
                itemCount: length,
                itemBuilder: (_, i) {
                  return data[select]?[length - 1 - i] ?? const SizedBox();
                },
                separatorBuilder: (_, __) => const Spacing(height: 3, flex: null,),
              ),
            )
          ],
        );
      },
    );
  }

  Widget createButton(String label, selectedLabel) {
    return GestureDetector(
      onTap: () {
        controller.switchType(label);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 38,
        height: 20,
        margin: EdgeInsets.only(right: 15),
        alignment: Alignment.center,
        decoration: label != selectedLabel ? null : BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(1000),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: label == selectedLabel ? Color(0xFFF5CBFF) : Colors.white,
          ),
        ),
      ),
    );
  }
}
