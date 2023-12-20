

import 'package:fixnum/fixnum.dart';
import 'package:app/3rd/tencent/rtc.dart';
import 'package:app/common/theme.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/room/room_mic_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/room/chat/room_msg_view.dart';
import 'package:app/ui/room/overlay/room_overlay.dart';
import 'package:app/ui/room/overlay/scene_overlay_bottom_bar.dart';
import 'package:app/ui/room/user/mic_user_view_2.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:provider/provider.dart';


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

  MicInfo? owner;
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
    if(owner == null && (userList == null || userList?.isEmpty == true)) {
      return SizedBox(child: child,);
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        child,
        // 房主
        createOwnerName(),
        // 观众
        if(userList?.isNotEmpty == true)
          const SizedBox(height: 25,),
        if(userList?.isNotEmpty == true)
          createOnMicList(),

        const SizedBox(height: 35,),
      ],
    );
  }

  Widget createOwnerName() {
    if(owner == null) {
      return const SizedBox();
    }
    return UserInfoCtrl.use(owner?.uid ?? "", builder: (info) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // 头像
              AsyncAvatar(
                uid: owner?.uid ?? "",
                size: 46,
                onTap: Some(() {
                  if(RoomManagerCtrl.ins.sceneCtrl2 is! PersonRoomCtrl) {
                    return;
                  }
                  (RoomManagerCtrl.ins.sceneCtrl as PersonRoomCtrl).onClickAvatar(owner?.uid ?? "", owner?.nUid ?? Int64(0));
                }),
              ),
              // 主持
              Image.asset(IMG.format("room/chair_man_label"), width: 37, height: 12,)
            ],
          ),

          const SizedBox(height: 5,),
          Text(
            info?.showName() ?? "",
            style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w600
            ),
          ),

          const SizedBox(height: 6,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(IMG.format("room/fire"), width: 15, height: 15,),
              Text(
                (owner?.hotCount ?? 0).toString(),
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                ),
              )
            ],
          )
        ],
      );
    });
  }

  Widget createOnMicList() {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      width: AppSize.width,
      height: 71,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          MicInfo? micInfo = userList?[index];
          if(micInfo == null) {
            return const SizedBox();
          }
          return UserInfoCtrl.use(micInfo.uid, builder: (userInfoDto) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() {
                  final val = Rtc.speakRx[micInfo.uid];
                  var avatar = AsyncAvatar(
                    uid: micInfo.uid ?? "",
                    size: 46,
                    // todo 点击处理
                    onTap: Some(() {
                      if(RoomManagerCtrl.ins.sceneCtrl2 is! PersonRoomCtrl) {
                        return;
                      }
                      (RoomManagerCtrl.ins.sceneCtrl as PersonRoomCtrl).onClickAvatar(micInfo.uid ?? "", micInfo.nUid ?? Int64(0));
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
                Text(
                  userInfoDto?.showName() ?? "",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  )
                )
              ],
            );
          });
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 18, height: 1,);
        },
        itemCount: userList?.length ?? 0
      ),
    );
  }


}

