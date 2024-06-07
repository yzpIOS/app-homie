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
    return
      Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 60,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
            ),

            Positioned(
              top: -40,
              left: 10,
              // right: 10,
              child: CircularProfileImage(
                imageUrl: data['image'], // 替换为你的图片URL
                size: 81.0,
                borderWidth: 1.0, // 1厘米边框（根据实际DPI调整）
                borderColor: Colors.white,
              ),

            ),

            Positioned(
                top: 10,
                left: 100,
                child:  topViewWidget()
            ),

            Positioned(
                top: 0,
                right: 10,
                child:$ReportView()
            ),
            // const Positioned(
            //   top: -50, // 偏移量的一半，假设头像大小是100
            //   left: 10,
            //   child: CircleAvatar(
            //     radius: 50, // 头像的半径
            //     backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            //   ),
            // ),


          ],
        ),
        // 其他内容，可以在这里添加更多的部件
        divider,

        // $Body()

        Stack(
          children: [
            Expanded(
                // flex: 1,
                child: Container(
                  height: 300,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      const Text('房间详情',  style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text('【房间公告】'),
                            alignment: Alignment.centerLeft,
                          ),
                          if(controller.isOwner(OAuthCtrl.uid)) Container(
                            child: GestureDetector(
                              onTap: () {
                                controller.clickEditNotice();
                              },
                              child: Image.asset(IMG.format('room/room_info_notice_edit'),
                                  width: 18, height: 18, scale: 3),
                            ),
                          ),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          child:  SingleChildScrollView(
                            padding: const Pad(horizontal: 10),
                            child: Text(
                              notice.isEmpty ? '目前暂无公告。' : notice,
                              style: const TextStyle(fontSize: 12, color: AppPalette.cc,),
                              textAlign: TextAlign.left,
                            ),
                          )
                      ),


                    ],
                  ),
                )),
            Positioned(
                bottom: MediaQuery.of(context).padding.bottom + 20,
                left: 80,
                right: 80,
                child: $Btn(action: '分享房间')
            ),


          ],
        )

      ],
    );

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
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Optional: Align the Column itself
          crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start of the Column
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
           //   crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Text(
                   data['room_name'],
                  style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppPalette.colorEB,
                    borderRadius: AppBorderRadius.a10,
                  ),
                  child:  SelectableText(
                    'ID:${data['room_no'] ?? data['room_id']}',
                    style: const TextStyle(fontSize: 12, color: AppPalette.colorA7),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
          //    crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Text(
                   data['collect_num'] >= 10000 ?
                   '${(data['collect_num'] / 10000).toStringAsFixed(1)}W 粉丝' :
                   '${convert(
                       data['collect_num'])} 粉丝',
                 // '${data['collect_num']}',
                  style: const TextStyle(color: AppPalette.colorA7),
                     textAlign: TextAlign.left,
                ),


                const SizedBox(
                  width: 10,
                ),

                Container(
                  width: 1,
                  height: 10,
                  color: AppPalette.colorA7,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  data['like_num'] >= 10000 ?
                  '${(data['like_num'] / 10000).toStringAsFixed(1)}W 赞' :
                  '${convert(
                      data['like_num'])} 赞',
                  // '${data['collect_num']}',
                  style: const TextStyle(color: AppPalette.colorA7,),
                ),
              ],
            )
          ],
        ));
  }

  String convert(int value) {
    return value.toString();
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
      child: Obx(() {
        return Text(
          controller.noticeRx.isEmpty ? '目前暂无公告。' : controller.noticeRx.value,
          style: const TextStyle(fontSize: 12, color: AppPalette.cc),
        );
      }),
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
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
            if(controller.isOwner(OAuthCtrl.uid)) WidgetSpan(
            child: GestureDetector(
              onTap: () {
                controller.clickEditNotice();
              },
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
    Widget child = Container(

      decoration: BoxDecoration(
        color: AppPalette.primary,
        // color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        //  border: Border.all(color: AppPalette.primary),
      ),
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

    // child = Container(
    //   decoration: BoxDecoration(
    //     // color: Colors.white,
    //     borderRadius: BorderRadius.circular(17),
    //   //  border: Border.all(color: AppPalette.primary),
    //   ),
    //   // const ShapeDecoration(
    //   //   shape: XStadiumBorder(side: BorderSide(color: AppPalette.primary)),
    //   // ),
    //   child: child,
    // );



    // child = OpacityButton(
    //   onTap: () => onItemClick(action),
    //   child: child,
    // );
    child = GestureDetector(
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
        simpleSub(
          Api.Activity.finishRoomShare(),
          callback: () {

          },
        );
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
            ctrl is RoomCtrl && ctrl
                .getRole(OAuthCtrl.uid)
                .isManager;

        final items = {
          '举报': () =>
              Get.to(() => MomentReportPage(type: 2, id: data['uid'])),
          if (canManage && !ctrl
              .getRole(data['uid'])
              .isManager) //
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

class CircularProfileImage extends StatelessWidget {
  final String imageUrl;
  final double size;
  final double borderWidth;
  final Color borderColor;

  CircularProfileImage({
    required this.imageUrl,
    required this.size,
    required this.borderWidth,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: ClipOval(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          width: size - borderWidth * 2,
          height: size - borderWidth * 2,
        ),
      ),
    );
  }
}