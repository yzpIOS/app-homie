import 'package:app/3rd/tencent/rtc.dart';
import 'package:app/common/theme.dart';
import 'package:app/exception.dart';
import 'package:app/model/enum/room_state.dart';
import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'package:app/ui/room/room_page.dart';
import 'package:app/ui/room/widgets/room_get_widget.dart';

class RoomMiniView extends StatelessWidget {
  static const double _limit = 168;

  static final _width = AppSize.width;
  static final _height = AppSize.height;

  const RoomMiniView({super.key});

  @override
  Widget build(BuildContext context) {
    const miniView = _MiniView();
    final miniSize = miniView.preferredSize;

    final right = _width - miniSize.width;
    final middle = _height * 0.3 - miniSize.height * 0.5;

    final rxVal = Rx(
      Tuple2(
        Offset(right, middle),
        Offset(right, middle),
      ),
    );

    final draggable = Draggable(
      feedback: miniView,
      childWhenDragging: Spacing.blank,
      onDragEnd: (it) {
        final x = it.offset.dx;
        final y = it.offset.dy;

        rxVal(
          Tuple2(
            it.offset,
            Offset(
              x > (right - x).abs() ? right : 0,
              _height - y < _limit ? _height - _limit : (y < _limit ? _limit : y),
            ),
          ),
        );
      },
      child: miniView,
    );

    return Align(
      alignment: Alignment.topLeft,
      child: Obx(
        () {
          final pos = rxVal();

          return TweenAnimationBuilder(
            key: ValueKey(pos),
            tween: Tween(begin: pos.value1, end: pos.value2),
            curve: Curves.easeOutCubic,
            duration: kThemeChangeDuration,
            child: draggable,
            builder: (_, val, child) {
              return Transform.translate(offset: val, child: child);
            },
          );
        },
      ),
    );
  }
}

class _MiniView extends RoomGetView<RoomCtrl> implements PreferredSizeWidget {
  const _MiniView();

  static const _size = Size(138, 50);

  @override
  Size get preferredSize => _size;

  @override
  Widget build(BuildContext context) {
    final data = controller.info;

    Widget child = Row(
      children: [
        ClipOval(
          clipBehavior: Clip.hardEdge,
          child: NetImage(
            data['image'] ?? data['scene_image'],
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
        Spacing.exp,
        Obx(
          () {
            final audioRx = Rtc.audioRx;

            return $IconBtn(
              icon: '声音',
              color: audioRx.isTrue ? Colors.red : const Color(0x4D000000),
              onTap: audioRx.toggle,
            );
          },
        ),
        Spacing.w10,
        $IconBtn(
          icon: '关闭',
          color: const Color(0x4D000000),
          onTap: doClose,
        ),
      ],
    );

    child = Box(
      width: _size.width,
      height: _size.height,
      padding: const Pad(left: 5, right: 10),
      child: child,
    );

    child = InkWell(onTap: RoomPage.show, child: child);

    child = Material(
      elevation: 4,
      color: Colors.white,
      clipBehavior: Clip.hardEdge,
      shape: const XStadiumBorder(),
      child: child,
    );

    return child;
  }

  Widget $IconBtn({required String icon, required Color color, required VoidCallback onTap}) {
    return InkResponse(
      onTap: onTap,
      child: SvgView(SVG.$('room/mini/$icon'), width: 30, height: 30, color: color),
    );
  }

  void doClose() async {
    final close = Get.find<RoomManagerCtrl>().doCloseState;

    if (controller.roomType != RoomType.guild && controller.getRole(OAuthCtrl.uid).isOwner) {
      Future api() async {
        try {
          await Api.Room.close();
        } on LogicException catch (e) {
          if (e.code != 16005) rethrow;
        }
      }

      await Get.alertSub(api, alert: '确定下播', callback: close);
    } else {
      close();
    }
  }
}
