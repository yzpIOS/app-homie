import 'package:app/3rd/tencent/rtc.dart';
import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/common/theme.dart';
import 'package:app/model/enum/person_mic_status.dart';
import 'package:app/model/enum/room_state.dart';
import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/room/room_mic_ctrl.dart';
import 'package:app/store/room/scene_mic_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/activity/act_main_dialog.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/ui/gift/gift_send_logic.dart';
import 'package:app/ui/gift/gift_sheet.dart';
import 'package:app/ui/my/feedback_page.dart';
import 'package:app/ui/room/chat/room_msg_view.dart';
import 'package:app/ui/room/game/turntable/turntable_page.dart';
import 'package:app/ui/room/overlay/mic_panel_switcher.dart';
import 'package:app/ui/room/overlay/notice_overlay.dart';
import 'package:app/ui/room/overlay/room_info_dialog.dart';
import 'package:app/ui/room/overlay/room_tool_dialog.dart';
import 'package:app/ui/room/overlay/scene_overlay.dart';
import 'package:app/ui/room/overlay/scene_overlay_bottom_bar.dart';
import 'package:app/ui/room/persion/common_dialog.dart';
import 'package:app/ui/room/persion/person_room_mic_ctrl.dart';
import 'package:app/ui/room/user/mic_user_charm_manager_sheet.dart';
import 'package:app/ui/room/user/challenge_user_view.dart';
import 'package:app/ui/room/user/mic_user_view_2.dart';
import 'package:app/ui/room/user/online_user_view.dart';
import 'package:app/ui/room/user/room_admin_page.dart';
import 'package:app/ui/room/user/room_block_page.dart';
import 'package:app/ui/room/widgets/icon_button_svg.dart';
import 'package:app/ui/room/widgets/portal_modal.dart';
import 'package:app/ui/room/widgets/room_get_widget.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:quiver/collection.dart';
import 'package:fixnum/fixnum.dart';
import 'package:app/common/nets/commons/proto/Common.pb.dart' as Common;

import '../user/room_user_info_dialog.dart';

class RoomOverlay extends SceneOverlay<RoomCtrl> {
  RoomOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape = context.watch<Orientation>() == Orientation.landscape;
    ValueNotifier<double> _changedValue = ValueNotifier<double>(AppSize.height - AppSize.safeBottom - 127 - 100);

    return Obx(
      () {
        final showMic = controller.micPanelRx();
        final freeMic = controller.freeMicRx();

        final showMicPanel = controller.maxMic > 0 && freeMic;

        //公会房且不在pk中，才显示麦位
        final topMicMode = (controller.roomType == RoomType.guild && !Get.find<RoomManagerCtrl>().sceneCtrl.isInPKRoom());
        final sideMicMode = controller.roomType == RoomType.customize;

        return Stack(
          alignment: Alignment.center,
          children: [
            // 聊天消息视图
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: controller.chatMsgViewIsShowRx() ? const RoomChatView() : Spacing.blank,
            ),
            // 横屏右侧视图
            if (showMicPanel && (sideMicMode || isLandscape))
              Positioned(
                right: 0,
                child: Animate(
                  effects: rightEffect,
                  child: const _RoomRight(),
                ),
              ),
            if (controller.bottomBarIsShowRx())
              Positioned(
                bottom: (AppSize.safeBottom > 0 ? AppSize.safeBottom : 15) + 20,
                // height: 50,
                width: AppSize.width - 10,
                left: 5,
                child: Box(
                  child: Animate(
                    effects: bottomEffect,
                    child: SceneOverlayBottomBar<RoomCtrl>(onItemClick: onItemClick),
                  ),
                ),
              ),

            // 抽奖入口
            if(controller.entry.isNotEmpty)
              Positioned(
                right: 10,
                height: 80,
                width: 80,
                bottom: 143,
                child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          TurntablePage.showDialog(controller.entry.toList()[index]);
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Image.network(controller.entry.toList()[index]["image"], width: 80, height: 80,),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 10, width: 10,);
                    },
                    itemCount: controller.entry.length
                ),
              )
            // Positioned(
            //   top: 0,
            //   left: 0,
            //   right: 0,
            //   child: CommonRoomHeader(
            //     showMicPanel: showMicPanel && topMicMode,
            //     showMic: showMic,
            //     isLandscape: isLandscape,
            //     onItemClick: onItemClick,
            //   ),
            // ),
            // if (!isLandscape)
            //   ValueListenableBuilder(
            //     valueListenable: _changedValue,
            //     builder: (BuildContext context, double value, Widget? child) {
            //       return Positioned(
            //         top: value,
            //         right: 10,
            //         child: GestureDetector(
            //           child: InkWell(
            //             onTap: () => onItemClick('装扮抽奖入口'),
            //             child: Image.asset(IMG.format('shop/装扮抽奖入口'), scale: 3),
            //           ),
            //           onPanUpdate: (DragUpdateDetails details) {
            //             double top = value + details.delta.dy;
            //             if (top < AppSize.safeTop) top = AppSize.safeTop;
            //             if (top > AppSize.height - AppSize.safeBottom - 127 - 100) top = AppSize.height - AppSize.safeBottom - 127 - 100;
            //             _changedValue.value = top;
            //           },
            //         ),
            //       );
            //     }
            //   ),
          ],
        );
      },
    );
  }

  @override
  void onItemClick(String action) {
    switch (action) {
      case '用户':
        OrientationSheet.show(
          child: OnlineUserPage(roomId: roomId),
          direction: Get.isLandscape ? SheetOrientation.right : SheetOrientation.bottom,
        );
        break;
      case '公告':
        controller.noticePanelRx.toggle();
        break;
      case '工具':
        RoomToolDialog.show().onNotNull(onItemClick);
        break;
      case '礼物':
        showGiftSend(roomId);
        break;
      case '黑名单':
        OrientationSheet.show(
          child: RoomBlockPage(roomId: roomId),
          direction: Get.isLandscape ? SheetOrientation.right : SheetOrientation.bottom,
        );
        break;
      case '管理员':
        OrientationSheet.show(
          child: const RoomAdminPage(),
          direction: Get.isLandscape ? SheetOrientation.right : SheetOrientation.bottom,
        );
        break;
      case '清零':
        // _resetHotCount();
        MicUserCharmManagerSheet.show();
        break;
      case '意见反馈':
        Get.to(() => FeedbackPage(type: 1, id: controller.roomId));
        break;
      case '发起挑战':
        OrientationSheet.show(
          child: ChallengeUserPage(roomId: roomId),
          direction: Get.isLandscape ? SheetOrientation.right : SheetOrientation.bottom,
        );
        break;
      case '装扮抽奖入口':
        ActMainDialog.show();
        break;
      case '全员闭麦':
      case '全员开麦':
        // todo 全员禁麦
        int value = 0;
        int newStatus = 0;
        if(Rtc.status.value == PersonMicStatus.disable.val) {
          // 1.开麦
          value = 2;
          newStatus = PersonMicStatus.open.val;
        } else {
          // 2.闭麦
          value = 1;
          newStatus = PersonMicStatus.disable.val;
        }
        simpleTry(
          () => Api.Room.speaking(roomId, value),
          callback: (t) {
            Rtc.status.value = newStatus;
          }
        );
        break;
      case "下播":
        CommonDialog.confirmDownMic(() {
          controller.keepState = false;

          Get.back();
        });
        break;
      case "关闭特效":
        RoomManagerCtrl.ins.closeEffect();
        break;
      case "打开特效":
        RoomManagerCtrl.ins.openEffect();
        break;
      default:
        super.onItemClick(action);
    }
  }

  static void showGiftSend(int roomId) {
    // 获取房间在线的用户信息
    post(() async {
      WaitingCtrl.obj.show();
      C_OnlineList c_roomEnterComplete = C_OnlineList.create();
      c_roomEnterComplete.roomIdList.add(Int64(roomId ?? 0));
      S_OnlineList? s_syncRoomInfo = await SocketCtrl.ins.sendByteAsyncServer(
          CMD.C_OnlineList,
          datas: c_roomEnterComplete.writeToBuffer(),
          resCmd: CMD.S_OnlineList
      );
      WaitingCtrl.obj.hidden();
      if(s_syncRoomInfo?.items.isEmpty == true) {
        showToast("暂无在麦用户");
        return;
      }

      // 找出的房主的信息
      GiftSend2RoomEntity? roomOwner;
      // 找出的主持的信息
      GiftSend2RoomEntity? mainRole;
      // 麦上的用户信息列表
      List<GiftSend2RoomEntity> userInMicList = [];
      // 获取麦上的用户列表
      var micUsers = sceneMicCtrl<RoomMicCtrl>().simpleUserList;
      // 根据麦号进行排序
      var userList = sceneMicCtrl<RoomMicCtrl>().simpleUserList;

      // 个人房间只能送给房主
      if(sceneMicCtrl<RoomMicCtrl>() is PersonRoomMicCtrl) {
        PersonRoomMicCtrl personRoomMicCtrl = sceneMicCtrl<RoomMicCtrl>() as PersonRoomMicCtrl;
        if(personRoomMicCtrl.roomOwner() == null) {
          showToast("房主信息错误");
          return;
        }
        userList = [personRoomMicCtrl.roomOwner()!];
      }
      userList.sort((a, b) => a.no.compareTo(b.no));

      // 获取房主的信息
      var roomOwnerInfo = s_syncRoomInfo?.items.firstWhereOrNull((element) => element.type == 1);
      if(roomOwnerInfo != null) {
        // 送礼过滤自己
        if(!OAuthCtrl.isSelf(roomOwnerInfo.uid)) {
          roomOwner = GiftSend2RoomEntity(uid: roomOwnerInfo.uid, no: "", userType: 1);
        }
      }

      // 其它用户信息
      for(int index = 0; index < userList.length; index ++) {
        // 过滤自己
        if(OAuthCtrl.isSelf(userList[index].uid)) {
          continue;
        }
        // 其它用户信息
        if(roomOwnerInfo?.uid == userList[index].uid) {
          roomOwner = GiftSend2RoomEntity(uid: userList[index].uid ?? "", no: "", userType: 1);
        } else if(userList[index] == "1") {
          // 主持信息
          mainRole = GiftSend2RoomEntity(uid: userList[index].uid ?? "", no: "", userType: 2);
        } else if(userList[index] == "8"){
          // 板板位不显示
          continue;
        } else {
          userInMicList.add(GiftSend2RoomEntity(uid: userList[index].uid ?? "", no: userList[index].no, userType: 3));
        }
      }

      // 两个数据不为空时，添加分隔线
      if((mainRole != null || roomOwner != null) && userInMicList.isNotEmpty) {
        userInMicList.insert(0, const GiftSend2RoomEntity(uid: "", no: "", userType: GiftSend2RoomEntity.DIVIDE_TYPE));
      }

      // 主持，艾文确认：如果房主坐了主持位，那么就不显示主持的信息
      if(mainRole != null && mainRole.uid != roomOwner?.uid) {
        userInMicList.insert(0, mainRole);
      }
      // 房主
      if(roomOwner != null) {
        userInMicList.insert(0, roomOwner);
      }
      GiftSheet.show(
        GiftSend2Room(roomId: roomId, users: userInMicList.toList(growable: false)),
        hasShowUnityView: true,
      );
    });

  }
}

class CommonRoomHeader extends RoomGetView<RoomCtrl> {
  final bool showMic;
  final bool showMicPanel;
  final bool isLandscape;
  final ValueChanged<String> onItemClick;

  CommonRoomHeader({required this.showMicPanel, required this.showMic, required this.isLandscape, required this.onItemClick})
      : super(key: ValueKey(Tuple3(showMicPanel, showMic, isLandscape)));

  @override
  Widget build(BuildContext context) {
    // 横屏
    if (isLandscape || !showMicPanel) return $AppBar();

    // 竖屏
    Widget child = $AppBar(
      [
        if (!showMic)
          InkResponse(
            onTap: controller.micPanelRx.toggle,
            child: RotatedBox(
              quarterTurns: 3,
              child: SvgView(SVG.$('room/麦位显示_1'), color: AppPalette.room),
            ),
          ),
      ],
    );

    if (showMic) {
      // 麦列表
      child = createMicList(child);

      child = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          child,
          // Box(
          //   alignment: Alignment.topRight,
          //   padding: const Pad(right: 10),
          //   child: GestureDetector(
          //     onTap: controller.micPanelRx.toggle,
          //     child: RotatedBox(
          //       quarterTurns: 3,
          //       child: SvgView(SVG.$('room/麦位显示_0'), color: AppPalette.room),
          //     ),
          //   ),
          // )
        ],
      );
    }

    return child;
  }

  Widget createMicList(Widget child) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        child,
        MicUser$Header(myRole: controller.getRole(OAuthCtrl.uid)),
      ],
    );
  }

  Widget $AppBar([List<Widget> actions = const []]) {
    return Container(
      margin: Pad(top: AppSize.safeTop, right: 10),
      height: 44,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          BackButton(color: Colors.white, onPressed: () => onItemClick('最小化')),
          $TitleView(),
          Spacing.w4,
          Spacing.w4,
          // $QualityView(),
          Spacing.exp,
          for (final item in actions) ...[
            item,
            Spacing.w10,
          ],
          $OnlineView(),
        ],
      ),
    );
  }

  Widget $TitleView() {
    return PortalModal(
      visible: controller.noticePanelRx(),
      onDismiss: () => controller.noticePanelRx(false),
      modal: const NoticeOverlay(),
      child: IntrinsicWidth(
        child: InkResponse(
          onTap: RoomInfoDialog.show,
          child: Container(
            height: 38,
            width: 144,
            decoration: const ShapeDecoration(shape: XStadiumBorder(), color: AppPalette.room),
            padding: const Pad(horizontal: 6),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      XText(
                        '${controller.info['room_name']}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: fw$Medium),
                      ),
                      XText(
                        'ID:${controller.info['room_no']}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 10, color: Color(0xFFCCCCCC), fontWeight: fw$Medium),
                      ),
                    ],
                  ),
                ),

                Obx(() {
                  return GestureDetector(
                    onTap: () {
                      onItemClick.call(controller.followRx.value == true ? '己关注' : '关注');
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      width: 52,
                      height: 26,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF00D2),
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: XText(
                          controller.followRx.value == true ? '己关注' : '关注',
                          overflow: TextOverflow.fade,
                          style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget $QualityView() {
  //   return Obx(() {
  //     final it = Rtc.netQualityRx();
  //
  //     Color color;
  //
  //     // 如果SDK网络质量不是按照顺序排列就有问题
  //     final quality = (it.value1.index + it.value2.index) ~/ 2;
  //
  //     if (quality < 3) {
  //       color = Colors.green;
  //     } else if (quality < 5) {
  //       color = Colors.orange;
  //     } else {
  //       color = Colors.red;
  //     }
  //
  //     return Icon(Icons.wifi, size: 16, color: color);
  //   });
  // }

  Widget $OnlineView() {
    return Obx(() {
      S_TopThree? topThree = controller.topThree.value;
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 热度值第一名
          if(topThree != null && topThree.items.isNotEmpty)
            SizedBox(
              height: 33,
              width: 36,
              child: Stack(
                children: [
                  // 头像
                  Positioned(
                    left: 0,
                    right: 0,
                    child: AsyncAvatar(
                      uid: topThree.items.first.uid,
                      size: 24,
                      avatarFrameSize: 6,
                      side: BorderSide(color: Color(0xFFD9B22F), width: 1),
                      onTap: Some(() {
                        RoomUserInfoDialog.show(uid: topThree.items.first.uid, nuid: topThree.items.first.roleId);
                      }),
                    ),
                  ),
                  // 热度值
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 2,
                    child: Container(
                      width: double.infinity,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color(0xFFD9B22F),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgView(SVG.$('room/热度'), width: 6, height: 6),
                          Text(
                            convert(topThree.items[0].contributionCount.toInt()),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 6,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),



          // 热度值第二名
          if(topThree != null && topThree.items.length > 1)
            SizedBox(width: 3,),
          if(topThree != null && topThree.items.length > 1)
            SizedBox(
              height: 33,
              width: 36,
              child: Stack(
                children: [
                  // 头像
                  Positioned(
                    left: 0,
                    right: 0,
                    child: AsyncAvatar(
                      uid: topThree.items[1].uid,
                      size: 24,
                      avatarFrameSize: 6,
                      side: BorderSide(color: Color(0xFF6B98D6), width: 1),
                      onTap: Some(() {
                        RoomUserInfoDialog.show(uid: topThree.items[1].uid, nuid: topThree.items[1].roleId);
                      }),
                    ),
                  ),
                  // 热度值
                  Positioned(
                    left: 2,
                    right: 2,
                    bottom: 2,
                    child: Container(
                      width: 24,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color(0xFF6B98D6),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 2,),
                          SvgView(SVG.$('room/热度'), width: 6, height: 6),
                          Text(
                            convert(topThree.items[1].contributionCount.toInt()),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 6,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                          SizedBox(width: 2,),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),



          // 热度值第三名
          if(topThree != null && topThree.items.length > 2)
            SizedBox(width: 3,),
          if(topThree != null && topThree.items.length > 2)
            SizedBox(
              height: 33,
              width: 36,
              child: Stack(
                children: [
                  // 头像
                  Positioned(
                    left: 0,
                    right: 0,
                    child: AsyncAvatar(
                      uid: topThree.items[2].uid,
                      size: 24,
                      avatarFrameSize: 6,
                      side: BorderSide(color: Color(0xFFB76E4D), width: 1),
                      onTap: Some(() {
                        RoomUserInfoDialog.show(uid: topThree.items[2].uid, nuid: topThree.items[2].roleId);
                      }),
                    ),
                  ),
                  // 热度值
                  Positioned(
                    left: 2,
                    right: 2,
                    bottom: 2,
                    child: Container(
                      width: 24,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color(0xFFB76E4D),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 2,),
                          SvgView(SVG.$('room/热度'), width: 6, height: 6),
                          Text(
                            convert(topThree.items[2].contributionCount.toInt()),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 6,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                          SizedBox(width: 2,),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),


          // 在线人数
          SizedBox(width: 10,),
          GestureDetector(
            onTap: () {
              onItemClick('用户');
            },
            behavior: HitTestBehavior.opaque,
            child: Container(
              height: 26,
              decoration: const ShapeDecoration(shape: XStadiumBorder(), color: AppPalette.room),
              constraints: const BoxConstraints(minWidth: 26),
              padding: const Pad(horizontal: 6),
              alignment: Alignment.center,
              child: Obx(() {
                // final maxUser = controller.maxUser;
                final userCount = controller.userCountRx();

                return XRichText(
                  TextSpan(
                    children: [
                      TextSpan(text: '$userCount'),
                      // if (maxUser > 0) TextSpan(text: '/$maxUser'),
                    ],
                  ),
                  style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: fw$Medium),
                );
              }),
            ),
          )
        ],
      );
    });
  }

  String convert(int value) {
    return value.toString();
  }
}

class _RoomRight extends RoomGetView<RoomCtrl> {
  const _RoomRight();

  double _calcH(int count) {
    return MicUser$Right.padding.vertical //
            +
            MicUser$Right.itemH * count //
            +
            MicUser$Right.spacing * (count - 1) //
        ;
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape = context.watch<Orientation>() == Orientation.landscape;

    final double width = isLandscape ? 160 : 90;
    final double height = _calcH(isLandscape ? 2 : 4);

    const dur = kTabScrollDuration;
    final showMicRx = controller.micPanelRx;

    final micView = $MicUserView();

    Widget child = Obx(
      () {
        final isShow = showMicRx();

        return Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: dur,
              curve: Curves.easeOutCubic,
              right: isShow ? width : 0,
              width: 22,
              height: 48,
              child: GestureDetector(
                onTap: showMicRx.toggle,
                child: MicPanelSwitcher(dur: dur, isShow: isShow),
              ),
            ),
            AnimatedPositioned(
              duration: dur,
              curve: Curves.easeOutCubic,
              right: isShow ? 0 : -width,
              width: width,
              height: height,
              child: micView,
            ),
          ],
        );
      },
    );

    child = SizedBox(width: 22 + width, height: height, child: child);

    return child;
  }

  Widget $MicUserView() {
    const decor = ShapeDecoration(
      color: Color(0x80000000),
      shape: XRectangleBorder(borderRadius: AppBorderRadius.l10),
    );

    return DecoratedBox(
      decoration: decor,
      child: Obx(() => MicUser$Right(myRole: controller.getRole(OAuthCtrl.uid))),
    );
  }
}
