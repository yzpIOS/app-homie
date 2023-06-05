import 'dart:io';
import 'dart:ui';

import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

final _init = MediaKit.ensureInitialized();

class VideoPage extends StatefulWidget {
  final Media? playable;

  VideoPage._(this.playable) {
    _init;
  }

  factory VideoPage.fromUrl(String url) {
    return VideoPage._(Media(url));
  }

  factory VideoPage.fromFile(File file) {
    return VideoPage._(
      file.existsSync() ? Media(file.uri.toString()) : null,
    );
  }

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  final controller = Rxn<VideoController>();
  final player = Player(
    configuration: const PlayerConfiguration(logLevel: MPVLogLevel.error),
  );

  final durationRx = Rx(Duration.zero);
  final positionRx = Rx(Duration.zero);
  final bufferRx = Rx(Duration.zero);
  final playingRx = RxBool(false);
  final completedRx = RxBool(false);
  final bufferingRx = RxBool(false);

  @override
  void initState() {
    super.initState();

    late final playable = widget.playable;

    if (playable == null) {
      post(() => Get.alertDialog('数据错误'));

      return;
    }

    _init(playable);
  }

  void _init(Media playable) async {
    final videoCtrl = VideoController(player);

    final streams = player.streams;

    durationRx.bindStream(streams.duration);
    positionRx.bindStream(streams.position);
    completedRx.bindStream(streams.completed);
    playingRx.bindStream(streams.playing);
    bufferingRx.bindStream(streams.buffering);
    bufferRx.bindStream(streams.buffer);

    await player.open(playable);

    controller(videoCtrl);
  }

  @override
  void dispose() {
    player.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Obx(
      () => controller()?.let($Video) ?? Spacing.blank,
    );

    child = Scaffold(
      backgroundColor: Colors.black,
      appBar: xAppBar(bgColor: Colors.transparent),
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: $Bnb(),
      body: child,
    );

    return child;
  }

  Widget $Bnb() {
    const color1 = Color(0x9DFFFFFF);
    const color2 = AppPalette.primary;

    Widget child = Obx(() {
      final duration = durationRx();
      final position = positionRx();

      final percent = position.inMicroseconds / duration.inMicroseconds;

      return Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: LinearPercentIndicator(
              lineHeight: 1,
              padding: Pad.zero,
              percent: completedRx.isTrue ? 1 : (percent.isNaN ? 0 : percent),
              progressColor: color2,
              backgroundColor: color1,
            ),
          ),
          Positioned(
            left: 0,
            child: Obx(() {
              return IconButton(
                icon: playingRx.isTrue ? const Icon(Icons.pause_rounded) : const Icon(Icons.play_arrow_rounded),
                color: color1,
                onPressed: controller.isNull() ? null : player.playOrPause,
              );
            }),
          ),
          Positioned(
            right: 16,
            child: Text(
              '${completedRx.isTrue ? duration.format() : position.format()}/${duration.format()}',
              style: const TextStyle(fontFeatures: [FontFeature("tnum")]),
            ),
          ),
        ],
      );
    });

    return Padding(
      padding: Pad(bottom: AppSize.safeBottom),
      child: Box(
        height: 48,
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 14, color: color1),
          child: child,
        ),
      ),
    );
  }

  Widget $Video(VideoController controller) {
    final child = Stack(
      alignment: Alignment.center,
      children: [
        Video(controller: controller, fill: Colors.transparent),
        Obx(
          () => bufferingRx.isFalse
              ? Spacing.blank
              : const SizedBox(
                  width: 48,
                  height: 48,
                  child: CircularProgressIndicator(color: Colors.white),
                ),
        ),
      ],
    );

    return child;
  }
}
