
import 'package:app/store/oauth_ctrl.dart';
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
      margin: const EdgeInsets.only(left: 17, top: 7),
      child: AsyncAvatar(
          size: 49.0,
          uid: OAuthCtrl.uid
      ),
    );
  }

  Widget _createBackground() {
    // todo 去看看
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
    double textHeight = 37;
    return Positioned(
      left: avatarSize + 12,
      top: 15,
      child: Container(
          height: textHeight,
          alignment: Alignment.centerLeft,
          width: totalWidth - avatarSize - 30,
          child: Marqueer.builder(
            interaction: false,
            controller: controller,
            itemCount: 3,
            itemBuilder: (context, index) {
              if(index == 0) {
                String text = "玩家名字";
                var style = const TextStyle(
                  color: Color(0xFFFED85B),
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                );
                var size = boundingTextSize(text, style);

                return Container(
                  width: size.width,
                  height: textHeight,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    text,
                    style: style,
                  ),
                );
              }

              if(index == 1) {
                String text = "【在弯月亮的活动】";
                var style = const TextStyle(
                  color: Color(0xFFFF5888),
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                );
                var size = boundingTextSize(text, style);

                return Container(
                  width: size.width,
                  height: textHeight,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    text,
                    style: style,
                  ),
                );
              }

              String text = "开出静静弯月亮";
              var style = const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              );
              var size = boundingTextSize(text, style);

              return Container(
                width: size.width,
                height: textHeight,
                alignment: Alignment.centerLeft,
                child: Text(
                  text,
                  style: style,
                ),
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