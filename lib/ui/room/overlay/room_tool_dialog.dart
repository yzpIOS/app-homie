import 'package:app/common/theme.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/ui/room/overlay/scene_overlay.dart';

class RoomToolDialog extends SceneOverlay<RoomCtrl> {
  RoomToolDialog._();

  static Future<String?> show() {
    const decor = ShapeDecoration(
      shape: XRectangleBorder(borderRadius: AppBorderRadius.t12),
      color: Color(0xCC333333),
    );

    return OrientationSheet.show<String>(
      child: RoomToolDialog._(),
      minHeight: 0,
      decoration: decor,
      direction: Get.isLandscape ? SheetOrientation.right : SheetOrientation.bottom,
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationSheet.scaffold(
      title: '工具',
      textStyle: const TextStyle(color: Colors.white),
      body: $BodyView(),
    );
  }

  Widget $BodyView() {
    final myRole = controller.getRole(OAuthCtrl.uid);

    final isOwner = myRole.isOwner;
    final isManager = myRole.isManager;

    final items = [
      if (isOwner) '管理员',
      if(isOwner) '下麦',
      if (isManager) ...[
        '黑名单',
        '清零',
      ],
      if (Env.isDebug) '切换横竖屏',
      // '自拍',
      '意见反馈',
    ];

    return SizedBox(
      height: 260,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        gridDelegate: const XGridDelegate(crossAxisCount: 4),
        itemBuilder: (_, i) => itemBuilder(items[i]),
      ),
    );
  }

  Widget itemBuilder(String item) {
    Widget child = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgView(SVG.$('room/setting/$item'), width: 34, height: 34),
        Spacing.h2,
        XText(
          item,
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
      ],
    );

    child = OpacityButton(
      onTap: () => Get.back(result: item),
      child: child,
    );

    return child;
  }
}
