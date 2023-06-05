import 'package:app/3rd/tencent/rtc.dart';
import 'package:app/event/event.dart';
import 'package:app/model/enum/room_state.dart';
import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_rtc_ctrl.dart';
import 'package:app/store/room/scene_mic_ctrl.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';

class RoomMicCtrl extends SceneMicCtrl with BusGetLifeMixin {
  final int roomId;
  final int maxMic;
  final RoomType roomType;
  final RxMap<String, MicInfo> dataRx;

  RoomMicCtrl(this.roomId, {required this.maxMic, required this.roomType, required micInit})
      : dataRx = RxMap(_micDataFrom(micInit));

  final sendCmd2Unity = Get.find<UnityCtrl>().sendCmd;

  @override
  void onInit() {
    super.onInit();

    _sendMicData2Unity();

    Api.Room.hotCount(roomId: roomId) //
        .then((val) => val is List ? _updateHotCount(val) : null);

    on<MicUpEvent>(
      (event) {
        dataRx[event.micNo] = //
            dataRx.remove(event.oldMicNo)?.also((it) => it.micId = event.micId) ??
                MicInfo(uid: event.uid, micId: event.micId, hotCount: event.hotCount, isMute: event.isMute);

        _sendMicData2Unity();
      },
    );

    on<MicDownEvent>(
      (event) {
        dataRx.remove(event.micNo);

        _sendMicData2Unity();
      },
    );

    on<MicStateEvent>(
      (event) {
        final info = dataRx[event.micNo];

        assert(info != null && event.uid == info.uid, '数据错误 -> $event ${event.uid}');

        if (info != null && event.uid == info.uid) {
          info.isMute = event.isMute;

          dataRx.refresh();
        }
      },
    );

    on<InviteMicUpEvent>(
      test: (event) => OAuthCtrl.isSelf(event.uid),
      (event) {
        onInviteMicUp(event.micId);
      },
    );

    on<UpdateHotCountEvent>(
      (event) {
        _updateHotCount([event.data]);
      },
    );

    final myUid = OAuthCtrl.uid;

    on<JoinChannelEvent>(
      (event) async {
        assert(event.channel == '$roomId', '数据错误 -> $event');

        if (dataRx.values.any((it) => it.uid == myUid)) {
          await Rtc.$.switchRole(TRTCCloudDef.TRTCRoleAnchor);
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
      _micDataFrom(resp),
    );

    //TODO 处理重连期间自己麦状态改变情况

    _sendMicData2Unity();
  }

  void _updateHotCount(List data) {
    final b = data.any((it) {
      final info = dataRx[it['mike_no']];

      if (info == null) {
        return false;
      } else {
        info.hotCount = it['number'];

        return true;
      }
    });

    if (b) dataRx.refresh();
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

  void _sendMicData2Unity() {
    if (Env.useUnity && roomType == RoomType.guild) {
      sendCmd2Unity(
        App2UnityEnum.FTU_MICROPHONE_LIST,
        data: _unityMicInfoData(),
      );
    }
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
      test: (event) => isSelf(event.uid) && event.oldMicNo == null, //如果不是切换麦，就先把麦禁用
      (_) => Rtc.micRx(false),
    );

    on<MicDownEvent>(
      test: (event) => isSelf(event.uid),
      (_) => Rtc.micRx(false),
    );

    on<MicStateEvent>(
      test: (event) => isSelf(event.uid) && event.isMute,
      (_) {
        Rtc.micRx(false);
      },
    );

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

        switch (result['status']) {
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
        () => Api.Room.micDown(micId: data.micId),
      );
    } else {
      assert(false, '数据错误 -> $data $no');
    }
  }

  void inviteMicUp({required String no, required UID uid}) {
    Future api() async {
      final result = await Api.Room.micUp(roomId: roomId, no: no, uid: uid);

      // 1.上麦， 2.下麦， 3.申请中 4.邀请
      switch (result['status']) {
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
        () => Api.Room.micMute(micId: data.micId, isMute: !data.isMute),
      );
    } else {
      assert(false, '数据错误 -> $data $no $uid');
    }
  }

  static Map<String, MicInfo> _micDataFrom(data) {
    return <String, MicInfo>{
      if (data is List && data.isNotEmpty)
        for (final item in data)
          item['mike_no']: MicInfo(
            uid: item['uid'],
            micId: item['mike_id'],
            hotCount: item['number'] ?? 0,
            isMute: item['open_status'] == 2,
          ),
    };
  }
}

class MicInfo {
  UID uid;
  int micId;
  bool isMute;
  int hotCount;

  MicInfo({required this.uid, required this.micId, required this.hotCount, required this.isMute});
}
