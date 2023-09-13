import 'package:app/net/api.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/room/user/room_user_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/ui/room/widgets/role_view.dart';
import 'package:app/ui/room/user/room_user_item_view.dart';
import 'package:fixnum/fixnum.dart';

class OnlineUserPage extends StatefulWidget {
  final int roomId;

  const OnlineUserPage({super.key, required this.roomId});

  @override
  State<OnlineUserPage> createState() => _OnlineUserPageState();
}

class _OnlineUserPageState extends State<OnlineUserPage> {
  @override
  Widget build(BuildContext context) {
    return OrientationSheet.scaffold(
      title: '房间成员',
      body: OnlineUserView(widget.roomId),
    );
  }
}

class OnlineUserView extends SimplePageView<Map> {
  final int roomId;
  final RoomRoleType? myRole;

  OnlineUserView(this.roomId, {super.key, this.myRole});

  late final _ctrl = sceneCtrl<RoomCtrl>();

  @override
  Future fetchPage(PageNum page) => Api.Room.onlineUser(page: page, roomId: roomId);

  @override
  BaseConfig get config {
    return const ListConfig(
      divider: Divider(indent: 18 + 70, endIndent: 10),
    );
  }

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    final uid = item['uid'];
    final role = _ctrl.getRole(uid);

    return _ItemView(data: item, role: role);
  }
}

class _ItemView extends StatelessWidget {
  final Map data;
  final RoomRoleType? role;

  const _ItemView({required this.data, required this.role});

  @override
  Widget build(BuildContext context) {
    final uid = data['uid'];
    final nuid = Int64(data['role_id']);

    Widget child = Row(
      children: [
        Spacing.w10,
        Expanded(
          child: RoomUserItemView(
            uid: uid,
            role: role,
            padding: const Pad(left: 10, right: 20),
          ),
        ),
      ],
    );

    child = InkWell(
      child: child,
      onTap: () => RoomUserSheet.show(uid, nuid),
    );

    return child;
  }
}
