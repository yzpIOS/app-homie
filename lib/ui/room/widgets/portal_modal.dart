import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_portal/flutter_portal.dart';

class PortalModal extends StatelessWidget {
  final Widget child;
  final Widget modal;
  final bool visible;
  final VoidCallback onDismiss;

  PortalModal({
    Key? key,
    required this.visible,
    required this.onDismiss,
    required this.modal,
    required this.child,
  }) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    const aligned = Aligned(
      offset: Offset(0, 10),
      target: Alignment.bottomCenter,
      follower: Alignment.topCenter,
      backup: Aligned(
        offset: Offset(48, 10),
        target: Alignment.bottomCenter,
        follower: Alignment.topLeft,
        portal: Alignment.topLeft,
        alignToPortal: AxisFlag(x: true, y: false),
      ),
    );

    final target = PortalTarget(
      visible: visible,
      anchor: aligned,
      closeDuration: kThemeChangeDuration,
      portalFollower: modal.animate().fadeIn(duration: kThemeChangeDuration, curve: Curves.easeOutCubic),
      child: child,
    );

    return _Barrier(visible: visible, onDismiss: onDismiss, child: target);
  }
}

class _Barrier extends StatelessWidget {
  final Widget child;
  final bool visible;
  final VoidCallback onDismiss;

  const _Barrier({required this.onDismiss, required this.visible, required this.child});

  @override
  Widget build(BuildContext context) {
    return PortalTarget(
      visible: visible,
      closeDuration: kThemeChangeDuration,
      portalFollower: ModalBarrier(color: Colors.transparent, onDismiss: onDismiss),
      child: child,
    );
  }
}
