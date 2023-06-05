import 'package:app/tools.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

mixin GetStateMixin<T extends StatefulWidget> on State<T> {
  final _cache = Workers([]);

  S bindGet<S>(S dependency, {String? tag, ValueChanged<S>? onDelete}) {
    final s = Get.put<S>(dependency, tag: tag, permanent: true);

    assert(dependency == s, '数据错误 -> $dependency');

    bindWorker(
      Worker(
        () async {
          if (await Get.delete<S>(force: true, tag: tag)) onDelete?.call(dependency);
        },
        'DeleteGet',
      ),
    );

    return s;
  }

  void bindStream(StreamSubscription work) {
    bindWorker(
      Worker(work.cancel, 'StreamSub'),
    );
  }

  void bindWorker(Worker work) => _cache.workers.add(work);

  @override
  void dispose() {
    _cache.dispose();

    super.dispose();
  }
}

mixin GetDisposableMixin on GetLifeCycleBase {
  final _cache = Workers([]);

  S bindGet<S>(S dependency, {String? tag, ValueChanged<S>? onDelete}) {
    if (isClosed) throw '逻辑错误';

    final s = Get.put<S>(dependency, tag: tag, permanent: true);

    assert(dependency == s, '数据错误 -> $dependency');

    bindWorker(
      Worker(
        () async {
          if (await Get.delete<S>(force: true, tag: tag)) onDelete?.call(dependency);
        },
        'DeleteGet',
      ),
    );

    return s;
  }

  bindStream(StreamSubscription work) {
    bindWorker(
      Worker(work.cancel, 'StreamSub'),
    );
  }

  bindWorker(Worker work) => _cache.workers.add(work);

  void clearWorkers() {
    _cache.dispose();
    _cache.workers.clear();
  }

  @override
  @mustCallSuper
  void onClose() {
    _cache.dispose();

    super.onClose();
  }
}

extension XValueListenable<T> on ValueListenable<T> {
  Worker on(ValueChanged<T> callback) {
    // ignore: prefer_function_declarations_over_variables
    final listener = () => callback(value);

    addListener(listener);

    return Worker(
      () async => removeListener(listener),
      'DeleteListenable',
    );
  }
}
