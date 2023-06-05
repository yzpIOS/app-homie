import 'package:app/tools/log.dart';
import 'package:intl/intl.dart';
import 'package:timing/timing.dart';

Future<T> asyncTrack<T>(String label, {required Future<T> Function() action, LogType type = LogType.TRACK}) async {
  final tracker = SimpleAsyncTimeTracker();

  try {
    xlog('$label -> 开始', level: 0, type: type);

    final result = await tracker.track(action);

    xlog('$label -> 完成，耗时[${tracker.duration.format()}]', level: 1, type: type);

    return result;
  } catch (_) {
    xlog('$label -> 失败，耗时[${tracker.duration.format()}]', level: 3, type: type);
    rethrow;
  }
}

extension on Duration {
  static final _format = NumberFormat().format;

  String format() => '${_format(inMilliseconds)}ms';
}
