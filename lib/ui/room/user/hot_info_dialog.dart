import 'package:app/net/api.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import '../../../tools.dart';

class HotInfoDialog extends StatefulWidget {

  static OverlayEntry? overlayEntry;

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
    // 设置对话框尺寸
    double width = 178 * 1.2;
    double height = 164;

    // 计算对话框位置
    double parentX = widget.anchorPoint?.dx ?? 0;
    double contentX = 0;
    double edgeDistance = width;

    // 根据屏幕宽度调整对话框位置
    if(parentX + edgeDistance > Get.width) {
      // 如果靠右，向左偏移
      contentX = Get.width - edgeDistance - edgeDistance / 4;
    } else if(parentX < width / 2) {
      // 如果靠左，向右偏移
      contentX = width / 8;
    } else {
      // 居中显示
      contentX = parentX - edgeDistance / 4;
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          // 半透明背景
          Positioned.fill(
            child: GestureDetector(
              onTap: () => Get.back(),  // 点击背景关闭
              behavior: HitTestBehavior.opaque,
              child: Container(
                color: Colors.black.withAlpha(80),
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          // 上箭头图标
          Positioned(
            left: parentX + 50 / 2,
            top: widget.anchorPoint?.dy ?? 0,
            child: Image.asset(IMG.format("room/icon_up_arrow"), width: 10, height: 6,),
          ),
          // 主要内容区域
          Positioned(
            left: contentX,
            top: (widget.anchorPoint?.dy ?? 0) + 5,
            child: Container(
              width: width,
              height: height,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                // 渐变背景
                gradient: const LinearGradient(
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
    return Api.Room.getHotHistory(page, roomId, roleId);
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
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              item["username"] ?? "",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style:const TextStyle(
                color: Color(0xFF282828),
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
         const SizedBox(width: 10,),
          SvgView(SVG.$('room/热度'), width: 12, height: 12),
          Expanded(
            flex: 1,
            child: Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              (item["number"].toString() ?? ""),
              style:const TextStyle(
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