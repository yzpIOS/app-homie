
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/charm_level_view.dart';
import 'package:app/ui/common/wealthy_level_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:marqueer/marqueer.dart';

///
/// 普通礼物漂屏
///
class CommonGiftMarqueeView extends StatefulWidget {

  final UID acceptUid;
  final Map<UID, UserInfoDto> users;
  final S_FloatingScreen data;

  CommonGiftMarqueeView({super.key,required this.data, required this.acceptUid, required this.users});

  @override
  State<StatefulWidget> createState() => _CommonGiftMarqueeViewState();
}

class _CommonGiftMarqueeViewState extends State<CommonGiftMarqueeView> {

  double avatarSize = 60;
  double totalWidth = 357;

  final controller = MarqueerController();


  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }

  ///
  /// 用户头像或者是礼物图片
  ///
  Widget _createLeftIcon() {
    Characters number = "${widget.data.count}".characters;
    double totalLeft = 13.5;
    List<Widget> numbers = [];
    for(int index = 0; index < number.length; index ++) {
      numbers.insert(0, Container(
        margin: EdgeInsets.only(left: totalLeft,),
        child: Image.asset(
          IMG.format("room/gift_${number.characterAt(index)}"),
          width: number.characterAt(index).toString() == '1' ? 10.5 : 14,
          height: 21,
        ),
      ));
      totalLeft += (number.characterAt(index).toString() == "1" ? 8.5 : 14);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 礼物图片
        Image.network(
          widget.data.cover,
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
      margin: const EdgeInsets.only(left: 20),
      height: avatarSize,
      child: Image.network(
        widget.data.bannerStyleUrl,
        width: 357,
        height: avatarSize,
      ),
    );
  }

  Widget _createMarquee() {
    final sender = widget.users[widget.data.sendId];
    final receiver = widget.users[widget.acceptUid];
    double textHeight = 18;
    return Positioned(
      left: avatarSize,
      top: 26,
      child: Container(
          height: textHeight,
          width: totalWidth - avatarSize,
          child: Marqueer.builder(
            interaction: false,
            controller: controller,
            itemCount: 6,
            itemBuilder: (context, index) {
              // 发送人的：财富等级或者是魅力等级
              if(index == 0) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: Stack(
                          children: [
                            if(sender?.level != null && (sender?.level ?? "").isNotEmpty)
                              WealthyLevelView(level: sender?.level ?? ""),
                          ],
                        )
                    )
                  ],
                );
              }

              // 发送人的：头像
              if(index == 1) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 18,
                      width: 18,
                      margin: EdgeInsets.only(left: 5),
                      child: AvatarView(sender?.avatar ?? "", size: 18, side: BorderSide(color: Colors.white, width: 1),),
                    )
                  ],
                );
              }

              // 发送人的：名字
              if(index == 2) {
                String text = sender?.showName() ?? "";
                var style = const TextStyle(
                  color: Color(0xFFFED85B),
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  decoration: TextDecoration.none,
                );
                var size = boundingTextSize(text, style);
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: size.width,
                      height: textHeight,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 5),
                      child: Text(
                        text,
                        maxLines: 1,
                        style: style,
                      ),
                    )
                  ],
                );
              }

              // 发送人的：赚送给文案
              if(index == 3) {
                String text = "赚送给";
                var style = const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  decoration: TextDecoration.none,
                );
                var size = boundingTextSize(text, style);
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: size.width,
                      height: textHeight,
                      margin: const EdgeInsets.only(left: 2),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        text,
                        style: style,
                      ),
                    )
                  ],
                );
              }


              // 接收人的：头像
              if(index == 4) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 18,
                      width: 18,
                      margin: EdgeInsets.only(left: 2),
                      child: AvatarView(receiver?.avatar ?? "", size: 18, side: BorderSide(color: Colors.white, width: 1),),
                    )
                  ],
                );
              }

              // 接收人的：名字
              String text = receiver?.showName() ?? "";
              var style = const TextStyle(
                color: Color(0xFFFED85B),
                fontWeight: FontWeight.bold,
                fontSize: 11,
                decoration: TextDecoration.none,
              );
              var size = boundingTextSize(text, style);
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: size.width,
                    height: textHeight,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 5),
                    child: Text(
                      text,
                      style: style,
                    ),
                  )
                ],
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