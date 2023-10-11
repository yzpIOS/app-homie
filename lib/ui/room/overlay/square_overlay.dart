import 'package:app/common/theme.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/room/chat/room_msg_view.dart';
import 'package:app/ui/room/overlay/scene_overlay.dart';
import 'package:app/ui/room/overlay/scene_overlay_bottom_bar.dart';
import 'package:app/ui/room/widgets/room_get_widget.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class SquareOverlay extends SceneOverlay<SquareCtrl> {
  SquareOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape = context.watch<Orientation>() == Orientation.landscape;

    return Obx(() {
      return Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: AppSize.safeTop,
            left: 5,
            right: 5,
            height: 44,
            child: _RoomHeader(onItemClick: onItemClick),
          ),
          Positioned.fill(
            top: isLandscape ? 80 : 110,
            child: controller.chatMsgViewIsShowRx() ? const RoomChatView() : Spacing.blank,
          ),
          // Positioned(
          //   right: 10,
          //   child: Animate(
          //     effects: rightEffect,
          //     child: _RoomRight(onItemClick: onItemClick),
          //   ),
          // ),
          if (controller.bottomBarIsShowRx())
            Positioned(
              bottom: AppSize.safeBottom,
              height: 50,
              width: AppSize.width,
              child: Padding(
                padding: const Pad(horizontal: 5),
                child: Animate(
                  effects: bottomEffect,
                  child: SceneOverlayBottomBar<SquareCtrl>(onItemClick: onItemClick),
                ),
              ),
            ),
        ],
      );
    });
  }

  @override
  void onItemClick(String action) {
    switch (action) {
      case '更多':
        Get.showActionSheet(['退出']).onNotNull(onItemClick);
        break;
    // case '公告2':
    //   Get.dialog(RoomNoticeDialog());
    //   break;
      case '地图':
        break;
      default:
        super.onItemClick(action);
    }
  }
}

class _IconBtn extends StatelessWidget {
  final String icon;
  final ValueChanged<String>? onTap;

  _IconBtn({required this.icon, this.onTap}) : super(key: ValueKey(icon));

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap == null ? null : () => onTap!(icon),
      child: Box(
        padding: const Pad(all: 5),
        child: SvgView(SVG.$('room/$icon')),
      ),
    );
  }
}

// class _BlurBtn extends StatelessWidget {
//   final String icon;
//   final ValueChanged<String>? onTap;
//
//   _BlurBtn({required this.icon, this.onTap}) : super(key: ValueKey(icon));
//
//   @override
//   Widget build(BuildContext context) {
//     return BlurView(
//       borderRadius: AppBorderRadius.all4,
//       child: InkResponse(
//         onTap: onTap == null ? null : () => onTap!(icon),
//         child: Box(
//           width: 26,
//           height: 26,
//           child: SvgView(SVG.$('room/$icon'), fit: BoxFit.none),
//         ),
//       ),
//     );
//   }
// }

class _RoomHeader extends RoomGetView<SquareCtrl> {
  final ValueChanged<String> onItemClick;

  const _RoomHeader({required this.onItemClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacing.exp,
        _IconBtn(icon: '更多', onTap: onItemClick),
      ],
    );
  }
}

// class _RoomRight extends RoomGetView<SquareCtrl> {
//   final ValueChanged<String> onItemClick;
//
//   const _RoomRight({Key? key, required this.onItemClick}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         _BlurBtn(icon: '公告2', onTap: onItemClick),
//         _BlurBtn(icon: '地图', onTap: onItemClick),
//         _BlurBtn(icon: '拍照2', onTap: onItemClick),
//       ].separator(Spacing.h20).toList(growable: false),
//     );
//   }
// }
