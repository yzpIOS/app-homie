import 'package:app/tools.dart';
import 'package:flutter/widgets.dart';
import 'package:keframe/keframe.dart';

class XFrameWidget extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;

  const XFrameWidget({super.key, required this.child, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    if (isSlowDevice) {
      return FrameSeparateWidget(
        key: key,
        placeHolder: SizedBox(width: width, height: height),
        child: child,
      );
    }

    return child;
  }
}

class XSnapshotWidget extends StatefulWidget {
  final Widget child;

  const XSnapshotWidget({super.key, required this.child});

  @override
  State<XSnapshotWidget> createState() => _XSnapshotWidgetState();
}

class _XSnapshotWidgetState extends State<XSnapshotWidget> {
  final controller = SnapshotController(allowSnapshotting: true);

  Animation? _anime;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    doReset();

    _anime = ModalRoute.of(context)?.animation;

    doInit();
  }

  @override
  void dispose() {
    doReset();
    controller.dispose();

    super.dispose();
  }

  void doInit() {
    _anime?.addStatusListener(onStatusChange);

    onStatusChange(_anime?.status);
  }

  void doReset() {
    _anime?.removeStatusListener(onStatusChange);
  }

  void onStatusChange(AnimationStatus? status) {
    switch (status) {
      case null:
      case AnimationStatus.completed:
      case AnimationStatus.dismissed:
        controller.allowSnapshotting = false;
        break;
      case AnimationStatus.forward:
      case AnimationStatus.reverse:
        controller.allowSnapshotting = true;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SnapshotWidget(
      mode: SnapshotMode.permissive,
      controller: controller,
      child: widget.child,
    );
  }
}
