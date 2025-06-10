import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tencent_trtc_cloud/trtc_cloud.dart';
import 'package:tencent_trtc_cloud/trtc_cloud_def.dart';
import 'package:tencent_trtc_cloud/trtc_cloud_listener.dart';

import 'package:app/common/utils/utils.dart';
import '../../event/event.dart';
import 'keys.dart';

export 'package:tencent_trtc_cloud/trtc_cloud_def.dart';

/// RTC 实时通信管理类
/// 用于管理腾讯云 TRTC 的实时音视频通信功能
class Rtc {
  Rtc._(); // 私有构造函数，防止实例化

  /// 初始化实例
  static final init = _init();

  /// 用户说话音量映射表，key为用户ID，value为音量值(0-1)
  static final speakRx = RxMap<String, double>();
  /// 开启麦克风的用户集合
  static final openMicRx = RxSet<String>();
  /// 麦克风开关状态
  static final micRx = RxBool(false);
  /// 音频开关状态
  static final audioRx = RxBool(true);
  /// 视频开关状态
  static final videoRx = RxBool(false);
  /// 网络质量状态
  static final netQualityRx = RxInt(0);

  /// TRTC SDK 应用 ID
  static  int sdkAppId = 0 ;
  /// 用户 ID
  static String userId = '';
  /// 用户签名
  static String userSig = '';
  /// 麦状态，1禁麦
  static late final status = RxInt(0);

  /// 是否可以选择麦克风
  static bool isCanSelect = true;
  /// 麦克风状态:0.无麦 1.上麦 2,下麦 3.闭麦,4.禁麦
  /// 3.开麦 4.闭麦 5.禁言【禁止rtc】
  static late final mike_status = RxInt(0);

  /// TRTC 客户端实例
  static late final TRTCCloud _rtcClient;

  /// 初始化 TRTC 客户端
  static Future<void> _init() async {
    _rtcClient = (await TRTCCloud.sharedInstance())!;

    await Future.wait(
      [
        _rtcClient.setLogLevel(TRTCCloudDef.TRTC_LOG_LEVEL_NULL),
        _rtcClient.setConsoleEnabled(canLog(LogType.RTC)),
      ],
    );

    // 注册 TRTC 事件监听器
    _rtcClient.registerListener((type, args) {
      switch (type) {
        /// 网络质量变化回调。用于监控本地和远端用户的网络状况，通常用于显示网络信号强弱。
        case TRTCCloudListener.onNetworkQuality:
          netQualityRx(args['localQuality']['quality']);
          break;
          /// 用户音量回调。用于获取房间内每个用户的实时音量大小，常用于语音聊天室的音量显示。
        case TRTCCloudListener.onUserVoiceVolume:
          _onUserVoiceVolume(args);
          break;
          /// 进入房间回调。用户成功进入房间时触发。
        case TRTCCloudListener.onEnterRoom:
          _onEnterRoom(args);
          break;
          /// 离开房间回调。用户主动离开房间时触发。
        case TRTCCloudListener.onExitRoom:
          _onExitRoom(args);
          break;
          /// 用户切换房间回调。用户切换到其他房间时触发。
        case TRTCCloudListener.onSwitchRoom:
          xlog('用户切换房间 -> $args', type: LogType.RTC);
          break;
          /// 用户切换角色回调。用户切换角色时触发。
        case TRTCCloudListener.onSwitchRole:
          xlog('用户切换角色 -> $args', type: LogType.RTC);
          break;
          /// 远程用户进入房间回调。当有其他用户进入房间时触发。
        case TRTCCloudListener.onRemoteUserEnterRoom:
          _onRemoteUserEnterRoom(args);
          break;
          /// 远程用户离开房间回调。当有其他用户离开房间时触发。
        case TRTCCloudListener.onRemoteUserLeaveRoom:
          _onRemoteUserLeaveRoom(args);
          break;
          /// 用户音量回调。用于获取房间内每个用户的实时音量大小，常用于语音聊天室的音量显示。
        case TRTCCloudListener.onUserAudioAvailable:
          _onUserAudioAvailable(args);
          break;
          /// 统计信息回调。用于获取当前用户的音视频统计信息。
        case TRTCCloudListener.onStatistics:
          break;
          /// 错误回调。用于处理音视频通信过程中的错误事件。
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

  /// 初始化麦克风相关设置
  static Future<void> _micInit() async {
    await _enableMic(micRx.value);
    await _enableAudio(audioRx.value);
    await _enableVideo(videoRx.value);

    // 监听状态变化
    micRx.listen(_enableMic);
    audioRx.listen(_enableAudio);
    videoRx.listen(_enableVideo);
  }

  //<editor-fold desc="Event">
  /// 处理远程用户进入房间事件
  static void _onRemoteUserEnterRoom(args) {
    xlog('用户上麦 -> $args', type: LogType.RTC);
  }

  /// 处理远程用户离开房间事件
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

  /// 处理用户音频可用性变化事件
  static void _onUserAudioAvailable(Map args) {
    xlog('用户开关麦 -> $args', type: LogType.RTC);

    if (args['available']) {
      openMicRx.add(args['userId']);
    } else {
      openMicRx.remove(args['userId']);
    }
  }

  /// 处理用户音量变化事件
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

  /// 处理进入房间事件
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

  /// 处理离开房间事件
  static void _onExitRoom(int args) {
    xlog('用户离开房间 -> $args', type: LogType.RTC);

    micRx(false);
    speakRx.clear();
    openMicRx.clear();
    status(0);
    mike_status(0);

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
  /// 控制麦克风开关
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

  /// 控制音频开关
  static Future<void> _enableAudio(bool enable) async {
    try {
      await _rtcClient.muteAllRemoteAudio(!enable);

      xlog(() => '声音状态设置为[$enable]', type: LogType.RTC);
    } catch (e, s) {
      errLog(e, s, type: LogType.RTC);
    }
  }

  /// 进入房间
  static Future<void> enterRoom(String roomId, String token) async {
    await Rtc.init;
    await Rtc.leave(isJoinBefore: true);

    _rtcClient.enterRoom(
      TRTCParams(
        sdkAppId: Rtc.sdkAppId,
        roomId: 0,
        strRoomId: roomId,
        userId: Rtc.userId,
        userSig: Rtc.userSig,
        role: TRTCCloudDef.TRTCRoleAudience,
      ),
      TRTCCloudDef.TRTC_APP_SCENE_VOICE_CHATROOM,
    );

    Rtc.micRx(false);
  }

  /// 设置音频采集音量
  static Future<void> setAudioCaptureVolume(int volume) async {
    await Rtc._rtcClient.setAudioCaptureVolume(volume.toInt());
  }

  /// 控制视频开关
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

  /// 切换麦克风开关
  static Future<void> micSwitch() async {
    if (micRx.isFalse) {
      if (!await Permission.microphone.request().isGranted) {
        showToast('权限获取失败');
        return;
      }
    }

    if(isCanSelect == true){
      int status = micRx.value == true ? 2: 1;
      await Api.Room.openShutMike(status: status);
    }
  }

  /// 切换用户角色
  static Future<void> switchRole(int role) async {
    await _rtcClient.switchRole(TRTCCloudDef.TRTCRoleAnchor);
  }

  /// 离开房间
  static Future<void> leave({bool isJoinBefore = false}) async {
    try {
      audioRx(true);
      await Future.wait(
        [
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
