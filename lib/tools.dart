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

import '3rd/tencent/im.dart';

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
  // openInstall信息key
  static const OpenInstallBlindData = 'OpenInstallBlindData';
  // 记录是否上传openInstall
  static const OpenInstallBlindDataFlag = 'OpenInstallBlindDataFlag';
  // 记录是否上传openInstall
  static const OpenInstallBlindDataFlag2 = 'OpenInstallBlindDataFlag2';

}

class FiltrationChatText {
  FiltrationChatText._();

  // static String filterChat(String content, {String? atText}) {
  //   const List<String> chatFilter1 = ['新App','新app','新 App','新 app','更好的app','新平台','新软件','新应用','新游戏','wan','WAN','玩手游',
  //       '折扣','福利','半价','后台','.务','。务','服。','充值送','紫钻','紫。钻','紫.钻','紫鉆','紫。鉆','人民币','RMB','刷',
  //       'WV','微信','微+信','微-信','微 信','微.信','徽.信','徽信','徽 信','威 信','威信','威.信','威+信','wx','wX','Wx',
  //       'QQ','qQ','Qq','qq','q.','Q。','q ','Q ','Q.','q。','扣扣','扣 扣','扣。扣','秋秋','秋 秋','秋.秋','秋。秋',
  //       '充值','充 值','充.值','@163','tel','call','电话','电.话','电。话','手机','手.机','手。机','联系','联 系','联。系',
  //       '@126','.com','.net','.org'];
  //   const String chatFilter2 = "345678⒈⒉⒊⒌⒍⒎⒏⒐⑴⑵⑶⑷⑹⑺⑻⑸⑼⑥③⑦⑨④㈠㈡㈢㈣㈤㈣㈤㈦㈨叁肆伍玖柒捌五六七八九零①②❺❻❼❽❾￥\$";
  //   int count = 0;
  //   var startIndex = 0;//滚动过滤开始的下标
  //   var result = '';//过滤后的结果
  //   if (atText != null) {
  //     if (atText.isNotEmpty) {
  //       startIndex = atText.length;
  //       result = atText;
  //     }
  //   }
  //   if (startIndex < 0) {
  //     startIndex = 0;
  //   }
  //
  //   void pollString(String s, Function(String) handler, int startIndex) {
  //     int i = startIndex < 0 ? 0 : startIndex;
  //     while (true) {
  //       if (i >= s.length) {
  //         break;
  //       }
  //       String c = s[i];
  //       // int b = c.codeUnitAt(0);
  //       String v = "";
  //
  //       // if (b > 128) {
  //       //   v = s.substring(i, i + 3);
  //       //   i += 3;
  //       // } else {
  //         v = c;
  //         i += 1;
  //       // }
  //
  //       handler(v);
  //     }
  //   }
  //
  //   void handler(String v) {
  //     if (chatFilter1.any((filter) => v.contains(filter))) {
  //       result += "*";
  //     } else if (int.tryParse(v) != null) {
  //       count++;
  //       if (count > 4) {
  //         result += "*";
  //       } else {
  //         result += v;
  //       }
  //     } else if (chatFilter2.contains(v)) {
  //       result += "*";
  //     } else {
  //       count = 0;
  //       result += v;
  //     }
  //   }
  //
  //   pollString(content, handler, startIndex);
  //   return result;
  // }

    // 滚动过滤
  static void pollString(String s, Function(String) handler, int startIndex) {
    var i = startIndex < 0 ? 0 : startIndex;
    var v = '';
    while (true) {
      var c = s[i];
      var b = c.codeUnitAt(0);
      // if (b > 128) {
      //   v = s.substring(i, i + 3);
      //   i += 3;
      // } else {
        v = c;
        i += 1;
      // }
      handler(v);
      if (i >= s.length) break;
    }
  }

  // 过滤聊天输入框中发送的内容,以及后台返回到app输出到面板的聊天内容
  static String filterChat(String content, {String? atText}) {
    const chatFilter1 = ['新App','新app','新 App','新 app','更好的app','新平台','新软件','新应用','新游戏','wan','WAN','玩手游',
      '折扣','福利','半价','后台','.务','。务','服。','充值送','紫钻','紫。钻','紫.钻','紫鉆','紫。鉆','人民币','RMB','刷',
      'WV','微信','微+信','微-信','微 信','微.信','徽.信','徽信','徽 信','威 信','威信','威.信','威+信','wx','wX','Wx',
      'QQ','qQ','Qq','qq','q.','Q。','q ','Q ','Q.','q。','扣扣','扣 扣','扣。扣','秋秋','秋 秋','秋.秋','秋。秋',
      '充值','充 值','充.值','@163','tel','call','电话','电.话','电。话','手机','手.机','手。机','联系','联 系','联。系',
      '@126','.com','.net','.org'];
    const chatFilter2 = '345678⒈⒉⒊⒌⒍⒎⒏⒐⑴⑵⑶⑷⑹⑺⑻⑸⑼⑥③⑦⑨④㈠㈡㈢㈣㈤㈣㈤㈦㈨叁肆伍玖柒捌五六七八九零①②❺❻❼❽❾￥¥';

    var startIndex = 0;//滚动过滤开始的下标
    var result = '';//过滤后的结果
    int count = 0;
    if (atText != null) {
      if (atText.isNotEmpty) {
        startIndex = atText.length;
        result = atText;
      }
    }
    if (startIndex < 0) {
      startIndex = 0;
    }

    // 对输入的字符串进行过滤和替换操作
    // for (var i = 0; i < chatFilter1.length; i++) {
    //   String tem = chatFilter1[i];
    //   String rep = '*' * tem.length;
    //   content = content.replaceAll(tem, rep);
    // }

    // 对输入的字符串进行过滤和替换操作
    for (String filterString in chatFilter1) {
      RegExp regex = RegExp(filterString, caseSensitive: false);
      content = content.replaceAllMapped(regex, (match) => '*' * match.group(0)!.length);
    }

    // 连续五个是过滤词则转换成*
    void handler(String v) {
      result += v;
      if (int.tryParse(v) != null || chatFilter2.contains(v)) {
        count++;
        if (count >= 5) {
          result = result.replaceRange(result.length-count, result.length, '*' * count);
        }
      } else {
        count = 0;
      }
    }

    pollString(content, handler, startIndex);

    return result;
  }

  //收到的新消息匹配规则
  // static bool receivedNewMessageMatches(V2TimMessage lastMsg, V2TimMessage newMsg) {
  //   //最新一条消息和上一条消息都是文本消息
  //   if (lastMsg.elemType == MessageElemType.V2TIM_ELEM_TYPE_TEXT && newMsg.elemType == MessageElemType.V2TIM_ELEM_TYPE_TEXT) {
  //     String text = lastMsg.textElem!.text! + newMsg.textElem!.text!;
  //     RegExp regex = RegExp(r'((\d{5,}))|(q.{1,}?\d{1,})|(\d.?\d.?\d.?\d.?\d)|(加.*?q)/gism');
  //     if (regex.hasMatch(text)) {
  //       debugPrint('Match!');
  //       return true;
  //     } else {
  //       debugPrint('No match.');
  //     }
  //   }
  //   return false;
  // }
}

class ChatTextInputFormatter extends TextInputFormatter {
  final String? atText;

  ChatTextInputFormatter.atText({this.atText,});

  static const int chatTextMaxLength = 127;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String filteredText = newValue.text;

    if (filteredText == '') {
      return newValue;
    }

    // 进行过滤和替换操作的逻辑
    filteredText = FiltrationChatText.filterChat(filteredText, atText: atText);
    // 创建新的TextEditingValue对象并返回
    return newValue.copyWith(text: filteredText);

    // //上次文本
    // String oldContent = oldValue.text;
    // //最新文本
    // String newContent = newValue.text;
    // //上次文本长度
    // int oldLength = oldContent.length;
    // //最新文本长度
    // int newLength = newContent.length;
    // //上次文本光标位置
    // int oldBaseOffset = oldValue.selection.baseOffset;
    // //最新文本光标位置
    // int newBaseOffset = newValue.selection.baseOffset;
    // //光标位置
    // int offset = newBaseOffset;
    // //输入的文本
    // String inputContent = newContent.substring(oldBaseOffset, newBaseOffset);
    //
    // if (inputContent == '') {
    //   return newValue;
    // }
    //
    // newContent = FiltrationChatText.filterChat(newContent, atText: atText);
    // if (newLength > oldLength) {
    //   offset = newContent.length;
    // } else {
    //   offset = oldContent.length;
    // }
    //
    // return newValue.copyWith(text: newContent, selection: TextSelection.collapsed(offset: offset));

    // return TextEditingValue(
    //   text: newContent,
    //   selection: TextSelection.collapsed(offset: offset),
    // );
  }
}

