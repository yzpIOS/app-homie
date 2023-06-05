import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/slide_animated_view.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';

abstract class BroadcastQueueCtrl<T> extends GetxController with BusGetLifeMixin {
  final _views = <Key, OverlayEntry>{};

  late final _ctrl = StreamController<T>.broadcast();
  late final _queue = StreamQueue(_ctrl.stream);

  @override
  void onInit() {
    super.onInit();

    _doLoop().ignore();
  }

  @override
  void onClose() {
    [_queue.cancel, _ctrl.close].tryRun();

    _views
      ..values.forEach((it) async => it.remove())
      ..clear();

    super.onClose();
  }

  Future<void> _doLoop() async {
    bool canRun() => !isClosed;

    while (canRun() && await _queue.hasNext) {
      if (canRun()) {
        final data = await _queue.next;

        if (canRun()) {
          await _doAnime(itemBuilder(data));
        }
      }
    }
  }

  Future<void> _doAnime(AnimeEntity data) async {
    final key = UniqueKey();

    Widget child = SlideAnimatedView(
      onFinish: () async => _views[key]?.remove(),
      dock: data.dock,
      times: data.times,
      child: data.child,
    );

    child = Positioned(
      key: key,
      left: 0,
      right: 0,
      top: data.offsetTop,
      child: child,
    );

    _views[key] = await Get.insertOverlay(child);

    // 等待上一个横幅
    return await Future.delayed(data.times.value1 + data.times.value2);
  }

  AnimeEntity itemBuilder(T data);

  addTask(T data) => _ctrl.add(data);
}

class AnimeEntity {
  final Widget child;
  final double offsetTop;
  final Tuple3<double, double, double> dock;
  final Tuple3<Duration, Duration, Duration> times;

  AnimeEntity({required this.child, required this.dock, required this.times, required this.offsetTop});
}
