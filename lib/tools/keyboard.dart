import 'dart:math';
import 'dart:ui';

import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

final _heightRx = RxDouble(AppSize.safeBottom);
final _heightMaxRx = RxDouble(260);

final keyboardRx = RxBool(KeyboardVisibilityController().isVisible);

Future<void> keyboardInit() async {
  final dispatcher = WidgetsBinding.instance.platformDispatcher;
  final window = dispatcher.implicitView!;

  dispatcher.addMetricsChangedListener(
    onMetricsChanged: () => _heightRx(window.safeBottomHeight),
  );

  keyboardRx.bindStream(KeyboardVisibilityController().onChange);

  hideKeyboard();

  _heightMaxRx(await KvBox.read<double>(PrefKey.KeyboardHeight));

  ever<double>(_heightMaxRx, (it) {
    xlog('更新键盘高度配置 => $it');

    KvBox.write(PrefKey.KeyboardHeight, it);
  });

  debounce<double>(
    _heightRx,
    (it) => keyboardRx() && it > 0 ? _heightMaxRx(it) : null,
    time: const Duration(milliseconds: 50),
  );
}

Future<void> hideKeyboard({bool keepFocus = false}) async {
  const method = 'TextInput.hide';

  try {
    if (keepFocus) {
      await SystemChannels.textInput.invokeMethod(method);
    } else {
      final focus = FocusManager.instance.primaryFocus;

      if (focus != null) {
        focus.unfocus();
      } else {
        await SystemChannels.textInput.invokeMethod(method);
      }
    }
  } catch (e, s) {
    errLog(e, s);
  }
}

Widget $KeyboardBlank() {
  Widget child = Obx(
    () => SizedBox(height: _heightRx()),
  );

  if (!GetPlatform.isIOS) {
    child = AnimatedSize(
      duration: const Duration(milliseconds: 100),
      child: child,
    );
  }

  return child;
}

Widget $KeyboardHolder({required Widget child}) {
  return Obx(() => Box(height: _heightMaxRx(), child: child));
}

extension on FlutterView {
  double get safeBottomHeight {
    return max(viewPadding.bottom, viewInsets.bottom) / devicePixelRatio;
  }
}

extension XPlatformDispatcher on PlatformDispatcher {
  void addMetricsChangedListener({required VoidCallback onMetricsChanged}) {
    final _onMetricsChanged = this.onMetricsChanged;

    if (_onMetricsChanged is VoidCallback) {
      this.onMetricsChanged = () {
        _onMetricsChanged();

        onMetricsChanged();
      };
    } else {
      this.onMetricsChanged = onMetricsChanged;
    }
  }
}
