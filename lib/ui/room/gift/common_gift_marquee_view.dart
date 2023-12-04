
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/charm_level_view.dart';
import 'package:app/ui/common/wealthy_level_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:marqueer/marqueer.dart';

///
/// 普通礼物漂屏
///
class CommonGiftMarqueeView extends StatefulWidget {

  CommonGiftMarqueeView({super.key});

  @override
  State<StatefulWidget> createState() => _CommonGiftMarqueeViewState();
}

class _CommonGiftMarqueeViewState extends State<CommonGiftMarqueeView> {

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
    Characters number = "321".characters;
    double totalLeft = 13.5;
    List<Widget> numbers = [];
    for(int index = 0; index < number.length; index ++) {
      numbers.insert(0, Container(
        margin: EdgeInsets.only(left: totalLeft,),
        child: Image.asset(
          IMG.format("room/gift_${number.characterAt(index)}"),
          width: number.characterAt(index).toString() == '1' ? 10.5 : 21,
          height: 21,
        ),
      ));
      totalLeft += (number.characterAt(index).toString() == "1" ? 10.5 : 21);
    }

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
        IMG.format("room/common_gift_background2"),
        width: 357,
        height: avatarSize,
      ),
    );
  }

  Widget _createMarquee() {
    double textHeight = 18;
    return Positioned(
      left: avatarSize,
      top: 26,
      child: Container(
          height: textHeight,
          width: totalWidth - avatarSize - 30,
          child: Marqueer.builder(
            interaction: false,
            controller: controller,
            itemCount: 6,
            itemBuilder: (context, index) {
              // 发送人的：财富等级或者是魅力等级
              if(index == 0) {
                return Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Image.asset(
                    IMG.format('level/10'),
                    fit: BoxFit.fill,
                  ),
                );
                CharmLevelView(level: "10", height: 14.5,);
                return WealthyLevelView(level: "30", height: 8.5);
              }

              // 发送人的：头像
              if(index == 1) {
                return Container(
                  height: 20,
                  width: 20,
                  margin: EdgeInsets.only(left: 5),
                  child: UserInfoCtrl.use(OAuthCtrl.uid, builder: (user) {
                    return AvatarView(user?.avatar ?? "", size: 20, side: BorderSide(color: Colors.white, width: 1),);
                  }),
                );
              }

              // 发送人的：名字
              if(index == 2) {
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
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    text,
                    style: style,
                  ),
                );
              }

              // 发送人的：赚送给文案
              if(index == 3) {
                String text = "赚送给";
                var style = const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                );
                var size = boundingTextSize(text, style);
                return Container(
                  width: size.width,
                  height: textHeight,
                  margin: const EdgeInsets.only(left: 2),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    text,
                    style: style,
                  ),
                );
              }


              // 接收人的：头像
              if(index == 4) {
                return Container(
                  height: 20,
                  width: 20,
                  margin: EdgeInsets.only(left: 5),
                  child: UserInfoCtrl.use(OAuthCtrl.uid, builder: (user) {
                    return AvatarView(user?.avatar ?? "", size: 20, side: BorderSide(color: Colors.white, width: 1),);
                  }),
                );
              }
              // 接收人的：名字
              String text = "接收人的：名字";
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
                margin: EdgeInsets.only(left: 5),
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