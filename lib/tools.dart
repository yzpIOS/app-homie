// ignore_for_file: constant_identifier_names

library tools;

import 'dart:convert';
import 'dart:io';

import 'package:app/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http_proxy/http_proxy.dart';
import 'package:number_display/number_display.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

export 'dart:async';

export 'package:collection/collection.dart';
export 'package:dartz/dartz.dart' show Either, Left, Right, Option, Some, None, Tuple2, Tuple3, Tuple4;
export 'package:get/get_core/get_core.dart';
export 'package:get/get_instance/get_instance.dart';
export 'package:get/get_navigation/get_navigation.dart';
export 'package:get/get_rx/get_rx.dart';
export 'package:get/get_state_manager/get_state_manager.dart';
export 'package:get/utils.dart' show GetNumUtils, GetPlatform;
export 'package:kotlin_flavor/scope_functions.dart';
export 'package:provider/provider.dart' show ReadContext;
export 'package:quiver/iterables.dart' hide min, max;

export 'env.dart';
export 'tools/bus.dart';
export 'tools/clipboard.dart';
export 'tools/connectivity.dart';
export 'tools/duration.dart';
export 'tools/executor.dart';
export 'tools/file_help.dart';
export 'tools/file_picker.dart';
export 'tools/get_extension.dart';
export 'tools/help.dart';
export 'tools/image_help.dart';
export 'tools/keyboard.dart';
export 'tools/lifecycle.dart';
export 'tools/local_storage.dart';
export 'tools/log.dart';
export 'tools/scheduler.dart';
export 'tools/screen.dart';
export 'tools/time.dart';
export 'tools/toast.dart';
export 'tools/tracker_help.dart';
export 'tools/user_box.dart';
export 'tools/view.dart';

final isSlowDevice = Platform.isAndroid;

late final PackageInfo appInfo;

Future<void> toolsInit() async {
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemStatusBarContrastEnforced: false,
      //
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarContrastEnforced: false,
    ),
  );

  await keyboardInit();

  // debugInvertOversizedImages = true;
  // debugRepaintRainbowEnabled = true;

  //禁用Provider类型检查
  Provider.debugCheckInvalidValueType = null;

  Get.log = (msg, {bool isError = false}) => xlog(msg, level: isError ? 3 : 0, type: LogType.GETX);

  //加快刷新时间，不用延迟
  VisibilityDetectorController.instance.updateInterval = Duration.zero;

  final result = await Future.wait<dynamic>(
    [
      PackageInfo.fromPlatform(),
      lockScreenToPortrait(),
      if (const bool.fromEnvironment('use_proxy', defaultValue: false)) //
        HttpProxy.createHttpProxy().then((val) => HttpOverrides.global = val),
    ],
  );

  appInfo = result[0];
}

final $NumFormat = createDisplay(length: 4, placeholder: '--', roundingType: RoundingType.floor);

T readJson<T>(json) => readJsonOrNull<T>(json) as T;

T? readJsonOrNull<T>(json) {
  if (json is String) {
    try {
      final data = jsonDecode(json);

      if (data is T) return data;
    } catch (e) {
      // errLog(e);
    }
  }

  return null;
}

class IMG {
  IMG._();

  static String format(String img, [String type = 'webp']) => 'assets/img/$img.$type';
}

class SVG {
  SVG._();

  static String $(String img) => 'assets/si/$img.si';
}

class PrefKey {
  PrefKey._();

  static const KeyboardHeight = 'KeyboardHeight';
  static const AuthInfo = '登录信息';
  static const MyInfo = '我的信息';
  static const LastPhone = '最后登录号码';
  static const OpenInstallBlindData = 'OpenInstallBlindData';
}
