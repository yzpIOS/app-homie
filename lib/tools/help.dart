import 'dart:io';
import 'dart:math' as math;

import 'package:android_intent_plus/android_intent.dart';
import 'package:app/3rd/sentry/sentry.dart';
import 'package:app/exception.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

typedef WhenErr = Map<int?, ValueChanged<LogicException>>;

Future<void> goHome() {
  const intent = AndroidIntent(
    action: 'android.intent.action.MAIN',
    category: 'android.intent.category.HOME',
  );

  return intent.launch();
}


void toAppMarket() async {
  if (Platform.isAndroid) {
    // var appName = "com.jm.homie.app";
    // var targetURL = Uri.parse("market://details?id=$appName");
    // await launchUrl(targetURL);
    // const intent = AndroidIntent(
    //   action: "android.intent.action.VIEW",
    //   data: "market://details?id=com.jm.homie.app",
    // );
    // intent.launch();
    var targetURL = Uri.parse("http://app.web.homieyy.com");
    await launchUrl(targetURL);
  } else if (Platform.isIOS) {
    var appID = "6450973472";
    var targetURL = Uri.parse("itms-apps://itunes.apple.com/app/$appID");
    await launchUrl(targetURL);
  }
}

//<editor-fold desc="提交">
WhenErr get doBackWhenErr {
  void f(LogicException e) {
    showToast(e.msg);

    Get.back();
  }

  return {null: f};
}

Future showProgress(f) async {
  final dialog = WaitingCtrl.obj;

  try {
    dialog.show();

    if (f is Future) {
      return await f;
    } else if (f is Function) {
      final data = f.call();
      return data is Future ? await data : data;
    }
  } finally {
    dialog.hidden();
  }
}

Future<T> holderProgress<T>(Future<T> f) async {
  final ctrl = WaitingCtrl.obj;

  if (ctrl.isShow) {
    try {
      ctrl.hidden();

      return await f;
    } finally {
      ctrl.show();
    }
  } else {
    return await f;
  }
}

Future<void> simpleSub(f, {ValueChanged? callback1, VoidCallback? callback, String? msg, WhenErr? whenErr}) {
  return simpleTry(
    whenErr: whenErr,
    () async {
      final result = await showProgress(f);

      if (msg != null) showToast(msg);

      if (callback != null) {
        callback();
      } else if (callback1 != null) {
        callback1(result);
      }
    },
  );
}

Future<void> simpleTry<T>(FutureOr<T> Function() body, {WhenErr? whenErr, ValueChanged<T>? callback}) async {
  try {
    final resp = await body();

    callback?.call(resp);
  } on LogicException catch (e) {
    if (whenErr == null) {
      errLog(e, null, type: LogType.SIMPLE_TRY);

      showToast(e.msg);
    } else {
      final call = whenErr[e.code] ?? whenErr[null];

      if (call == null) {
        if (e.code == 7700) {
          Get.alertDialog(e.msg);
        } else {
          showToast(e.msg);
        }
      } else {
        call(e);
      }
    }
  } on TimeoutException {
    showToast('操作超时');
  } on CanceledException {
    showToast('已取消');
  } on NetException catch (e) {
    showToast(e.msg);
  } catch (e, s) {
    errLog(e, s, type: LogType.SIMPLE_TRY);

    SentryHelp.sendErr(e, s: s);

    showToast('服务异常');
  }
}
//</editor-fold>

bool isEmpty(v) => v == null || v.isEmpty;

bool isNotEmpty(v) => !isEmpty(v);

extension XNum<T extends num> on T {
  T limit(T min, T max) => math.min(math.max(this, min), max);
}

extension XIterable<E> on Iterable<E> {
  Iterable<E> separator(E separator) {
    Iterator<E> iterator = this.iterator;

    if (!iterator.moveNext()) return const [];

    final buffer = <E>[];

    buffer.add(iterator.current);

    while (iterator.moveNext()) {
      buffer.add(separator);
      buffer.add(iterator.current);
    }

    return buffer;
  }

  Iterable<E> joinTop(E separator) {
    Iterator<E> iterator = this.iterator;

    final buffer = <E>[];

    while (iterator.moveNext()) {
      buffer.add(separator);
      buffer.add(iterator.current);
    }

    return buffer;
  }
}

extension XVoidCallback on Iterable<Function()> {
  void tryRun() async {
    for (final fn in this) {
      try {
        await fn();
      } catch (e, s) {
        errLog(e, s);
      }
    }
  }
}

// extension XStream<E> on Stream<E> {
//   Stream<T> whereType<T>() {
//     return where((event) => event is T).map((event) => event as T);
//   }
// }

extension XObject on Object? {
  T? typeIf<T>() {
    if (this is T) {
      return this as T;
    } else {
      return null;
    }
  }
}

extension XString on String {
  String get overflow => Characters(this).join('\u{200B}');
}

extension XBool on bool {
  int get intVal => this ? 1 : 0;
}

extension XInt on int {
  bool get boolVal => this != 0;
}

extension XNilMap<K, V> on Map<K, V>? {
  bool boolGet(String key) {
    return (this?[key] as int?)?.boolVal == true;
  }

  X? xGet<X>(String key) {
    return this?[key] as X?;
  }

  String debug() {
    final sb = StringBuffer();

    final $ = this;

    if ($ != null) {
      for (final item in $.entries) {
        sb
          ..writeln()
          ..write('${item.key} # ${item.value}');
      }
    }

    return sb.toString();
  }
}

extension XInput<T> on Map<T, TextEditingController> {
  String by(T key) => this[key]!.text.trim();

  bool validate() {
    final item = entries.firstWhereOrNull((it) => it.value.text.trim().isEmpty);

    if (item != null) {
      showToast('请输入${item.key}');

      return false;
    }

    return true;
  }
}

extension NotNullFuture<T extends Object> on Future<T?> {
  Future onNotNull(dynamic Function(T val) onValue) async {
    final result = await this;

    return result == null ? null : onValue(result);
  }

  Future onType<TYPE>(dynamic Function(TYPE val) onValue) async {
    final result = await this;

    return result is TYPE ? onValue(result as TYPE) : null;
  }
}

extension XTextEditingController on TextEditingController {
  void join(String text) {
    final tmp = value;

    int end = tmp.selection.extentOffset;

    if (tmp.selection.isValid) {
      String newText = '';

      if (tmp.selection.isCollapsed) {
        if (end > 0) {
          newText += tmp.text.substring(0, end);
        }

        newText += text;

        if (tmp.text.length > end) {
          newText += tmp.text.substring(end, tmp.text.length);
        }
      } else {
        final start = tmp.selection.baseOffset;

        newText = tmp.text.replaceRange(start, end, text);

        end = start;
      }

      value = tmp.copyWith(
        text: newText,
        selection: tmp.selection.copyWith(baseOffset: end + text.length, extentOffset: end + text.length),
      );
    } else {
      value = TextEditingValue(
        text: text,
        selection: TextSelection.fromPosition(TextPosition(offset: text.length)),
      );
    }
  }

  void backspace() {
    final _text = text.characters.skipLast(1).string;

    value = value.copyWith(
      text: _text,
      selection: TextSelection.collapsed(offset: _text.length),
      composing: TextRange.empty,
    );
  }
}

extension XDialog on Future<String?> {
  Future<T?> onResult<T>({T Function()? okCall}) {
    return then((it) {
      switch (it) {
        case '确定':
          return okCall?.call();
      }

      return null;
    });
  }
}

checkVersion(BuildContext context, {bool alert = true}) async {
  //TODO
}

Future<void> autoTips(String key, FutureOr call) async {
  if (await showTips(key)) await call;
}

Future<bool> showTips(String key) async {
  final b = await KvBox.read(key) ?? true;

  if (b) await KvBox.write(key, false);

  return b;
}
