
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/model/api/user_info_dto.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:marqueer/marqueer.dart';

///
/// 服装抽奖漂屏
///
class ClothGiftMarqueeView extends StatefulWidget {

  String? blinkName;
  String? blinkUrl;

  final UID acceptUid;
  final Map<UID, UserInfoDto> users;
  final S_FloatingScreen data;

  ClothGiftMarqueeView({
    super.key,
    required this.data,
    required this.acceptUid,
    required this.users,
    this.blinkName,
    this.blinkUrl
  });

  @override
  State<StatefulWidget> createState() => _ClothGiftMarqueeViewState();
}

class _ClothGiftMarqueeViewState extends State<ClothGiftMarqueeView> {

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
    return Positioned(
      width: avatarSize,
      height: avatarSize,
      child: Image.network(widget.data.cover),
    );
  }

  Widget _createBackground() {
    // todo 去看看
    return SizedBox(
      width: totalWidth,
      height: avatarSize,
      child: Image.network(
        widget.blinkUrl ?? "",
        width: totalWidth,
        height: avatarSize,
      ),
    );
  }

  Widget _createMarquee() {
    double textHeight = 37;
    final user = widget.users[widget.data.sendId];
    return Positioned(
      left: avatarSize + 12,
      top: 15,
      child: Stack(
        children: [
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
                    String text = "在";
                    var style = const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                      decoration: TextDecoration.none,
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

                  if(index == 2) {
                    String text = "【${widget.blinkName}】";
                    var style = const TextStyle(
                      color: Color(0xFFFF5888),
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                      decoration: TextDecoration.none,
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

                  String text = "开出${widget.data.giftName}";
                  var style = const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    decoration: TextDecoration.none,
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

          Positioned.fill(
            left: totalWidth - 116,
            right: 0,
            child: GestureDetector(
              onTap: () {
                // todo 去看看
              },
              child: Container(
                width: 51,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0XFFB840DB),
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
          ),
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