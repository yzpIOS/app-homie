import 'dart:math';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:flutter/material.dart';
import 'package:marqueer/marqueer.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';

/// 财富等级更新
class WealthLevelUpdateMarqueeView extends StatelessWidget {
  final S_UpdateLevel_All data;

  WealthLevelUpdateMarqueeView({super.key, required this.data});

  final double backgroundHeight = 66;
  final double backgroundWidth = 344;
  final double leftIconWidth = 71.5;
  final double leftIconHeight = 34.5;
  final double leftIconBottomMargin = 9;
  final double marqueeViewMaxWidth = 370;
  final double avatarSize = 21;
  final double marqueeLeftMargin = 4;
  final double marqueeRightMargin = 36;
  final double marqueeTopMargin = 29;
  final controller = MarqueerController();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: backgroundHeight,
      width: marqueeViewMaxWidth,
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

  Widget _createBackground() {
    return Positioned(
      width: backgroundWidth,
      height: backgroundHeight,
      right: 0,
      top: 0,
      child: Image.asset(
        IMG.format('level/wealth/wealth_level_update_marquee_background'),
        width: backgroundWidth,
        height: backgroundHeight,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _createLeftIcon() {
    return Positioned(
      width: leftIconWidth,
      height: leftIconHeight,
      left: 0,
      bottom: leftIconBottomMargin,
      child: Image.asset(
        IMG.format('level/wealth/${min(data.level, 60)}'),
        width: leftIconWidth,
        height: leftIconHeight,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _createMarquee() {
    return Positioned(
      right: marqueeRightMargin,
      height: avatarSize,
      left: leftIconWidth + marqueeLeftMargin,
      top: marqueeTopMargin,
      child: Marqueer.builder(
          interaction: false,
          controller: controller,
          itemCount: 5,
          itemBuilder: (context, index) {
            // 恭喜
            if (index == 0) {
              return const Center(
                child:  Text(
                  '恭喜',
                  maxLines: 1,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              );
            }

            // 等级
            if (index == 1) {
              return Container(
                // width: 24,
                // height: 11,
                margin: const EdgeInsets.only(left: 2,top:2),
                alignment: Alignment.center,
                child: Image.asset(
                  IMG.format('level/wealth/${min(data.level, 60)}'),
                  scale: 3,
                  width: 24,
                  height: 11,
                  fit: BoxFit.contain,
                ),
              );
            }

            // 头像
            if (index == 2) {
              return Container(
                height: avatarSize,
                width: avatarSize,
                margin: const EdgeInsets.only(left: 1),
                child: AvatarView(
                  data.avatarUrl ?? "",
                  size: avatarSize,
                  side: const BorderSide(color: Colors.white, width: 1),
                ),
              );
            }

            // 用户名称
            if (index == 3) {
              return Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 1.5),
                child: Text(
                  data.userName,
                  style: const TextStyle(
                    decoration: TextDecoration.none,
                    color: Color(0xFFFF3A11),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }

            // 文案
            return Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 2.5),
              child: Text(
                '财富等级升级到${data.level}级',
                style: const TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }),
    );
  }
}
