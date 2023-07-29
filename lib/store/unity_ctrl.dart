import 'dart:convert';

import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/event/event.dart';
import 'package:app/exception.dart';
import 'package:app/model/enum/unity_event_enum.dart';
import 'package:app/net/api.dart';
import 'package:app/store/common/ready_ctrl_mixin.dart';
import 'package:app/store/oauth_ctrl.dart';
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
  // 随便起的？？
  static const UNITY_STOP_EVENT = "flutter_tell_ios_stop_render_event";
  static const UNITY_RESUME_EVENT = "flutter_tell_ios_resume_render_event";
  late final _callback = _Callback();

  StreamSubscription? _netStatusChange;
  StreamSubscription? _netStatusMessageTick;
  StreamSubscription? subscription;
  // 是否调用过unity的
  bool successSendInfo2Unity = false;
  // unity是否初始化成功
  bool _isUnityInitSuccess = false;

  // 当前加载的scene
  String curScene = "";
  bool? netStatusValue = null;
  int curFluttyVersion = DateTime.now().millisecondsSinceEpoch;

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
      if(_isUnityInitSuccess) {
        _netStatusChange?.cancel();
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
        debugPrint("curFluttyVersion != version || maxTimes <= 0");
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
        debugPrint("unity通讯成功");
        break;
      } catch(e, s) {
        await Future.delayed(const Duration(seconds: 2));
        debugPrint(e.toString());
        debugPrint("unity通讯异常");
      }
    }
    debugPrint("unity通讯完成");
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
            curScene = "";
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
    xlog('Unity准备好了！！！', type: LogType.UNITY);
    try {
      markReady();
    } catch(e, s) {
      print(e);
    }
  }

  Future<void> _unityReady() async {
    if (!Env.useUnity) throw '未开启Unity';

    await ready.timeout(const Duration(seconds: unity_time_out));
  }

  ///
  /// 发送flutter相关的socket信息
  ///
  void sendFlutterSocketInfo({int tryTimes = 0}) async {
    if(isClosed) {
      return;
    }
    // 未登录, 不发消息
    if(!OAuthCtrl.isLogin || _isUnityInitSuccess == false) {
      return;
    }
    if(tryTimes >= 100) {
      return;
    }
    debugPrint("[sendFlutterSocketInfo]: 发送socket相关信息给unity");
    // 更新唯一id
    SocketCtrl.ins.updateUniqueId();
    // 延迟时间
    int delayTryTIme = 5;
    // 获取到端口号
    subscription?.cancel();
    successSendInfo2Unity = true;
    subscription = SocketCtrl.ins.getLocalServerPort().asStream().listen((event) async {
      // 服务还没有连上
      if(event == 0) {
        debugPrint("[sendFlutterSocketInfo]: 服务没有启动...");
        await Future.delayed(Duration(seconds: delayTryTIme));
        sendFlutterSocketInfo(tryTimes: tryTimes + 1);
        return;
      }

      debugPrint("[sendFlutterSocketInfo]: 发送信息给unity, port = ${event}, uniqueId = ${SocketCtrl.ins.uniqueId}...");
      // 获取到端口
      dynamic resultString = await sendMessage(
        App2UnityEnum.FTU_NEW_SOCKET_INFO,
        data: {
          "port": event,
          "uniqueId": SocketCtrl.ins.uniqueId,
          "uid": OAuthCtrl.uid,
          "role_id": OAuthCtrl.nUid.toInt()
        },
      );
      debugPrint("[sendFlutterSocketInfo]: 连接成功, port = ${event}, uniqueId = ${SocketCtrl.ins.uniqueId}, info = ${resultString}...");
    }, onError: (error) async {
      debugPrint("[sendFlutterSocketInfo]: 连接失败, error = ${error.toString()}");
      // 连接错误
      await Future.delayed(Duration(seconds: delayTryTIme));
      sendFlutterSocketInfo(tryTimes: tryTimes + 1);
    });
  }

  ///
  /// 监听flutter socket相关的状态
  ///
  void socketCtrlStatus() {
    SocketCtrl.ins.removeServerStatusCallBacks(onServerStatusCallBacks);
    SocketCtrl.ins.addServerStatusCallBacks(onServerStatusCallBacks);
  }

  ///
  /// 本地服务连接状态变化回调
  ///
  void onServerStatusCallBacks() {
    sendFlutterSocketInfo();
  }

  @override
  void onClose() {
    super.onClose();
    subscription?.cancel();
    _netStatusChange?.cancel();
    _netStatusMessageTick?.cancel();
    SocketCtrl.ins.removeServerStatusCallBacks(onServerStatusCallBacks);
  }

  Future<T> sendMessage<T>(App2UnityEnum action, {data, Duration timeout = const Duration(seconds: unity_time_out)}) async {
    await _unityReady();

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
    await _unityReady();

    assert(data is! Function);

    if (Env.useUnity) {
      final msg = jsonEncode(
        {
          'action': action.name,
          'requestId': '',
          'data': data == null ? '{}' : (data is String ? data : jsonEncode(data)),
        },
      );

      xlog(() => 'sendMessage -> $msg', type: LogType.UNITY);

      await FUnityPlatform.instance.doSend(msg);
    }
  }

  Future<void> _loadScene(SceneInfo loader) async {
    await _sceneLock.synchronized(() {});
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

        // 防止重复加载
        if(curScene != loader.scene) {
          debugPrint("场景切换太频繁=>loader.scene = ${loader.scene}, curScene = $curScene");
          return;
        }

        await sendMessage(
          App2UnityEnum.FTU_LOAD_SCENE,
          data: data,
          timeout: const Duration(minutes: unity_time_out),
        );

        await loader.doOnAfter?.call();
      },
    );
  }

  Future<void> loadScene(final String scene, {DoOnAfter? doOnAfter, DoOnBefore? doOnBefore}) {
    curScene = scene;
    return _loadScene(
      SceneInfo(scene, doOnAfter: doOnAfter, doOnBefore: doOnBefore),
    );
  }

  Future<void> loadSceneBlank() async {
    curScene = "Transition";
    _loadScene(SceneInfo(curScene));
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

          xlog('Unity响应[超时] -> [${info.requestId}]#[$action] $completer', type: LogType.UNITY);

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

          xlog('Unity响应[成功] -> [$id]#[$action] $data', type: LogType.UNITY);

          info._completer.complete(data);
          break;
        default:
          final err = msg['message'];

          xlog('Unity响应[失败] -> [$id]#[$action] $code $err', type: LogType.UNITY);

          info._completer.completeError(LogicException(code, err ?? '操作失败'));
          break;
      }
    } else {
      xlog('Unity响应[错误] -> [$id]不存在', type: LogType.UNITY);
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
