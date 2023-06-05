import 'dart:convert';

import 'package:app/tools.dart';
import 'package:flutter/services.dart';
import 'package:worker_manager/worker_manager.dart';

final _exec = Executor();
final _init = _exec.warmUp(log: canLog(LogType.EXECUTOR), isolatesCount: 2);

typedef Fn1<A, O, T> = FutureOr<O> Function(A arg1, TypeSendPort<T> sendPort);
typedef Fn2<A, B, O, T> = FutureOr<O> Function(A arg1, B arg2, TypeSendPort<T> sendPort);

Future<void> executorInit() => _init;

dynamic _decode(ByteData data, _) => jsonDecode(utf8.decode(data.buffer.asUint8List()));

Future<dynamic> loadAssetJson(String asset) async {
  await _init;

  return execTask1(arg1: await rootBundle.load(asset), fun1: _decode);
}

Future<O> execTask1<A, O, T>({required A arg1, required Fn1<A, O, T> fun1}) async {
  await _init;

  return _exec.execute<A, void, void, void, O, T>(arg1: arg1, fun1: fun1);
}

Future<O> execTask2<A, B, O, T>({required A arg1, required B arg2, required Fn2<A, B, O, T> fun2}) async {
  await _init;

  return _exec.execute<A, B, void, void, O, T>(arg1: arg1, arg2: arg2, fun2: fun2);
}
