
import 'package:app/net/api.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import '../../../tools.dart';

class HotInfoDialog extends StatefulWidget {

  Offset? anchorPoint;

  int roomId;
  int roleId;

  HotInfoDialog(this.roomId, this.roleId, {this.anchorPoint});

  @override
  State<StatefulWidget> createState() => _HotInfoState();


  ///
  /// 个人房：确认下麦吗？
  ///
  static void userApplyDownMic(int roomId, int roleId, {Offset? anchorPoint}) async {
    showDialog(
      barrierColor: Colors.transparent,
      context: Get.context!,
      builder: (context) {
        return HotInfoDialog(roomId, roleId, anchorPoint: anchorPoint);
      },
      useSafeArea: false,
    );
  }
}

class _HotInfoState extends State<HotInfoDialog> {
  @override
  Widget build(BuildContext context) {
    double width = 178;
    double height = 164;

    // 开始位置
    double parentX = widget.anchorPoint?.dx ?? 0;

    double contentX = 0;

    double edgeDistance = width;
    if(parentX + edgeDistance > Get.width) {
      contentX = Get.width - edgeDistance - edgeDistance / 4;
    } else if(parentX < width / 2) {
      contentX = width / 8;
    } else {
      contentX = parentX - edgeDistance / 4;
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            behavior: HitTestBehavior.opaque,
            child: Positioned.fill(
              child: Container(color: Colors.transparent,),
            ),
          ),
          Positioned(
            left: parentX + 50 / 2,
            top: widget.anchorPoint?.dy ?? 0,
            child: Image.asset(IMG.format("room/icon_up_arrow"), width: 10, height: 6,),
          ),
          Positioned(
            left: contentX,
            top: (widget.anchorPoint?.dy ?? 0) + 5,
            child: Container(
              width: width,
              height: height,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFEFFF3),
                      Color(0xFFFAFFD1),
                    ]
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: HotHistoryUserView(widget.roomId, widget.roleId),
            ),
          ),
        ],
      ),
    );
  }

}


///
/// 魅力等级排行
///
class HotHistoryUserView extends SimplePageView<Map> {

  int roomId;
  int roleId;

  HotHistoryUserView(this.roomId, this.roleId);

  @override
  Future fetchPage(PageNum page) {
    return Api.Room.getHotHistory(PageNum(size: 999), roomId, roleId);
  }

  @override
  BaseConfig get config {
    return ListConfig(
      padding: EdgeInsets.zero,
      needNorMore: false
    );
  }

  @override
  Widget itemBuilder(BuildContext context, Map<dynamic, dynamic> item, int index) {
    return Container(
      height: 20,
      width: Get.width,
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              item["username"] ?? "",
              style: TextStyle(
                color: Color(0xFF282828),
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
          SvgView(SVG.$('room/热度'), width: 12, height: 12),
          Expanded(
            flex: 1,
            child: Text(
              (item["number"].toString() ?? "") + (item["number"].toString() ?? ""),
              style: TextStyle(
                color: Color(0xFF282828),
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

}