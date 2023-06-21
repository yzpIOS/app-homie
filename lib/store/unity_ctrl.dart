import 'dart:convert';

import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/event/event.dart';
import 'package:app/exception.dart';
import 'package:app/model/enum/unity_event_enum.dart';
import 'package:app/store/common/ready_ctrl_mixin.dart';
import 'package:app/tools.dart';
import 'package:app/tools/scene_loader.dart';
import 'package:app/widgets.dart';
import 'package:f_unity/f_unity_platform_interface.dart';
import 'package:slugid/slugid.dart';
import 'package:synchronized/synchronized.dart';

export 'package:app/model/enum/unity_event_enum.dart';

class UnityCtrl extends GetxService with ReadyMixin, ReadyCtrlMixin, GetDisposableMixin {
  late final _callback = _Callback();

  StreamSubscription? subscription;

  final _sceneLock = Lock(reentrant: true);

  @override
  void onInit() {
    super.onInit();

    asyncTrack('Unity初始化', action: () => ready);

    bindStream(
      FUnityPlatform.instance.onUnityMessage().listen(_onUnityMessage),
    );

    if (Env.isDebug && Env.useUnity) {
      _sendMessage(App2UnityEnum.FTU_TEST, null, const Duration(seconds: 5)) //
          .then((_) => markReady())
          .ignore();
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
    xlog('Unity准备好了！！！', type: LogType.UNITY);

    markReady();
  }

  Future<void> _unityReady() async {
    if (!Env.useUnity) throw '未开启Unity';

    await ready.timeout(const Duration(seconds: 30));
  }

  ///
  /// 发送flutter相关的socket信息
  ///
  void sendFlutterSocketInfo({int tryTimes = 0}) async {
    if(tryTimes >= 10) {
      return;
    }
    debugPrint("[sendFlutterSocketInfo]: 发送socket相关信息给unity");
    // 更新唯一id
    SocketCtrl.ins.updateUniqueId();
    // 延迟时间
    int delayTryTIme = 3;
    // 获取到端口号
    subscription?.cancel();
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
    SocketCtrl.ins.removeServerStatusCallBacks(onServerStatusCallBacks);
  }

  Future<T> sendMessage<T>(App2UnityEnum action, {data, Duration timeout = const Duration(seconds: 5)}) async {
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
          timeout: const Duration(minutes: 2),
        );

        await loader.doOnAfter?.call();
      },
    );
  }

  Future<void> loadScene(final String scene, {DoOnAfter? doOnAfter, DoOnBefore? doOnBefore}) {
    return _loadScene(
      SceneInfo(scene, doOnAfter: doOnAfter, doOnBefore: doOnBefore),
    );
  }

  Future<void> loadSceneBlank() => _loadScene(const SceneInfo('Transition'));

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

          completer?.completeError(TimeoutException("Future not completed", timeout));
        },
      ),
    );

    return info;
  }

  _CallbackInfo? _popup(String requestId) {
    final data = _data.remove(requestId);

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
