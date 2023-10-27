// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter_mxlogger/flutter_mxlogger.dart';
import 'package:stack_trace/stack_trace.dart';

typedef CreateLog = String Function();

int _seq = 0;
late final String _session;
late final MXLogger _logger;

Future<void> loggerInit(String session) async {
  _session = session;

  _logger = await MXLogger.initialize(
    nameSpace: 'logs',
    fileName: Env.appName.toLowerCase(),
    cryptKey: '0' * 16,
    iv: '1' * 16,
    storagePolicy: MXStoragePolicyType.yyyy_MM_dd,
  );

  _logger
    ..setEnable(true)
    ..setFileLevel(1)
    ..setConsoleEnable(false)
    ..setMaxDiskAge(60 * 60 * 24 * 7)
    ..setMaxDiskSize(1024 * 1024 * 10);
}

enum LogType {
  App,
  BUS,
  HTTP,
  TRACK,
  BOX,
  IMG,
  API,
  IM,
  USER_BOX,
  WEB_VIEW,
  ASYNC_CTRL,
  SIMPLE_TRY,
  EXECUTOR,
  UNITY,
  STOMP,
  RTC,
  GIFT_EFFECT,
  GETX,
  SOCKET,
}

const _visible = <LogType>{
  // LogType.App,
  // LogType.BUS,
  // LogType.HTTP,
  // LogType.TRACK,
  // LogType.BOX,
  // LogType.IMG,
  // LogType.API,
  // LogType.IM,
  // LogType.USER_BOX,
  // LogType.WEB_VIEW,
  // LogType.ASYNC_CTRL,
  // LogType.SIMPLE_TRY,
  // LogType.EXECUTOR,
  // LogType.UNITY,
  // LogType.STOMP,
  // LogType.RTC,
  // LogType.GIFT_EFFECT,
  // LogType.GETX,
  // LogType.SOCKET,
};

bool canLog(LogType? type) {
  return Env.isDebug && _visible.contains(type);
}

void xlog(message, {int level = 1, LogType type = LogType.App}) {
  final name = type.name;

  late final String msg = message is CreateLog ? message() : '$message';

  if (level > 0) {
    _log(msg, level: level, name: name);
  }
  if (canLog(type)) {
    _print(msg, name: name);
  }
}

void errLog(e, StackTrace? s, {String? message, LogType type = LogType.App}) {
  final name = type.name;

  final sb = StringBuffer();

  if (message != null) sb.write(message);

  sb.writeln();

  sb.writeln('===== Err =====');
  sb.writeln(e);

  if (s != null) {
    final trace = Trace.from(s);

    sb.writeln('===== Stack =====');
    sb.write(trace);
  }

  sb.write('===== End =====');

  late final msg = sb.toString();

  _log(msg, name: name, level: 3);

  if (canLog(type)) _print(msg, name: name);
}

Future<void> removeExpireLogs() => Future.sync(_logger.removeExpireData);

void _log(String msg, {required String name, required int level}) {
  _logger.log(level, msg, name: name, tag: _session);
}

void _print(String msg, {required String name}) {
  log(msg, name: name, sequenceNumber: _seq++);
}

// 缓存的日志
Map<LogType, RxList<String>> cachesLogs = {};
// 日志开启标志
Map<LogType, int> openers = {};
// 调试信息缓存前缀
const String CACHE_PREFIX = "homie_app_debug_view_key_";

///
/// 记录日志
///
void logForDebug(String? msg, {LogType type = LogType.SOCKET, String? enMsg}) {
  if(msg == null) {
    return;
  }
  debugPrint(msg);
  if(!cachesLogs.containsKey(type)) {
    cachesLogs[type] = RxList();
  }
  cachesLogs[type]?.insert(0, msg);
  cachesLogs[type]?.refresh();
  // 最多只能存1万条数据
  if((cachesLogs[type]?.length ?? 0) < 300) {
    return;
  }
  // 删除最后一条
  cachesLogs.remove((cachesLogs[type]?.length ?? 0) - 1);
}

///
/// 开启日志
///
void openDebug(LogType type) async {
  openers[type] = 0;
  if(!(await KvBox.contains(CACHE_PREFIX + type.name))) {
    await KvBox.write(CACHE_PREFIX + type.name, type.name);
  }
}

/// 关闭日志
void closeDebug(LogType type) async {
  if(openers.containsKey(type)) {
    // 关闭日志
    openers.remove(type);
  }
  // 判断是否存在
  if((await KvBox.contains(CACHE_PREFIX + type.name))) {
    await KvBox.remove(CACHE_PREFIX + type.name);
  }
}

///
/// 加载调试信息
///
void loadDebugConfig() {
  LogType.values.forEach((element) async {
    if(await KvBox.contains(CACHE_PREFIX + element.name)) {
      openers[element] = 0;
    }
  });
}

///
/// 获取日志
///
RxList<String>? getDebugLogs(LogType type) {
  if(!openers.containsKey(type)) {
    return null;
  }
  return cachesLogs[type];
}

///
/// 调试模式是否打开
///
bool isDebugOpen(LogType type) {
  if(Env.isDebugCfg) {
    return true;
  }
  return openers.containsKey(type);
}

///
/// 开启debugView
///
bool openDebugView(String text) {
  if(text == "hello homie, please open the room debug view for me and the password is cqeY2ZR4JcCZ7giJ") {
    openDebug(LogType.SOCKET);
    return true;
  }
  return false;
}

///
/// 关闭debugView
///
bool closeDebugView(String text) {
  if(text == "hello homie, please close the room debug view for me and the password is cqeY2ZR4JcCZ7giJ") {
    closeDebug(LogType.SOCKET);
    return true;
  }
  return false;
}