import 'package:app/3rd/tencent/rtc.dart';
import 'package:app/common/theme.dart';
import 'package:app/model/enum/person_mic_status.dart';
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
      body: Obx(() {
        return $BodyView(Rtc.status.value == PersonMicStatus.disable.val);
      }),
      titleWidget: createTitle(),
    );
  }

  Widget $BodyView(bool disable) {
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
      if((isOwner || isManager) && !disable && controller is PersonRoomCtrl) '全员闭麦',
      if((isOwner || isManager) && disable && controller is PersonRoomCtrl) '全员开麦',
      if((isOwner) && controller is PersonRoomCtrl) '下播',
      // if (Env.isDebug) '切换横竖屏',
      // '自拍',
      '意见反馈',
      '礼物特效',
    ];

    return SizedBox(
      height: 260,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        gridDelegate: const XGridDelegate(crossAxisCount: 4, childAspectRatio: 1),
        itemBuilder: (_, i) => itemBuilder(items[i]),
      ),
    );
  }

  Widget itemBuilder(String item) {
    String imageValue = item;
    if(item == "礼物特效") {
      if(RoomManagerCtrl.ins.effectClose.value == false) {
        imageValue = '关闭特效';
      } else {
        imageValue = '打开特效';
      }
    }
    Widget child = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(child: SizedBox()),
        Image.asset(IMG.format('room/$imageValue'), width: 34, height: 34, fit: BoxFit.contain, scale: 3),
        Spacing.h2,
        XText(
          item,
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
        Expanded(child: SizedBox()),
      ],
    );

    child = OpacityButton(
      onTap: () {
        Get.back(result: imageValue);
      },
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
        GestureDetector(
          onTap: () {
            Get.back();
          },
          behavior: HitTestBehavior.opaque,
          child: Image.asset(IMG.format("close"), width: 24, height: 24,),
        ),
        SizedBox(width: 10,),
      ],
    );
  }
}
