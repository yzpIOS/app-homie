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
  // 从URL创建视频页面
  factory VideoPage.fromUrl(String url) {
    return VideoPage._(Media(url));
  }
 // 从文件创建视频页面
  factory VideoPage.fromFile(File file) {
    return VideoPage._(
      file.existsSync() ? Media(file.uri.toString()) : null,
    );
  }

  @override
  State<VideoPage> createState() => _VideoPageState();
}
// 2. 视频播放器实现
class _VideoPageState extends State<VideoPage> {
  // 视频控制器
  final controller = Rxn<VideoController>();

  // 播放器实例
  final player = Player(
    configuration: const PlayerConfiguration(logLevel: MPVLogLevel.error),
  );

  // 状态管理
  final durationRx = Rx(Duration.zero);      // 视频时长
  final positionRx = Rx(Duration.zero);      // 播放位置
  final bufferRx = Rx(Duration.zero);        // 缓冲进度
  final playingRx = RxBool(false);           // 是否正在播放
  final completedRx = RxBool(false);         // 是否播放完成
  final bufferingRx = RxBool(false);         // 是否正在缓冲

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
    // 创建视频控制器
    final videoCtrl = VideoController(player);

    // 绑定状态流
    final stream = player.stream;
    durationRx.bindStream(stream.duration);
    positionRx.bindStream(stream.position);
    completedRx.bindStream(stream.completed);
    playingRx.bindStream(stream.playing);
    bufferingRx.bindStream(stream.buffering);
    bufferRx.bindStream(stream.buffer);

    // 打开视频
    await player.open(playable);

    // 设置控制器
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
