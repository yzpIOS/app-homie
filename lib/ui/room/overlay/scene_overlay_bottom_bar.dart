import 'package:app/3rd/tencent/im.dart';
import 'package:app/3rd/tencent/rtc.dart';
import 'package:app/common/theme.dart';
import 'package:app/model/enum/person_mic_status.dart';
import 'package:app/store/im/conv_manager_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/room/room_mic_ctrl.dart';
import 'package:app/store/room/scene_mic_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/room/persion/person_room_mic_ctrl.dart';
import 'package:app/ui/room/widgets/icon_button.dart';
import 'package:app/ui/room/widgets/icon_button_svg.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'package:app/ui/room/widgets/room_get_widget.dart';
import 'package:app/ui/room/overlay/scene_overlay_input.dart';

import '../../../store/room/room_chat_ctrl.dart';

class SceneOverlayBottomBar<T extends SceneCtrl> extends RoomGetView<T> {
  final ValueChanged<String> onItemClick;

  SceneOverlayBottomBar({super.key, required this.onItemClick});



  @override
  Widget build(BuildContext context) {
    // final isSquare = controller is SquareCtrl;
    final isRoom = controller is RoomCtrl;

    //
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if((controller is PersonRoomCtrl) == false) $MicView(isRoom),
        $SpeakView(),
        Expanded(child: SceneOverlayInput(onItemClick: onItemClick, padding: Pad(horizontal: 5),)),

        SizedBox(width: 5,),
        _ConvView(onItemClick: onItemClick),

        // _IconBtnSvg(icon: '动作', onItemClick: onItemClick),
        if(isRoom)
          SizedBox(width: 10,),
        if (isRoom)
          GestureDetector(
            onTap: () {
              onItemClick.call('礼物');
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              width: 28,
              height: 28,
              child: IconBtnDecor(
                child: Image.asset(IMG.format('room/礼物'), width: 28, height: 28),
              ),
            ),
          ),

        // if (isSquare) _IconBtn(icon: '拍照', onItemClick: onItemClick),
        if(controller is PersonRoomCtrl) MicOperate(),

        if(isRoom)
          SizedBox(width: 10,),
        if (isRoom)
          GestureDetector(
            onTap: () {
              onItemClick.call('工具');
            },
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: 28,
              height: 28,
              child: IconBtnDecor(
                child: Image.asset(IMG.format('room/工具'), width: 28, height: 28),
              ),
            ),
          ),
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
        final isEnable = (isRoom && freeMicRx && canSpeak(myUid)) || (manInHallNearByRoom?.isTrue ?? false);
        // int? status = RoomChatCtrl.status.value;
       // bool isMickStatus = Rtc.micRx.value;
       // int isJinMaiStatus = Rtc.status.value;
        /// 麦克风状态:0.无麦 1.上麦 2,下麦 3.闭麦,4.禁麦
        /// 3.开麦 4.闭麦 5.禁言【禁止rtc】
        int mikeStatus = Rtc.mike_status.value;
     //   print('123status = $status');
        return mikeStatus == 5? _IconBtn(
          icon: '麦位_禁麦',
          padding: Pad(horizontal: 5),
          // onItemClick: isEnable && status != 1 ? onItemClick : null,
          // onItemClick: isEnable ? onItemClick : null,
          onItemClick:null,
        ) : _IconBtnSvg(
       //   icon: isEnable && mikeStatus == 3 ? '麦克风_${Rtc.micRx().intVal}' : mikeStatus == 5 ?'表情' : '麦克风_禁用',
          icon: mikeStatus == 3 ? '麦克风_${Rtc.micRx().intVal}' : '麦克风_禁用',
          padding: Pad(horizontal: 5),
         // onItemClick: isEnable && status != 1 ? onItemClick : null,
          onItemClick: isEnable ? onItemClick : null,
        //  onItemClick:onItemClick ,
        );
      },
    );
  }

  Widget $SpeakView() {
    return Obx(
      () {

        return  _IconBtnSvg(
          icon: '声音_${Rtc.audioRx().intVal}',
          padding: Pad(horizontal: 5),
          onItemClick:onItemClick,
        );
      },
    );
  }
}





class MicOperate extends StatefulWidget {

  MicOperate();

  @override
  State<StatefulWidget> createState()  => _MicOperateState();

}

class _MicOperateState extends State<MicOperate> {

  @override
  Widget build(BuildContext context) {

    final canSpeak = sceneMicCtrl().canSpeakRx;
    final myUid = OAuthCtrl.uid;


    PersonRoomMicCtrl personRoomMicCtrl = sceneMicCtrl<PersonRoomMicCtrl>();
    return GestureDetector(
      onTap: () {
        personRoomMicCtrl.micOperate();
      },
      child: Container(
        width: 68,
        height: 29,
        padding: EdgeInsets.only(left: 5),
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black.withAlpha(75),
        ),
        child: Obx(() {
          Widget icon;
          String title = "";
          bool micRx = Rtc.micRx.isTrue;
          int status = Rtc.status.value;
          if(micRx) {
            title = "开麦中";
            icon = Image.asset(IMG.format("room/mic/mic_join"), width: 15, height: 18,);
          } else if(status == PersonMicStatus.close.val) {
            title = "闭麦中";
            icon = Image.asset(IMG.format("room/mic/mic_disable"), width: 15, height: 18,);
          } else if(status == PersonMicStatus.disable.val) {
            title = "闭麦中";
            icon = Image.asset(IMG.format("room/mic/mic_disable"), width: 15, height: 18,);
          } else {
            title = "上麦";
            icon = Image.asset(IMG.format("room/mic/mic_enable"), width: 15, height: 18,);
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 15,
                height: 18,
                child: icon,
              ),

              SizedBox(width: 6,),
              Text(
                title,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}

class _IconBtnSvg extends StatelessWidget {
  final String? icon;

  Pad padding;

  final ValueChanged<String>? onItemClick;

  _IconBtnSvg({this.icon, this.onItemClick, this.padding = const Pad(all: 5)}) : super(key: ValueKey(icon));

  @override
  Widget build(BuildContext context) {
    return IconBtnSvg(
      icon: icon,
      size: 28,
      padding: padding,
      onTap: onItemClick?.let((fn) => () => fn(icon!)),
    );
  }
}

class _IconBtn extends StatelessWidget {
  final String? icon;
  Pad padding;
  final ValueChanged<String>? onItemClick;

  _IconBtn({this.icon, this.onItemClick,this.padding = const Pad(all: 5)}) : super(key: ValueKey(icon));

  @override
  Widget build(BuildContext context) {
    return IconBtn(
      icon: icon,
      size: 28,
      padding: const Pad(horizontal: 5),
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
                    // Positioned(
                    //   child: Image.asset(IMG.format('room/房间消息提醒框'), width: 20, height: 20.7, scale: 3, fit: BoxFit.contain),
                    // ),
                    Positioned(
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
                        return AsyncAvatar(
                          uid: uid,
                          size: 26,
                          avatarFrameSize: 4,
                          onTap: Some(() => widget.onItemClick('消息_0')),
                        );
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
          SizedBox(height: 5,),
          IconBtnSvg(
            icon: "消息_0",
            size: 30,
            onTap: widget.onItemClick.let((fn) => () => fn("消息_0")),
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
