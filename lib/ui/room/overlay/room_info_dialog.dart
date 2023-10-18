import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/ui/debug/room_debug_view.dart';
import 'package:app/ui/room/widgets/room_get_widget.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class RoomInfoDialog extends RoomGetView<RoomCtrl> {
  const RoomInfoDialog._();

  static void show() {
    // 打开调试面版
    if(isDebugOpen(LogType.SOCKET)) {
      Future.delayed(const Duration(seconds: 3)).whenComplete(() {
        Get.to(() => RoomDebugView());
      });
      return;
    }

    const decor = ShapeDecoration(
      shape: XRectangleBorder(borderRadius: AppBorderRadius.t12),
      color: Color(0xCC333333),
    );

    OrientationSheet.show(
      child: const RoomInfoDialog._(),
      decoration: decor,
      direction: Get.isLandscape ? SheetOrientation.left : SheetOrientation.bottom,
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationSheet.scaffold(
      title: '房间详情',
      textStyle: const TextStyle(color: Colors.white),
      body: $Body(),
    );
  }

  Widget $Body() {
    final data = controller.info;
    final notice = controller.noticeRx();

    final headerView = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: AppBorderRadius.a10,
          child: NetImage(data['image'], width: 60, height: 60),
        ),
        Spacing.w10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacing.h4,
            XText(
              data['room_name'],
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
            Spacing.h12,
            SelectableText(
              'ID:${data['room_no'] ?? data['room_id']}',
              style: const TextStyle(fontSize: 12, color: AppPalette.cc),
            ),
          ],
        ),
      ],
    );

    final noticeView = SingleChildScrollView(
      padding: const Pad(horizontal: 10),
      child: Text(
        notice.isEmpty ? '目前暂无公告。' : notice,
        style: const TextStyle(fontSize: 12, color: AppPalette.cc),
      ),
    );

    final actionView = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        $Btn(action: '分享房间'),
        Obx(() => $Btn(action: controller.followRx() ? '已关注' : '关注房间')),
      ],
    );

    Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacing.h20,
        headerView,
        Spacing.h16,
        const Text(
          '【房间公告】',
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        Spacing.h4,
        Expanded(child: noticeView),
        Spacing.h4,
        actionView,
      ],
    );

    child = Padding(
      padding: Pad(horizontal: 10, bottom: 20 + AppSize.safeBottom),
      child: child,
    );

    return child;
  }

  Widget $Btn({required String action}) {
    Widget child = Box(
      width: 120.adaptW,
      height: 34,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgView(SVG.$('room/$action'), width: 26, height: 26),
          Text(
            action,
            style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: fw$Medium),
          ),
        ],
      ),
    );

    child = DecoratedBox(
      decoration: const ShapeDecoration(
        shape: XStadiumBorder(side: BorderSide(color: Colors.white)),
      ),
      child: child,
    );

    child = OpacityButton(
      onTap: () => onItemClick(action),
      child: child,
    );

    return child;
  }

  void onItemClick(String action) {
    switch (action) {
      case '分享房间':
        Share.share('http://app.web.homieyy.com/?channelCode=1&invite_uid=${OAuthCtrl.uid}', subject: '房间分享');
        break;
      case '已关注':
      case '关注房间':
        final b = action == '关注房间';

        simpleSub(
          Api.Room.follow(roomId: controller.roomId, doFollow: b),
          callback: () {
            controller.followRx(b);
          },
        );
        break;
    }
  }
}
