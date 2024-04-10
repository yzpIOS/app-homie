import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'package:app/ui/common/app_bottom_sheet.dart';
import 'package:app/ui/common/app_dialog.dart';

extension XGet on GetInterface {
  Orientation get orientation => Get.mediaQuery.orientation;

  bool get isLandscape {
    final size = Get.mediaQuery.size;

    return size.width > size.height;
  }

  //<editor-fold desc="Dialog">
  Future<String?> showInputDialog({
    String? title,
    String? hint = '请输入',
    String? initial,
    TextInputType? keyboardType,
    TextAlign textAlign = TextAlign.left,
  }) {
    final ctrl = TextEditingController(text: initial);

    return Get.dialog(
      useSafeArea: false,
      AppDialog(
        title: title,
        content: TextField(
          autofocus: true,
          controller: ctrl,
          textAlign: textAlign,
          style: const TextStyle(fontSize: 17),
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: const Color(0xFFF5F5F5),
            contentPadding: const Pad(horizontal: 16),
            border: const OutlineInputBorder(
              gapPadding: 0,
              borderSide: BorderSide.none,
              borderRadius: AppBorderRadius.max,
            ),
          ),
        ),
        actions: [
          CancelDialogAction(onTap: () => Get.back(result: null)),
          OkDialogAction(onTap: () => Get.back(result: ctrl.text)),
        ],
      ),
    );
  }

  Future<String?> simpleDialog({String msg = '请选择', String okLabel = '确定', String cancelLabel = '取消'}) {
    final content = Text(
      msg,
      style: const TextStyle(fontSize: 13, color: AppPalette.c3),
    );

    return Get.dialog<String>(
      useSafeArea: false,
      AppDialog(
        content: content,
        actions: [
          CancelDialogAction(title: cancelLabel),
          OkDialogAction(
            title: okLabel,
            onTap: () => Get.back(result: okLabel),
          ),
        ],
      ),
    );
  }

  Future<void> alertDialog(String msg, {Function? callBack}) {
    final content = Text(
      msg,
      style: const TextStyle(fontSize: 13, color: AppPalette.c3),
    );

    return Get.dialog<String>(
      useSafeArea: false,
      AppDialog(
        content: content,
        actions: [OkDialogAction(onTap: Get.back)],
      ),
    );
  }

  Future<void> alertDialog2(String msg, {VoidCallback? callBack, String button = "确定", WillPopCallback? onWillPop}) {
    final content = Text(
      msg,
      style: const TextStyle(fontSize: 13, color: AppPalette.c3),
    );


    return Get.dialog<String>(
      useSafeArea: false,
      WillPopScope(
        child: AppDialog(
          content: content,
          actions: callBack != null ? [OkDialogAction(onTap: callBack, title: button,)] : [],
        ),
        onWillPop: () {
          return onWillPop?.call() ?? Future.value(true);
        },
      ),
    );
  }

  Future<void> infoDialog({String? title, required String msg}) {
    return Get.dialog(
      useSafeArea: false,
      AppDialog(
        title: title,
        content: SizedBox(
          height: 350,
          child: SingleChildScrollView(
            padding: const Pad(vertical: 16),
            child: Text(
              msg,
              style: const TextStyle(fontSize: 13, color: AppPalette.txtDark),
            ),
          ),
        ),
      ),
    );
  }

  Future alertSub(
    FutureOr Function() api, {
    required String alert,
    bool isModal = true,
    ValueChanged? callback1,
    VoidCallback? callback,
  }) {
    return simpleDialog(msg: alert).onResult(okCall: () {
      if (isModal) {
        return simpleSub(api, callback: callback, callback1: callback1);
      } else {
        assert(callback == null);
        assert(callback1 == null);

        return simpleTry(api);
      }
    });
  }

  //</editor-fold>

  //<editor-fold desc="Sheet">
  Future<T?> showBottomSheet<T>(
    Widget child, {
    bool enableDrag = true,
    bool isDismissible = true,
    bool ignoreSafeArea = false,
    bool isScrollControlled = true,
    Color bgColor = AppPalette.sheetWhite,
    EdgeInsets safeAreaMinimum = Pad.zero,
    ShapeBorder? shape,
    Duration? enterBottomSheetDuration,
  }) {
    Widget sheet = child;

    if (!ignoreSafeArea) {
      sheet = SafeArea(minimum: safeAreaMinimum, child: child);
    }

    return Get.bottomSheet(
      sheet,
      enableDrag: enableDrag,
      shape: shape,
      clipBehavior: Clip.none,
      backgroundColor: bgColor,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      settings: child.toRouteSettings(),
      enterBottomSheetDuration: enterBottomSheetDuration,
    );
  }

  Future<String?> showActionSheet(Iterable<String> actions) {
    return showSheet<String>(actions);
  }

  Future<T?> showSheet<T>(Iterable<T> actions, {Tuple2<String, String?> Function(T)? toTitle}) {
    final genTitle = toTitle ?? (T it) => Tuple2(it is String ? it : '$it', null);

    Widget itemBuilder(T it) {
      final title = genTitle(it);

      return AppBottomSheetAction(
        title: title.value1,
        hint: title.value2,
        onTap: () => Get.back(result: it),
      );
    }

    final sheet = AppBottomSheet(
      children: actions.map(itemBuilder).toList(growable: false),
    );

    const shape = XRectangleBorder(
      borderRadius: AppBorderRadius.t10,
    );

    return showModalBottomSheet(
      context: Get.context!,
      shape: shape,
      isScrollControlled: true,
      backgroundColor: AppPalette.sheetWhite,
      builder: (_) => sheet,
    );
  }

  //</editor-fold>

  Future<OverlayEntry> insertOverlay<T extends Widget>(T child) async {
    final completer = Completer<OverlayEntry>();

    int count = 0;

    void doInsert() {
      count++;

      final overlay = Get.key.currentState?.overlay;

      if (overlay == null) {
        post(doInsert);
      } else {
        xlog('insertOverlay -> [$child]@[$count]');

        try {
          final entry = OverlayEntry(builder: (_) => child);

          overlay.insert(entry);
          completer.complete(entry);
        } catch (e, s) {
          completer.completeError(e, s);
        }
      }
    }

    doInsert();

    return completer.future;
  }

  void backRoot() => navigator!.popUntil(ModalRoute.withName('/'));

  Future<T?> push<T>(Route<T> route) => navigator!.push<T>(route);

  void pop() => navigator?.pop();
}

extension XRxn<T> on Rxn<T> {
  void nil() => value = null;

  bool isNull() => value == null;
}

extension XRxObjectMixin<T> on RxObjectMixin<T> {
  T rebuild(T Function(T val) fn) {
    final tmp1 = value;
    final tmp2 = fn(tmp1);

    if (tmp1 == tmp2) {
      refresh();
    } else {
      value = tmp2;
    }

    return tmp2;
  }
}
