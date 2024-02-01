
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class RoomMiddlePage extends StatefulWidget {
  int roomId;
  Map? data;
  bool callCloseRoom;

  RoomMiddlePage({required this.roomId, this.data, required this.callCloseRoom, super.key});

  @override
  State<StatefulWidget> createState() => _RoomMiddlePageState();
}

class _RoomMiddlePageState extends State<RoomMiddlePage> {

  @override
  void initState() {
    super.initState();
    post(() async {
      if (widget.callCloseRoom) {
        try {
          await RoomManagerCtrl.ins.doCloseState();
        } catch(e) {
        }
      }
      await Future.delayed(const Duration(milliseconds: 500));
      RoomManagerCtrl.ins.toRoom(roomId: widget.roomId, data: widget.data, off: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: widget.data?["bg_2d_image"] != null ?
          NetImage(widget.data?["bg_2d_image"], fit: BoxFit.cover,) :
          Image.asset(
            IMG.format('room_background'),
            fit: BoxFit.cover,
          ),
        )
    );
  }
  
}