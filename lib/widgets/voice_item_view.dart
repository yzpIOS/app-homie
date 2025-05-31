import 'package:app/common/theme.dart';
import 'package:app/store/sound_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class VoiceItemView extends StatelessWidget {
  final Uri uri;
  final Duration? dur;

  VoiceItemView({required this.uri, this.dur}) : super(key: ValueKey(uri));

  factory VoiceItemView.fromMap(Map data) {
    try {
      final dur = Duration(milliseconds: data['dur']);

      return VoiceItemView(uri: Uri.parse(data['url']), dur: dur);
    } catch (_) {
      return VoiceItemView(uri: Uri.http('localhost', ''));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Box(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          child: $Icon(),
        ),
        Image.asset(IMG.format('voice/波形'), width: 56, height: 20, scale: 3),
        if (dur != null) //
          XText(
            dur!.format2(),
            style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: fw$Medium),
          ),
      ].separator(Spacing.w10).toList(growable: false),
    );

    child = Box(
      padding: const Pad(horizontal: 10, vertical: 6),
      child: child,
    );

    child = InkWell(
      child: child,
      onTap: () => Get.find<SoundCtrl>().doPlay(uri),
    );

    return Material(
      color: const Color(0xFF434D6A),
      borderRadius: AppBorderRadius.a8,
      clipBehavior: Clip.hardEdge,
      child: child,
    );
  }

  Widget $Icon() {
    return SoundCtrl.use(uri, (playing, state) {
      return AnimatedSwitcher(
        key: const Key(''),
        duration: kTabScrollDuration,
        child: () {
          Widget $Icon(String icon) {
            return Image.asset(key: Key(icon), scale: 3, IMG.format('voice/$icon'));
          }

          if (playing) {
            return $Icon('语音暂停');
          } else if (state == null) {
            return $Icon('语音播放');
          } else {
            switch (state) {
              case ProcessingState.idle:
                return $Icon('语音播放');
              case ProcessingState.loading:
              case ProcessingState.buffering:
                return const CircularProgressIndicator(strokeWidth: 1);
              case ProcessingState.ready:
              case ProcessingState.completed:
                return $Icon('语音播放');
            }
          }
        }(),
      );
    });
  }
}
