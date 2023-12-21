
import 'package:app/3rd/tencent/rtc.dart';
import 'package:app/common/nets/commons/proto/Common.pb.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/event/event.dart';
import 'package:app/model/enum/api_switch.dart';
import 'package:app/model/enum/person_mic_status.dart';
import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/room/room_mic_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/my/real_identity_2_page.dart';
import 'package:app/ui/room/chat/msg_adapter/data/user_msg_data.dart';
import 'package:app/ui/room/persion/common_dialog.dart';
import 'package:app/widgets.dart';

class PersonRoomMicCtrl extends RoomMicCtrl {

  ///
  /// 在麦上的用户列表, 自由麦和关闭自由麦共用
  ///
  RxList<MicInfo> micUserList = RxList();

  // 当前麦状态
  ValueNotifier<int> userMicStatus = ValueNotifier<int>(0);

  @override
  List<MicInfo> get simpleUserList => micUserList.value;

  @override
  List<MicInfo> getOnLineManager() {
    return getAudience();
  }

  PersonRoomMicCtrl(super.roomId, {required super.maxMic, required super.roomType});

  @override
  void onInit() {
    super.onInit();
    // 拒绝上麦弹窗
    on<RefuseUpEvent>((event) {
      CommonDialog.refuseApplyUpMic(() {
        micOperate(reRequest: true);
        sendTextNotify("申请上麦");
      });
    });
    // 申请上麦成功
    on<S_InviteMikeBroadcast>((event) {
      sendTextNotify("公屏显示你已上麦");
    });
    // 申请上麦
    on<MicApplyEvent>((event) async {
      UserInfoDto? userInfo = await UserInfoCtrl.ins.findByUidOrNull(event.uid ?? "", useNet: true);
      if(userInfo == null) {
        return;
      }
      CommonDialog.receiveApplyMicUp(userInfo.showName(), () {
        // todo 同意后，发送请求
        Api.Room.micConfirm(mikeId: 0, type: 1, isAgree: true, uid: userInfo.nuid, roomId: event.data?.roomId.toInt());
        sendTextNotify("你同意了${userInfo.showName()}上麦请求");
      }, () {
        Api.Room.micConfirm(mikeId: 0, type: 1, isAgree: false, uid: userInfo.nuid, roomId: event.data?.roomId.toInt());
        sendTextNotify("你拒绝了${userInfo.showName()}上麦请求");
      });
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
    micUserList.add(MicInfo(
        uid: event.uid ?? "",
        micId: data.mikeId.toInt(),
        hotCount: event.hotCount,
        isMute: event.isMute,
        nUid: data.roleId,
        roleType: event.data?.roleType ?? 0
    ));

    // 用户己上麦
    if(event.uid == OAuthCtrl.uid) {
      sendTextNotify("你已上麦");
      userMicStatus.value = PersonMicStatus.open.val;
      // 关闭麦
      Rtc.micRx.value = true;
    }
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

    // 用户己下麦
    if(event.uid == OAuthCtrl.uid) {
      sendTextNotify("你已下麦");
      userMicStatus.value = PersonMicStatus.none.val;
      // 关闭麦
      Rtc.micRx.value = false;
    }
  }

  @override
  void onMeMicDownHandler() {
    super.onMeMicDownHandler();
    sendTextNotify("你已下麦");
    userMicStatus.value = PersonMicStatus.none.val;
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


  @override
  void onInviteMicUp(int micId) {
    Get.simpleDialog(msg: '群主邀请你上麦聊天', okLabel: '接受', cancelLabel: '拒绝').then((val) {
      simpleTry(() {
        Api.Room.micConfirm(mikeId: micId, type: 2, isAgree: val == '接受');
      },);
    });
  }

  ///
  /// 登录用户：上下麦操作，要判断是否被禁
  ///
  void micOperate({bool reRequest = false}) {
    // 非自由组麦, 需要弹窗
    if(isOnMic()) {
      // 在麦上，下麦
      if(userMicStatus.value == PersonMicStatus.open.val) {
        // 开麦中，那么就把mic关闭
        userMicStatus.value == PersonMicStatus.close.val;;
        // 关闭麦
        Rtc.micRx.value = false;
      } else {
        // 如果是闭麦中，那么就开麦
        userMicStatus.value == PersonMicStatus.open.val;;
        // 关闭麦
        Rtc.micRx.value = true;
      }
    } else {
      // 不在麦上，上麦
      micUp(no: "", uid: OAuthCtrl.nUid, reRequest: reRequest);
    }
  }

  @override
  Future<void> micUp({required String no, NUID? uid, bool reRequest = false}) async {
    MicInfo? ownerInfo = roomOwner();
    if(ownerInfo == null || ownerInfo.nUid == uid) {
      super.micUp(no: no);
      return;
    }

    if(!OAuthCtrl.isNameValidate) {
      String? label = await Get.simpleDialog(msg: "上麦需要进行实名认证", okLabel: "去实名", cancelLabel: "取消");
      if(label != "去实名") {
        return;
      }
      // 未认证，去认证
      await Get.to(() => const RealIdentity2Page());
      // 更新用户数据
      await OAuthCtrl.ins.udpateUserInfo();
      // 未实名，直接返回
      if(!OAuthCtrl.isNameValidate) {
        return;
      }
    }
    if(isFreeMic()) {
      // 自由麦
      super.micUp(no: no, uid: uid);
    } else {
      // 不在麦上，上麦
      CommonDialog.applyUpMic(() {
        super.micUp(no: "", uid: uid);
        sendTextNotify("申请成功，等待群主同意");
      }, reRequest);
    }
  }

  @override
  void micDow({required String no, required String alert}) {
    MicInfo? ownerInfo = roomOwner();
    // 主播下麦
    if(ownerInfo?.nUid == OAuthCtrl.nUid) {
      CommonDialog.confirmDownMic(() {
        Api.Room.micDown(uid: null);
      });
      return;
    }
    // 自由组麦
    CommonDialog.userConfirmDownMic(() {
      Api.Room.micDown(uid: OAuthCtrl.nUid);
    });
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
    if(RoomManagerCtrl.ins.sceneCtrl2 is! PersonRoomCtrl) {
      return false;
    }
    PersonRoomCtrl personRoomMicCtrl = RoomManagerCtrl.ins.sceneCtrl as PersonRoomCtrl;
    return personRoomMicCtrl.info['mike_status'] == ApiSwitch.open.code;
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
    return isUserOnMic(OAuthCtrl.uid);
  }

  void sendTextNotify(String msg) {
    LocalMsgEvent(LocalMsgData(data: msg)).fire();
  }

  ///
  /// 房主
  ///
  MicInfo? roomOwner() {
    return micUserList.firstWhereOrNull((element) => element.isMainRole());
  }

  ///
  /// 观众
  ///
  List<MicInfo> getAudience() {
    List<MicInfo> results = [];

    micUserList.forEach((element) {
      if(!element.isMainRole()) {
        results.add(element);
      }
    });

    return results;
  }
}