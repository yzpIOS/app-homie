import 'package:app/common/theme.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
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
      color: Colors.white
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
      textStyle: const TextStyle(color: Colors.black),
      body: $BodyView(),
      titleWidget: createTitle(),
    );
  }

  Widget $BodyView() {
    final myRole = controller.getRole(OAuthCtrl.uid);

    final isOwner = myRole.isOwner;
    final isManager = myRole.isManager;

    final items = [
      // 房主或管理员，且不在pk中，才显示发起挑战入口
      // if ((isOwner || isManager) && !Get.find<RoomManagerCtrl>().sceneCtrl.isInPKRoom()) '发起挑战',
      if (isOwner) '管理员',
      if(isOwner || isManager) '下麦',
      if (isManager) ...[
        '黑名单',
        '清零',
      ],
      if(isOwner || isManager) '全员禁麦',
      // if (Env.isDebug) '切换横竖屏',
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
        Image.asset(IMG.format('room/$item'), width: 34, height: 34, fit: BoxFit.contain, scale: 3),
        Spacing.h2,
        XText(
          item,
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
      ],
    );

    child = OpacityButton(
      onTap: () => Get.back(result: item),
      child: child,
    );

    return child;
  }

  Widget createTitle() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 24,),
        const Expanded(
          child: Center(
            child: DefaultTextStyle(
              style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$Medium),
              child: XText("工具", style: TextStyle(color: Colors.black),),
            ),
          ),
        ),
        Image.asset(IMG.format("close"), width: 14, height: 14,),
        SizedBox(width: 10,),
      ],
    );
  }
}
