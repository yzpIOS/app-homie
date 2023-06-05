import 'package:app/exception.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class UserBox<T> {
  final UID uid;
  final String name;
  final Future<Box<T>> _box;

  UserBox({required this.uid, required this.name}) : _box = Hive.openBox<T>('${uid}_$name');

  Future<void> close() => use((box) => box.close());

  void delete() async {
    final box = await _box;

    box.deleteFromDisk();
  }

  Future<R> use<R>(FutureOr<R> Function(Box<T> box) callback) async {
    final box = await _box;

    try {
      return await callback(box);
    } catch (e, s) {
      errLog(e, s, type: LogType.USER_BOX);

      rethrow;
    }
  }
}

class UserLazyBox<T> {
  final UID uid;
  final String name;
  final Future<LazyBox<T>> _box;

  UserLazyBox({required this.uid, required this.name}) : _box = Hive.openLazyBox<T>('${uid}_$name');

  Future<void> close() => use((box) => box.close());

  void delete() async {
    final box = await _box;

    box.deleteFromDisk();
  }

  Future<R> use<R>(FutureOr<R> Function(LazyBox<T> box) callback) async {
    final box = await _box;

    if (!box.isOpen) throw const CanceledException();

    try {
      return await callback(box);
    } catch (e, s) {
      errLog(e, s, type: LogType.USER_BOX);

      rethrow;
    }
  }
}

mixin UserBoxDisposableMixin<T> on GetLifeCycleBase {
  abstract final UID uid;
  abstract final String boxName;

  late final box = UserBox<T>(uid: uid, name: boxName);

  @override
  @mustCallSuper
  void onClose() {
    box.close();

    super.onClose();
  }
}

mixin UserLazyBoxDisposableMixin<T> on GetLifeCycleBase {
  abstract final UID uid;
  abstract final String boxName;

  late final box = UserLazyBox<T>(uid: uid, name: boxName);

  @override
  @mustCallSuper
  void onClose() {
    box.close();

    super.onClose();
  }
}
