
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

  StreamSubscription? streamSubscription;

  MicInfo? curUserMicInfo;

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
      micOperate(reRequest: true);
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

    // 非房主收到的禁麦处理
    on<MikeSpeakingEvent>((event) async {
      MicInfo? micInfo = micUserList.firstWhereOrNull((element) => element.uid == event.uid);
      // 是否禁麦中
      micInfo?.isMute = event.data?.status == 1;
      if(event.data?.status == 1) {
        if(Rtc.micRx.isTrue) {
          Rtc.micSwitch();
        }
        // 禁麦中
        Rtc.status.value = PersonMicStatus.disable.val;
      } else {
        Rtc.status.value = PersonMicStatus.open.val;
      }
      if(micInfo != null) {
        micUserList.refresh();
      }
    });

    // 说话处理
    streamSubscription = Rtc.speakRx.listenAndPump((event) {
      // 当前用户不在麦上时，就把说话的用户从所在的索引拿到前面
      int startIndex = 0;
      micUserList.removeWhere((element) => element == curUserMicInfo);
      for(var index = 0; index < micUserList.length; index ++) {
        if(event.containsKey(micUserList[index].uid)) {
          // 索引相等，不需要改变
          if(startIndex == index) {
            // 指针向前
            startIndex += 1;
            continue;
          }
          micUserList.swap(index, startIndex);
          startIndex += 1;
        }
      }
      if(curUserMicInfo != null) {
        micUserList.insert(0, curUserMicInfo!);
      }
      micUserList.refresh();
    });
  }

  void updateMicInfo(List<MicInfo> micInfos, String roomUid, int micStatus) {
    micUserList.value = micInfos;
    if(Rtc.status.value == PersonMicStatus.none.val) {
      // 重置麦位状态
      if(micStatus != 3) {
        // 房主开房时，会走到这里
        Rtc.status.value = micInfos.firstWhereOrNull((element) => element.uid == roomUid) != null
            ? PersonMicStatus.open.val : PersonMicStatus.none.val;
      } else {
        // 其它的玩家进房时，会走到这里
        Rtc.status.value = PersonMicStatus.disable.val;
      }
      // 第一次主动上麦
      if(roomUid == OAuthCtrl.uid && Rtc.status.value == PersonMicStatus.open.val) {
        if(Rtc.micRx.isTrue) {
          return;
        }
        Future.delayed(const Duration(milliseconds: 500)).then((value) {
          Rtc.micSwitch();
        });
      }
    }
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

    var localMicInfo = MicInfo(
        uid: event.uid ?? "",
        micId: data.mikeId.toInt(),
        hotCount: event.hotCount,
        isMute: event.isMute,
        nUid: data.roleId,
        roleType: event.data?.roleType ?? 0
    );

    // 当前用户的mic信息
    if(event.uid == OAuthCtrl.uid) {
      // 当前用户放在第一位
      curUserMicInfo = localMicInfo;
      micUserList.insert(0, localMicInfo);
    } else {
      // 新增mike
      micUserList.add(localMicInfo);
    }

    debugPrint("新增麦位：data = ${data.toProto3Json()}");

    // 用户己上麦
    if(event.uid == OAuthCtrl.uid) {
      sendTextNotify("你已上麦");
      // 关闭麦
      if(Rtc.micRx.isFalse) {
        Rtc.micSwitch();
      }
      Rtc.status.value = PersonMicStatus.open.val;
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
  }

  @override
  void onMeMicDownHandler() {
    super.onMeMicDownHandler();
  }

  ///
  /// 下麦处理
  ///
  @override
  void onMicDownEventHandle(MicDownEvent event) {
    micUserList.removeWhere((element) => element.uid == event.uid);

    // 用户己下麦
    if(event.uid == OAuthCtrl.uid) {
      sendTextNotify("你已下麦");
      // 关闭麦
      Rtc.micSwitch();
      Future.delayed(const Duration(milliseconds: 300)).then((value) {
        Rtc.micRx.value = false;
        Rtc.status.value = PersonMicStatus.none.val;
        Rtc.status.refresh();
      });
      curUserMicInfo = null;
    }
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
    Get.simpleDialog(msg: '房主邀请你上麦聊天', okLabel: '接受', cancelLabel: '拒绝').then((val) {
      simpleTry(() {
        Api.Room.micConfirm(mikeId: micId, type: 2, isAgree: val == '接受');
      }, callback: (dynamic d) {
        if(d["code"] != 0 && d["code"] != 200) {
          showToast(d["msg"] ?? "上麦失败");
          return;
        }
        sendTextNotify("你己$val了房主邀请");
      });
    });
  }

  @override
  void inviteMicUp({required String no, required NUID nuid, UID? uid}) async {
    if(uid == null) {
      return;
    }
    UserInfoDto? userInfo = await UserInfoCtrl.ins.findByUidOrNull2(uid, forceUseNet: true);
    if(userInfo == null) {
      showToast("无法操作，获取该用户信息异常");
      return;
    }
    // 该用户未实名
    if(userInfo.realNameType != 1 && userInfo.realNameType != 2) {
      showToast("无法操作，该用户未实名");
      return;
    }
    super.inviteMicUp(no: no, nuid:nuid, uid: uid);
  }

  int preTime = 0;

  ///
  /// 登录用户：上下麦操作，要判断是否被禁
  ///
  void micOperate({bool reRequest = false}) {
    if(Rtc.status.value == PersonMicStatus.disable.val) {
      showToast("全员禁麦中");
      return;
    }
    // 非自由组麦, 需要弹窗
    if(isOnMic()) {
      if(preTime != 0 && (DateTime.now().millisecondsSinceEpoch - preTime) < 100) {
        return;
      }
      preTime = DateTime.now().millisecondsSinceEpoch;

      // 在麦上，下麦
      if(Rtc.status.value == PersonMicStatus.open.val) {
        // 开麦中，那么就把mic关闭
        Rtc.status.value = PersonMicStatus.close.val;
      } else if(Rtc.status.value == PersonMicStatus.close.val) {
        // 如果是闭麦中，那么就开麦
        Rtc.status.value = PersonMicStatus.open.val;
      } else {
        // 禁麦中
        return;
      }
      bool curMicValue = Rtc.micRx.value;
      // 关闭麦
      Rtc.micSwitch();
      Future.delayed(const Duration(milliseconds: 100)).then((value) {
        Rtc.micRx.value = !curMicValue;
      });
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
        sendTextNotify("申请成功，等待房主同意");
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

  @override
  void dispose() {
    super.dispose();
    streamSubscription?.cancel();
  }
}