
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class RoomMiddlePage extends StatefulWidget {
  int roomId;
  Map? data;

  RoomMiddlePage({required this.roomId, this.data, super.key});

  @override
  State<StatefulWidget> createState() => _RoomMiddlePageState();
}

class _RoomMiddlePageState extends State<RoomMiddlePage> {

  @override
  void initState() {
    super.initState();
    post(() async {
      await RoomManagerCtrl.ins.doCloseState();
      RoomManagerCtrl.ins.toRoom(roomId: widget.roomId, data: widget.data, off: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            IMG.$('loading'),
            fit: BoxFit.cover,
          ),
        )
    );
  }
  
}