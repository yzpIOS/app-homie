import 'dart:math';

import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:chinese_font_library/chinese_font_library.dart';
import 'package:flutter/material.dart';

ThemeData get $theme => _default();

ThemeData _default() {
  final px1 = AppSize.px1;

  final dividerTheme = DividerThemeData(
    space: px1,
    thickness: px1,
    color: AppPalette.divider,
  );

  const tabBarTheme = TabBarTheme(
    dividerColor: Colors.transparent,
    //
    indicatorSize: TabBarIndicatorSize.tab,
    indicator: UnderlineTabIndicator(
      borderRadius: AppBorderRadius.a2,
      borderSide: BorderSide(width: 2, color: AppPalette.primary),
    ),
    //
    labelColor: AppPalette.primary,
    unselectedLabelColor: AppPalette.c3,
    //
    labelStyle: TextStyle(fontSize: 16, fontWeight: fw$SemiBold),
    unselectedLabelStyle: TextStyle(fontSize: 16, fontWeight: fw$Regular),
  );

  const appBarTheme = AppBarTheme(
    foregroundColor: AppPalette.appBarForegroundColorLight,
    backgroundColor: AppPalette.background,
    surfaceTintColor: Colors.transparent,
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 0,
    toolbarHeight: AppSize.appBar,
    toolbarTextStyle: TextStyle(fontSize: 18),
    titleTextStyle: TextStyle(fontSize: 18, color: AppPalette.appBarForegroundColorLight, fontWeight: fw$SemiBold),
  );

  const cardTheme = CardTheme(
    elevation: 0,
    margin: Pad.zero,
    clipBehavior: Clip.hardEdge,
    surfaceTintColor: Colors.transparent,
    shape: AppShape.a12,
  );

  const bottomSheetTheme = BottomSheetThemeData(
    surfaceTintColor: Colors.transparent,
    shape: XRectangleBorder(borderRadius: AppBorderRadius.t16),
  );

  const timePickerTheme = TimePickerThemeData(
    backgroundColor: Colors.red,
    shape: XRectangleBorder(borderRadius: AppBorderRadius.t16),
  );

  ThemeData theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppPalette.primary,
      background: AppPalette.background,
    ),
    hintColor: AppPalette.hint,
    splashColor: AppPalette.primary.withOpacity(0.20 / 2),
    highlightColor: AppPalette.primary.withOpacity(0.15 / 2),
    scaffoldBackgroundColor: AppPalette.background,
    cardTheme: cardTheme,
    tabBarTheme: tabBarTheme,
    appBarTheme: appBarTheme,
    dividerTheme: dividerTheme,
    bottomSheetTheme: bottomSheetTheme,
    timePickerTheme: timePickerTheme,
    platform: TargetPlatform.android,
  );

  theme = theme.useSystemChineseFont();

  return theme;
}

const fw$Regular = FontWeight.w400;
const fw$Medium = FontWeight.w500;
const fw$SemiBold = FontWeight.w600;
const fw$Bold = FontWeight.w700;

abstract class AppPalette {
  //App
  static const primary = Color(0xFFBD7CE5);
  static const newMain = Color(0xFFC979FB);
  static const hint = c9;
  static const tips = Color(0xFF979797);
  static const divider = Color(0x80CCCCCC);
  static const background = Colors.white;
  static const background2 = Color(0xFFF5F5F5);
  static const primaryRed = Color(0xFFFF2C67);


  static const room = Color(0x4D000000);
  static const colorY = Color(0xFFFFDD7A);
  static const colorEB = Color(0xFFEBEBFF);
  static const colorB5 = Color(0xFFB5B5B5);
  static const colorYZ = Color(0xFFFFA00B);

  static const appBarForegroundColorLight = Colors.black;
  static const appBarForegroundColorDark = Colors.white;

  //Txt
  static const txtDark = Colors.black;
  static const txtWhite = Colors.white;

  //
  static const c3 = Color(0xFF333333);
  static const c6 = Color(0xFF666666);
  static const c9 = Color(0xFF999999);
  static const color71 = Color(0xFF717171);
  static const colorA9 = Color(0xFFA9A9A9);
  static const colorA7 = Color(0xFFA7A7A7);
  static const cc = Color(0xFFCCCCCC);
  static const barrier = Color(0x80000000);
  static const transparent = Color(0x00000001);

  static const sheetWhite = Colors.white;
  static const sheetDark = Colors.black;

  static Color get random {
    final r = Random.secure();

    return Color.fromARGB(0xFF, r.nextInt(0xFF), r.nextInt(0xFF), r.nextInt(0xFF));
  }
}

abstract class AppSize {
  static const _target = 375;

  static const appBar = 48.0;
  static const safeAreaMini = Pad(bottom: 24);

  static const btnLarge = 44.0;
  static const btnTiny = 24.0;
  static const editLarge = 40.0;

  //<editor-fold desc="MediaQuery">
  static MediaQueryData _mq = () {
    final dispatcher = WidgetsBinding.instance.platformDispatcher;
    final window = dispatcher.implicitView!;

    dispatcher.addMetricsChangedListener(
      onMetricsChanged: () => _mq = MediaQueryData.fromView(window),
    );

    return MediaQueryData.fromView(window);
  }();

  static double get pixelRatio => _mq.devicePixelRatio;

  static double get px1 => 1 / pixelRatio;

  static double get safeTop => _mq.viewPadding.top;

  static double get safeBottom => _mq.viewPadding.bottom;

  static Size get size => _mq.size;

  static double get width => size.width;

  static double get height => size.height;

  static double get scaleW => width / _target;
//</editor-fold>
}

abstract class AppRadius {
  static const _smooth = 0.5;

  static const r2 = XRadius(cornerRadius: 02, cornerSmoothing: _smooth);
  static const r3 = XRadius(cornerRadius: 03, cornerSmoothing: _smooth);
  static const r4 = XRadius(cornerRadius: 04, cornerSmoothing: _smooth);
  static const r6 = XRadius(cornerRadius: 06, cornerSmoothing: _smooth);
  static const r8 = XRadius(cornerRadius: 08, cornerSmoothing: _smooth);
  static const r10 = XRadius(cornerRadius: 10, cornerSmoothing: _smooth);
  static const r12 = XRadius(cornerRadius: 12, cornerSmoothing: _smooth);
  static const r14 = XRadius(cornerRadius: 14, cornerSmoothing: _smooth);
  static const r16 = XRadius(cornerRadius: 16, cornerSmoothing: _smooth);
  static const r20 = XRadius(cornerRadius: 20, cornerSmoothing: _smooth);
  static const max = XRadius(cornerRadius: 999, cornerSmoothing: _smooth);
}

abstract class AppBorderRadius {
  static const a2 = XBorderRadius.all(AppRadius.r2);
  static const a3 = XBorderRadius.all(AppRadius.r3);
  static const a4 = XBorderRadius.all(AppRadius.r4);
  static const a6 = XBorderRadius.all(AppRadius.r6);
  static const a8 = XBorderRadius.all(AppRadius.r8);
  static const a10 = XBorderRadius.all(AppRadius.r10);
  static const a12 = XBorderRadius.all(AppRadius.r12);
  static const a14 = XBorderRadius.all(AppRadius.r14);
  static const a16 = XBorderRadius.all(AppRadius.r16);
  static const a20 = XBorderRadius.all(AppRadius.r20);
  static const max = XBorderRadius.all(AppRadius.max);

  static const t8 = XBorderRadius.vertical(top: AppRadius.r8);
  static const t10 = XBorderRadius.vertical(top: AppRadius.r10);
  static const t12 = XBorderRadius.vertical(top: AppRadius.r12);
  static const t16 = XBorderRadius.vertical(top: AppRadius.r16);

  static const l6 = XBorderRadius.horizontal(left: AppRadius.r6);
  static const l10 = XBorderRadius.horizontal(left: AppRadius.r10);

  static const r6 = XBorderRadius.horizontal(right: AppRadius.r6);

  static const b8 = XBorderRadius.vertical(bottom: AppRadius.r8);
  static const b10 = XBorderRadius.vertical(bottom: AppRadius.r10);
}

abstract class AppShape {
  static const a2 = XRectangleBorder(borderRadius: AppBorderRadius.a2);
  static const a3 = XRectangleBorder(borderRadius: AppBorderRadius.a3);
  static const a4 = XRectangleBorder(borderRadius: AppBorderRadius.a4);
  static const a6 = XRectangleBorder(borderRadius: AppBorderRadius.a6);
  static const a8 = XRectangleBorder(borderRadius: AppBorderRadius.a8);
  static const a10 = XRectangleBorder(borderRadius: AppBorderRadius.a10);
  static const a12 = XRectangleBorder(borderRadius: AppBorderRadius.a12);
  static const a14 = XRectangleBorder(borderRadius: AppBorderRadius.a14);
  static const a16 = XRectangleBorder(borderRadius: AppBorderRadius.a16);
  static const a20 = XRectangleBorder(borderRadius: AppBorderRadius.a20);
  static const max = XRectangleBorder(borderRadius: AppBorderRadius.max);
}
