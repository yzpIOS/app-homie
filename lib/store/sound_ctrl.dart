import 'package:app/tools.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';

class SoundCtrl extends GetxController {
  final player = AudioPlayer();

  final dataRx = Rxn<Uri>();
  final stateRx = Rx(PlayerState(false, ProcessingState.idle));

  @override
  void onInit() {
    super.onInit();

    stateRx.bindStream(player.playerStateStream);
  }

  void doPlay(Uri uri) async {
    if (dataRx() == uri) {
      final state = player.playerState;

      xlog('重复播放 -> $state');

      if (state.playing) {
        switch (state.processingState) {
          case ProcessingState.idle:
            break;
          case ProcessingState.loading:
          case ProcessingState.buffering:
          case ProcessingState.ready:
            return await player.pause();
          case ProcessingState.completed:
            return await player.seek(Duration.zero);
        }
      } else {
        return await player.play();
      }
    }

    final source = AudioSource.uri(uri);

    dataRx(uri);
    stateRx(PlayerState(false, ProcessingState.idle));

    xlog('播放 -> $uri');

    await _doPlay(source);
  }

  Future<void> _doPlay(AudioSource source) async {
    try {
      await player.setAudioSource(source);
      await player.play();
    } catch (e, s) {
      errLog(e, s);

      dataRx.nil();
      stateRx(PlayerState(false, ProcessingState.idle));
    }
  }

  @override
  void onClose() {
    player.dispose();
  }

  static Widget use(Uri uri, Widget Function(bool playing, ProcessingState? state) builder) {
    return KeyedSubtree(
      key: ValueKey(uri),
      child: GetX<SoundCtrl>(
        builder: (it) {
          final b = it.dataRx() == uri;

          if (b) {
            final val = it.stateRx();

            final state = val.processingState;
            final playing = val.playing && state != ProcessingState.completed;

            return builder(playing, state);
          } else {
            return builder(false, null);
          }
        },
      ),
    );
  }
}
