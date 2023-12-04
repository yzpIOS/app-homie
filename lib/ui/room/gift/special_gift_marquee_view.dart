
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:marqueer/marqueer.dart';

///
/// 特殊礼物漂屏
///
class SpecialGiftMarqueeView extends StatefulWidget {

  const SpecialGiftMarqueeView({super.key});

  @override
  State<StatefulWidget> createState() => _SpecialGiftMarqueeViewState();
}

class _SpecialGiftMarqueeViewState extends State<SpecialGiftMarqueeView> {

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
              // 背景图
              _createBackground(),
              // 左边的icon
              _createLeftIcon(),
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
    int number = 123;
    double totalLeft = 13.5;
    List<Widget> numbers = [];
    while(true) {
      int curValue = number % 10;
      if(curValue == 0) {
        break;
      }
      // 数字
      numbers.add(Container(
        margin: EdgeInsets.only(left: totalLeft,),
        child: Image.asset(
          IMG.format("room/gift_${curValue}"),
          width: curValue == 1 ? 10.5 : 21,
          height: 21,
        ),
      ));
      totalLeft += (curValue == 1 ? 10.5 : 21);
      number = number ~/ 10;
    }
    numbers = numbers.reversed.toList();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 礼物图片
        Image.network(
          "https://picsum.photos/300/300?random=1",
          width: 56,
          height: 56,
        ),

        // X
        if(numbers.isNotEmpty)
          Container(
            width: totalLeft,
            margin: EdgeInsets.only(top: 45),
            height: 21,
            child: Stack(
              children: [
                // X
                Container(
                  margin: EdgeInsets.only(top: 5,),
                  child: Image.asset(
                    IMG.format("room/gift_X"),
                    width: 16.5,
                    height: 15,
                  ),
                ),
                ...numbers
              ],
            ),
          ),
      ],
    );
  }

  Widget _createBackground() {
    return Container(
      width: 357,
      margin: EdgeInsets.only(left: 20),
      height: avatarSize,
      child: Image.asset(
        IMG.format("room/common_gift_background"),
        width: 357,
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