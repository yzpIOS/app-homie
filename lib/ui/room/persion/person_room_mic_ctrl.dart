
import 'package:app/3rd/tencent/rtc.dart';
import 'package:app/common/nets/commons/proto/Common.pb.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_mic_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/room/chat/msg_adapter/data/user_msg_data.dart';
import 'package:app/ui/room/persion/common_dialog.dart';
import 'package:app/widgets.dart';

class PersonRoomMicCtrl extends RoomMicCtrl {

  ///
  /// 在麦上的用户列表, 自由麦和关闭自由麦共用
  ///
  RxList<MicInfo> micUserList = RxList();

  @override
  List<MicInfo> get simpleUserList => micUserList.value;

  PersonRoomMicCtrl(super.roomId, {required super.maxMic, required super.roomType});

  @override
  void onInit() {
    super.onInit();
    // 拒绝上麦弹窗
    on<RefuseUpEvent>((event) {
      CommonDialog.refuseApplyUpMic(() {
        micOperate();
        sendTextNotify("申请上麦");
      });
    });
    // 申请上麦成功
    on<S_InviteMikeBroadcast>((event) {
      sendTextNotify("公屏显示你已上麦");
    });
  }

  @override
  Future<void> onJoinChannelEventHandle(JoinChannelEvent event) async {
    final myUid = OAuthCtrl.uid;
    assert(event.channel == '$roomId', '数据错误 -> $event');
    MicInfo? micInfo = micUserList.firstWhereOrNull((element) => element.uid == myUid);
    if (micInfo != null) {
      await Rtc.switchRole(TRTCCloudDef.TRTCRoleAnchor);
    }
  }

  ///
  /// 上麦处理
  ///
  @override
  void onMicUpEventHandle(MicUpEvent event) {
    S_UpMikeBroadcast? data = event.data;
    if(data == null) {
      return;
    }
    for(int index = 0; index < micUserList.length; index ++) {
      if(micUserList[index].uid == data.uid) {
        debugPrint("删除旧麦位: data = ${data.toProto3Json()}");
        micUserList.removeAt(index);
      }
    }
    debugPrint("新增麦位：data = ${data.toProto3Json()}");
    // 新增mike
    micUserList.add(MicInfo(uid: event.uid ?? "",
        micId: data.mikeId.toInt(), hotCount: event.hotCount, isMute: event.isMute, nUid: data.roleId));
  }


  ///
  /// 麦位关闭
  ///
  @override
  void onMicClose(MicCloseEvent event) {
    var info = micUserList.firstWhereOrNull((element) => event.uid == event.uid);
    if (info != null && event.uid == info.uid) {
      info.isMute = true;

      micUserList.refresh();
    }
  }

  ///
  /// 下麦处理
  ///
  @override
  void onMicDownEventHandle(MicDownEvent event) {
    micUserList.removeWhere((element) => element.uid == event.uid);
  }


  ///
  /// 处理麦位在线数据
  ///
  @override
  void onDoRefreshHandle(resp) {
    micUserList.value = RoomMicCtrl.micDataFrom2(resp);
  }

  ///
  /// 处理麦位数据
  ///
  @override
  void onUpdateHotCountHandle(List data) {
    bool refresh = false;
    for(int index = 0; index < data.length; index ++) {
      var it = data[index];

      final info = micUserList.firstWhereOrNull((element) => element.uid == it['uid']);
      if(info != null) {
        refresh = true;
        info.hotCount = it['number'];
        // onUpdateHotCount3Handler(it['mike_no'], it['number']);
      }
    }
    if (refresh){
      micUserList.refresh();
    }
  }


  ///
  /// 处理麦位热力值
  ///
  @override
  void onUpdateHotCount2Handler(List<S_AccMikeBroadcast> data) {
    bool refresh = false;
    for(int index = 0; index < data.length; index ++) {
      var info = micUserList.firstWhereOrNull((element) => element.uid == data[index].uid);
      if(info != null) {
        refresh = true;
        info.hotCount = data[index].number;
        // onUpdateHotCount3Handler(data[index].mikeNo, data[index].number);
      }
    }
    if (refresh) {
      micUserList.refresh();
    }
  }


  @override
  bool canSpeakRx(UID uid) {
    final item = micUserList.firstWhereOrNull((it) => it.uid == uid);

    return item != null && !item.isMute;
  }


  @override
  Map<String, List<Map<String, UID>>> unityMicInfoData() {
    return {
      'Infos': [
        for (int index = 0; index < micUserList.length; index ++)
          {
            'mircophoneIndex': index.toString(),
            'uid': micUserList[index].uid,
          },
      ]
    };
  }

  ///
  /// 登录用户：上下麦操作，要判断是否被禁
  ///
  void micOperate() {
    if(isFreeMic()) {
      // 自由组麦的形式
      if(isOnMic()) {
        // 在麦上，下麦
        micDow(no: "", alert: "");
      } else {
        // 不在麦上，上麦
        micUp(no: "");
      }
    } else {
      // 非自由组麦, 需要弹窗
      if(isOnMic()) {
        // 在麦上，下麦
        CommonDialog.userApplyDownMic(() {
          micDow(no: "", alert: "");
          sendTextNotify("申请成功，等待群主同意");
        });
      } else {
        // 不在麦上，上麦
        CommonDialog.applyUpMic(() {
          micUp(no: "");
          sendTextNotify("申请成功，等待群主同意");
        });
      }
    }
  }

  @override
  void micDow({required String no, required String alert}) {
    Api.Room.micDown(uid: null);
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