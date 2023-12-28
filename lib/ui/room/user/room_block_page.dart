import 'package:app/net/api.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools/help.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'package:app/ui/room/user/room_user_item_view.dart';

class RoomBlockPage extends StatefulWidget {
  final int roomId;

  const RoomBlockPage({super.key, required this.roomId});

  @override
  State<RoomBlockPage> createState() => _RoomBlockPageState();
}

class _RoomBlockPageState extends State<RoomBlockPage> {
  @override
  Widget build(BuildContext context) {
    return OrientationSheet.scaffold(
      title: '黑名单列表',
      body: _DataView(widget.roomId),
    );
  }
}

class _DataView extends SimplePageView<Map> {
  final int roomId;

  _DataView(this.roomId);

  @override
  BaseConfig get config {
    return const ListConfig(
      divider: Divider(indent: 70, endIndent: 10),
    );
  }

  @override
  Future fetchPage(PageNum page) {
    return Api.Room.blockList(page: page, roomId: roomId);
  }

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    final uid = item['uid'];

    Widget child = UserInfoCtrl.use(uid, builder: (dto) {
      return Row(
        children: [
          Expanded(
            child: RoomUserItemView(data: dto,),
          ),
          XTextBtn(
            label: '解封',
            width: 60,
            height: 24,
            textStyle: const TextStyle(fontSize: 14, color: Colors.white),
            onTap: () async {
              await Api.Room.setBlock(roomId: roomId, uid: uid, isAdd: false);
              controller.removeItem(item);
            },
          ),
          Spacing.w20,
        ],
      );
    });

    // Widget child = RoomUserItemView(uid: uid);
    //
    // child = xSlidable(
    //   key: ValueKey(item),
    //   onDismissed: () => controller.removeItem(item),
    //   actions: [
    //     SlidAction(
    //       label: '移除',
    //       bgColor: Colors.red,
    //       onWillDismiss: () => Api.Room.setBlock(roomId: roomId, uid: uid, isAdd: false),
    //     ),
    //   ],
    //   child: child,
    // );

    return child;
  }
}
