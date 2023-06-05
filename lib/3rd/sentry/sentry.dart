import 'package:app/tools.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

// ignore: undefined_shown_name
export 'package:app/3rd/sentry/sentry.dart' show SentryNavigatorObserver;

class SentryHelp {
  SentryHelp._();

  static const dsn = String.fromEnvironment('sentry_dsn');

  static Future<void> initApp(Widget app) async {
    /*if (Env.isDebug) */return runApp(app);

    // void optCfg(SentryFlutterOptions options) {
    //   options
    //     ..dsn = dsn
    //     ..tracesSampleRate = 1
    //     ..sendDefaultPii = true
    //     ..enableUserInteractionTracing = true
    //     ..environment = Env.channelCode
    //     ..addIntegration(LoggingIntegration());
    // }

    // FutureOr<void> run() {
    //   runApp(
    //     SentryScreenshotWidget(
    //       child: SentryUserInteractionWidget(
    //         child: DefaultAssetBundle(
    //           bundle: SentryAssetBundle(),
    //           child: app,
    //         ),
    //       ),
    //     ),
    //   );
    // }
    //
    // return await SentryFlutter.init(optCfg, appRunner: run);
  }

  static Dio add(Dio dio) {
    return dio/*..addSentry()*/;
  }

  static FutureOr<void> setUser([String? uid]) {
    // final SentryUser? user;
    //
    // if (uid == null) {
    //   user = null;
    // } else {
    //   user = SentryUser(id: uid);
    // }
    //
    // return Sentry.configureScope((it) => it.setUser(user));
  }

  static void sendErr(e, {StackTrace? s}) {
    // Sentry.captureException(e, stackTrace: s);
  }
}
