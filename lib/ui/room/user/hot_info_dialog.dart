
import 'package:app/net/api.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import '../../../tools.dart';

class HotInfoDialog extends StatefulWidget {

  Offset? anchorPoint;

  HotInfoDialog({this.anchorPoint});

  @override
  State<StatefulWidget> createState() => _HotInfoState();


  ///
  /// 个人房：确认下麦吗？
  ///
  static void userApplyDownMic({Offset? anchorPoint}) async {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return HotInfoDialog(anchorPoint: anchorPoint);
      },
      useSafeArea: false,
      anchorPoint: anchorPoint,
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
            // margin: EdgeInsets.only(left: parentX + 50 / 2, top: widget.anchorPoint?.dy ?? 0),
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
              child: HotHistoryUserView(),
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

  @override
  Future fetchPage(PageNum page) {
    return Api.Room.getHotHistory(page);
  }

  @override
  BaseConfig get config {
    return ListConfig(
      padding: EdgeInsets.zero,
      divider: Divider(indent: 65, endIndent: 10),
      needNorMore: false
    );
  }

  @override
  Widget itemBuilder(BuildContext context, Map<dynamic, dynamic> item, int index) {
    return Container(
      height: 20,
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Text(
            item["username"] ?? "",
            style: TextStyle(
              color: Color(0xFF282828),
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
          Expanded(child: SizedBox()),
          SvgView(SVG.$('room/热度'), width: 12, height: 12),
          Text(
            item["number"].toString() ?? "",
            style: TextStyle(
              color: Color(0xFF282828),
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

}