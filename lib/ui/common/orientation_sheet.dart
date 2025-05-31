import 'dart:math';

import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

// import '../../store/oauth_ctrl.dart';
// import '../../store/room/room_ctrl.dart';
// import '../moment/report/moment_report_page.dart';
// import '../room/user/room_user_info_dialog.dart';


import 'package:app/net/api.dart';
import 'package:app/store/im/chat_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_ctrl.dart';

import '../moment/report/moment_report_page.dart';
class OrientationSheet extends StatelessWidget {
  final Widget sheet;
  final Decoration? decoration;
  final BoxConstraints? constraints;
 // final UID uid;
  final Color bgColor;

  const OrientationSheet._({
    required this.sheet,
    this.constraints,
    this.decoration,
   //  required this.uid,
    this.bgColor = Colors.white
  });

  static BoxConstraints get _boxConstraints {
    final width = AppSize.width;

    return BoxConstraints(
      minWidth: width,
      maxWidth: width,
      minHeight: width,
      maxHeight: Get.isLandscape ? width : max(AppSize.height * 0.5, width),
    );
  }

  Widget $ReportView() {
    return InkResponse(
      onTap: () => onItemClick('举报'),
      child: Padding(
        padding: const Pad(all: 10),
        // child: SvgView(SVG.$('common/举报')),
        child: Image.asset(IMG.format('room/举报'), scale: 3),
      ),
    );
  }

  void onItemClick(String action) async {
    final ctrl = sceneCtrl();

    switch (action) {
      case '关注':
      //   doFollow(true);
        break;
      case '已关注':
      //  doFollow(false);
        break;
      case '@TA':

        break;
      case '私聊':

        break;
      case '送礼物':
        break;
      case '举报':

        final canManage = ctrl is RoomCtrl && ctrl.getRole(OAuthCtrl.uid).isManager;

        final items = {
          '举报': () => Get.to(() => const MomentReportPage(type: 2, id: '')),
          if (canManage && !ctrl.getRole('').isManager) //
            '加入黑名单': () => ctrl.setBlock(uid:'', isAdd: true)
        };


        switch (items.length) {
          case 0:
            break;
          case 1:
            items.values.single();
            break;
          default:
            Get.showSheet(items.entries, toTitle: (it) => Tuple2(it.key, null)) //
                .onNotNull((val) => val.value());
        }

        break;
      case '下麦':

        break;
      case '上麦':

        break;

    }
  }


  static Future<T?> show<T extends Object?>({
    required Widget child,
    double? minHeight,
    BoxConstraints? constraints,
    Decoration? decoration = const ShapeDecoration(
      color: Colors.white,
      shape: XRectangleBorder(borderRadius: AppBorderRadius.t12),
    ),
    Color? barrierColor,
    bool barrierDismissible = true,
    SheetOrientation direction = SheetOrientation.bottom,
    Color bgColor = Colors.white,
    // String uid = '',
    Duration dur = const Duration(milliseconds: 200),
  }) {
    final sheet = OrientationSheet._(
      bgColor: bgColor,
      // uid: uid,
      constraints: constraints ?? (minHeight?.let((it) => _boxConstraints.copyWith(minHeight: it)) ?? _boxConstraints),
      decoration: decoration,
      sheet: child,
    );

    final AlignmentGeometry alignment;
    final Tween<Offset> offsetTween;

    switch (direction) {
      case SheetOrientation.left:
        alignment = Alignment.centerLeft;
        offsetTween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        break;
      case SheetOrientation.right:
        alignment = Alignment.centerRight;
        offsetTween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        break;
      case SheetOrientation.bottom:
        alignment = Alignment.bottomCenter;
        offsetTween = Tween(begin: const Offset(0, 1), end: Offset.zero);
        break;
    }


    final route = RawDialogRoute<T>(
      settings: child.toRouteSettings(),
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      pageBuilder: (_, __, ___) => sheet,
      transitionDuration: dur,
      transitionBuilder: (_, animation, __, child) {
        return Align(
          alignment: alignment,
          child: FractionalTranslation(
            translation: offsetTween.evaluate(animation),
            child: AbsorbPointer(
              absorbing: !animation.isCompleted,
              child: child,
            ),
          ),
        );
      },
    );

    return Get.push<T>(route).then((val) => Future.delayed(dur, () => val));
  }

  @override
  Widget build(BuildContext context) {
    Widget child = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeLeft: true,
      removeRight: true,
      removeBottom: true,
      child: sheet,
    );

    child = Material(
      color: bgColor,
      type: MaterialType.transparency,
      clipBehavior: Clip.none,
      child: child,
    );

    if (decoration != null) {
      child = DecoratedBox(decoration: decoration!, child: child);
    }

    if (constraints != null) {
      child = ConstrainedBox(constraints: constraints!, child: child);
    }

    return child;
  }



  static Widget scaffold({required String title, required Widget body, TextStyle? textStyle, Widget? titleWidget, bool needDivider = true}) {
    Widget child = titleWidget ?? DefaultTextStyle(
      style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$Medium),
      child: XText(title, style: textStyle),
    );

    child = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
          // Row(
          //   children: [
              Box(
                height: 42,
                alignment: Alignment.center,
                child: child,
              ),
          //
          //     $ReportView()
          //   ],
          // ),

        if(needDivider)
          const Divider(indent: 10, endIndent: 10, color: Color(0x80CCCCCC)),
        Flexible(child: body),
      ],
    );

    return child;
  }
}


enum SheetOrientation {
  left,
  right,
  bottom,
  ;
}

class SheetController {}
