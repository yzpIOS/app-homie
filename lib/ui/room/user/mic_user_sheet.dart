import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/room/room_mic_ctrl.dart';
import 'package:app/store/room/scene_mic_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/room/user/room_user_info_dialog.dart';
import 'package:app/ui/room/user/select_user_page.dart';
import 'package:fixnum/fixnum.dart';

abstract class MicUserSheet {
  static void show(String no, {MicInfo? info}) {
    if(info == null) {
      final roomCtrl = Get.find<RoomManagerCtrl>().sceneCtrl;
      // 是否在房
      final isRoom = roomCtrl is RoomCtrl;
      // 房间信息
      final roomId = roomCtrl.roomId;
      final myUid = OAuthCtrl.uid;
      // 是否是管理员
      final isAdmin = isRoom && roomCtrl.isAdmin(myUid);
      // 是否是管理者
      final isOwner = isRoom && roomCtrl.isOwner(myUid);
     // bool aa = RoomCtrl;

      final canManage = isOwner || isAdmin;
      if(canManage) {
        // 管理员操作
        final actions = <String, FutureOr Function()>{
          '抱Ta上麦': () {
            Get.to(() => SelectUserPage(roomId: roomId, title: '抱Ta上麦')) //
                ?.onType<Map>((val) {
              sceneMicCtrl<RoomMicCtrl>().inviteMicUp(no: no, nuid: Int64(val['role_id']), uid: val['uid']);
            });
          },
          '移到此座位': () {
            sceneMicCtrl<RoomMicCtrl>().micUp(no: no);
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
      } else {
        // 普通用户的操作
        sceneMicCtrl<RoomMicCtrl>().micUp(no: no);
      }
    } else {
      // 显示用户信息
      RoomUserInfoDialog.show(uid: info.uid, nuid: info.nUid, micNo: no);
    }
  }
}
