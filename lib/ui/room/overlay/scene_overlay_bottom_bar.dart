import 'package:app/3rd/tencent/rtc.dart';
import 'package:app/common/theme.dart';
import 'package:app/store/im/conv_manager_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/scene_mic_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/room/widgets/icon_button.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'package:app/ui/room/widgets/room_get_widget.dart';
import 'package:app/ui/room/overlay/scene_overlay_input.dart';

class SceneOverlayBottomBar<T extends SceneCtrl> extends RoomGetView<T> {
  final ValueChanged<String> onItemClick;

  const SceneOverlayBottomBar({super.key, required this.onItemClick});

  @override
  Widget build(BuildContext context) {
    // final isSquare = controller is SquareCtrl;
    final isRoom = controller is RoomCtrl;

    return Row(
      children: [
        $MicView(isRoom),
        $SpeakView(),
        Expanded(child: SceneOverlayInput(onItemClick: onItemClick)),
        _ConvView(onItemClick: onItemClick),
        _IconBtn(icon: '动作', onItemClick: onItemClick),
        if (isRoom) _GiftBtn(onItemClick: onItemClick),
        // if (isSquare) _IconBtn(icon: '拍照', onItemClick: onItemClick),
        if (isRoom) _IconBtn(icon: '工具', onItemClick: onItemClick),
      ],
    );
  }

  Widget $MicView(bool isRoom) {
    late final freeMicRx = (controller as RoomCtrl).freeMicRx;
    // 大厅中的用户是否接近了直播房，如果是就要使用禁用mike
    late final manInHallNearByRoom = (controller as SquareCtrl).manInHallNearByRoom;

    final canSpeak = sceneMicCtrl().canSpeakRx;
    final myUid = OAuthCtrl.uid;

    return Obx(
      () {
        final isEnable = (isRoom && freeMicRx.isTrue) || canSpeak(myUid) || manInHallNearByRoom.isTrue;

        return _IconBtn(
          icon: isEnable ? '麦克风_${Rtc.micRx().intVal}' : '麦克风_禁用',
          onItemClick: isEnable ? onItemClick : null,
        );
      },
    );
  }

  Widget $SpeakView() {
    return Obx(
      () {
        return _IconBtn(
          icon: '声音_${Rtc.audioRx().intVal}',
          onItemClick: onItemClick,
        );
      },
    );
  }
}

class _IconBtn extends StatelessWidget {
  final String? icon;

  final ValueChanged<String>? onItemClick;

  _IconBtn({this.icon, this.onItemClick}) : super(key: ValueKey(icon));

  @override
  Widget build(BuildContext context) {
    return IconBtn(
      icon: icon,
      size: 28,
      padding: const Pad(all: 5),
      onTap: onItemClick?.let((fn) => () => fn(icon!)),
    );
  }
}

class _GiftBtn extends StatelessWidget {
  final ValueChanged<String> onItemClick;

  const _GiftBtn({required this.onItemClick}) : super(key: const ValueKey(_icon));

  static const String _icon = '礼物';

  @override
  Widget build(BuildContext context) {
    const size = 28.0;

    return InkResponse(
      onTap: () => onItemClick(_icon),
      child: Padding(
        padding: const Pad(all: 5) * AppSize.scaleW,
        child: IconBtnDecor(
          child: Image.asset(IMG.$('room/$_icon'), width: size, height: size, scale: 3, fit: BoxFit.none),
        ),
      ),
    );
  }
}

class _ConvView extends StatefulWidget {
  final ValueChanged<String> onItemClick;

  const _ConvView({required this.onItemClick});

  @override
  State<_ConvView> createState() => _ConvViewState();
}

class _ConvViewState extends State<_ConvView> {
  @override
  Widget build(BuildContext context) {
    return NotifierView(
      Get.find<ConvManagerCtrl>().badge,
      onData: (data) {
        return _IconBtn(
          icon: '消息_${(data > 0).intVal}',
          onItemClick: widget.onItemClick,
        );
      },
    );
  }
}
