
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:marqueer/marqueer.dart';

///
/// 服装抽奖漂屏
///
class ClothGiftMarqueeView extends StatefulWidget {

  ClothGiftMarqueeView({super.key});

  @override
  State<StatefulWidget> createState() => _ClothGiftMarqueeViewState();
}

class _ClothGiftMarqueeViewState extends State<ClothGiftMarqueeView> {

  double avatarSize = 60;
  double totalWidth = 357;

  final controller = MarqueerController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.only(top: 80),
          alignment: Alignment.topCenter,
          height: avatarSize,
          width: totalWidth,
          child: Stack(
            children: [
              // 左边的icon
              _createLeftIcon(),
              // 背景图
              _createBackground(),
              // 跑马灯
              _createMarquee(),
            ],
          ),
        ),
      ),
    );
  }

  ///
  /// 用户头像或者是礼物图片
  ///
  Widget _createLeftIcon() {
    return Container(
      width: 49,
      height: 49,
      margin: EdgeInsets.only(left: 11, top: 9),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(500),
        clipBehavior: Clip.hardEdge,
        child: Image.network(
          "https://picsum.photos/300/300?random=1",
          width: avatarSize,
          height: avatarSize,
        ),
      ),
    );
  }

  Widget _createBackground() {
    return SizedBox(
      width: totalWidth,
      height: avatarSize,
      child: Image.asset(
        IMG.format("room/cloth_gift_background"),
        width: totalWidth,
        height: avatarSize,
      ),
    );
  }

  Widget _createMarquee() {
    return Positioned(
      left: avatarSize,
      top: 15,
      child: SizedBox(
          height: 37,
          width: totalWidth - avatarSize - 30,
          child: Marqueer.builder(
            interaction: false,
            controller: controller,
            itemCount: 40,
            itemBuilder: (context, index) {
              return Image.network(
                'https://picsum.photos/300/300?random=$index',
                height: 20,
                width: 20,
              );
            },
          )
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.stop();
  }

  static Size boundingTextSize(String text, TextStyle style,
      {int maxLines = 2^31, double maxWidth = double.infinity}) {
    if (text == null || text.isEmpty) {
      return Size.zero;
    }
    final TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(text: text, style: style), maxLines: maxLines)
      ..layout(maxWidth: maxWidth);
    return textPainter.size;
  }
}