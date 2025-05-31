import 'package:app/common/cache_manager.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:async/async.dart';
import 'package:quiver/cache.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';

final _cache = MapCache<String, MovieEntity>.lru(maximumSize: 3);

abstract class SvgaEffectCtrl extends GetxController with GetSingleTickerProviderStateMixin {
  late final SVGAAnimationController svgaCtrl;
  late final statusRx = Rx(AnimationStatus.dismissed);

  late final _ctrl = StreamController<String>(sync: true);
  late final _queue = StreamQueue(_ctrl.stream);
  late final _download = GiftCacheManager.obj.getSingleFile;

  @override
  void onInit() {
    super.onInit();

    svgaCtrl = SVGAAnimationController(vsync: this) //
      ..addStatusListener(statusRx);

    _doLoop().ignore();
  }

  @override
  void onClose() {
    [_queue.cancel, _ctrl.close].tryRun();

    svgaCtrl
      ..removeStatusListener(statusRx)
      ..dispose();

    super.onClose();
  }

  void play(String? url) {
    if (url == null || url.isEmpty) return;

    _download(url);
    _ctrl.add(url);
  }

  Future<void> _doLoop() async {
    while (await _queue.hasNext) {
      if (isClosed) return;

      try {
        final url = await _queue.next;
        if (isClosed) return;

        final movie = await _fetchMovie(url);
        if (isClosed) return;

        svgaCtrl
          ..videoItem = movie
          ..reset();

        await svgaCtrl.forward().orCancel;
        if (isClosed) return;
      } catch (e, s) {
        errLog(e, s, type: LogType.GIFT_EFFECT);
      }
    }
  }

  Future<MovieEntity?> _fetchMovie(String url) async {
    xlog(url, type: LogType.GIFT_EFFECT);

    return _cache.get(
      url,
      ifAbsent: (it) async {
        xlog('ifAbsent -> $it', type: LogType.GIFT_EFFECT);

        final file = await _download(it);
        xlog('CacheFile -> $file', type: LogType.GIFT_EFFECT);

        return await SVGAParser.shared.decodeFromBuffer(await file.readAsBytes())
          ..autorelease = false;
      },
    );
  }
}
