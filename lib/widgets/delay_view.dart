import 'package:app/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class DelayView<T extends Widget> extends StatefulWidget {
  final bool fadeIn;
  final bool keepAlive;
  final double fraction;
  final T Function(BuildContext) builder;

  const DelayView({super.key, required this.builder, this.fadeIn = true, this.keepAlive = false, this.fraction = 1});

  @override
  State<DelayView> createState() => _DelayViewState<T>();
}

class _DelayViewState<T extends Widget> extends State<DelayView> {
  bool _initialized = false;

  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    if (_initialized) {
      Widget child = Builder(builder: widget.builder);

      if (widget.fadeIn) {
        child = child.animate().fadeIn(duration: kTabScrollDuration, curve: Curves.easeOutCubic);
      }

      if (widget.keepAlive) {
        child = KeepAliveView(child: child);
      }

      return child;
    } else {
      return VisibilityDetector(
        key: _key,
        child: const SizedBox.expand(),
        onVisibilityChanged: (it) {
          if (it.visibleFraction >= widget.fraction) {
            xlog('DelayView [SHOW] -> $T');

            setState(() => _initialized = true);
          }
        },
      );
    }
  }
}

class KeepAliveView extends StatefulWidget {
  final Widget child;

  const KeepAliveView({super.key, required this.child});

  @override
  State<KeepAliveView> createState() => _KeepAliveViewState();
}

class _KeepAliveViewState extends State<KeepAliveView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
