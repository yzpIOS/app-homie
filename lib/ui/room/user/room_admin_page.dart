import 'package:app/net/api.dart';
import 'package:app/store/room/room_admin_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/ui/room/user/room_user_item_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class RoomAdminPage extends StatefulWidget {
  const RoomAdminPage({super.key});

  @override
  State<RoomAdminPage> createState() => _RoomAdminPageState();
}

class _RoomAdminPageState extends State<RoomAdminPage> {
  final controller = Get.find<RoomAdminCtrl>();

  @override
  void initState() {
    super.initState();

    controller.doRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationSheet.scaffold(
      title: '管理员列表',
      body: Obx(
        () => SimpleListView<String>(
          controller.dataRx.toList(growable: false),
          itemBuilder: itemBuilder,
          divider: const Divider(indent: 70, endIndent: 10),
        ),
      ),
    );
  }

  Widget itemBuilder(BuildContext context, String item, int index) {
    final uid = item;

    Widget child = UserInfoCtrl.use(uid, builder: (dto) {
      return Row(
        children: [
          Expanded(
            child: RoomUserItemView(data: dto,),
          ),
          XTextBtn(
            label: '移除',
            width: 60,
            height: 24,
            textStyle: const TextStyle(fontSize: 14, color: Colors.white),
            onTap: () async {
              await Api.Room.setManager(roomId: controller.roomId, uid: uid, isAdd: false);
              controller.dataRx.remove(uid);
            },
          ),
          Spacing.w20,
        ],
      );
    });

    // Widget child = RoomUserItemView(uid: uid);
    //
    // child = xSlidable(
    //   key: ValueKey(uid),
    //   onDismissed: () => controller.dataRx.remove(uid),
    //   actions: [
    //     SlidAction(
    //       label: '移除',
    //       bgColor: Colors.red,
    //       onWillDismiss: () => Api.Room.setManager(roomId: controller.roomId, uid: uid, isAdd: false),
    //     ),
    //   ],
    //   child: child,
    // );

    return child;
  }
}
