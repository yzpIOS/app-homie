// ignore_for_file: non_constant_identifier_names

import 'package:app/tools.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class TimeUtils {
  TimeUtils._();

  static int now() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  static String fromNow(ms) {
    if (ms is int) return _fromNow(ms);

    if (ms is String) {
      try {
        return _fromNow(int.parse(ms));
      } catch (e, s) {
        errLog(e, s);
      }
    }

    return '';
  }

  static String _fromNow(int ms) => ms.toDateTime().fromNow();
}

class TimeFormat {
  TimeFormat._();

  static final MMMd = DateFormat.MMMd();
  static final yMMMMd = DateFormat.yMMMMd();
  static final yMMMMdHms = yMMMMd.add_Hms();
  static final yyMMdd = DateFormat('yyMMdd');
  static final yyyyMMdd = DateFormat('yyyy-MM-dd');

  static Future<void> initLocale(String language) async {
    try {
      await Jiffy.setLocale(language);
    } catch (e, s) {
      errLog(e, s);

      await Jiffy.setLocale('en_US');
    }
  }
}

extension DateTimeInt on int {
  DateTime toDateTime({bool isMilli = true}) {
    return DateTime.fromMillisecondsSinceEpoch(isMilli ? this : this * 1000);
  }
}

extension XDateTime on DateTime {
  String fromNow() => toJiffy().fromNow();

  String pretty() {
    final format = (DateTime.now().year == year ? TimeFormat.MMMd : TimeFormat.yMMMMd).format;

    return format(this);
  }

  Duration diffNow() => difference(DateTime.now());

  Jiffy toJiffy() => Jiffy.parseFromMillisecondsSinceEpoch(millisecondsSinceEpoch);

  int get unixTimestamp => (millisecondsSinceEpoch / 1000).round();
}

extension XDateFormat on DateFormat {
  String formatEpoch(int? ms) {
    if (ms == null || ms == 0) return '';

    return format(ms.toDateTime());
  }
}
