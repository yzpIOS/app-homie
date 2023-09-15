import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/room/user/room_user_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'package:app/ui/common/orientation_sheet.dart';
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
      body: OnlineUserView(widget.roomId,),
    );
  }
}

class OnlineUserView extends SimplePageView<Map> {
  final int roomId;

  OnlineUserView(this.roomId, {super.key});

  late final _ctrl = sceneCtrl<RoomCtrl>();
  late final myRole = _ctrl.getRole(OAuthCtrl.uid);

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
    final uid = item['uid'];//用户字符id
    final nuid = Int64(item['role_id']);//角色id
    final role = _ctrl.getRole(uid);
    final dataUserIsSelf = OAuthCtrl.isSelf(uid);//这条数据用户是否是我本人
    final dataUserIsOwner = role.isOwner;//这条数据用户是否是房主
    final dataUserIsManager = role.isManager;//这条数据用户是否是管理员
    /// 房主能对管理员、普通用户进行"添加"“移除”"封禁"管理员的操作
    /// 管理员能对普通用户进行“封禁”操作
    var isShowEditManagerAction = (myRole.isOwner && !dataUserIsSelf && !dataUserIsOwner);
    var isShowEditBlackListAction = (myRole.isManager && !dataUserIsSelf && !dataUserIsOwner && myRole != role);

    /// 添加或移除管理员
    Widget $EditManagerView() {
      return dataUserIsManager
          ? XOutlinedBtn(
        label: '移除',
        width: 48,
        height: 24,
        textStyle: const TextStyle(fontSize: 14, color: AppPalette.primary),
        onTap: () async {
          await Api.Room.setManager(roomId: roomId, uid: uid, isAdd: false);
          controller.updateItem(index, item);
        },
      )
          : XTextBtn(
        label: '添加',
        width: 48,
        height: 24,
        textStyle: const TextStyle(fontSize: 14, color: Colors.white),
        onTap: () async {
          await Api.Room.setManager(roomId: roomId, uid: uid, isAdd: true);
          controller.updateItem(index, item);
        },
      );
    }

    /// 拉黑用户
    Widget $EditBlackListView() {
      return XTextBtn(
        label: '封禁',
        width: 48,
        height: 24,
        textStyle: const TextStyle(fontSize: 14, color: Colors.white),
        onTap: () async {
          await Api.Room.setBlock(roomId: roomId, uid: uid, isAdd: true);
          controller.removeItem(item);
        },
      );
    }

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
        if (isShowEditManagerAction) $EditManagerView(),
        Spacing.w6,
        if (isShowEditBlackListAction) $EditBlackListView(),
        Spacing.w20,
      ],
    );

    child = InkWell(
      child: child,
      onTap: () => RoomUserSheet.show(uid, nuid),
    );

    return child;

    // return _ItemView(data: item, role: role, myRole: myRole,);
  }
}

// class _ItemView extends StatelessWidget {
//   final Map data;
//   final RoomRoleType? role;//这条数据用户角色
//   final RoomRoleType? myRole;//当前用户角色
//
//   const _ItemView({required this.data, required this.role, required this.myRole});
//
//   @override
//   Widget build(BuildContext context) {
//     final uid = data['uid'];
//     final nuid = Int64(data['role_id']);
//     final dataUserIsSelf = OAuthCtrl.isSelf(uid);//这条数据用户是否是我本人
//     final dataUserIsOwner = role.isOwner;//这条数据用户是否是房主
//     final dataUserIsManager = role.isManager;//这条数据用户是否是管理员
//     final isShowActions = true;// myRole.isManager && !dataUserIsSelf && !dataUserIsOwner;
//
//     Widget child = Row(
//       children: [
//         Spacing.w10,
//         Expanded(
//           child: RoomUserItemView(
//             uid: uid,
//             role: role,
//             padding: const Pad(left: 10, right: 20),
//           ),
//         ),
//       ],
//     );
//
//     child = InkWell(
//       child: child,
//       onTap: () => RoomUserSheet.show(uid, nuid),
//     );
//
//     return child;
//   }
// }
