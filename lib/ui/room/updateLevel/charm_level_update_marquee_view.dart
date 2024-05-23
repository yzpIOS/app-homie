import 'dart:math';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:flutter/material.dart';
import 'package:marqueer/marqueer.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';

/// 魅力等级升级
class CharmLevelUpdateMarqueeView extends StatelessWidget {
  final S_UpdateLevel_All data;

  CharmLevelUpdateMarqueeView({super.key, required this.data});

  final double backgroundHeight = 66;
  final double backgroundLeftInset = 26.5;
  final double backgroundWidth = 344;
  final double leftIconWidth = 73.5;
  final double leftIconHeight = 58.5;
  final double marqueeViewMaxWidth = 370;
  final double avatarSize = 21;
  final double marqueeLeftMargin = 4;
  final double marqueeRightMargin = 36;
  final double marqueeTopMargin = 27;
  final controller = MarqueerController();
  final int maxLevel = 60;

  @override
  Widget build(BuildContext context) {
    final double marqueeViewLeftInset = (Get.width - marqueeViewMaxWidth)/2.0;
    return Container(
      alignment: Alignment.center,
      height: backgroundHeight,
      width: marqueeViewMaxWidth,
      child: Stack(
        children: [
          // 背景图
          _createBackground(marqueeViewLeftInset:marqueeViewLeftInset),
          // 左边的icon
          _createLeftIcon(marqueeViewLeftInset:marqueeViewLeftInset),
          // 跑马灯
          _createMarquee(marqueeViewLeftInset:marqueeViewLeftInset),
        ],
      ),
    );
  }

  Widget _createBackground({required double marqueeViewLeftInset}) {
    return Positioned(
      width: backgroundWidth,
      height: backgroundHeight,
      left: marqueeViewLeftInset + backgroundLeftInset,
      top: 0,
      child: Image.asset(
        IMG.format('level/charm/charm_level_update_marquee_background'),
        width: backgroundWidth,
        height: backgroundHeight,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _createLeftIcon({required double marqueeViewLeftInset}) {
    return Positioned(
      width: leftIconWidth,
      height: leftIconHeight,
      left: marqueeViewLeftInset,
      bottom: 0,
      child: Image.asset(
        IMG.format('level/charm/${min(data.level, maxLevel)}'),
        width: leftIconWidth,
        height: leftIconHeight,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _createMarquee({required double marqueeViewLeftInset}) {
    return Positioned(
      right: marqueeRightMargin,
      height: avatarSize,
      left:marqueeViewLeftInset + leftIconWidth + marqueeLeftMargin,
      top: marqueeTopMargin,
      child: Marqueer.builder(
          interaction: false,
          controller: controller,
          itemCount: 5,
          itemBuilder: (context, index) {
            // 恭喜
            if (index == 0) {
              return const Center(
                child: Text(
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
                width: 20,
                height: 20,
                margin: const EdgeInsets.only(left: 2),
                child: Image.asset(
                  IMG.format('level/charm/${min(data.level, maxLevel)}'),
                  scale: 3,
                  width: 20,
                  height: 20,
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
                    color: Color(0xFFFDD95D),
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
                '魅力等级升级到${data.level}级',
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
