import 'dart:convert';
import 'dart:io';

import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/exception.dart';
import 'package:app/model/enum/room_state.dart';
import 'package:app/model/enum/unity_event_enum.dart';
import 'package:app/net/api.dart';
import 'package:app/store/common/ready_ctrl_mixin.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/tools/scene_loader.dart';
import 'package:app/widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:f_unity/f_unity_platform_interface.dart';
import 'package:slugid/slugid.dart';
import 'package:synchronized/synchronized.dart';

export 'package:app/model/enum/unity_event_enum.dart';

const unity_time_out = 90;

class UnityCtrl extends GetxService with ReadyMixin, ReadyCtrlMixin, GetDisposableMixin {
  late final _callback = _Callback();

  StreamSubscription? _netStatusChange;
  StreamSubscription? _netStatusMessageTick;
  StreamSubscription? subscription;
  // 是否调用过unity的
  bool successSendInfo2Unity = false;
  // unity是否初始化成功
  bool _isUnityInitSuccess = false;

  // 当前加载的scene
  bool? netStatusValue = null;
  int curFluttyVersion = DateTime.now().millisecondsSinceEpoch;

  Completer _sendSockComplete = Completer();

  final _sceneLock = Lock(reentrant: true);

  static UnityCtrl get ins {
    return Get.find<UnityCtrl>();
  }

  @override
  void onInit() {
    super.onInit();

    asyncTrack('Unity初始化', action: () => ready);

    bindStream(
      FUnityPlatform.instance.onUnityMessage().listen(_onUnityMessage),
    );

    if (Env.isDebug && Env.useUnity) {
      _sendMessage(App2UnityEnum.FTU_TEST, null, const Duration(seconds: unity_time_out)) //
          .then((_) => markReady())
          .ignore();
    }
    // 网络变化
    _netStatusChange = Connectivity().onConnectivityChanged.listen((event) async {
      if(!_sendSockComplete.isCompleted) {
        _sendSockComplete = Completer();
      }
      if(_isUnityInitSuccess) {
        return;
      }
      tellUnityNetStatus(event == ConnectivityResult.wifi || event == ConnectivityResult.mobile);
    });
    // 默认网络开启
    Connectivity().checkConnectivity().then((event) async {
      if(_isUnityInitSuccess) {
        return;
      }
      tellUnityNetStatus(event == ConnectivityResult.wifi || event == ConnectivityResult.mobile);
    }, onError: (error) {
      tellUnityNetStatus(false);
    });
  }

  ///
  /// 告诉unity网络变化
  ///
  void tellUnityNetStatus(bool result) async {
    // if(!_isUnityInitSuccess) {
    //   return;
    // }
    if(netStatusValue == result) {
      return;
    }
    netStatusValue = result;

    curFluttyVersion = DateTime.now().millisecondsSinceEpoch;
    // 局部变量，用于记录上一次的版本号
    int version = curFluttyVersion;
    int maxTimes = 50;
    while(true) {
      if(curFluttyVersion != version || maxTimes <= 0) {
        logForDebug("[UnityCtrl:tellUnityNetStatus]:curFluttyVersion != version || maxTimes <= 0");
        break;
      }
      // unity己经初始初始化成功了
      if(_isUnityInitSuccess) {
        break;
      }
      // 重试次数
      maxTimes --;
      try {
        await _sendMessage(
            App2UnityEnum.FTU_NET_STATUS_CHANGE,
            {"status": result},
            const Duration(seconds: 5)
        );
        // 成功返回
        logForDebug("[UnityCtrl:tellUnityNetStatus]:告诉unity网络状态成功");
        break;
      } catch(e, s) {
        await Future.delayed(const Duration(seconds: 2));
        logForDebug("[UnityCtrl:tellUnityNetStatus]:告诉unity网络状态成功异常");
      }
    }
  }

  void _onUnityMessage(String json) {
    xlog(() => 'onUnityMessage -> $json', type: LogType.UNITY);

    final Map msg = jsonDecode(json);
    final respId = msg['responseId'];

    if (respId is String) {
      _callback.doOnResp(respId, msg);
    } else {
      final code = Unity2AppEnum.fromName(msg['action']);

      if (code == null) {
        assert(false, '数据错误 -> $json');
      } else {
        switch (code) {
          case Unity2AppEnum.FLUTTER_DEBUG:
            _onUnityStart();
            break;
          case Unity2AppEnum.UTF_INIT_START:
            _isUnityInitSuccess = true;
            _onUnityInit();
            // 发送flutter相关的信息
            sendFlutterSocketInfo();
            // 监听flutter socketserver状态
            socketCtrlStatus();
            break;
          default:
            final reqId = msg['requestId'];

            if (reqId is String && reqId.isNotEmpty) {
              RespUnityEvent(code: code, data: msg['data'], requestId: reqId) //
                ..doResp(FUnityPlatform.instance.doSend)
                ..fire();
            } else {
              XUnityEvent(code: code, data: msg['data']).fire();
            }
        }
      }
    }
  }

  void _onUnityStart() {
    final data = {
      'data': {'catalogPath': ''}
    };

    FUnityPlatform.instance.doSend(jsonEncode(data));
  }

  void _onUnityInit() {
    logForDebug('[UnityCtrl:sendFlutterSocketInfo]:Unity准备好了！！！');
    try {
      markReady();
    } catch(e, s) {
      print(e);
    }
  }

  Future<void> unityReady() async {
    if (!Env.useUnity) throw '未开启Unity';

    await ready.timeout(const Duration(seconds: unity_time_out));
  }

  ///
  /// 发送flutter相关的socket信息
  ///
  void sendFlutterSocketInfo({int tryTimes = 0}) async {
    if(isClosed || _isUnityInitSuccess == false || tryTimes >= 100) {
      return;
    }
    // 重新进入等待
    if(_sendSockComplete.isCompleted) {
      _sendSockComplete = Completer();
    }
    logForDebug("[UnityCtrl:sendFlutterSocketInfo]:发送socket相关信息给unity");
    // 更新唯一id
    SocketCtrl.ins.updateUniqueId();
    // 延迟时间
    int delayTryTIme = 5;
    // 获取到端口号
    subscription?.cancel();
    subscription = SocketCtrl.ins.getLocalServerPort().asStream().listen((event) async {
      // 服务还没有连上
      if(event == 0) {
        logForDebug("[UnityCtrl:sendFlutterSocketInfo]:服务没有启动...");
        await Future.delayed(Duration(seconds: delayTryTIme));
        sendFlutterSocketInfo(tryTimes: tryTimes + 1);
        return;
      }

      logForDebug("[UnityCtrl:sendFlutterSocketInfo]:发送信息给unity, port = ${event}, uniqueId = ${SocketCtrl.ins.uniqueId}...");
      // 获取到端口
      dynamic resultString = await sendMessage(
        App2UnityEnum.FTU_NEW_SOCKET_INFO,
        data: {
          "port": event,
          "uniqueId": SocketCtrl.ins.uniqueId,
        },
      );

      // 发送完成消息
      _sendSockComplete.complete();

      // 如果用户己登录，那么发送用户信息给unity
      await sendUserInfo2Unity();

      logForDebug("[UnityCtrl:sendFlutterSocketInfo]:连接成功, port = ${event}, uniqueId = ${SocketCtrl.ins.uniqueId}, info = ${resultString}...");
    }, onError: (error) async {
      logForDebug("[UnityCtrl:sendFlutterSocketInfo]:连接失败, error = ${error.toString()}");
      // 连接错误
      await Future.delayed(Duration(seconds: delayTryTIme));
      sendFlutterSocketInfo(tryTimes: tryTimes + 1);
    });
  }

  ///
  /// 发送用户信息到unity
  ///
  Future sendUserInfo2Unity() async {
    if(isClosed || _isUnityInitSuccess == false) {
      return;
    }
    if(!OAuthCtrl.isLogin) {
      return;
    }
    // 获取到端口
    await sendMessage(
      App2UnityEnum.FTU_SEND_USER_INFO,
      data: {
        "uid": OAuthCtrl.uid,
        "role_id": OAuthCtrl.nUid.toInt()
      },
    );
  }

  ///
  /// 监听flutter socket相关的状态
  ///
  void socketCtrlStatus() {
    SocketCtrl.ins.removeServerStatusCallBacks(onServerStatusCallBacks);
    SocketCtrl.ins.addServerStatusCallBacks(onServerStatusCallBacks);

    SocketCtrl.ins.removeLocalDisconnect(localServerStatusChange);
    SocketCtrl.ins.addLocalDisconnect(localServerStatusChange);
  }

  ///
  /// 本地服务连接状态变化回调
  ///
  void onServerStatusCallBacks() {
    sendFlutterSocketInfo();
  }

  void localServerStatusChange() {
    if(loadSceneComplete) {
      return;
    }
    if(RoomManagerCtrl.ins.stateRx.value == RoomState.Mini) {
      // 房间最小化中
      RoomManagerCtrl.ins.closeRoom2();
    } else if(RoomManagerCtrl.ins.stateRx.value == RoomState.Normal) {
      // 现在在房间中
      RoomExitEvent("房间数据加载失败，请重试").fire();
      // 房间最小化中
      RoomManagerCtrl.ins.closeRoom2();
    } else {
      RoomExitEvent("房间数据加载失败，请重试").fire();
    }
  }

  @override
  void onClose() {
    super.onClose();
    subscription?.cancel();
    _netStatusChange?.cancel();
    _netStatusMessageTick?.cancel();
    SocketCtrl.ins.removeServerStatusCallBacks(onServerStatusCallBacks);
    SocketCtrl.ins.removeLocalDisconnect(localServerStatusChange);
  }

  Future<T> sendMessage<T>(App2UnityEnum action, {data, Duration timeout = const Duration(seconds: unity_time_out)}) async {
    await unityReady();

    return _sendMessage(action, data, timeout);
  }

  Future<T> _sendMessage<T>(App2UnityEnum action, data, Duration timeout) async {
    assert(data is! Function);

    final req = _callback.create<T>(action, timeout);

    if (Env.useUnity) {
      try {
        final msg = jsonEncode(
          {
            'action': req.action,
            'requestId': req.requestId,
            'appVersion': Env.version,
            'screenWidth': AppSize.width.toInt(),
            'screenHeight': AppSize.height.toInt(),
            'data': data == null ? '{}' : (data is String ? data : jsonEncode(data)),
          },
        );

        xlog(() => 'sendMessage -> $msg', type: LogType.UNITY);

        await FUnityPlatform.instance.doSend(msg);
      } catch (e, s) {
        _callback.doRespErr(req.requestId, req.action, e, s);
      }
    } else {
      _callback.doRespErr(req.requestId, req.action, '');
    }

    return req.future;
  }

  void sendCmd(App2UnityEnum action, {data}) async {
    await unityReady();

    assert(data is! Function);

    if (Env.useUnity) {
      final msg = jsonEncode(
        {
          'action': action.name,
          'requestId': '',
          'appVersion': Env.version,
          'isAndroid': Platform.isAndroid,
          'isIOS': Platform.isIOS,
          'data': data == null ? '{}' : (data is String ? data : jsonEncode(data)),
        },
      );

      xlog(() => 'sendMessage -> $msg', type: LogType.UNITY);

      await FUnityPlatform.instance.doSend(msg);
    }
  }

  bool loadSceneComplete = false;

  Future<void> _loadScene(SceneInfo loader) async {
    await _sceneLock.synchronized(() {});
    // 没有完成，需要等待
    // if(!sendSocketComplete.isCompleted) {
    //   await sendSocketComplete.future.timeout(const Duration(seconds: unity_time_out));
    // }
    loadSceneComplete = false;
    if(!_sendSockComplete.isCompleted) {
      logForDebug("[UnityCtrl:loadScene]:与unity通信未成功，unity返回再加载场景");
      await _sendSockComplete.future;
    }
    logForDebug("[UnityCtrl:loadScene]:unity通信成功，开始加载场景");
    // 通知加载场景
    Bus.fire(LoadScene(sceneName: loader.scene));
    return asyncTrack(
      '加载场景 -> ${loader.scene}',
      type: LogType.UNITY,
      action: () async {
        final doOnBefore = loader.doOnBefore;

        final data = {
          if (doOnBefore != null) ...await doOnBefore(),
          'sceneName': loader.scene,
        };

        await sendMessage(
          App2UnityEnum.FTU_LOAD_SCENE,
          data: data,
          timeout: const Duration(minutes: unity_time_out),
        );
        loadSceneComplete = true;


        await loader.doOnAfter?.call();
      },
    );
  }

  ///
  /// 加载unity场景
  ///
  Future<void> loadScene(final String scene, {DoOnAfter? doOnAfter, DoOnBefore? doOnBefore}) async {
    // 登录成功后才会连接上socket, 等待socket连接成功才加载场景
    if(OAuthCtrl.isLogin) {
      logForDebug("[UnityCtrl:loadScene]:开始加载场景, 等待网络状态返回, scene = $scene");
      await SocketCtrl.ins.isCConnect();
      logForDebug("[UnityCtrl:loadScene]:开始加载场景, 网络状态己返回, scene = $scene");
    }
    // 加载场景
    return _loadScene(
      SceneInfo(scene, doOnAfter: doOnAfter, doOnBefore: doOnBefore),
    );
  }

  ///
  /// 加载空白的unity场景
  ///
  Future<void> loadSceneBlank() async {
    _loadScene(const SceneInfo('Transition'));
  }

  Future<void> loadSceneCombo(FutureOr<void> Function() action) => _sceneLock.synchronized(action);
}

class _Callback {
  late final _data = <String, Tuple2<_CallbackInfo, Timer>>{};

  _CallbackInfo<T> create<T>(App2UnityEnum action, Duration timeout) {
    final info = _CallbackInfo<T>(action.name);

    _data[info.requestId] = Tuple2(
      info,
      Timer(
        timeout,
        () {
          final completer = _data.remove(info.requestId)?.value1._completer;

          logForDebug('Unity响应[超时] -> [${info.requestId}]#[$action] $completer');

          assert(completer != null);

          completer?.completeError(TimeoutException("Future not completed2", timeout));
        },
      ),
    );

    return info;
  }

  _CallbackInfo? _popup(String requestId) {
    final data = _data.remove(requestId);
    if(data == null) {
      return null;
    }
    assert(data != null, '数据异常[$requestId]');

    return data?.let((it) {
      it.value2.cancel();

      return it.value1;
    });
  }

  void doOnResp(String id, Map msg) {
    final info = _popup(id);

    if (info != null) {
      final code = msg['code'];
      final action = msg['action'];

      assert(info.action == action);

      switch (code) {
        case 0:
          final data = msg['data'];

          logForDebug('Unity响应[成功] -> [$id]#[$action] $data');

          info._completer.complete(data);
          break;
        default:
          final err = msg['message'];

          logForDebug('Unity响应[失败] -> [$id]#[$action] $code $err');

          info._completer.completeError(LogicException(code, err ?? '操作失败'));
          break;
      }
    } else {
      logForDebug('Unity响应[错误] -> [$id]不存在');
    }
  }

  void doRespErr(String requestId, String action, Object error, [StackTrace? stackTrace]) {
    final info = _popup(requestId);

    if (info != null) {
      assert(info.action == action);

      info._completer.completeError(error, stackTrace);
    }
  }
}

class _CallbackInfo<T> {
  final String action;
  final String requestId = Slugid.nice().toString();

  _CallbackInfo(this.action);

  final _completer = Completer<T>();

  Future<T> get future => _completer.future;
}

extension on FUnityPlatform {
  Future<void> doSend(String message) async {
    return await postMessage('FlutterReceiver', 'ReceiveMessageFromFlutter', message);
  }
}
