import 'package:app/common/theme.dart';
import 'package:app/exception.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

mixin ReadyMixin {
  final _ready = Completer<void>();
  final _statusRx = Rx(RxStatus.loading());

  Future<void> get ready => _ready.future;

  bool get isCompleted => _ready.isCompleted;

  bool get isReady => isCompleted && _statusRx().isSuccess;

  void markReady() {
    _ready.complete();
    _statusRx(RxStatus.success());
  }

  void markFail(Object error, StackTrace stackTrace) {
    errLog(error, stackTrace);

    if (_ready.isCompleted) return;

    _ready.completeError(error, stackTrace);
    _statusRx(RxStatus.error('$error'));
  }

  void markCancel() {
    _ready.completeError(const CanceledException());

    post(() => _statusRx(RxStatus.error('')));
  }

  Widget readyBuild({required Widget Function() builder, Widget? blank, Widget? error}) {
    return ObxValue<Rx<RxStatus>>(
      (it) {
        final status = it();

        if (status.isSuccess) {
          return builder();
        } else if (status.isError) {
          return error ??
              Scaffold(
                body: Center(
                  child: XText(Env.isDebug ? '${status.errorMessage}' : 'Err'),
                ),
              );
        } else {
          return blank ?? const Scaffold(body: _loading);
        }
      },
      _statusRx,
    );
  }

  static const _loading = _LoadingIndicator();
}

mixin ReadyCtrlMixin on GetLifeCycleBase, ReadyMixin {
  @override
  @mustCallSuper
  void onClose() {
    if (!_ready.isCompleted) markCancel();

    super.onClose();
  }
}

mixin ReadyStateMixin<T extends StatefulWidget> on State<T>, ReadyMixin {
  @override
  @mustCallSuper
  void dispose() {
    if (!_ready.isCompleted) markCancel();

    super.dispose();
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitPulse(color: AppPalette.primary),
    );
  }
}
