
import 'package:app/common/theme.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'room_debug_ctrl.dart';

class RoomDebugView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _RoomDebugViewState();
}

class _RoomDebugViewState extends State<RoomDebugView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("mxlogger")),
      body: GetBuilder(
        init: RoomDebugCtrl(),
        builder: (roomDebugCtrl) {
          RxList<String>? rxList = roomDebugCtrl.rxList;
          if(rxList == null) {
            return Spacing.blank;
          }
          return ListView.separated(
            itemBuilder: (context, index) {
              return Text(
                "${index}: ${rxList[index] ?? ""}",
                style: const TextStyle(
                  fontSize: 14,
                  color: AppPalette.primary,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 15,);
            },
            itemCount: rxList.length,
          );
        },
      ),
    );
  }

}