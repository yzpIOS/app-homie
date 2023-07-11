import 'package:app/3rd/tencent/rtc.dart';
import 'package:app/common/nets/commons/proto/Common.pb.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/event/event.dart';
import 'package:app/model/enum/room_state.dart';
import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_rtc_ctrl.dart';
import 'package:app/store/room/scene_mic_ctrl.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';

class RoomMicCtrl extends SceneMicCtrl with BusGetLifeMixin {
  int roomId;
  int maxMic;
  RoomType roomType;
  RxMap<String, MicInfo> dataRx = RxMap();

  RoomMicCtrl(this.roomId, {required this.maxMic, required this.roomType});

  final sendCmd2Unity = Get.find<UnityCtrl>().sendCmd;

  @override
  void onInit() {
    super.onInit();

    Api.Room.hotCount(roomId: roomId) //
        .then((val) => val is List ? _updateHotCount(val) : null);

    on<MicUpEvent>(
      (event) {
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
        dataRx[data.mikeNo] = MicInfo(uid: event.uid ?? "",
            micId: data.mikeId.toInt(), hotCount: event.hotCount, isMute: event.isMute, nUid: data.roleId);

        _updateHotCount3(data.mikeNo, data.number, refresh: true);

      },
    );

    on<MicDownEvent>(
      (event) {
        dataRx.remove(event.data?.mikeNo);
      },
    );

    on<MicCloseEvent>((event) {
      final info = dataRx[event.data?.mikeNo];

      assert(info != null && event.uid == info.uid, '数据错误 -> $event ${event.uid}');

      if (info != null && event.uid == info.uid) {
        info.isMute = true;

        dataRx.refresh();
      }
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
        _updateHotCount2([data]);
      },
    );

    final myUid = OAuthCtrl.uid;

    on<JoinChannelEvent>(
      (event) async {
        assert(event.channel == '$roomId', '数据错误 -> $event');

        if (dataRx.values.any((it) => it.uid == myUid)) {
          await Rtc.rtcClient.switchRole(TRTCCloudDef.TRTCRoleAnchor);
        }
      },
    );

    on<RoomReConnectEvent>(
      (_) => doRefresh(),
    );

    //<editor-fold desc="unity req event">
    on<RespUnityEvent>(
      test: (it) => it.code == Unity2AppEnum.UTF_GET_ONMICROPJONE_INFO_GUILD,
      (event) {
        event.complete(_unityMicInfoData());
      },
    );
    //</editor-fold>
  }

  Future<void> doRefresh() async {
    final resp = await Api.Room.micList(roomId: roomId);

    dataRx(
      micDataFrom(resp),
    );

    //TODO 处理重连期间自己麦状态改变情况
  }

  void _updateHotCount(List data) {
    bool refresh = false;
    for(int index = 0; index < data.length; index ++) {
      var it = data[index];
      final info = dataRx[it['mike_no']];
      if(info != null) {
        refresh = true;
        _updateHotCount3(it['mike_no'], it['number']);
      }
    }
    if (refresh){
      dataRx.refresh();
    }
  }

  void _updateHotCount2(List<S_AccMikeBroadcast> data) {
    bool refresh = false;
    for(int index = 0; index < data.length; index ++) {
      var info = dataRx[data[index].mikeNo];
      if(info != null) {
        refresh = true;
        _updateHotCount3(data[index].mikeNo, data[index].number);
      }
    }
    if (refresh) {
      dataRx.refresh();
    }
  }

  void _updateHotCount3(String? mikeNo, int? number, {bool refresh = false}) {
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

  Map<String, List<Map<String, UID>>> _unityMicInfoData() {
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
      (_) => Rtc.micRx(false),
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

  void onInviteMicUp(int micId) {
    Get.simpleDialog(msg: '管理员邀请你上麦', okLabel: '接受', cancelLabel: '拒绝').then((val) {
      simpleTry(
        () => Api.Room.micConfirm(mikeId: micId, type: 2, isAgree: val == '接受'),
      );
    });
  }

  void micUp({required String no}) {
    simpleTry(
      () async {
        final result = await Api.Room.micUp(roomId: roomId, no: no);

        switch (result?.status.toInt()) {
          case 3:
            showToast('申请发送成功');
            break;
        }
      },
    );
  }

  void micDow({required String no, required String alert}) {
    final data = dataRx[no];

    if (data != null) {
      Get.alertSub(
        alert: alert,
        isModal: false,
        () => Api.Room.micDown(uid: data.nUid),
      );
    } else {
      assert(false, '数据错误 -> $data $no');
    }
  }

  void inviteMicUp({required String no, required NUID uid}) {
    Future api() async {
      final result = await Api.Room.micUp(roomId: roomId, no: no, uid: uid);

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
          ),
    };
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
        isMute: mikeInfo.isFrozen,
      );
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

  MicInfo({required this.uid, required this.micId, required this.hotCount, required this.isMute, required this.nUid});
}
