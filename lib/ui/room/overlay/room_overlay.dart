import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/common/theme.dart';
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
import 'package:app/ui/room/overlay/mic_panel_switcher.dart';
import 'package:app/ui/room/overlay/notice_overlay.dart';
import 'package:app/ui/room/overlay/room_info_dialog.dart';
import 'package:app/ui/room/overlay/room_tool_dialog.dart';
import 'package:app/ui/room/overlay/scene_overlay.dart';
import 'package:app/ui/room/overlay/scene_overlay_bottom_bar.dart';
import 'package:app/ui/room/user/mic_user_charm_manager_sheet.dart';
import 'package:app/ui/room/user/challenge_user_view.dart';
import 'package:app/ui/room/user/mic_user_view_2.dart';
import 'package:app/ui/room/user/online_user_view.dart';
import 'package:app/ui/room/user/room_admin_page.dart';
import 'package:app/ui/room/user/room_block_page.dart';
import 'package:app/ui/room/widgets/icon_button.dart';
import 'package:app/ui/room/widgets/portal_modal.dart';
import 'package:app/ui/room/widgets/room_get_widget.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:quiver/collection.dart';
import 'package:fixnum/fixnum.dart';
import 'package:app/common/nets/commons/proto/Common.pb.dart' as Common;

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

        final showMicPanel = controller.maxMic > 0 && !freeMic;

        //公会房且不在pk中，才显示麦位
        final topMicMode = (controller.roomType == RoomType.guild && !Get.find<RoomManagerCtrl>().sceneCtrl.isInPKRoom());
        final sideMicMode = controller.roomType == RoomType.customize;

        return Stack(
          alignment: Alignment.center,
          children: [
            // 聊天消息视图
            Positioned.fill(
              top: isLandscape || sideMicMode || !showMicPanel || !showMic ? AppSize.safeTop + AppSize.appBar + 26 : AppSize.safeTop + AppSize.appBar + 235,
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
                bottom: AppSize.safeBottom,
                height: 50,
                width: AppSize.width,
                child: Box(
                  padding: const Pad(horizontal: 5),
                  child: Animate(
                    effects: bottomEffect,
                    child: SceneOverlayBottomBar<RoomCtrl>(onItemClick: onItemClick),
                  ),
                ),
              ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: _RoomHeader(
                showMicPanel: showMicPanel && topMicMode,
                showMic: showMic,
                isLandscape: isLandscape,
                onItemClick: onItemClick,
              ),
            ),
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
        _showGiftSend();
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
      default:
        super.onItemClick(action);
    }
  }

  void _showGiftSend() {
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
      var micUsers = sceneMicCtrl<RoomMicCtrl>().dataRx;
      // 根据麦号进行排序
      var userList = micUsers.keys.toList();
      userList.sort((a, b) => a.compareTo(b));

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
        if(OAuthCtrl.isSelf(micUsers[userList[index]]?.uid)) {
          continue;
        }
        // 其它用户信息
        if(roomOwnerInfo?.uid == micUsers[userList[index]]?.uid) {
          roomOwner = GiftSend2RoomEntity(uid: micUsers[userList[index]]?.uid ?? "", no: "", userType: 1);
        } else if(userList[index] == "1") {
          // 主持信息
          mainRole = GiftSend2RoomEntity(uid: micUsers[userList[index]]?.uid ?? "", no: "", userType: 2);
        } else if(userList[index] == "8"){
          // 板板位不显示
          continue;
        } else {
          userInMicList.add(GiftSend2RoomEntity(uid: micUsers[userList[index]]?.uid ?? "", no: userList[index], userType: 3));
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
        GiftSend2Room(roomId: controller.roomId, users: userInMicList.toList(growable: false)),
        hasShowUnityView: true,
      );
    });

  }

  void _resetHotCount() {
    simpleSub(
      Api.Room.resetHotCount(),
    );
  }
}

class _RoomHeader extends RoomGetView<RoomCtrl> {
  final bool showMic;
  final bool showMicPanel;
  final bool isLandscape;
  final ValueChanged<String> onItemClick;

  _RoomHeader({required this.showMicPanel, required this.showMic, required this.isLandscape, required this.onItemClick})
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
      child = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          child,
          Padding(
            padding: const Pad(top: 28, bottom: 10),
            child: MicUser$Header(myRole: controller.getRole(OAuthCtrl.uid)),
          ),
        ],
      );

      child = DecoratedBox(
        decoration: const ShapeDecoration(
          color: AppPalette.room,
          shape: XRectangleBorder(borderRadius: AppBorderRadius.b10),
        ),
        child: child,
      );

      child = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          child,
          Box(
            alignment: Alignment.topRight,
            padding: const Pad(right: 10),
            child: GestureDetector(
              onTap: controller.micPanelRx.toggle,
              child: RotatedBox(
                quarterTurns: 3,
                child: SvgView(SVG.$('room/麦位显示_0'), color: AppPalette.room),
              ),
            ),
          )
        ],
      );
    }

    return child;
  }

  Widget $AppBar([List<Widget> actions = const []]) {
    return Container(
      margin: Pad(top: AppSize.safeTop, right: 10),
      height: 44,
      child: Row(
        children: [
          BackButton(color: Colors.white, onPressed: () => onItemClick('最小化')),
          $TitleView(),
          Spacing.w4,
          Obx(
            () => PortalModal(
              visible: controller.noticePanelRx(),
              onDismiss: () => controller.noticePanelRx(false),
              modal: const NoticeOverlay(),
              child: IconBtn(
                icon: '公告',
                size: 28,
                padding: const Pad(all: 5),
                onTap: () => onItemClick('公告'),
              ),
            ),
          ),
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
    return IntrinsicWidth(
      child: InkResponse(
        onTap: RoomInfoDialog.show,
        child: Container(
          height: 36,
          decoration: const ShapeDecoration(shape: XStadiumBorder(), color: AppPalette.room),
          constraints: const BoxConstraints(maxWidth: 140),
          padding: const Pad(horizontal: 10),
          alignment: Alignment.center,
          child: XText(
            '${controller.info['room_name']}',
            overflow: TextOverflow.fade,
            style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$Medium),
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
    Widget child = Obx(() {
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
    });

    child = Container(
      height: 26,
      decoration: const ShapeDecoration(shape: XStadiumBorder(), color: AppPalette.room),
      constraints: const BoxConstraints(minWidth: 26),
      padding: const Pad(horizontal: 6),
      alignment: Alignment.center,
      child: child,
    );

    child = InkResponse(
      onTap: () => onItemClick('用户'),
      child: child,
    );

    return child;
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
