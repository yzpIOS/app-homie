import 'dart:math';

import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/wealthy_level_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

///
/// 财富等级
///
class WealthLevelPage extends StatefulWidget {
  final UID uid;

  const WealthLevelPage({super.key, required this.uid});

  @override
  State<WealthLevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<WealthLevelPage> {
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
          const Text('财富等级是你在Homie开启Homie人生之后的成长属性，随着你的等级上升，你的等级标志会有相应的颜色变化'),
          Spacing.h10,
          Image.asset(IMG.format('my/level/wealth_level'), fit: BoxFit.fitWidth, scale: 2),
          const Padding(
            padding: Pad(top: 20, bottom: 5),
            child: Text(
              '如何获得经验',
              style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$SemiBold),
            ),
          ),
          const Text('在直播间送礼等一切直播间内的消费，都可以提升用户等级。累计消费越多，对应的等级越高 '),
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
        const Box(height: 10, color: AppPalette.colorEB),
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
        lineHeight: 4.5,
        padding: Pad.zero,
        barRadius: AppRadius.max,
        percent: percent,
        progressColor: AppPalette.newMain,
        backgroundColor: const Color(0xFFCBCBCB),
        widgetIndicator: Container(
          width: 9,
          height: 9,
          decoration: const BoxDecoration(
            color: AppPalette.newMain,
            borderRadius: AppBorderRadius.max,
          ),
        ),
      );
    }

    Widget builder(Map? data) {
      if (data == null) return Spacing.blank;

      final num growthVal = data['growth_value'];//用户当前经验值
      final num levelGrowthValue = data['level_growth_value'];//本级总经验值
      final num nextLevelGrowthVal = data['next_level_growth_value'];//下一级总经验值
      final num growthToNextNeedVal = nextLevelGrowthVal - growthVal;//升到下一级所需经验值

      final $LevelView = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('lv${data['level']}'),
          Text('lv${data['next_level']}'),
        ],
      );

      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('经验值：$growthVal'),
          const Spacing(height: 20, flex: null,),
          $LevelView,
          const Spacing(height: 6, flex: null,),
          $Indicator(
            max(0, min(1, (growthVal - levelGrowthValue) / (nextLevelGrowthVal - levelGrowthValue),),),
          ),
          const Spacing(height: 10, flex: null,),
          Text(
            '升级所需经验值：$growthToNextNeedVal',
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      );
    }

    Widget child = Obx(() => builder(dataRx()));

    child = DefaultTextStyle(
      style: const TextStyle(fontSize: 11, color: Colors.black),
      child: child,
    );

    child = Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 20,
          child: AvatarView(
              info?.avatar,
              blur: info?.avatarEx,
              size: 70,
            avatarFrameUrl: info?.avatar_frame,
            avatarFrameSize: 12,
          ),
        ),
        Positioned(
          top: 80,
          child: Obx(() {
            var level = dataRx.value?.containsKey("level") == true ? dataRx.value!["level"] : info?.level;
            return WealthyLevelView(level: level);
          }),
        ),
        Positioned(left: 10, right: 10, top: 100, height: 100, child: child),
      ],
    );

    child = Box(height: 200, child: child);

    return child;
  }
}
