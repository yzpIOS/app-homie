import 'package:intl/intl.dart';

extension XDuration on Duration {
  static final _format = NumberFormat('00');

  String format() {
    return [inMinutes, inSeconds.remainder(60)].map(_format.format).join(':');
  }

  String format2() {
    String out = '${inSeconds.remainder(60)}″';

    if (inMinutes > 0) {
      out = '$inMinutes′$out';
    }

    return out;
  }
}
