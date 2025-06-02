import 'package:app/3rd/tencent/rtc.dart';
import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/model/enum/room_state.dart';
import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/moment/widgets/reply_view.dart';
import 'package:app/ui/room/overlay/conv_dialog.dart';
import 'package:app/ui/room/overlay/room_anime_dialog.dart';
import 'package:app/ui/room/user/mic_user_charm_manager_sheet.dart';
import 'package:app/ui/room/user/mic_user_online_manager_sheet.dart';
import 'package:app/ui/room/widgets/room_get_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fixnum/fixnum.dart';

import '../../../store/room/room_chat_ctrl.dart';

abstract class SceneOverlay<T extends SceneCtrl> extends RoomGetView<T> {
  late final roomId = controller.roomId;

  final rightEffect = const <Effect>[
    // 1. 基础动画效果
    Effect(
      duration: kThemeChangeDuration,  // 动画持续时间
      curve: Curves.easeOutCubic,      // 动画曲线
    ),
    
    // 2. 滑动效果
    SlideEffect(
      begin: Offset(0.4, 0),  // 开始位置：向右偏移自身宽度的 40%
      end: Offset.zero,       // 结束位置：原始位置(0,0)
    ),
  ];

  // 定义底部滑入动画效果列表
  final bottomEffect = const <Effect>[
    // 基础动画效果配置
    // duration: 动画持续时间，使用主题中定义的过渡动画时长
    Effect(duration: kThemeChangeDuration, curve: Curves.easeOutCubic),
    
    // 滑动效果配置
    // begin: 动画开始位置，从底部向上偏移40%的位置开始
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
      case '麦克风_禁用':
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
        MicUserOnlineManagerSheet.show();
        break;
      default:
        assert(false, '未处理的业务 -> $action');
    }
  }

  void _showSendMsg({bool autofocus = true}) async {
    final sheet = ReplySheet.show(
      TextEditingController(),
      autofocus: autofocus,
      barrierColor: Colors.transparent,
      maxLength: ChatTextInputFormatter.chatTextMaxLength,
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
