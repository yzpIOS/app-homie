import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/room/room_mic_ctrl.dart';
import 'package:app/store/room/scene_mic_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/room/user/room_user_info_dialog.dart';
import 'package:app/ui/room/user/select_user_page.dart';

abstract class MicUserSheet {
  static void show(String no, {MicInfo? info}) {
    final roomCtrl = Get.find<RoomManagerCtrl>().sceneCtrl;

    final isRoom = roomCtrl is RoomCtrl;

    final roomId = roomCtrl.roomId;
    final myUid = OAuthCtrl.uid;
    final posUid = info?.uid;
    final posnUid = info?.nUid;
    final nUid = info?.nUid;

    final isAdmin = isRoom && roomCtrl.isAdmin(myUid);
    final isOwner = isRoom && roomCtrl.isOwner(myUid);
    final canManage = isOwner || isAdmin;

    final notUser = posUid == null;
    final hasUser = !notUser;

    final isSelf = hasUser && posUid == myUid;
    final notSelf = !isSelf;

    final posAdmin = isRoom && hasUser && roomCtrl.isAdmin(posUid);
    final posOwner = isRoom && hasUser && roomCtrl.isOwner(posUid);
    final posManage = posAdmin || posOwner;

    final actions = <String, FutureOr Function()>{
      if (hasUser && notSelf) //
        '查看资料': () {
          if(posnUid == null) {
            return;
          }
          RoomUserInfoDialog.show(uid: posUid);
        },
      if (hasUser && canManage && notSelf) //
        '抱Ta下麦': () {
          sceneMicCtrl<RoomMicCtrl>().micDow(alert: '确定抱Ta下麦', no: no);
        },
      if (notUser && canManage) //
        '抱Ta上麦': () {
          Get.to(() => SelectUserPage(roomId: roomId, title: '抱Ta上麦')) //
              ?.onType<Map>((val) => sceneMicCtrl<RoomMicCtrl>().inviteMicUp(no: no, uid: val['uid']));
        },
      if (hasUser && canManage) //
        '清空魅力值': () {
          simpleSub(Api.Room.resetHotCount(roomId: roomId, micId: info!.micId));
        },
      if (hasUser && canManage && notSelf && !posManage) //
        '加入黑名单': () {
          if(posnUid == null) {
            return;
          }
          roomCtrl.setBlock(uid: posUid, isAdd: true);
        },
      if (hasUser && isOwner && notSelf && !posManage) //
        '添加管理员': () {
          roomCtrl.setManager(uid: posUid, isAdd: true);
        },
      if (hasUser && posAdmin && isOwner && notSelf) //
        '移除管理员': () {
          roomCtrl.setManager(uid: posUid, isAdd: false);
        },
      if (notUser) //
        '移到此座位': () {
          sceneMicCtrl<RoomMicCtrl>().micUp(no: no);
        },
      if (isSelf) //
        '下麦旁听': () {
          sceneMicCtrl<RoomMicCtrl>().micDow(alert: '确定下麦', no: no);
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
