
import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/user_giftwall_dialog.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class GiftWallView extends StatefulWidget {
  UID uid;
  NUID? nuid;

  final List<dynamic> datas;

  GiftWallView({required this.datas, required this.uid, this.nuid});

  @override
  State<StatefulWidget> createState() => _GiftWallViewState();
}

class _GiftWallViewState extends State<GiftWallView> {

  @override
  Widget build(BuildContext context) {

    double gapWidth = 10.0;
    double itemWidth = (AppSize.width - gapWidth * 5 - 20) / 4.0;
    double itemHeight = (108.0 / 80.0) * gapWidth;
    return GestureDetector(
      onTap: () {
        Get.to(() => UserGiftWallDialog(uid: widget.uid, nuid: widget.nuid,));
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
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: const Row(
                children: [
                  Expanded(
                      child: Text(
                        "礼物墙",
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
                  itemCount: widget.datas.length,
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
                      child: _createItem(widget.datas[index]),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(width: gapWidth,);
                  },
                ),
              ).horizonMargin(left: 10, right: 10),
            ),

            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }

  Widget _createItem(Map data) {
    int accept_count = data["count"];
    int lighten_need_count = data["lighten_need_count"];

    String lightText;
    bool isLighten = false;
    // 点亮图标
    Widget giftImage;
    if(accept_count >= lighten_need_count) {
      giftImage = AspectRatio(
        aspectRatio: 1.0 / 1.0,
        child: NetImage(data["cover"], fit: BoxFit.cover),
      );
      lightText = "己点亮";
      isLighten = true;
    } else {
      const ColorFilter sepia = ColorFilter.matrix(<double>[
        0.2126, 0.7152, 0.0722, 0, 0,
        0.2126, 0.7152, 0.0722, 0, 0,
        0.2126, 0.7152, 0.0722, 0, 0,
        0,      0,      0,      1, 0,
      ]);
      giftImage = AspectRatio(
        aspectRatio: 1.0 / 1.0,
        child: ColorFiltered(
          colorFilter: sepia,
          child: NetImage(data["cover"], fit: BoxFit.cover),
        ),
      );
      lightText = "未点亮";
    }

    return Column(
      children: [
        const SizedBox(height: 5,),
        Expanded(
          child: giftImage,
        ),
        Text(
          data["name"],
          style: TextStyle(
            color: isLighten ? Colors.black : const Color(0xFF999999),
            fontSize: 12,
          ),
        ),
        Text(
          lightText,
          style: TextStyle(
            color: isLighten ? Colors.black : const Color(0xFF999999),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 6,)
      ],
    );
  }
}