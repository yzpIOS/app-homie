
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/model/api/user_info_dto.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:marqueer/marqueer.dart';

///
/// 盲盒礼物漂屏
///
class BlindGiftMarqueeView extends StatefulWidget {

  String? blinkName;
  String? blinkUrl;

  final UID acceptUid;
  final Map<UID, UserInfoDto> users;
  final S_FloatingScreen data;

  BlindGiftMarqueeView({
    super.key,
    required this.data,
    required this.acceptUid,
    required this.users,
    this.blinkName,
    this.blinkUrl
  });

  @override
  State<StatefulWidget> createState() => _BlindGiftMarqueeViewState();
}

class _BlindGiftMarqueeViewState extends State<BlindGiftMarqueeView> {

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
          // 左边的icon
          _createLeftIcon(),
          // 背景图
          _createBackground(),
          _createLeftNumber(),
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 6, top: 6),
          child: AsyncAvatar(
              size: 49.0,
              uid: widget.data.sendId
          ),
        ),
      ],
    );
  }


  ///
  /// 用户头像或者是礼物图片
  ///
  Widget _createLeftNumber() {
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
        SizedBox(width: 49,),
        // X
        if(numbers.isNotEmpty)
          Container(
            width: totalLeft,
            margin: EdgeInsets.only(top: 38),
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
    // todo 去看看
    return SizedBox(
      width: 357,
      height: avatarSize,
      child: NetImage(
        widget.data.bannerStyleUrl ?? "",
        width: 357,
        height: avatarSize,
        fit: BoxFit.cover,
      ),
    );
  }


  Widget _createMarquee() {
    final user = widget.users[widget.data.sendId];
    double textHeight = 37;
    return Positioned(
      left: avatarSize + 12,
      top: 15,
      child: Stack(
        children: [
          // 漂屏
          Container(
              height: textHeight,
              alignment: Alignment.centerLeft,
              width: totalWidth - avatarSize,
              child: Marqueer.builder(
                interaction: false,
                controller: controller,
                itemCount: 4,
                itemBuilder: (context, index) {
                  if(index == 0) {
                    String text = user?.showName() ?? "";
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
                          child: XText(
                            text,
                            style: style,
                          ),
                        )
                      ],
                    );
                  }

                  if(index == 1) {
                    String text = "在";
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
                          child: XText(
                            text,
                            style: style,
                          ),
                        )
                      ],
                    );
                  }

                  if(index == 2) {
                    String text = "【${widget.blinkName ?? ""}】";
                    var style = const TextStyle(
                      color: Color(0xFFFF5888),
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
                          child: XText(
                            text,
                            style: style,
                          ),
                        )
                      ],
                    );
                  }

                  String text = "开出${widget.data.giftName}";
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
            left: totalWidth - 136,
            right: 0,
            child: GestureDetector(
              onTap: () {
                // todo 去看看
                RoomManagerCtrl.ins.toRoomBlind(widget.data.roomId.toInt());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 51,
                    height: 20,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 3),
                    decoration: BoxDecoration(
                      color: Color(0xFFFF5787),
                      borderRadius: BorderRadius.circular(100),

                    ),
                    child: Text(
                      "去看看",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  )
                ],
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