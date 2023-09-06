import 'package:app/3rd/tencent/rtc.dart';
import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/model/enum/room_state.dart';
import 'package:app/net/api.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/moment/widgets/reply_view.dart';
import 'package:app/ui/room/overlay/conv_dialog.dart';
import 'package:app/ui/room/overlay/room_anime_dialog.dart';
import 'package:app/ui/room/user/mic_user_charm_manager_sheet.dart';
import 'package:app/ui/room/widgets/room_get_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fixnum/fixnum.dart';

abstract class SceneOverlay<T extends SceneCtrl> extends RoomGetView<T> {
  late final roomId = controller.roomId;

  final rightEffect = const <Effect>[
    Effect(duration: kThemeChangeDuration, curve: Curves.easeOutCubic),
    SlideEffect(begin: Offset(0.4, 0), end: Offset.zero),
  ];

  final bottomEffect = const <Effect>[
    Effect(duration: kThemeChangeDuration, curve: Curves.easeOutCubic),
    SlideEffect(begin: Offset(0, 0.4), end: Offset.zero),
  ];

  SceneOverlay({super.key});

  void onItemClick(String action) async {
    switch (action) {
      case '动作':
        RoomAnimeDialog.show();
        break;
      case '新消息':
        _showSendMsg();
        break;
      case '表情':
        _showSendMsg(autofocus: false);
        break;
      case '切换横竖屏':
        screenRotate();
        break;
      case '麦克风_0':
      case '麦克风_1':
        Rtc.micSwitch();
        break;
      case '消息_0':
      case '消息_1':
        ConvDialog.show();
        break;
      case '声音_0':
      case '声音_1':
        Rtc.audioRx.toggle();
        break;
      case '自拍':
      case '拍照':
        _setPhotoMode(true);
        break;
      case '退出自拍':
        _setPhotoMode(false);
        break;
      case '退出':
        controller.keepState = false;

        Get.back();
        break;
      case '最小化':
        try {
          controller.keepState = true;
          // 公会房通知下线
          if(controller.roomType == RoomType.guild || controller.roomType == RoomType.customize) {
            C_GoBack c_goBack = C_GoBack.create();
            c_goBack.roomId = Int64(roomId);
            SocketCtrl.ins.sendSever(CMD.C_GoBack, message: c_goBack);
          }
        } catch(e, s) {
        }
        Get.back();
        break;
      case '下麦':
        MicUserCharmManagerSheet.show(uid: "");
        break;
      default:
        assert(false, '未处理的业务 -> $action');
    }
  }

  void _showSendMsg({bool autofocus = true}) {
    final sheet = ReplySheet.show(
      TextEditingController(),
      autofocus: autofocus,
      barrierColor: Colors.transparent,
    );

    sheet.onType<String>((it) {
      simpleTry(
        () => Api.RoomMsg.sendMessage(roomId: controller.roomId, message: it),
      );
    });
  }

  void _setPhotoMode(bool b) async {
    final stateRx = controller.sceneHudRx;

    stateRx(b ? RoomHudState.Camera : RoomHudState.Normal);

    try {
      await Get.find<UnityCtrl>().sendMessage(
        b ? App2UnityEnum.FTU_PICTURE_ENTER : App2UnityEnum.FTU_PICTURE_EXIT,
      );
    } catch (e, s) {
      errLog(e, s);

      stateRx(RoomHudState.Normal);
    }
  }
}
