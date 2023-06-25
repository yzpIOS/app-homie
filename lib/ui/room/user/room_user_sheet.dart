import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/room/user/room_user_info_dialog.dart';

abstract class RoomUserSheet {
  static void show(UID uid, NUID nuid) {
    final roomCtrl = Get.find<RoomManagerCtrl>().sceneCtrl;

    final isRoom = roomCtrl is RoomCtrl;

    final myUid = OAuthCtrl.uid;

    final isAdmin = isRoom && roomCtrl.isAdmin(myUid);
    final isOwner = isRoom && roomCtrl.isOwner(myUid);
    final canManage = isOwner || isAdmin;

    final isSelf = uid == myUid;
    final notSelf = !isSelf;

    final posAdmin = isRoom && roomCtrl.isAdmin(uid);
    final posOwner = isRoom && roomCtrl.isOwner(uid);
    final posManage = posAdmin || posOwner;

    final actions = <String, FutureOr Function()>{
      if (!isSelf) //
        '查看资料': () {
          RoomUserInfoDialog.show(uid: uid, nuid: nuid);
        },
      if (canManage && notSelf && !posManage) //
        '加入黑名单': () {
          roomCtrl.setBlock(uid:uid, nuid: nuid, isAdd: true);
        },
      if (isOwner && notSelf && !posManage) //
        '添加管理员': () {
          roomCtrl.setManager(uid: uid, isAdd: true);
        },
      if (posAdmin && isOwner && notSelf) //
        '移除管理员': () {
          roomCtrl.setManager(uid: uid, isAdd: false);
        },
    };

    switch (actions.length) {
      case 0:
        break;
      case 1:
        simpleTry(actions.values.single);
        break;
      default:
        Get.showSheet(actions.entries, toTitle: (it) => Tuple2(it.key, null)) //
            .onNotNull((val) => simpleTry(val.value));
    }
  }
}
