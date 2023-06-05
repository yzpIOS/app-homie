import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:app/test/_my_test.dart';
import 'package:app/test/unity_view.dart';

class MyMain extends StatefulWidget {
  const MyMain({super.key});

  @override
  State<MyMain> createState() => _MyMainState();
}

class _MyMainState extends State<MyMain> with BusStateMixin {
  UnityWidgetController? _controller;

  UnityWidgetController get controller => _controller!;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        children: [
          const XUnityView(),
          _createBtn(),
        ],
      ),
    );
  }

  Widget _createBtn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MyTest.createBtn(
          onPressed: () {
            print("my" "->${666}");

            var data = {
              "code": "FTU_LoadRoomScene",
              "data": {
                "user": {
                  "uid": "xxx",
                  "name": "xxx",
                  "sex": "1",
                },
                "scene": {
                  "ip": "192.168.1.114",
                  "port": "8020",

                  // "ip": "192.168.1.156",
                  // "port": "31650",
                },
                "sceneName": "Assets/HybridCLR/HotFix/Scene/RoomScene.unity",
              },
            };

            MyTest.sendMessage(data: data);
          },
        ),
        Spacing.h10,
        MyTest.createBtn(
          onPressed: () {
            print("my" "->${7777}");
            var data = {
              "code": "FTU_LoadRoomScene",
              "data": {
                "sceneName": "ModelScene",
              },
            };

            MyTest.sendMessage(data: data);
          },
        ),
        Spacing.h10,
        MyTest.createBtn(
          onPressed: () {
            print("my" "->${888}");

            var data = {
              "code": "UNITY_LoadScene",
              "data": {
                "uid": "xxx",
                "ip": "192.168.1.114",
                "port": "8020",
                "name": "xxx",
                "sex": "1",
                "sceneName": "Assets/HybridCLR/HotFix/Scene/Room0.unity",
              },
            };

            MyTest.sendMessage(data: data);
          },
        ),
        Spacing.h10,
        MyTest.createBtn(
          onPressed: () {
            print("my" "->${999}");
          },
        ),
        Spacing.h10,
      ],
    );
  }
}
