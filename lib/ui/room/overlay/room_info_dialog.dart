import 'package:app/common/theme.dart';
import 'package:app/common/utils/route_utils.dart';
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

import '../../moment/report/moment_report_page.dart';

class RoomInfoDialog extends RoomGetView<RoomCtrl> {
  const RoomInfoDialog._();

  static void show() {
    const decor = ShapeDecoration(
      shape: XRectangleBorder(borderRadius: AppBorderRadius.t12),
      color: Color(0xCC333333),
      //  color: Colors.white,
    );

    OrientationSheet.show(
      child: RoomInfoDialog._(),
      decoration: decor,
      direction:
          Get.isLandscape ? SheetOrientation.left : SheetOrientation.bottom,
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = controller.info;
    final notice = controller.noticeRx();
    const divider = Divider(height: 5, thickness: 5, color: AppPalette.colorEB);
// <<<<<<< HEAD
//     return
//     //   Column(
//     //   mainAxisSize: MainAxisSize.min,
//     //   mainAxisAlignment: MainAxisAlignment.start,
//     //   children: [
//     //     Stack(
//     //       clipBehavior: Clip.none,
//     //       alignment: Alignment.centerLeft,
//     //       children: [
//     //         Container(
//     //           height: 60,
//     //           color: Colors.white,
//     //           // child: const Center(
//     //           //   child: Text(
//     //           //     'This is a bottom sheet',
//     //           //     style: TextStyle(fontSize: 20),
//     //           //   ),
//     //           // ),
//     //         ),
//     //
//     //         Positioned(
//     //           top: -30,
//     //           left: 10,
//     //           // right: 10,
//     //           child: ClipRRect(
//     //             borderRadius: AppBorderRadius.a10,
//     //             child: NetImage(data['image'], width: 60, height: 60),
//     //           ),
//     //
//     //         ),
//     //
//     //         Positioned(
//     //             top: 10,
//     //             left: 80,
//     //             child:  topViewWidget()
//     //         ),
//     //
//     //         Positioned(
//     //             top: 0,
//     //             right: 10,
//     //             child:$ReportView()
//     //         ),
//     //         // const Positioned(
//     //         //   top: -50, // 偏移量的一半，假设头像大小是100
//     //         //   left: 10,
//     //         //   child: CircleAvatar(
//     //         //     radius: 50, // 头像的半径
//     //         //     backgroundImage: NetworkImage('https://via.placeholder.com/150'),
//     //         //   ),
//     //         // ),
//     //       ],
//     //     ),
//     //     // 其他内容，可以在这里添加更多的部件
//     //     divider,
//     //     Text('房间详情'),
//     //     // $Body()
//     //    Container(
//     //      margin: EdgeInsets.only(left: 10),
//     //      child: Text('【房间公告】'),
//     //      alignment: Alignment.centerLeft,
//     //    ),
//     // Container(
//     //     margin: EdgeInsets.only(left: 10),
//     //     alignment: Alignment.centerLeft,
//     //   child:  SingleChildScrollView(
//     //     padding: const Pad(horizontal: 10),
//     //     child: Text(
//     //       notice.isEmpty ? '目前暂无公告。' : notice,
//     //       style: const TextStyle(fontSize: 12, color: AppPalette.cc,),
//     //       textAlign: TextAlign.left,
//     //     ),
//     //   )
//     // )
//     //
//     //
//     //   ],
//     // );
// =======
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Stack(
//           clipBehavior: Clip.none,
//           alignment: Alignment.centerLeft,
//           children: [
//             Container(
//               height: 60,
//               color: Colors.white,
//               // child: const Center(
//               //   child: Text(
//               //     'This is a bottom sheet',
//               //     style: TextStyle(fontSize: 20),
//               //   ),
//               // ),
//             ),

//             Positioned(
//               top: -30,
//               left: 10,
//               // right: 10,
//               child: ClipRRect(
//                 borderRadius: AppBorderRadius.a10,
//                 child: NetImage(data['image'], width: 60, height: 60),
//               ),

//             ),

//             Positioned(
//                 top: 10,
//                 left: 80,
//                 child:  topViewWidget()
//             ),

//             Positioned(
//                 top: 0,
//                 right: 10,
//                 child:$ReportView()
//             ),
//             // const Positioned(
//             //   top: -50, // 偏移量的一半，假设头像大小是100
//             //   left: 10,
//             //   child: CircleAvatar(
//             //     radius: 50, // 头像的半径
//             //     backgroundImage: NetworkImage('https://via.placeholder.com/150'),
//             //   ),
//             // ),
//           ],
//         ),
//         // 其他内容，可以在这里添加更多的部件
//         divider,
//         Text('房间详情'),
//         // $Body()
//        Container(
//          margin: EdgeInsets.only(left: 10),
//          child: Text('【房间公告】'),
//          alignment: Alignment.centerLeft,
//        ),

//     Container(
//         margin: EdgeInsets.only(left: 10),
//         alignment: Alignment.centerLeft,
//       child:  SingleChildScrollView(
//         padding: const Pad(horizontal: 10),
//         child: Text(
//           notice.isEmpty ? '目前暂无公告。' : notice,
//           style: const TextStyle(fontSize: 12, color: AppPalette.cc,),
//           textAlign: TextAlign.left,
//         ),
//       )
//     ),

//    // Row(
//    //  mainAxisAlignment: MainAxisAlignment.center,
//    //  children: [
//       Positioned(
//           bottom: 20,
//           child: $Btn(action: '分享房间'),)
//     // Obx(() => $Btn(action: controller.followRx() ? '已关注' : '关注房间')),
//     // ],
//     // )

//       ],
//     );
// >>>>>>> 1.6.0_1
    return titleWidget();
  }

  Widget titleWidget() {
    const divider = Divider(height: 5, thickness: 5, color: AppPalette.colorEB);
    final data = controller.info;
    final notice = controller.noticeRx();
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        OrientationSheet.scaffold(
          title: '房间详情',
          textStyle: const TextStyle(color: Colors.white),
          body: $Body(),
        ),
        // Positioned(
        //   top: -30,
        //   left: 10,
        //   // right: 10,
        //   child: ClipRRect(
        //     borderRadius: AppBorderRadius.a10,
        //     child: NetImage(data['image'], width: 60, height: 60),
        //   ),
        //
        // ),

        // Positioned(
        //     top: 10,
        //     left: 80,
        //     child:  topViewWidget()
        // ),
        //
        Positioned(top: 0, right: 10, child: $ReportView()),

        // const Positioned(
        //    top: 50,
        //    child: divider),
      ],
    );
  }

  Widget topViewWidget() {
    final data = controller.info;
    final notice = controller.noticeRx();
    return Container(
        child: Column(
      children: [
        Row(
          children: [
            const Text(
              '恋爱告急',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 10,
            ),
            SelectableText(
              'ID:${data['room_no'] ?? data['room_id']}',
              style: const TextStyle(fontSize: 12, color: AppPalette.cc),
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              '恋爱告急',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 10,
            ),
            SelectableText(
              'ID:${data['room_no'] ?? data['room_id']}',
              style: const TextStyle(fontSize: 12, color: AppPalette.cc),
            ),
          ],
        )
      ],
    ));
  }

  // Widget topView() {
  //
  //   return
  // }

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
        XRichText(TextSpan(children: [
          const TextSpan(
            text: "【房间公告】",
            style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.white),
          ),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(IMG.format('room/room_info_notice_edit'),
                  width: 18, height: 18, scale: 3),
            ),
          ),
        ],),),
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
            style: const TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: fw$Medium),
          ),
        ],
      ),
    );

    child = DecoratedBox(
      decoration: const ShapeDecoration(
        shape: XStadiumBorder(side: BorderSide(color: AppPalette.primary)),
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
    final ctrl = sceneCtrl();
    final data = controller.info;
    switch (action) {
      case '分享房间':
        Share.share(RouteUtil.generateShareRoom(controller.roomId),
            subject: '房间分享');
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

      case '举报':
        final canManage =
            ctrl is RoomCtrl && ctrl.getRole(OAuthCtrl.uid).isManager;

        final items = {
          '举报': () => Get.to(() => MomentReportPage(type: 2, id: data['uid'])),
          if (canManage && !ctrl.getRole(data['uid']).isManager) //
            '加入黑名单': () => ctrl.setBlock(uid: data['uid'], isAdd: true)
        };

        switch (items.length) {
          case 0:
            break;
          case 1:
            items.values.single();
            break;
          default:
            Get.showSheet(items.entries,
                    toTitle: (it) => Tuple2(it.key, null)) //
                .onNotNull((val) => val.value());
        }

        break;
    }
  }
}
