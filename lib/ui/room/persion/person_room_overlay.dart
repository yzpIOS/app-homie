
import 'package:app/3rd/tencent/rtc.dart';
import 'package:app/common/nets/commons/proto/Common.pb.dart';
import 'package:app/common/theme.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/room/room_mic_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/room/chat/room_msg_view.dart';
import 'package:app/ui/room/overlay/room_info_dialog.dart';
import 'package:app/ui/room/overlay/room_overlay.dart';
import 'package:app/ui/room/overlay/scene_overlay.dart';
import 'package:app/ui/room/overlay/scene_overlay_bottom_bar.dart';
import 'package:app/ui/room/user/mic_user_sheet.dart';
import 'package:app/ui/room/user/mic_user_view_2.dart';
import 'package:app/ui/room/widgets/icon_button_svg.dart';
import 'package:app/ui/room/widgets/portal_modal.dart';
import 'package:app/ui/room/widgets/room_get_widget.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../overlay/notice_overlay.dart';

class PersonRoomOverlay extends RoomOverlay {

  PersonRoomOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape = context.watch<Orientation>() == Orientation.landscape;
    ValueNotifier<double> _changedValue = ValueNotifier<double>(AppSize.height - AppSize.safeBottom - 127 - 100);

    return Obx(
          () {
        final showMic = controller.micPanelRx();

        return Stack(
          alignment: Alignment.center,
          children: [
            // 聊天消息视图
            Positioned.fill(
              top: isLandscape || !showMic ? AppSize.safeTop + AppSize.appBar + 26 : AppSize.safeTop + AppSize.appBar + 235,
              child: controller.chatMsgViewIsShowRx() ? const RoomChatView() : Spacing.blank,
            ),

            // 底部送礼
            if (controller.bottomBarIsShowRx())
              Positioned(
                bottom: AppSize.safeBottom > 0 ? AppSize.safeBottom : 15,
                // height: 50,
                width: AppSize.width,
                child: Box(
                  padding: const Pad(horizontal: 5),
                  child: Animate(
                    effects: bottomEffect,
                    child: SceneOverlayBottomBar<PersonRoomCtrl>(onItemClick: onItemClick),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

}

class PersonRoomHeader extends CommonRoomHeader {

  UserInfo? owner;
  List<MicInfo>? userList;

  PersonRoomHeader({
    required super.showMicPanel,
    required super.showMic,
    required super.isLandscape,
    required super.onItemClick,

    this.owner,
    this.userList,
  });

  @override
  Widget createMicList(Widget child) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        child,
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // 头像
            AsyncAvatar(uid: OAuthCtrl.uid, size: 46,),
            // 主持
            Image.asset(IMG.format("room/chair_man_label"), width: 37, height: 12,)
          ],
        ),

        SizedBox(height: 5,),
        createOwnerName(),

        SizedBox(height: 6,),
        createHotValue(),

        SizedBox(height: 25,),
        createOnMicList(),

        SizedBox(height: 35,),
      ],
    );
  }

  Widget createOwnerName() {
    return Text(
      "1号麦",
      style: TextStyle(
        fontSize: 12,
        color: Colors.white,
        fontWeight: FontWeight.w600
      ),
    );
  }

  Widget createHotValue() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(IMG.format("room/fire"), width: 15, height: 15,),
        Text(
          "123456",
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.w600
          ),
        )
      ],
    );
  }

  Widget createOnMicList() {
    return SizedBox(
      width: AppSize.width,
      height: 68,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() {
                final val = Rtc.speakRx[OAuthCtrl.uid];
                var avatar = AsyncAvatar(
                  uid: OAuthCtrl.uid,
                  size: 46,
                  // todo 点击处理
                  onTap: Some(() {
                    if(RoomManagerCtrl.ins.sceneCtrl2 is! PersonRoomCtrl) {
                      return;
                    }
                    (RoomManagerCtrl.ins.sceneCtrl as PersonRoomCtrl).onClickAvatar("");
                  }),
                );
                if(val == null) {
                  return avatar;
                }
                return MicAnimeBuilder(
                  value: val,
                  child: avatar,
                  builder: (context, value, child) => DecoratedBox(decoration: value, child: child),
                );
              }),

              // 麦上用户
              const SizedBox(height: 6,),
              createOwnerName(),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 18, height: 1,);
        },
        itemCount: 10
      ),
    );
  }


}

