
import 'package:app/common/theme.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/charm_level_view.dart';
import 'package:app/ui/common/wealthy_level_view.dart';
import 'package:app/ui/room/room_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class AcceptEnterRoom extends StatefulWidget {
  int roomId;
  // 信息
  Map<dynamic, dynamic> data;

  AcceptEnterRoom(this.roomId, this.data, {super.key});

  @override
  _AcceptEnterRoomState createState() => _AcceptEnterRoomState();

  static Future<void> show(int roomId, Map<dynamic, dynamic>? data) async {
    if(data == null) {
      return;
    }
    await Get.dialog(
      useSafeArea: false,
      barrierColor: Colors.transparent,
      AcceptEnterRoom(roomId, data,),
    );
  }

}

class _AcceptEnterRoomState extends State<AcceptEnterRoom> {
  @override
  Widget build(BuildContext context) {
    var child = _createBody();

    child = Container(
      width: 350,
      height: 280,
      child: child,
    );

    child = Align(
      alignment: Alignment.center,
      child: child,
    );

    return Material(
      color: const Color(0x4D000000),
      borderRadius: AppBorderRadius.a10,
      textStyle: const TextStyle(fontSize: 14, color: Colors.black),
      child: child,
    );
  }

  Widget _createBody() {
    return Stack(
      children: [
        _createInfo(),
        createHeader(),
      ],
    );
  }

  Widget createHeader() {
    return Positioned(
      left: 11.5,
      top: 0,
      right: 0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                height: 81,
                width: 81,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(200),
                ),
                child: ClipOval(
                  child: NetImage(
                    widget.data['image'] ?? widget.data['scene_image'],
                    width: 81,
                    height: 81,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(width: 6,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              Text(
                "${widget.data["room_name"] ?? ""}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 5,),
              Container(
                height: 20,
                width: 90,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: Color(0xFFEBEBFF),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  "ID:${widget.data["room_no"] ?? ""}",
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xFF717171),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _createInfo() {
    return Positioned(
      top: 39,
      left: 0,
      right: 0,
      child: Container(
        height: 224,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(child: SizedBox()),
                Container(
                  width: 24,
                  height: 24,
                  margin: EdgeInsets.only(right: 10, top: 10),
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgView(SVG.$('ic_close'), width: 24, height: 24,),
                  ),
                )
              ],
            ),
            SizedBox(height: 25,),

            Container(color: Color(0XFFEBEBFF), height: 3,),
            SizedBox(height: 12,),
            Container(
              height: 24,
              width: 155,
              padding: EdgeInsets.symmetric(horizontal: 3),
              child: Stack(
                children: [
                  Positioned.fill(
                    top: 10,
                    bottom: 6,
                    left: 8,
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFFECEBFF),
                                Color(0x00ECEBFF),
                              ]
                          )
                      ),
                    ),
                  ),
                  Text(
                    "【房间公告】",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13),
              child: Text(
                "${widget.data["notice_message"] ?? ""}",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),


            Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () {
                RoomManagerCtrl.ins.toRoom(roomId: widget.roomId, data: widget.data, off: true);
              },
              child: Center(
                child: Container(
                  height: 40,
                  width: 188,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF5887),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    "立刻进入",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 13,),
          ],
        ),
      ),
    );
  }
}