
import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/ui/debug/room_debug_view.dart';
import 'package:flutter/material.dart';

class DebugViewEntry extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _DebugViewEntryState();
}

class _DebugViewEntryState extends State<DebugViewEntry> {

  List<Map> params = [
    {
      "label": "房间日志",
      "router": () {
        Get.to(() => RoomDebugView());
      },
    },
    {
      "label": "房间日志",
      "router": () {
        Get.to(() => RoomDebugView());
      },
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("mxlogger")),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return _itemBuilder(context, index);
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 10,);
        },
        itemCount: params.length,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    Map<dynamic, dynamic> data = params[index];
    return GestureDetector(
      onTap: () {
        (data["router"] as Function?)?.call();
      },
      child: Container(
        width: 40,
        margin: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: AppPalette.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          data["label"] ?? "",
          style: const TextStyle(
            fontSize: 12,
            color: AppPalette.txtWhite,
          ),
        ),
      ),
    );
  }
}