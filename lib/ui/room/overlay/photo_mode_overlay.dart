import 'dart:convert';
import 'dart:io';

import 'package:app/common/theme.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/room/overlay/scene_overlay.dart';
import 'package:app/ui/room/widgets/room_get_widget.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:photo_manager/photo_manager.dart';

class PhotoModeOverlay extends SceneOverlay {
  PhotoModeOverlay({super.key});

  @override
  Widget build(BuildContext context) {
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
        Positioned(
          bottom: AppSize.safeBottom + 80,
          width: 54,
          height: 54,
          child: _TakePhotoView(size: 54),
        ),
      ],
    );
  }
}

class _RoomHeader extends RoomGetView<SquareCtrl> {
  final ValueChanged<String> onItemClick;

  const _RoomHeader({required this.onItemClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacing.exp,
        CloseButton(
          color: Colors.white,
          onPressed: () => onItemClick('退出自拍'),
        ),
      ],
    );
  }
}

class _TakePhotoView extends GetView<UnityCtrl> {
  final double size;

  _TakePhotoView({required this.size});

  final keepModeRx = RxBool(false);
  final videoFutureRx = Rxn<Timer>();

  final maxDuration = const Duration(minutes: 1);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            if (keepModeRx() && !videoFutureRx.isNull()) {
              endMakeVideo();
            } else {
              makePhoto();
            }
          },
          // onLongPressStart: (_) {
          //   keepModeRx(false);
          //
          //   if (videoFutureRx.isNull()) startMakeVideo();
          // },
          // onLongPressEnd: (_) {
          //   if (keepModeRx.isFalse && !videoFutureRx.isNull()) endMakeVideo();
          // },
          // onLongPressMoveUpdate: (_) {
          //   keepModeRx(true);
          // },
          child: Obx(
            () => videoFutureRx.isNull() //
                ? SvgView(SVG.$('room/开始拍照'), width: size, height: size)
                : SvgView(SVG.$('room/开始录像'), width: size, height: size),
          ),
        ),
        IgnorePointer(
          child: Obx(
            () => videoFutureRx.isNull()
                ? Spacing.blank
                : TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: maxDuration,
                    builder: (context, value, child) {
                      return CircularPercentIndicator(
                        percent: value,
                        radius: size / 2,
                        lineWidth: 2,
                        animation: false,
                        backgroundColor: Colors.transparent,
                        progressColor: const Color(0xFFFE3D3D),
                        circularStrokeCap: CircularStrokeCap.round,
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }

  void startMakeVideo() async {
    if (videoFutureRx.isNull()) {
      await controller.sendMessage(App2UnityEnum.FTU_PICTURE_REPLAY_START);

      HapticFeedback.vibrate();

      videoFutureRx(
        Timer(maxDuration, endMakeVideo),
      );
    } else {
      assert(false, '数据错误');
    }
  }

  void endMakeVideo() {
    final timer = videoFutureRx();

    if (timer != null) {
      timer.cancel();
      videoFutureRx.nil();

      simpleSub(
        controller.sendMessage(App2UnityEnum.FTU_PICTURE_REPLAY_STOP).then((val) {
          final path = jsonDecode(val);

          return PhotoManager.editor.saveVideo(
            File(path),
            title: FileHelp.basenameWithoutExtension(path),
          );
        }),
        callback1: (resp) {
          showToast('已保存至相册');
        },
      );
    } else {
      assert(false, '数据错误');
    }
  }

  void makePhoto() {
    HapticFeedback.mediumImpact();

    simpleSub(
      controller.sendMessage(App2UnityEnum.FTU_PICTURE_JPG).then((val) {
        final path = jsonDecode(val);

        return PhotoManager.editor.saveImageWithPath(
          path,
          title: FileHelp.basenameWithoutExtension(path),
        );
      }),
      callback1: (resp) {
        showToast('已保存至相册');
      },
    );
  }
}
