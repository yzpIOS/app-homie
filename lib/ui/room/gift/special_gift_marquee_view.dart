
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/theme.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/charm_level_view.dart';
import 'package:app/ui/common/wealthy_level_view.dart';
import 'package:app/ui/room/room_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:marqueer/marqueer.dart';

///
/// 普通礼物漂屏
///
class SpecialGiftMarqueeView extends StatefulWidget {
  final UID acceptUid;
  final Map<UID, UserInfoDto> users;
  final S_FloatingScreen data;

  SpecialGiftMarqueeView({super.key,required this.data, required this.acceptUid, required this.users});

  @override
  State<StatefulWidget> createState() => _SpecialGiftMarqueeViewState();
}

class _SpecialGiftMarqueeViewState extends State<SpecialGiftMarqueeView> {

  double avatarSize = 60;
  double totalWidth = 357;

  final controller = MarqueerController();


  @override
  Widget build(BuildContext context) {
    return Container(
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 礼物图片
        ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(40),
          child: Image.network(
            widget.data.cover,
            width: 56,
            height: 56,
          ),
        ),

        // X
        if(numbers.isNotEmpty)
          Container(
            width: totalLeft,
            margin: EdgeInsets.only(top: 36),
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: avatarSize / 2.0),
          width: totalWidth - avatarSize / 2.0,
          height: avatarSize - 14,
          child: Image.network(
            widget.data.bannerStyleUrl,
            width: totalWidth - avatarSize / 2.0,
            height: avatarSize - 14,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }

  Widget _createMarquee() {
    double textHeight = 20;
    final sender = widget.users[widget.data.sendId];
    final receiver = widget.users[widget.acceptUid];
    return Positioned(
      left: avatarSize,
      top: 16,
      right: 0,
      child: Stack(
        children: [
          SizedBox(
              height: textHeight,
              width: totalWidth - avatarSize - 55,
              child: Marqueer.builder(
                interaction: false,
                controller: controller,
                itemCount: 7,
                itemBuilder: (context, index) {
                  // 发送人的：财富等级或者是魅力等级
                  if(index == 0) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 5, top: 2),
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
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 5, top: 1),
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
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: style,
                          ),
                        )
                      ],
                    );
                  }

                  // 发送人的：赚送给文案
                  if(index == 3) {
                    String text = "赠送给";
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
                          margin: EdgeInsets.only(left: 5),
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
                          margin: EdgeInsets.only(left: 5),
                          child: AvatarView(receiver?.avatar ?? "", size: 18, side: BorderSide(color: Colors.white, width: 1),),
                        )
                      ],
                    );
                  }

                  if(index == 5) {
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
                  }


                  String text = "${widget.data.giftName}";
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
                        alignment: Alignment.centerLeft,
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


          Positioned.fill(
            left: totalWidth - 112,
            right: 5,
            child: GestureDetector(
              onTap: () {
                // todo 去看看
                if(RoomManagerCtrl.ins.sceneCtrl2?.roomId == widget.data.roomId.toInt()) {
                  return;
                }
                if(Get.currentRoute.toLowerCase().contains(RoomPage.room_name.toLowerCase())) {
                  // 当前在房间中
                  RoomManagerCtrl.ins.toMiddleRoom(roomId: widget.data.roomId.toInt());
                } else {
                  // 没有在房间
                  RoomManagerCtrl.ins.toRoom(roomId: widget.data.roomId.toInt());
                }
              },
              child: Container(
                width: 51,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0XFFFF5787),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Text(
                  "去看看",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.stop();
  }

  static Size boundingTextSize(String text, TextStyle style,
      {int maxLines = 1, double maxWidth = double.infinity}) {
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