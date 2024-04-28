
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

    double gapWidth = 6.0;
    double itemWidth = (AppSize.width - gapWidth * 5 - 10) / 4.0;
    double itemHeight = (112.0 / 87.0) * gapWidth;
    return GestureDetector(
      onTap: () {
        Get.to(() => UserGiftWallDialog(uid: widget.uid, nuid: widget.nuid,));
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        // color: const Color(0xFFF6FDFF),
        height: 153 * (AppSize.width / 375),
        margin: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 标题
            Container(
              height: 35,
              margin: const EdgeInsets.only(left: 7),
              child: const Row(
                children: [
                  Expanded(
                      child: Text(
                        "礼物墙",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
                      )
                  ),
                  RightArrowIcon(color: Colors.black),
                ],
              ),
            ),

            // 礼物信息
            Expanded(
              child: ListView.separated(
                itemCount: widget.datas.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: itemWidth,
                    // height: itemHeight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFBDBDBD).withAlpha(50), width: 0.5, strokeAlign: BorderSide.strokeAlignCenter,),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF727272).withAlpha(50),
                          blurRadius: 1,
                          spreadRadius: 0,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: _createItem(widget.datas[index]),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(width: gapWidth,);
                },
              ),
            ),

            const SizedBox(height: 5)
          ],
        ),
      ),
    );
  }

  Widget _createItem(Map data) {
    int startCount = data["start_count"];

    bool isLighten = false;
    // 点亮图标
    Widget giftImage;
    if(startCount >= 1) {
      giftImage = AspectRatio(
        aspectRatio: 1.0 / 1.0,
        child: NetImage(data["cover"], fit: BoxFit.cover),
      );
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
    }

    return Column(
      children: [
        const SizedBox(height: 5,),
        Expanded(
          child: giftImage,
        ),
        Text(
          data["name"],
          style: TextStyle(color: isLighten ? Colors.black : AppPalette.colorA9, fontSize: 10,),
        ),
        Image.asset(IMG.format(isLighten ? 'my/已点亮' : 'my/未点亮'), width: 64.5, height: 27.5, scale: 3,),
      ],
    );
  }
}