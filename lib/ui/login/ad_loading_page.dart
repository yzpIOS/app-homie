import 'package:app/common/theme.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ADLoadingPage extends StatefulWidget {
  final int fromType;//1启动广告页  2直播间+广场
  const ADLoadingPage({super.key, this.fromType = 1});

  @override
  State<ADLoadingPage> createState() => _ADLoadingPageState();
}

class _ADLoadingPageState extends State<ADLoadingPage> with TickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _animation;
  final _tweenSequence = TweenSequence(
    [
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        weight: 1,
      ),
    ],
  );

  @override
  void initState() {
    super.initState();

    _ctrl = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_ctrl);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {//动画在终点停止
        if (widget.fromType == 1) {
          delay(200, () {
            Get.find<OAuthCtrl>().skipToMain();
          });
        } else {

        }
      }
    });
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(IMG.format('login/pic_loading')), scale: 3, fit: BoxFit.cover),
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: child),
          Positioned(
            left: 25,
            right: 25,
            bottom: 67,
            child: AnimatedBuilder(
              animation: _ctrl,
              builder: (_, __) {
                return $LoadingView();
              },
            ),
          ),
        ],
      ),
    );
  }


  Widget $LoadingView() {
    Widget child = AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext ctx, child) {
        final percent = _animation.value;

        return LinearPercentIndicator(
          animateFromLastPercent: true,
          animation: false,
          animationDuration: 618,
          curve: Curves.easeOutCubic,
          lineHeight: 6,
          padding: Pad.zero,
          barRadius: AppRadius.max,
          percent: percent,
          linearGradient: const LinearGradient(colors: [Color(0xFFFCE2F1), Color(0xFFD9F2FC)]),
          backgroundColor: const Color(0x80000000),
        );
      },
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (_, __) {
            return Text(
              '正在初始化基础配置${(_animation.value * 100).toStringAsFixed(0)}%',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            );
          },
        ),
        Spacing.h4,
        child,
      ],
    );
  }
}
