import 'package:app/tools.dart';
import 'package:hive_flutter/hive_flutter.dart';

class KvBox {
  KvBox._();

  static const _boxName = 'App';

  static final _ready = Completer<LazyBox>();

  static Future<void> init() async {
    await Hive.initFlutter();

    final box = await Hive.openLazyBox(_boxName);

    _ready.complete(box);
  }

  static LazyBox? _boxCache;

  static Future<LazyBox> get _box async {
    return _boxCache ??= await _ready.future;
  }

  static Future<bool> contains(String k) async => (await _box).containsKey(k);

  static Future<T?> read<T>(String k) async {
    xlog('READ => $T $k', level: 0, type: LogType.BOX);

    final result = await (await _box).get(k);

    return result as T?;
  }

  static Future<void> write(String k, v) async {
    xlog('WRITE => ${v.runtimeType} $k', level: 0, type: LogType.BOX);

    return (await _box).put(k, v);
  }

  static Future<void> remove(String k) async {
    xlog('DELETE => $k', level: 0, type: LogType.BOX);

    return (await _box).delete(k);
  }
}
