import 'dart:io';

import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:record/record.dart';

enum _State {
  init('点击开始录制'),
  recording('点击停止录制'),
  done('点击开始试听'),
  playing('点击停止试听');

  final String tips;

  const _State(this.tips);
}

class VoiceRecordDialog extends StatefulWidget {
  final Duration min, max;

  const VoiceRecordDialog({
    super.key,
    this.min = const Duration(seconds: 1),
    this.max = const Duration(minutes: 1),
  });

  @override
  State<VoiceRecordDialog> createState() => _VoiceRecordDialogState();
}

class _VoiceRecordDialogState extends State<VoiceRecordDialog> {
  final stateRx = Rx(_State.init);
  final fileRx = Rxn<Tuple2<File, Duration>>();

  final player = AudioPlayer();
  final recorder = Record();

  late final min = widget.min;
  late final max = widget.max;

  final playbackRx = Rxn<Duration>();
  final recordingRx = Rxn<Stopwatch>();

  @override
  void initState() {
    super.initState();

    playbackRx.bindStream(player.positionStream);
  }

  @override
  void dispose() {
    Future.wait(
      [
        player.dispose(),
        recorder.dispose(),
      ],
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 14, color: AppPalette.c3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          $CloseBtn(),
          $TimeView(),
          $TipsView1(),
          const Spacing(height: 40, flex: null),
          $ActionView(),
          const Spacing(height: 40, flex: null),
          $TipsView2(),
        ],
      ),
    );
  }

  Widget $ActionView() {
    final actions = {
      _State.init: Tuple2('voice/录音', startRecorder),
      _State.recording: Tuple2('voice/暂停', stopRecorder),
      _State.done: Tuple2('voice/播放', startPlayer),
      _State.playing: Tuple2('voice/暂停', stopPlayer),
    };

    final children = <Widget>[
      Box(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        child: Obx(() {
          return fileRx.isNull()
              ? Spacing.blank
              : InkResponse(
                  onTap: doReset,
                  child: Image.asset(IMG.format('voice/重置'), scale: 3),
                );
        }),
      ),
      Box(
        width: 80,
        height: 80,
        alignment: Alignment.center,
        child: Obx(() {
          final val = actions[stateRx()]!;

          return InkResponse(
            onTap: val.value2,
            child: OpacityButton(
              onTap: val.value2,
              child: Image.asset(IMG.format(val.value1), scale: 3),
            ),
          );
        }),
      ),
      Box(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        child: Obx(() {
          return fileRx.isNull()
              ? Spacing.blank
              : InkResponse(
                  onTap: doDone,
                  child: Image.asset(IMG.format('voice/确定'), scale: 3),
                );
        }),
      ),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }

  Widget $TimeView() {
    final child = Obx(
      () {
        final playback = playbackRx();
        final recording = recordingRx();

        final children = <Widget>[
          if (playback != null && playback > Duration.zero) ...[
            XText(playback.format()),
            const XText('｜'),
          ],
          $RecordTimeView(recording),
        ];

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          mainAxisSize: MainAxisSize.min,
          children: children,
        );
      },
    );

    return Box(
      height: 42,
      alignment: Alignment.center,
      child: DefaultTextStyle.merge(
        style: const TextStyle(fontSize: 30, color: AppPalette.c3, fontWeight: fw$Medium),
        child: child,
      ),
    );
  }

  Widget $RecordTimeView(Stopwatch? watch) {
    Widget text(Duration dur) => XText(dur.format());

    if (watch == null) {
      return text(Duration.zero);
    } else if (watch.isRunning) {
      final tween = IntTween(begin: 0, end: max.inSeconds);

      return TweenAnimationBuilder(
        key: ValueKey(watch),
        tween: tween,
        duration: max,
        onEnd: stopRecorder,
        builder: (_, int s, __) => text(Duration(seconds: s)),
      );
    } else {
      return text(watch.elapsed);
    }
  }

  Widget $CloseBtn() {
    return const Align(
      alignment: Alignment.topRight,
      child: CloseButton(),
    );
  }

  Widget $TipsView({required String tips, Color? color}) {
    return Box(
      height: 20,
      alignment: Alignment.center,
      child: XText(tips, style: TextStyle(color: color)),
    );
  }

  Widget $TipsView1() {
    return Obx(() => $TipsView(tips: stateRx().tips));
  }

  Widget $TipsView2() {
    return Obx(() {
      late final String tips;

      switch (stateRx()) {
        case _State.init:
        case _State.recording:
          tips = '最短${min.inSeconds}s，最长${max.inSeconds}s';
          break;
        case _State.done:
        case _State.playing:
          tips = '录制完成';
          break;
      }

      return $TipsView(tips: tips, color: AppPalette.c3);
    });
  }

  void startRecorder() async {
    doReset();

    if (await recorder.hasPermission()) {
      await recorder.start();

      recordingRx(Stopwatch()..start());

      stateRx(_State.recording);
    }
  }

  void stopRecorder() async {
    final path = await recorder.stop();

    if (path == null) {
      assert(false, '数据错误');
    } else {
      try {
        final uri = Uri.parse(path);
        final dur = await player.setAudioSource(AudioSource.uri(uri));

        if (dur != null && dur >= min) {
          stateRx(_State.done);
          fileRx(Tuple2(File.fromUri(uri), dur));
          recordingRx.update((val) => val!.stop());

          return;
        } else {
          showToast('录制声音过短');
        }
      } catch (e, s) {
        errLog(e, s);

        showToast('Err');
      }
    }

    doReset();
  }

  void startPlayer() async {
    player.play();

    stateRx(_State.playing);
  }

  void stopPlayer() {
    player.stop();

    doResetPlayer();
  }

  void doResetPlayer() {
    playbackRx.nil();

    stateRx(_State.done);
  }

  void doReset() {
    player.stop();

    fileRx.nil();
    playbackRx.nil();
    recordingRx.nil();

    stateRx(_State.init);
  }

  void doDone() => Get.back(result: fileRx());
}
