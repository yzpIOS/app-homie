import 'dart:convert';

import 'package:flutter_unity_widget/flutter_unity_widget.dart';

import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:app/test/_my_test.dart';

class XUnityView extends StatefulWidget {
  const XUnityView({super.key});

  @override
  State<XUnityView> createState() => _UnityViewState();
}

class _UnityViewState extends State<XUnityView> with BusStateMixin {
  UnityWidgetController? _controller;

  UnityWidgetController get controller => _controller!;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    on<MyUnityEvent>(
      test: (it) => it.code == "-1",
      (event) {
        final data = event.data;

        final code = data['code'];
        final d = data['data'] ?? "";

        _sendMessage(code: code, data: d);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return UnityWidget(
      onUnityCreated: _onUnityCreated,
      onUnityUnloaded: _onUnityUnloaded,
      onUnityMessage: _onUnityMessage,
      onUnitySceneLoaded: _onUnitySceneLoaded,
      runImmediately: true,
      fullscreen: false,
      hideStatus: false,
      unloadOnDispose: false,
      enablePlaceholder: false,
      printSetupLog: canLog(LogType.UNITY),
    );
  }

  void _onUnityCreated(UnityWidgetController controller) {
    _controller = controller;
  }

  void _onUnityUnloaded() {}

  void _onUnitySceneLoaded(SceneLoaded? message) {}

  void _onUnityMessage(json) {
    print("my" "->${"_onUnityMessage"}" "->$json");

    final data = jsonDecode(json);
    final code = data['code'];

    MyUnityEvent(code: code, data: data['data']).fire();
  }

  Future _sendMessage({required String code, required dynamic data}) async {
    final message = jsonEncode(
      {
        'code': code,
        'data': jsonEncode(data),
      },
    );

    print("my" "->${"_sendMessage"}" "->$message");
    await controller.postMessage('GameMain', 'GameMain.IFlutter.ReceiveMessageFromFlutter', message);
  }
}
