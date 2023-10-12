
import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'room_debug_ctrl.dart';

class RoomDebugView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _RoomDebugViewState();
}

class _RoomDebugViewState extends State<RoomDebugView> {

  RoomDebugCtrl? roomDebugCtrl;

  @override
  void initState() {
    super.initState();
    roomDebugCtrl = Get.put<RoomDebugCtrl>(RoomDebugCtrl(), tag: hashCode.toString(), permanent: true);
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("mxlogger")),
      body: Obx(() {
        Widget body;
        if(roomDebugCtrl == null || roomDebugCtrl?.rxList == null) {
          body = const SizedBox();
        } else {
          body = ListView.separated(
            itemBuilder: (context, index) {
              return _itemBuilder(context, index);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10,);
            },
            itemCount: roomDebugCtrl?.rxList?.length ?? 0,
          );
        }
        return body;
      }),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Text(
      "${index}: ${roomDebugCtrl?.rxList?[index] ?? ""}",
      style: TextStyle(
        fontSize: 14,
        color: AppPalette.primary,
      ),
    );
  }

}