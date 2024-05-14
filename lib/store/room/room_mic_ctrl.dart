import 'package:app/3rd/tencent/rtc.dart';
import 'package:app/common/nets/commons/proto/Common.pb.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/event/event.dart';
import 'package:app/model/api/user_info_model.dart';
import 'package:app/model/enum/room_state.dart';
import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/room/room_rtc_ctrl.dart';
import 'package:app/store/room/scene_mic_ctrl.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/my/real_identity_1_page.dart';
import 'package:app/ui/room/chat/msg_adapter/data/user_msg_data.dart';
import 'package:app/ui/room/persion/common_dialog.dart';
import 'package:app/widgets.dart';
import 'package:fixnum/fixnum.dart';

class RoomMicCtrl extends SceneMicCtrl with BusGetLifeMixin {
  int roomId;
  int maxMic;
  RoomType roomType;

  UID roomUid;

  RxMap<String, MicInfo> dataRx = RxMap();

  List<MicInfo> get simpleUserList => dataRx.values.toList();

  List<MicInfo> getOnLineManager() {
    return simpleUserList;
  }

  RoomMicCtrl(this.roomId, {required this.maxMic, required this.roomType, required this.roomUid});

  final sendCmd2Unity = Get.find<UnityCtrl>().sendCmd;

  @override
  void onInit() {
    super.onInit();

    Api.Room.hotCount(roomId: roomId) //
        .then((val) => val is List ? onUpdateHotCountHandle(val) : null);

    on<MicUpEvent>(
      (event) {
        onMicUpEventHandle(event);
      },
    );

    on<MicDownEvent>(
      (event) {
        onMicDownEventHandle(event);
      },
    );

    on<MicCloseEvent>((event) {
      onMicClose(event);
    });

    // on<MicOpenEvent>((event) {
    //   final info = dataRx[event.data?.mikeNo];
    //
    //   assert(info != null && event.uid == info.uid, '数据错误 -> $event ${event.uid}');
    //
    //   if (info != null && event.uid == info.uid) {
    //     info.isMute = true;
    //
    //     dataRx.refresh();
    //   }
    // });
    //
    // on<MicStateEvent>(
    //   (event) {
    //     final info = dataRx[event.micNo];
    //
    //     assert(info != null && event.uid == info.uid, '数据错误 -> $event ${event.uid}');
    //
    //     if (info != null && event.uid == info.uid) {
    //       info.isMute = event.isMute;
    //
    //       dataRx.refresh();
    //     }
    //   },
    // );

    on<InviteMicUpEvent>(
      test: (event) => OAuthCtrl.isSelf(event.uid),
      (event) {
        onInviteMicUp(event.data?.mikeId.toInt() ?? 0);
      },
    );

    on<UpdateHotCountEvent>(
      (event) {
        var data = event.data;
        if(data == null) {
          return;
        }
        onUpdateHotCount2Handler([data]);
      },
    );


    on<JoinChannelEvent>(
      (event) async {
        await onJoinChannelEventHandle(event);
      },
    );

    on<RoomReConnectEvent>(
      (_) => doRefresh(),
    );

    on<RespUnityEvent>(
      test: (it) => it.code == Unity2AppEnum.UTF_GET_ONMICROPJONE_INFO_GUILD,
      (event) {
        event.complete(unityMicInfoData());
      },
    );


    // 申请上麦
    on<MicApplyEvent>((event) async {
      UserInfoModel? userInfo = await UserInfoCtrl.ins.findByUidOrNull(event.uid ?? "", useNet: true);
      if(userInfo == null) {
        return;
      }
      CommonDialog.receiveApplyMicUp(userInfo.showName, () {
        // todo 同意后，发送请求
        Api.Room.micConfirm(mikeId: int.tryParse(event.data?.mikeNo ?? "0") ?? 0, type: 1, isAgree: true, uid: userInfo.nuid, roomId: event.data?.roomId.toInt());
        sendTextNotify("你同意了${userInfo.showName}上麦请求");
      }, () {
        Api.Room.micConfirm(mikeId: int.tryParse(event.data?.mikeNo ?? "0") ?? 0, type: 1, isAgree: false, uid: userInfo.nuid, roomId: event.data?.roomId.toInt());
        sendTextNotify("你拒绝了${userInfo.showName}上麦请求");
      });
    });
  }

  Future<void> onJoinChannelEventHandle(JoinChannelEvent event) async {
    final myUid = OAuthCtrl.uid;
    assert(event.channel == '$roomId', '数据错误 -> $event');

    if (dataRx.values.any((it) => it.uid == myUid)) {
      await Rtc.switchRole(TRTCCloudDef.TRTCRoleAnchor);
    }
  }

  ///
  /// 上麦处理
  ///
  void onMicUpEventHandle(MicUpEvent event) {
    S_UpMikeBroadcast? data = event.data;
    if(data == null) {
      return;
    }
    var mikeUserKeyList = dataRx.keys.toList();
    for(int index = 0; index < mikeUserKeyList.length; index ++) {
      if(dataRx[mikeUserKeyList[index]]?.uid == data.uid) {
        debugPrint("删除旧麦位: data = ${data.toProto3Json()}");
        dataRx.remove(mikeUserKeyList[index]);
        break;
      }
    }
    debugPrint("新增麦位：data = ${data.toProto3Json()}");

    // 删除旧mike
    dataRx.remove(data.oldMikeNo);
    // 新增mike
    dataRx[data.mikeNo] = MicInfo(
        uid: event.uid ?? "",
        micId: data.mikeId.toInt(),
        hotCount: event.hotCount,
        isMute: false,
        nUid: data.roleId,
        roleType: event.data?.roleType ?? 0,
        no: event.data?.mikeNo ?? ""
    );

    onUpdateHotCount3Handler(data.mikeNo, data.number, refresh: true);
  }

  ///
  /// 麦位关闭
  ///
  void onMicClose(MicCloseEvent event) {
    final info = dataRx[event.data?.mikeNo];

    assert(info != null && event.uid == info.uid, '数据错误 -> $event ${event.uid}');

    if (info != null && event.uid == info.uid) {
      info.isMute = true;

      dataRx.refresh();
    }
  }

  ///
  /// 下麦处理
  ///
  void onMicDownEventHandle(MicDownEvent event) {
    dataRx.remove(event.data?.mikeNo);
  }

  ///
  /// 处理麦位在线数据
  ///
  void onDoRefreshHandle(resp) {
    dataRx(
      micDataFrom(resp),
    );
  }

  ///
  /// 处理麦位数据
  ///
  void onUpdateHotCountHandle(List data) {
    bool refresh = false;
    for(int index = 0; index < data.length; index ++) {
      var it = data[index];
      final info = dataRx[it['mike_no']];
      if(info != null) {
        refresh = true;
        onUpdateHotCount3Handler(it['mike_no'], it['number']);
      }
    }
    if (refresh){
      dataRx.refresh();
    }
  }

  ///
  /// 处理麦位热力值
  ///
  void onUpdateHotCount2Handler(List<S_AccMikeBroadcast> data) {
    bool refresh = false;
    for(int index = 0; index < data.length; index ++) {
      var info = dataRx[data[index].mikeNo];
      if(info != null) {
        refresh = true;
        onUpdateHotCount3Handler(data[index].mikeNo, data[index].number);
      }
    }
    if (refresh) {
      dataRx.refresh();
    }
  }

  ///
  /// 处理热力值
  ///
  void onUpdateHotCount3Handler(String? mikeNo, int? number, {bool refresh = false}) {
    if(mikeNo == null || number == null) {
      return;
    }
    final info = dataRx[mikeNo];
    if (info == null) {
      return;
    } else {
      info.hotCount = number;
    }
    if(refresh) {
      dataRx.refresh();
    }
  }


  Future<void> doRefresh() async {
    final resp = await Api.Room.micList(roomId: roomId);
    onDoRefreshHandle(resp);
    //TODO 处理重连期间自己麦状态改变情况
    onMikeListUpdate();
  }

  Map<String, List<Map<String, UID>>> unityMicInfoData() {
    return {
      'Infos': [
        for (final item in dataRx.entries)
          {
            'mircophoneIndex': item.key,
            'uid': item.value.uid,
          },
      ]
    };
  }


  @override
  bool canSpeakRx(UID uid) {
    final item = dataRx().values.firstWhereOrNull((it) => it.uid == uid);

    return item != null && !item.isMute;
  }

  @override
  void onRtcInit(RoomRtcCtrl rtc) {
    rtc.joinRoom(roomId: '$roomId');

    const isSelf = OAuthCtrl.isSelf;

    on<MicUpEvent>(
      test: (event) => isSelf(event.uid) && event.data?.oldMikeNo == null, //如果不是切换麦，就先把麦禁用
      (_) => Rtc.micRx(false),
    );

    on<MicDownEvent>(
      test: (event) => isSelf(event.uid),
      (_) => onMeMicDownHandler(),
    );

    // on<MicStateEvent>(
    //   test: (event) => isSelf(event.uid) && event.isMute,
    //   (_) {
    //     Rtc.micRx(false);
    //   },
    // );

    on<RoomCloseEvent>(
      (_) => rtc.leaveRoom(),
    );
  }

  ///
  /// 当前用户下麦广播
  ///
  void onMeMicDownHandler() {
    Rtc.micRx(false);
  }

  void onInviteMicUp(int micId) {
    Get.simpleDialog(msg: '管理员邀请你上麦', okLabel: '接受', cancelLabel: '拒绝').then((val) {
      simpleTry(
        () => Api.Room.micConfirm(mikeId: micId, type: 2, isAgree: val == '接受'),
      );
    });
  }

  void micUp({required String no, NUID? uid, bool reRequest = false, String contents = "是否申请上麦", String otherContent = "你的上麦申请被拒绝了"}) async {
    if(no != "9" && !(await OAuthCtrl.checkValid())) {
      return Future.value();
    }

    // 房主上麦
    MicInfo? ownerInfo = roomOwner();
    if(ownerInfo != null && ownerInfo.nUid == uid) {
      _doMicUp(no: no, uid: uid);
      return;
    }


    if(!OAuthCtrl.isNameValidate && no != "9") {
      String? label = await Get.simpleDialog(msg: "上麦需要进行实名认证", okLabel: "去实名", cancelLabel: "取消");
      if(label != "去实名") {
        return;
      }
      // 未认证，去认证
      await Get.to(() => const RealIdentity1Page());
      // 更新用户数据
      await OAuthCtrl.ins.udpateUserInfo();
      // 未实名，直接返回
      if(!OAuthCtrl.isNameValidate) {
        return;
      }
    }

    // 房主和房管
    if(RoomManagerCtrl.ins.sceneCtrl2 is RoomCtrl) {
      RoomCtrl roomCtrl = RoomManagerCtrl.ins.sceneCtrl2 as RoomCtrl;
      if(roomCtrl.isAdmin(OAuthCtrl.uid) || roomCtrl.isOwner(OAuthCtrl.uid) || roomCtrl.isAnchor == true) {
        // 管理员直接上麦
        _doMicUp(no: no, uid: uid);
        return;
      }
    }

    if(isFreeMic() || isOneMic(OAuthCtrl.uid)) {
      // 自由麦
      _doMicUp(no: no, uid: uid);
    } else {
      // 不在麦上，上麦
      CommonDialog.applyUpMic(() {
        _doMicUp(no: no, uid: uid);
        sendTextNotify("申请成功，等待房主同意");
      }, reRequest, contents, otherContent);
    }
  }

  bool isFreeMic() => false;

  bool isOneMic(UID uid) {
    bool onMic = false;
    simpleUserList.forEach((element) {
        onMic = onMic || element.uid == uid;
    });
    return onMic;
  }

  void _doMicUp({required String no, NUID? uid}) {
    simpleTry(
          () async {
        final result = await Api.Room.micUp(roomId: roomId, no: no, uid: uid);

        switch (result?.status.toInt()) {
          case 3:
            showToast('申请发送成功');
            break;
        }
      },
    );
  }

  void sendTextNotify(String msg) {
    LocalMsgEvent(LocalMsgData(data: msg)).fire();
  }

  ///
  /// 下麦处理
  ///
  void userMicDow(Int64? uid) {
    Api.Room.micDown(uid: uid);
  }

  void micDow({required String no, required String alert}) {
    final data = dataRx[no];

    if (data != null) {
      if(alert.isEmpty) {
        Api.Room.micDown(uid: data.nUid);
      } else {
        Get.alertSub(
          alert: alert,
          isModal: false,
              () => Api.Room.micDown(uid: data.nUid),
        );
      }
    } else {
      assert(false, '数据错误 -> $data $no');
    }
  }


  ///
  /// 房主
  ///
  MicInfo? roomOwner() {
    return simpleUserList.firstWhereOrNull((element) => element.isMainRole());
  }

  void inviteMicUp({required String no, required NUID nuid, UID? uid}) async {
    if(uid == null) {
      return;
    }

    // 房主不用判断
    if(uid != roomUid) {
      if(no != "9") {
        UserInfoModel? userInfo = await UserInfoCtrl.ins.findByUidOrNull2(uid, forceUseNet: true);
        if(userInfo == null) {
          showToast("无法操作，获取该用户信息异常");
          return;
        }
        // 该用户未实名
        if(userInfo.realNameType != 1 && userInfo.realNameType != 2) {
          showToast("无法操作，该用户未实名");
          return;
        }
      }
    }

    Future api() async {
      final result = await Api.Room.micUp(roomId: roomId, no: no, uid: nuid);

      // 1.上麦， 2.下麦， 3.申请中 4.邀请
      switch (result?.status.toInt()) {
        case 4:
          showToast('发送邀请成功');
          break;
      }
    }

    simpleTry(api);
  }

  void userMicSwitch({required String no, required UID uid}) {
    final data = dataRx[no];

    if (data != null && data.uid == uid) {
      simpleTry(
        () => Api.Room.micMute(roleId: data.nUid, isMute: !data.isMute),
      );
    } else {
      assert(false, '数据错误 -> $data $no $uid');
    }
  }

  ///
  /// 麦列表更新时调用这里, 此时检查用户是否在麦上，如果没有，那么就关麦
  ///
  void onMikeListUpdate() {
    var curUser = simpleUserList.firstWhereOrNull((element) => element.uid == OAuthCtrl.uid);
    if(curUser != null) {
      return;
    }
    Rtc.micRx(false);
  }

  static Map<String, MicInfo> micDataFrom(data) {
    debugPrint("用户上麦：data = ${data.toString()}");
    return <String, MicInfo>{
      if (data is List && data.isNotEmpty)
        for (final item in data)
          item['mike_no']: MicInfo(
            uid: item['uid'],
            nUid: NUID(item["role_id"] ?? 0),
            micId: item['mike_id'],
            hotCount: item['number'] ?? 0,
            isMute: item['open_status'] == 2,
            no: item['mike_no'],
            roleType: item['role_type'] ?? 0,
          ),
    };
  }



  static List<MicInfo> micDataFrom2(data) {
    debugPrint("用户上麦：data = ${data.toString()}");
    List<MicInfo> micInfoes = <MicInfo>[];
    if(data is List && data.isNotEmpty) {
      for (final item in data) {
        micInfoes.add(MicInfo(
          uid: item['uid'],
          nUid: NUID(item["role_id"] ?? 0),
          micId: item['mike_id'],
          hotCount: item['number'] ?? 0,
          isMute: item['open_status'] == 2,
          no: item['mike_no'],
          roleType: item['role_type'] ?? 0,
        ));
      }
    }
    return micInfoes;
  }

  static Map<String, MicInfo> createMicInfo(List<MikeInfo> mikeInfos) {
    var map = <String, MicInfo>{};
    for(var index = 0; index < mikeInfos.length; index ++) {
      var mikeInfo = mikeInfos[index];
      map[mikeInfo.mikeNo] = MicInfo(
        uid: mikeInfo.uid,
        nUid: mikeInfo.roleId,
        micId: mikeInfo.mikeId.toInt(),
        hotCount: mikeInfo.number.toInt(),
        isMute: false,
        no: mikeInfo.mikeNo,
        roleType: mikeInfo.roleType,
      );
    }
    return map;
  }

  static List<MicInfo> createMicInfo2(List<MikeInfo> mikeInfos) {
    var map = <MicInfo>[];
    for(var index = 0; index < mikeInfos.length; index ++) {
      var mikeInfo = mikeInfos[index];
      map.add(MicInfo(
        uid: mikeInfo.uid,
        nUid: mikeInfo.roleId,
        micId: mikeInfo.mikeId.toInt(),
        hotCount: mikeInfo.number.toInt(),
        isMute: false,
        roleType: mikeInfo.roleType,
        no: mikeInfo.mikeNo
      ));
    }
    return map;
  }
}

class MicInfo {
  UID uid;
  NUID nUid;
  int micId;
  bool isMute;
  int hotCount;

  // 麦号
  String no = "";

  // 1房主
  int roleType;


  MicInfo({
    required this.uid,
    required this.micId,
    required this.hotCount,
    required this.isMute,
    required this.nUid,
    required this.roleType,
    this.no = ""
  });

  ///
  /// 是否主角
  ///
  bool isMainRole() {
    return roleType == 1;
  }
}
