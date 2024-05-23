
import 'package:app/tools/text_extension.dart';
import 'package:app/ui/room/overlay/room_notice_edit_controller.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

/// 房间公告编辑
class RoomNoticeEditDialog extends StatelessWidget{
  final int roomId;
  const RoomNoticeEditDialog({super.key,required this.roomId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RoomNoticeEditController>(
        init: RoomNoticeEditController(roomId:roomId),
        builder: (RoomNoticeEditController controller) {
          return Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 355,
              height: 180,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 110,
                    child: TextField(
                      autofocus: true,
                      controller: controller.contentController,
                      style: const TextStyle(fontSize: 14,color: Color(0xFF000000)),
                      decoration: const InputDecoration(
                        counterText: "",
                        hintText: '请输入房间公告',
                        hintStyle: TextStyle(fontSize: 14,color: Color(0xFF999999)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Spacing.h10,
                  Align(
                    alignment: Alignment.bottomRight,
                    child: const Text("确定",
                        style:  TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),).toBtn(
                        width: 75,
                        height: 28,
                        radius: 14,
                        bg:const Color(0xFFBD7CE5),
                        margin: const EdgeInsets.only(bottom: 10,right: 10),
                        onTap: () {
                          controller.clickConfirm();
                        }),
                  ),
                ],
              ),
            ),
          );
        });
  }

}