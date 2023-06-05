import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class SlideAnimatedView extends StatefulWidget {
  final Widget child;
  final Tuple3<double, double, double> dock;
  final Tuple3<Duration, Duration, Duration> times;
  final VoidCallback onFinish;

  const SlideAnimatedView({
    super.key,
    required this.child,
    required this.dock,
    required this.times,
    required this.onFinish,
  });

  @override
  State<SlideAnimatedView> createState() => _SlideAnimatedViewState();
}

class _SlideAnimatedViewState extends State<SlideAnimatedView> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    final _times = widget.times;
    final _dock = widget.dock;

    _ctrl = AnimationController(
      vsync: this,
      duration: _times.value1 + _times.value2 + _times.value3,
    );

    _animation = TweenSequence(
      [
        TweenSequenceItem(
          tween: Tween(begin: Offset(_dock.value1, 0), end: Offset(_dock.value2, 0))
              .chain(CurveTween(curve: Curves.easeInOutCubicEmphasized)),
          weight: _times.value1.inMilliseconds.toDouble(),
        ),
        TweenSequenceItem(
          tween: Tween(begin: Offset(_dock.value2, 0), end: Offset(_dock.value2, 0)),
          weight: _times.value2.inMilliseconds.toDouble(),
        ),
        TweenSequenceItem(
          tween: Tween(begin: Offset(_dock.value2, 0), end: Offset(_dock.value3, 0))
              .chain(CurveTween(curve: Curves.easeOutCubic)),
          weight: _times.value3.inMilliseconds.toDouble(),
        ),
      ],
    ).animate(_ctrl);

    _ctrl.forward() /*.whenCompleteOrCancel(widget.onFinish)*/;
  }

  @override
  void dispose() {
    _ctrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SlideTransition(position: _animation, child: widget.child);
}
