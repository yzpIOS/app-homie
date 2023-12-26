import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tencent_trtc_cloud/trtc_cloud.dart';
import 'package:tencent_trtc_cloud/trtc_cloud_def.dart';
import 'package:tencent_trtc_cloud/trtc_cloud_listener.dart';

import 'keys.dart';

export 'package:tencent_trtc_cloud/trtc_cloud_def.dart';

class Rtc {
  Rtc._();

  static final init = _init();

  static final speakRx = RxMap<String, double>();
  static final openMicRx = RxSet<String>();
  static final micRx = RxBool(false);
  static final audioRx = RxBool(true);
  static final videoRx = RxBool(false);
  static final netQualityRx = RxInt(0);

  // 麦状态，1禁麦
  static final status = RxInt(0);

  static late final TRTCCloud _rtcClient;

  static Future<void> _init() async {
    _rtcClient = (await TRTCCloud.sharedInstance())!;

    await Future.wait(
      [
        _rtcClient.setLogLevel(TRTCCloudDef.TRTC_LOG_LEVEL_NULL),
        _rtcClient.setConsoleEnabled(canLog(LogType.RTC)),
      ],
    );

    _rtcClient.registerListener((type, args) {
      switch (type) {
        case TRTCCloudListener.onNetworkQuality:
          netQualityRx(args['localQuality']['quality']);
          break;
        case TRTCCloudListener.onUserVoiceVolume:
          _onUserVoiceVolume(args);
          break;
        case TRTCCloudListener.onEnterRoom:
          _onEnterRoom(args);
          break;
        case TRTCCloudListener.onExitRoom:
          _onExitRoom(args);
          break;
        case TRTCCloudListener.onSwitchRoom:
          xlog('用户切换房间 -> $args', type: LogType.RTC);
          break;
        case TRTCCloudListener.onSwitchRole:
          xlog('用户切换角色 -> $args', type: LogType.RTC);
          break;
        case TRTCCloudListener.onRemoteUserEnterRoom:
          _onRemoteUserEnterRoom(args);
          break;
        case TRTCCloudListener.onRemoteUserLeaveRoom:
          _onRemoteUserLeaveRoom(args);
          break;
        case TRTCCloudListener.onUserAudioAvailable:
          _onUserAudioAvailable(args);

          break;
        case TRTCCloudListener.onStatistics:
          break;
        case TRTCCloudListener.onError:
        case TRTCCloudListener.onWarning:
        case TRTCCloudListener.onCameraDidReady:
        case TRTCCloudListener.onMicDidReady:
        case TRTCCloudListener.onConnectOtherRoom:
        case TRTCCloudListener.onDisConnectOtherRoom:
        case TRTCCloudListener.onUserVideoAvailable:
        case TRTCCloudListener.onUserSubStreamAvailable:
        case TRTCCloudListener.onFirstVideoFrame:
        case TRTCCloudListener.onFirstAudioFrame:
        case TRTCCloudListener.onSendFirstLocalVideoFrame:
        case TRTCCloudListener.onSendFirstLocalAudioFrame:
        case TRTCCloudListener.onConnectionLost:
        case TRTCCloudListener.onTryToReconnect:
        case TRTCCloudListener.onConnectionRecovery:
        case TRTCCloudListener.onSpeedTest:
        case TRTCCloudListener.onRecvCustomCmdMsg:
        case TRTCCloudListener.onMissCustomCmdMsg:
        case TRTCCloudListener.onRecvSEIMsg:
        case TRTCCloudListener.onStartPublishing:
        case TRTCCloudListener.onStopPublishing:
        case TRTCCloudListener.onStartPublishCDNStream:
        case TRTCCloudListener.onStopPublishCDNStream:
        case TRTCCloudListener.onSetMixTranscodingConfig:
        case TRTCCloudListener.onMusicObserverStart:
        case TRTCCloudListener.onMusicObserverPlayProgress:
        case TRTCCloudListener.onMusicObserverComplete:
        case TRTCCloudListener.onSnapshotComplete:
        case TRTCCloudListener.onScreenCaptureStarted:
        case TRTCCloudListener.onScreenCapturePaused:
        case TRTCCloudListener.onScreenCaptureResumed:
        case TRTCCloudListener.onScreenCaptureStoped:
        case TRTCCloudListener.onDeviceChange:
        case TRTCCloudListener.onTestMicVolume:
        case TRTCCloudListener.onTestSpeakerVolume:
        case TRTCCloudListener.onStartPublishMediaStream:
        case TRTCCloudListener.onUpdatePublishMediaStream:
        case TRTCCloudListener.onStopPublishMediaStream:
          xlog(() => '$type -> $args', type: LogType.RTC);
          break;
        default:
          break;
      }
    });

    await _micInit();
  }

  static Future<void> _micInit() async {
    await _enableMic(micRx.value);
    await _enableAudio(audioRx.value);
    await _enableVideo(videoRx.value);

    micRx.listen(_enableMic);
    audioRx.listen(_enableAudio);
    videoRx.listen(_enableVideo);
  }

  //<editor-fold desc="Event">
  static void _onRemoteUserEnterRoom(args) {
    xlog('用户上麦 -> $args', type: LogType.RTC);
  }

  static void _onRemoteUserLeaveRoom(args) {
    xlog('用户下麦 -> $args', type: LogType.RTC);

    if(args is Map) {
      var userId = args["userId"];
      if(OAuthCtrl.uid != userId) {
        return;
      }
      micRx(false);
    }
  }

  static void _onUserAudioAvailable(Map args) {
    xlog('用户开关麦 -> $args', type: LogType.RTC);

    if (args['available']) {
      openMicRx.add(args['userId']);
    } else {
      openMicRx.remove(args['userId']);
    }
  }

  static void _onUserVoiceVolume(Map args) {
    final data = <String, double>{};

    for (final item in args['userVolumes']) {
      final volume = item['volume'];

      if (volume > 0) data[item['userId']] = volume / 100;
    }

    final speakRx = Rtc.speakRx;

    if (data.isEmpty) {
      if (speakRx.isNotEmpty) {
        speakRx.clear();
      }
    } else {
      speakRx.assignAll(data);

      xlog(() => '用户说话 -> $args', type: LogType.RTC);
    }
  }

  static void _onEnterRoom(int args) {
    xlog('用户进入房间 -> $args', type: LogType.RTC);

    if (args > 0) {
      _rtcClient.enableAudioVolumeEvaluation(400);
    } else if (args < 0) {
      assert(false);
    } else {
      assert(false);
    }
  }

  static void _onExitRoom(int args) {
    xlog('用户离开房间 -> $args', type: LogType.RTC);

    micRx(false);
    speakRx.clear();
    openMicRx.clear();
    status(0);

    switch (args) {
      case 0: //主动调用 exitRoom 退房
        break;
      case 1: //被服务器踢出当前房间
      case 2: //当前房间整个被解散
        break;
      default:
        assert(false, '用户离开房间 -> $args');
    }
  }

  //</editor-fold>

  //<editor-fold desc="Action">
  //开关麦
  static Future<void> _enableMic(bool enable) async {
    try {
      await Future.wait(
        [
          _rtcClient.muteLocalAudio(!enable),
          if (enable) //
            _rtcClient.startLocalAudio(TRTCCloudDef.TRTC_AUDIO_QUALITY_MUSIC)
          else
            _rtcClient.stopLocalAudio(),
          _rtcClient.switchRole(enable ? TRTCCloudDef.TRTCRoleAnchor : TRTCCloudDef.TRTCRoleAudience)
        ],
      );

      xlog('麦克风状态设置为[$enable]', type: LogType.RTC);
    } catch (e, s) {
      errLog(e, s, type: LogType.RTC);
    }
  }

  //开关声音
  static Future<void> _enableAudio(bool enable) async {
    try {
      await _rtcClient.muteAllRemoteAudio(!enable);

      xlog(() => '声音状态设置为[$enable]', type: LogType.RTC);
    } catch (e, s) {
      errLog(e, s, type: LogType.RTC);
    }
  }

  static Future<void> enterRoom(String roomId, String token) async {
    await Rtc.init;
    await Rtc.leave(isJoinBefore: true);
    _rtcClient.enterRoom(
      TRTCParams(
        sdkAppId: appId,
        roomId: 0,
        strRoomId: roomId,
        userId: OAuthCtrl.uid,
        userSig: token,
        role: TRTCCloudDef.TRTCRoleAudience,
      ),
      TRTCCloudDef.TRTC_APP_SCENE_VOICE_CHATROOM,
    );

    Rtc.micRx(false);
  }

  static Future<void> setAudioCaptureVolume(int volume) async {
    await Rtc._rtcClient.setAudioCaptureVolume(volume.toInt());
  }

  //开关视频
  static Future<void> _enableVideo(bool enable) async {
    try {
      await Future.wait(
        [
          _rtcClient.muteLocalVideo(!enable),
          if (enable) //
            _rtcClient.startLocalPreview(true, null)
          else
            _rtcClient.stopLocalPreview(),
        ],
      );

      xlog(() => '视频状态设置为[$enable]', type: LogType.RTC);
    } catch (e, s) {
      errLog(e, s, type: LogType.RTC);
    }
  }

  //切换麦克风开关
  static Future<void> micSwitch() async {
    if (micRx.isFalse) {
      if (!await Permission.microphone.request().isGranted) {
        showToast('权限获取失败');

        return;
      }
    }

    micRx.toggle();
  }

  static Future<void> switchRole(int role) async {
    await _rtcClient.switchRole(TRTCCloudDef.TRTCRoleAnchor);
  }

  static Future<void> leave({bool isJoinBefore = false}) async {
    try {
      audioRx(true);
      await Future.wait(
        [
          // $.switchRole(TRTCCloudDef.TRTCRoleAudience),
          _rtcClient.exitRoom(),
        ],
      );

      if (!isJoinBefore) {
        xlog(() => '用户申请离开房间', type: LogType.RTC);
      }
    } catch (e, s) {
      errLog(e, s, type: LogType.RTC);
    }
  }
//</editor-fold>
}
