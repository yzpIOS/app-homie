import 'dart:ui';

import 'package:app/common/theme.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/tools/scene_loader.dart';
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

  final Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers;

  UnityView({
    required this.uniqueKey,
    required this.onInit,
    this.onClose,
    this.gestureRecognizers,
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
                  builder: (_, child) => _ctrl.value == 1 ? Spacing.blank : child!,
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
    _ctrl
      ..value = 0
      ..animateTo(0.9999);

    _visible = visible;

    try {
      await onInit(_unity, _unity.loadScene, _onProcess);

      _ctrl.fling();
    } catch (_) {
      if (_visible.value1 == uniqueKey) _visible = const Tuple2('', 0);

      rethrow;
    }
  }

  void _onProcess(double val) async {
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
        opacity: Env.isDebug ? 0.618 : 1,
      ),
    );

    child = DecoratedBox(decoration: decor, child: child);

    child = AbsorbPointer(child: child);

    return child;
  }
}
