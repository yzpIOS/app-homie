import 'dart:ui';

import 'package:app/common/theme.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/tools/scene_loader.dart';
import 'package:app/ui/debug/debug_view_entry.dart';
import 'package:app/ui/debug/room_debug_view.dart';
import 'package:app/widgets.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:f_unity/unity_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:visibility_detector/visibility_detector.dart';

typedef OnInit = Future<void> Function(UnityCtrl unity, SceneLoader loader, ValueChanged<double> onProcess);
typedef OnClose = Future<void> Function();

class UnityView extends StatefulWidget {
  final String uniqueKey;

  final OnInit onInit;
  final OnClose? onClose;
  
  final bool fromRoom;

  final String? image2D;

  final Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers;

  UnityView({
    required this.uniqueKey,
    required this.onInit,
    this.onClose,
    this.gestureRecognizers,
    this.fromRoom = false,

    this.image2D = null,
  })  : assert(uniqueKey.isNotEmpty),
        super(key: Key(uniqueKey));

  @override
  State<UnityView> createState() => _UnityViewState();
}

class _UnityViewState extends State<UnityView> with GetStateMixin, TickerProviderStateMixin {
  late final _unity = Get.find<UnityCtrl>();
  late final AnimationController _ctrl;

  late final uniqueKey = widget.uniqueKey;

  late final onInit = widget.onInit;
  late final onClose = widget.onClose;

  bool isDisposed = false;

  late final gestureRecognizers = widget.gestureRecognizers;

  static Tuple2<String, num> _visible = const Tuple2('', 0);

  @override
  void initState() {
    super.initState();

    _ctrl = AnimationController(vsync: this, duration: const Duration(minutes: 2));

    if (Env.useUnity) {
      bindWorker(
        Worker(
          () async {
            final _onClose = onClose;

            await Future.wait(
              [
                if (_visible.value1 == uniqueKey) _unity.loadSceneCombo(_unity.loadSceneBlank),
                if (_onClose != null) _onClose(),
              ],
            );
          },
          'UnityView[Dispose]',
        ),
      );

      _doLoad(Tuple2(uniqueKey, 1));
    }
  }

  @override
  void dispose() {
    isDisposed = true;
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Env.useUnity) {
      double dpFix(double dp) => (dp * 100).ceil() / 100;

      final unityView = DelayView(
        fadeIn: false,
        builder: (_) => UnityWidget(key: const Key('Unity'), gestureRecognizers: gestureRecognizers),
      );

      Widget child = LayoutBuilder(
        builder: (_, c) {
          final width = dpFix(c.maxWidth), height = dpFix(c.maxHeight);

          return Stack(
            alignment: Alignment.center,
            children: [
              Positioned(width: width, height: height, child: unityView),
              Positioned.fill(
                child: AnimatedBuilder(
                  animation: _ctrl,
                  child: UnityLoading(controller: _ctrl),
                  builder: (_, child) {
                    // debugPrint("unity加载进度: ${_ctrl.value}");
                    // 己经加载完成
                    if(_ctrl.value >= 1) {
                      return Spacing.blank;
                    }
                    // 房间背景
                    if(widget.fromRoom || child == null) {
                      AppWaiting appWaiting = Get.find<AppWaiting>();
                      appWaiting.text = '3D画面加载中';

                      return Stack(
                        children: [
                          if(widget.image2D == null || widget.image2D?.isEmpty == true)
                            Positioned.fill(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(IMG.format('room_background')),
                                    scale: 2,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: SizedBox(width: AppSize.width, height: AppSize.height),
                              ),
                            ),
                          if(widget.image2D?.isNotEmpty == true)
                            Positioned.fill(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(widget.image2D ?? ""),
                                    scale: 2,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: SizedBox(width: AppSize.width, height: AppSize.height),
                              ),
                            ),
                          Positioned(
                            child: Center(child: appWaiting,),
                          ),
                        ],
                      );
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(IMG.format('room_background')),
                            scale: 2,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: SizedBox(width: AppSize.width, height: AppSize.height),
                      );
                    }
                    // 其它的背景
                    return child;
                  },
                ),
              ),
            ],
          );
        },
      );

      child = VisibilityDetector(
        key: Key(uniqueKey),
        onVisibilityChanged: _onVisibilityChanged,
        child: child,
      );

      return child;
    }

    return const SizedBox.expand();
  }

  void _doLoad(Tuple2<String, num> visible) async {
    if(isDisposed) {
      return;
    }
    _ctrl
      ..value = 0
      ..animateTo(0.9999);

    _visible = visible;

    try {
      await onInit(_unity, _unity.loadScene, _onProcess);
      if(isDisposed) {
        return;
      }
      _ctrl.fling();
    } catch (_) {
      if (_visible.value1 == uniqueKey) _visible = const Tuple2('', 0);

      rethrow;
    }
  }

  void _onProcess(double val) async {
    if(isDisposed) {
      return;
    }
    if (val == 1) {
      //ignore
    } else if (val > _ctrl.value) {
      await _ctrl.animateTo(val, duration: kTabScrollDuration);

      if (_ctrl.isCompleted) {
        _ctrl.animateTo(0.9999);
      }
    }
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    final fraction = info.visibleFraction;
    final visible = _visible;

    if (visible.value1 == uniqueKey) {
      _visible = visible.copyWith(value2: fraction);
    } else {
      if (fraction == 1 || visible.value2 < fraction) {
        if (mounted) _doLoad(Tuple2(uniqueKey, fraction));
      }
    }
  }
}

class UnityHolder extends StatelessWidget {
  const UnityHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return const IgnorePointer(
      child: Env.useUnity ? UnityWidget(key: GlobalStringKey('UnityGlobal')) : Spacing.blank,
    );
  }
}

class UnityLoading extends StatelessWidget {
  final Animation<double> _animation;

  UnityLoading({super.key, required AnimationController controller}) : _animation = _tweenSequence.animate(controller);

  static final _tweenSequence = TweenSequence(
    [
      TweenSequenceItem(
        tween: Tween<double>(begin: 0, end: 0.3),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.3, end: 0.5),
        weight: 5,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.5, end: 0.88),
        weight: 10,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.88, end: 0.99),
        weight: 20,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    Widget child = AnimatedBuilder(
      animation: _animation,
      builder: (_, __) {
        final percent = _animation.value;

        return LinearPercentIndicator(
          animateFromLastPercent: true,
          animation: false,
          animationDuration: 618,
          curve: Curves.easeOutCubic,
          lineHeight: 10,
          padding: Pad.zero,
          barRadius: AppRadius.max,
          percent: percent,
          linearGradient: const LinearGradient(colors: [Color(0xFFFF9E68), Color(0xFFFFEE7E)]),
          backgroundColor: const Color(0x4D000000),
        );
      },
    );

    child = DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: const ShapeDecoration(
        shape: XStadiumBorder(
          side: BorderSide(color: Colors.white, width: 1),
        ),
      ),
      child: child,
    );

    child = FractionallySizedBox(
      widthFactor: 300 / 375,
      child: child,
    );

    child = Column(
      children: [
        const Spacing(flex: 412),
        const Text(
          '另一个世界，另一个你',
          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: fw$SemiBold),
        ),
        const Spacing(flex: 80),
        child,
        const Spacing(flex: 10),
        Box(
          height: 22,
          alignment: Alignment.center,
          child: AnimatedBuilder(
            animation: _animation,
            builder: (_, __) {
              return Text(
                '正在加载中...${(_animation.value * 100).toStringAsFixed(0)}%',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFeatures: [FontFeature("tnum")],
                ),
              );
            },
          ),
        ),
        const Spacing(flex: 135),
      ],
    );

    child = SafeArea(child: child);

    final decor = BoxDecoration(
      image: DecorationImage(
        image: AssetImage(IMG.format('loading')),
        scale: 2,
        fit: BoxFit.cover,
        // opacity: Env.isDebug ? 0.618 : 1,
      ),
    );

    child = DecoratedBox(decoration: decor, child: child);

    child = AbsorbPointer(child: child);

    return GestureDetector(
      onTap: () {
        handleTap();
      },
      child: child,
    );
  }

  int tapTimes = 0;
  int preTapTime = 0;

  void handleTap() {
    int curTime = DateTime.now().millisecondsSinceEpoch;
    int unityStartLoadTime = UnityCtrl.ins.unityStartLoadTime;

    // 最小加载时间，大于这个时间时，连续点击屏屏打开调试面板
    double minTime = 1.5 * 60 * 1000;
    // 最少点击次数, 大于这个次数时才会打开调试面板
    double minClickTimes = 10;

    // 调试状态时，配置数值小于
    if(!Env.isRelease) {
      minTime = 500;
      minClickTimes = 2;
    }

    // 加载时间小于1分钟
    if(curTime - unityStartLoadTime < minTime) {
      return;
    }

    // 相邻两次点击的时间不能大于500毫秒
    if(preTapTime != 0 && curTime - preTapTime > 500) {
      tapTimes = 0;
      preTapTime = 0;
      return;
    }
    tapTimes += 1;
    preTapTime = curTime;

    // 大于10次
    if(tapTimes < minClickTimes) {
      return;
    }
    // 生置数据
    tapTimes = 0;
    preTapTime = 0;

    Get.off(() => RoomDebugView());
  }
}
