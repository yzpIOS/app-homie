// import 'dart:convert';
// import 'dart:ui';
//
// import 'package:app/common/nets/cmds.dart';
// import 'package:app/common/nets/commons/proto/Message.pb.dart';
// import 'package:app/common/nets/socket/socket_ctrl.dart';
// import 'package:app/event/event.dart';
// import 'package:app/tools.dart';
// import 'package:app/types.dart';
// import 'package:stomp_dart_client/stomp.dart';
// import 'package:stomp_dart_client/stomp_config.dart';
// import 'package:stomp_dart_client/stomp_frame.dart';
//
// class MqCtrl extends GetxController {
//   late final _StompClient _client;
//
//   @override
//   void onInit() {
//     super.onInit();
//
//     _client = _StompClient(
//       uri: Env.mqUrl,
//       auth: const {'login': Env.mqAcc, 'passcode': Env.mqPwd},
//       subMap: {},
//     );
//
//     _client.sub(
//       exchange('app_broadcast'),
//       (event) {
//         if (event case {'code': int code, 'data': Map data}) {
//           // final logicEvent = switch (code) {
//           //   8 => SuperGiftEvent(data),
//           //   _ => BroadcastEvent(data),
//           // };
//           //
//           // logicEvent.fire();
//
//           return;
//         }
//
//         assert(false, '未处理的业务 -> $event');
//       },
//     );
//     SocketCtrl.ins.onDataCmd(CMD.S_FloatingScreen, onFloatingScreen);
//   }
//
//   ///
//   /// 漂屏
//   ///
//   void onFloatingScreen(int cmd, S_FloatingScreen? sFloatingscreen) {
//     if(sFloatingscreen == null) {
//       return;
//     }
//     SuperGiftEvent(sFloatingscreen).fire();
//   }
//
//   @override
//   void onClose() {
//     _client.stop();
//     SocketCtrl.ins.removeOnDataCmd(CMD.S_FloatingScreen, onFloatingScreen);
//     super.onClose();
//   }
//
//   static String queue(String queue) => '/queue/$queue';
//
//   static String topic(String topic) => '/topic/$topic';
//
//   static String exchange(String exchange) => '/exchange/$exchange';
//
//   sub(String key, {required OnData<JMap> onData, VoidCallback? onReSub}) => _client.sub(key, onData, onReSub: onReSub);
//
//   unSub(String key) => _client.unSub(key);
//
//   static MqCtrl get obj => Get.find();
// }
//
// class _StompClient {
//   final Map<String, _SubInfo> subMap;
//   final StompClient _client;
//
//   _StompClient({required Uri uri, required Map<String, String> auth, required this.subMap})
//       : _client = _init(uri.toString(), auth, subMap)..activate();
//
//   void sub(String key, OnData<JMap> onData, {VoidCallback? onReSub}) {
//     if (subMap.containsKey(key)) {
//       assert(false, '订阅消息，数据错误 -> $key');
//     } else {
//       Function? unSub;
//
//       if (_client.connected) {
//         unSub = _client.subscribe(destination: key, callback: _onData(onData));
//
//         xlog('开始订阅【$key】', type: LogType.STOMP);
//       }
//
//       subMap[key] = _SubInfo(onData: onData, unSub: unSub, onReSub: onReSub);
//     }
//   }
//
//   void unSub(String key) {
//     xlog('取消订阅【$key】', type: LogType.STOMP);
//
//     try {
//       final f = subMap.remove(key);
//
//       f?.unSub?.call();
//     } catch (e, s) {
//       errLog(e, s, type: LogType.STOMP);
//     }
//   }
//
//   void stop() => _client.deactivate();
//
//   static StompClient _init(String url, Map<String, String> auth, Map<String, _SubInfo> subMap) {
//     xlog('初始化 -> $auth', type: LogType.STOMP);
//
//     const _delay = Duration(seconds: 2);
//     const _timeout = Duration(seconds: 15);
//
//     late final StompClient client;
//
//     client = StompClient(
//       config: StompConfig(
//         url: url,
//         stompConnectHeaders: auth,
//         reconnectDelay: _delay,
//         connectionTimeout: _timeout,
//         onWebSocketDone: () => xlog('WS已断开', type: LogType.STOMP),
//         onWebSocketError: (e) => errLog(e, null, type: LogType.STOMP),
//         // onDebugMessage: canLog(LogType.STOMP) ? print : (_) {},
//         onConnect: (frame) {
//           xlog('连接成功', type: LogType.STOMP);
//
//           subMap.forEach((k, v) {
//             xlog('恢复订阅【$k】', type: LogType.STOMP);
//
//             final unSub = v.unSub;
//
//             try {
//               unSub?.call();
//             } catch (e, s) {
//               errLog(e, s, type: LogType.STOMP);
//             }
//
//             try {
//               v.unSub = client.subscribe(destination: k, callback: _onData(v.onData));
//
//               if (unSub != null) v.onReSub?.call();
//             } catch (e, s) {
//               errLog(e, s, type: LogType.STOMP);
//             }
//           });
//         },
//       ),
//     );
//
//     return client;
//   }
//
//   static Function(StompFrame) _onData(OnData<JMap> onData) {
//     return (StompFrame frame) async {
//       final body = frame.body ?? utf8.decode(frame.binaryBody!);
//
//       xlog(() => '${frame.destination} ID[${frame.id}] -> $body', type: LogType.STOMP);
//
//       try {
//         final data = await execTask1(arg1: body, fun1: _decode) as JMap;
//
//         onData(data);
//       } catch (e, s) {
//         errLog(e, s);
//       }
//     };
//   }
//
//   static dynamic _decode(String data, _) => jsonDecode(data);
// }
//
// class _SubInfo {
//   final OnData<JMap> onData;
//   final VoidCallback? onReSub;
//
//   _SubInfo({required this.onData, required this.onReSub, this.unSub});
//
//   Function? unSub;
// }
//
// extension on StompFrame {
//   String? get id => headers['message-id'];
//
//   String? get destination => headers['destination'];
// }
