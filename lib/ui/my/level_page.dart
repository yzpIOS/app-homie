import 'dart:math';

import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/level_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LevelPage extends StatefulWidget {
  final UID uid;

  const LevelPage({super.key, required this.uid});

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  late final uid = widget.uid;
  late final dataRx = Rxn<Map>();

  @override
  void initState() {
    super.initState();

    Api.UserInfo.level(uid).then((it) => dataRx(it));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '等级说明'),
      body: $Body(),
    );
  }

  Widget $Body() {
    Widget child = Padding(
      padding: const Pad(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: Pad(top: 10, bottom: 5),
            child: Text(
              '等级说明',
              style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$SemiBold),
            ),
          ),
          const Text('经验等级是你在Homie开启Homie人生之后的成长属性，随着你的等级上升，你的等级标志会有相应的颜色变化'),
          Spacing.h10,
          Image.asset(IMG.$('my/level/说明'), fit: BoxFit.fitWidth, scale: 2),
          const Padding(
            padding: Pad(top: 20, bottom: 5),
            child: Text(
              '如何获得经验',
              style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$SemiBold),
            ),
          ),
          const Text('在聊天室送礼等一切聊天室内的消费，都可以提升用户等级。累计消费越多，对应的等级越高'),
        ],
      ),
    );

    child = DefaultTextStyle(
      style: const TextStyle(fontSize: 12, color: AppPalette.c6),
      child: child,
    );

    child = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        UserInfoCtrl.use(uid, builder: $HeaderView),
        const Box(height: 10, color: AppPalette.background2),
        child,
      ],
    );

    child = SingleChildScrollView(
      padding: Pad(bottom: 55 + AppSize.safeBottom),
      child: child,
    );

    return child;
  }

  Widget $HeaderView(UserInfoDto? info) {
    Widget $Indicator(double percent) {
      return LinearPercentIndicator(
        animation: true,
        animationDuration: 618,
        curve: Curves.easeOutCubic,
        lineHeight: 4,
        padding: Pad.zero,
        barRadius: AppRadius.max,
        percent: percent,
        progressColor: AppPalette.primary,
        backgroundColor: AppPalette.cc,
      );
    }

    Widget builder(Map? data) {
      if (data == null) return Spacing.blank;

      final num growthVal = data['growth_value'];
      final num levelGrowthVal = data['level_growth_value'];
      final num nextLevelGrowthVal = data['next_level_growth_value'];

      final $GrowthView = Row(
        children: [
          LevelView(level: data['level']),
          Spacing.w4,
          Text('经验值：$growthVal'),
          Spacing.exp,
          Text('升级所需经验值：$nextLevelGrowthVal'),
        ],
      );

      final $LevelView = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('lv${data['level']}'),
          Text('lv${data['next_level']}'),
        ],
      );

      return Column(
        children: [
          Expanded(child: $GrowthView),
          $Indicator(
            max(
              0,
              min(
                1,
                (growthVal - levelGrowthVal) / (nextLevelGrowthVal - levelGrowthVal),
              ),
            ),
          ),
          Expanded(child: $LevelView),
        ],
      );
    }

    Widget child = Obx(() => builder(dataRx()));

    child = DefaultTextStyle(
      style: const TextStyle(fontSize: 12, color: Colors.black),
      child: child,
    );

    child = Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 20,
          child: AvatarView(info?.avatar, blur: info?.avatarEx, size: 70),
        ),
        Positioned(
          top: 80,
          child: LevelView(level: info?.level),
        ),
        Positioned(left: 10, right: 10, bottom: 8, height: 32 * 2, child: child),
      ],
    );

    child = Box(height: 200, child: child);

    return child;
  }
}
