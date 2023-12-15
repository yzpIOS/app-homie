
import 'package:app/common/nets/commons/proto/Common.pb.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/event/event.dart';
import 'package:app/store/room/room_mic_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/room/chat/msg_adapter/data/user_msg_data.dart';
import 'package:app/ui/room/persion/common_dialog.dart';

class PersonRoomMicCtrl extends RoomMicCtrl {

  ///
  /// 在麦上的用户列表, 自由麦和关闭自由麦共用
  ///
  RxList<UserInfo> micUserList = RxList();

  PersonRoomMicCtrl(super.roomId, {required super.maxMic, required super.roomType});

  ///
  /// 登录用户：上下麦操作，要判断是否被禁
  ///
  void micOperate() {
    if(isFreeMic()) {
      // 自由组麦的形式
      if(isOnMic()) {
        // 在麦上，下麦
        onMicDown();
      } else {
        // 不在麦上，上麦
        onMicUp();
      }
    } else {
      // 非自由组麦, 需要弹窗
      if(isOnMic()) {
        // 在麦上，下麦
        CommonDialog.userApplyDownMic(() {
          onMicDown();
        });
      } else {
        // 不在麦上，上麦
        CommonDialog.applyUpMic(() {
          onMicUp();
        });
      }
    }
    sendTextNotify("申请上麦");
  }


  ///
  /// 登录用户：上麦操作
  ///
  void onMicDown() {

  }

  ///
  /// 登录用户：下麦操作
  ///
  void onMicUp() {

  }

  ///
  /// 房主管理员：邀请上麦
  ///
  void inviteMicUp2({required NUID uid}) {

  }

  ///
  /// 房主管理员：邀请上麦
  ///
  void onMicDown2({required NUID uid}) {
    CommonDialog.inviteApplyUpMic(() {

    });
  }

  ///
  /// 是否自由麦
  ///
  bool isFreeMic() {
    return true;
  }

  ///
  /// 用户是否在mic上
  ///
  bool isUserOnMic(String uid) {
    for(int index = 0; index < micUserList.length; index ++) {
      if(micUserList[index].uid == uid) {
        return true;
      }
    }
    return false;
  }

  ///
  /// 当前用户是否在mic上
  ///
  bool isOnMic() {
    return true;
  }

  void sendTextNotify(String msg) {
    LocalMsgEvent(LocalMsgData(data: msg)).fire();
  }
}