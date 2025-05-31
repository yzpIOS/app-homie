import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:hive_flutter/hive_flutter.dart';

mixin _ListMixin<T> on AsyncCtrl<RxList<T>, List<T>, T> {
  bool _ready = false;

  @override
  final RxList<T> _dataRx = RxList();

  @override
  RxList<T> get autoGet {
    if (!_ready && _dataRx.isEmpty) doRefresh();

    return _dataRx;
  }

  @override
  FutureOr<void> readCache(Box<T> box) {
    _dataRx.assignAll(box.values);
  }

  @override
  FutureOr<void> saveCache(Box<T> box, List<T> data) async {
    await box.clear();
    await box.addAll(data);
  }

  @override
  List<T> transform(data) {
    assert(data is List, '数据错误 -> [$data]');

    return data is List ? data.cast() : const [];
  }

  @override
  void onRefreshData(List<T> data) {
    _ready = true;
    if(data.isEmpty) {
      _dataRx.clear();
      return;
    }
    _dataRx.assignAll(data);
  }

  @override
  bool retryAssert(e) => _dataRx.isEmpty;
}

mixin _MapMixin<T> on AsyncCtrl<RxMap<String, T>, Map<String, T>, T> {
  bool _ready = false;

  @override
  final RxMap<String, T> _dataRx = RxMap();

  @override
  RxMap<String, T> get autoGet {
    if (!_ready && _dataRx.isEmpty) doRefresh();

    return _dataRx;
  }

  @override
  FutureOr<void> readCache(Box<T> box) {
    _dataRx.assignAll(box.toMap().cast());
  }

  @override
  FutureOr<void> saveCache(Box<T> box, Map<String, T> data) async {
    await box.clear();
    await box.putAll(data);
  }

  @override
  Map<String, T> transform(data) {
    assert(data is Map, '数据错误 -> [$data]');

    return data is Map ? data.cast() : const {};
  }

  @override
  void onRefreshData(Map<String, T> data) {
    _ready = true;

    _dataRx.assignAll(data);
  }

  @override
  bool retryAssert(e) => _dataRx.isEmpty;
}

abstract class AsyncCtrl<RX extends RxInterface<DATA>, DATA, T> extends GetxController
    with UserBoxDisposableMixin<T>, GetDisposableMixin {
  @override
  final UID uid;
  @override
  final String boxName;

  AsyncCtrl({required this.uid, required this.boxName});

  bool retryAssert(e) => true;

  abstract final RX _dataRx;

  Future? _cache;

  Future get api;

  @override
  void onInit() async {
    super.onInit();

    try {
      await box.use(readCache);
    } catch (e, s) {
      errLog(e, s, type: LogType.ASYNC_CTRL);
    }

    bindWorker(
      debounce<DATA>(
        _dataRx,
        (it) => box.use((box) => saveCache(box, it)),
      ),
    );
  }

  FutureOr<void> readCache(Box<T> box);

  FutureOr<void> saveCache(Box<T> box, DATA data);

  RX get dataRx => _dataRx;

  RX get autoGet;

  DATA transform(data);

  Future doRefresh() async {
    if (isClosed) return;

    int tryTime = 0;

    final task = _cache ??= Future.doWhile(() async {
      if(tryTime >= 5) {
        throw TimeoutException("time out");
      }
      tryTime += 1;
      return _fetch();
    }).whenComplete(() => _cache = null);

    await task;
  }

  Future<bool> _fetch() async {
    if (isClosed) return false;

    try {
      final result = await api;

      if (isClosed) return false;

      onRefreshData(transform(result));

      return false;
    } catch (e, s) {
      errLog(e, s, message: '$runtimeType', type: LogType.ASYNC_CTRL);

      if (retryAssert(e)) return await Future.delayed(const Duration(seconds: 5), () => true);

      return false;
    }
  }

  void doPreCache() => autoGet;

  void onRefreshData(DATA data);
}

abstract class AsyncListCtrl<T> extends AsyncCtrl<RxList<T>, List<T>, T> with _ListMixin<T> {
  AsyncListCtrl({required super.uid, required super.boxName});
}

abstract class AsyncMapCtrl<T> extends AsyncCtrl<RxMap<String, T>, Map<String, T>, T> with _MapMixin<T> {
  AsyncMapCtrl({required super.uid, required super.boxName});
}
