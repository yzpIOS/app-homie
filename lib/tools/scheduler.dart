import 'dart:async';

import 'package:flutter/scheduler.dart';

final _ = SchedulerBinding.instance;
final _addPostFrameCallback = _.addPostFrameCallback;

void post(VoidCallback callback) {
  _addPostFrameCallback((_) => callback());
}

Future<T> endOfFrame<T>(FutureOr<T> Function() callback) async {
  await _.endOfFrame;

  return await callback();
}
