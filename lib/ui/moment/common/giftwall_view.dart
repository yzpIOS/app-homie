
import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/my/giftwall/gift_list_dialog.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class GiftWallView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GiftWallViewState();
}

class _GiftWallViewState extends State<GiftWallView> {

  @override
  Widget build(BuildContext context) {

    double gapWidth = 10.0;
    double itemWidth = (AppSize.width - gapWidth * 5) / 4.0;
    double itemHeight = (108.0 / 80.0) * gapWidth;
    return GestureDetector(
      onTap: () {
        Get.showBottomSheet(
          GiftListDialog(),
          shape: const XRectangleBorder(borderRadius: AppBorderRadius.t10,),
          isScrollControlled: false
        );
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        color: const Color(0xFFF6FDFF),
        height: 153,
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            // 标题
            Container(
              height: 35,
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                        "礼物",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
                      )
                  ),
                  RightArrowIcon(color: Colors.grey),
                ],
              ),
            ),

            // 礼物信息
            Expanded(
              child: ColoredBox(
                color: const Color(0xFFF6FDFF),
                child: ListView.separated(
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: itemWidth,
                      height: itemHeight,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF7CCCE5).withAlpha(27), width: 1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: _createItem(index),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(width: gapWidth,);
                  },
                ),
              ),
            ),

            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }

  Widget _createItem(int index) {
    return Column(
      children: [
        SizedBox(height: 5,),
        Expanded(
          child: AspectRatio(
            aspectRatio: 1.0 / 1.0,
            child: Container(
              color: Colors.red,
            ),
          ),
        ),
        Text(
          "小兔子",
          style: TextStyle(
            color: Color(0xFF999999),
            fontSize: 14,
          ),
        ),
        Text(
          "未拥有",
          style: TextStyle(
            color: Color(0xFF999999),
            fontSize: 12,
          ),
        ),
        SizedBox(height: 6,)
      ],
    );
  }
}