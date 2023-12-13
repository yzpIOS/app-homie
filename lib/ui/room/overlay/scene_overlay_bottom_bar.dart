import 'package:app/3rd/tencent/im.dart';
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
      crossAxisAlignment: CrossAxisAlignment.end,
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
    late final freeMicRx = isRoom ? (controller as RoomCtrl).freeMicRx.isTrue : false;
    // 大厅中的用户是否接近了直播房，如果是就要使用禁用mike
    RxBool? manInHallNearByRoom;
    if(controller is SquareCtrl) {
      manInHallNearByRoom = (controller as SquareCtrl?)?.enableUpMikeButton;
    }

    final canSpeak = sceneMicCtrl().canSpeakRx;
    final myUid = OAuthCtrl.uid;

    return Obx(
      () {
        final isEnable = (isRoom && freeMicRx) || canSpeak(myUid) || (manInHallNearByRoom?.isTrue ?? false);

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
          child: Image.asset(IMG.format('room/$_icon'), width: size, height: size, scale: 3, fit: BoxFit.none),
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
  Widget $UnReadView(int count) {
    const double height = 15;
    return Container(
      constraints: const BoxConstraints(minHeight: height, maxHeight: height, minWidth: height),
      decoration: const ShapeDecoration(color: Color(0xFFFF0049), shape: XStadiumBorder()),
      alignment: Alignment.center,
      child: XText(
        count > 99 ? '99+' : '$count',
        style: const TextStyle(fontSize: 10, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () => widget.onItemClick('消息_0'),
      child: Column(
        children: [
          NotifierView(
            Get.find<ConvManagerCtrl>().unReadMessageCount,
            onData: (data) {
              if (data > 0) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      child: Image.asset(IMG.format('room/房间消息提醒框'), width: 31, height: 34, scale: 3, fit: BoxFit.contain),
                    ),
                    Positioned(
                      top: 2.5,
                      left: 2.5,
                      child: Obx(() {
                        String uid = '';
                        final list = Get.find<ConvManagerCtrl>().convRx;
                        if (list.isNotEmpty) {
                          for (final item in list) {
                            if ((item.unreadCount ?? 0) > 0) {
                              uid = item.userID ?? '';
                              if (item.isSysConv) {
                                return AvatarView(item.faceUrl, size: 26);
                              }
                              break;
                            }
                          }
                        }
                        return AsyncAvatar(uid: uid, size: 26, onTap: Some(() => widget.onItemClick('消息_0')),);
                      }),
                    ),
                    Positioned(
                      top: -2,
                      left: 22,
                      child: $UnReadView(data),
                    )
                  ],
                );
              }
              return Spacing.blank;
            },
          ),
          _IconBtn(
            icon: '消息_0',
          ),
        ],
      ),
    );

    // return NotifierView(
    //   Get.find<ConvManagerCtrl>().unReadMessageCount,
    //   onData: (data) {
    //     return _IconBtn(
    //       icon: '消息_${(data > 0).intVal}',
    //       onItemClick: widget.onItemClick,
    //     );
    //   },
    // );
  }
}
