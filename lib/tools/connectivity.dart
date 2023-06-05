import 'dart:async';

import 'package:app/exception.dart';
import 'package:app/tools/log.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class ConnState {
  static var _ready = false;
  static var _completer = Completer<void>();

  static Future<void> get ready => _completer.future;

  static void onChanged(ConnectivityResult state) {
    xlog('网络连接状态 -> $state');

    final hasNet = state != ConnectivityResult.none;

    if (_ready != hasNet) {
      _ready = hasNet;

      if (hasNet) {
        _completer.complete();
      } else {
        if (!_completer.isCompleted) {
          assert(false, '数据错误');

          _completer.completeError(const CanceledException());
        }

        _completer = Completer<void>();
      }
    }
  }
}
