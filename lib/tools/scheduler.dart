import 'dart:async';

import 'package:app/widgets.dart';
import 'package:flutter/scheduler.dart';

final _ = SchedulerBinding.instance;
final _addPostFrameCallback = _.addPostFrameCallback;

void post(VoidCallback callback) {
  _addPostFrameCallback((_) {
    try {
      callback();
    } catch(e) {
      //debugPrint(e.toString());
    }
  });
}

void delay({required int milliseconds,required VoidCallback callBack}) {
  Future.delayed(Duration(milliseconds: milliseconds)).whenComplete(() => callBack.call());
}

Future<T> endOfFrame<T>(FutureOr<T> Function() callback) async {
  await _.endOfFrame;

  return await callback();
}
