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

  ///根据月份和日期获取星座
  ///例子: 19960515, 则getConstellationWith(5,15);
  ///[month]月份
  ///[day] 日期
  static String getConstellationWith(DateTime dateTime) {
    const String capricorn = '摩羯座'; //Capricorn 摩羯座（12月22日～1月20日）
    const String aquarius = '水瓶座'; //Aquarius 水瓶座（1月21日～2月19日）
    const String pisces = '双鱼座'; //Pisces 双鱼座（2月20日～3月20日）
    const String aries = '白羊座'; //3月21日～4月20日
    const String taurus = '金牛座'; //4月21～5月21日
    const String gemini = '双子座'; //5月22日～6月21日
    const String cancer = '巨蟹座'; //Cancer 巨蟹座（6月22日～7月22日）
    const String leo = '狮子座'; //Leo 狮子座（7月23日～8月23日）
    const String virgo = '处女座'; //Virgo 处女座（8月24日～9月23日）
    const String libra = '天秤座'; //Libra 天秤座（9月24日～10月23日）
    const String scorpio = '天蝎座'; //Scorpio 天蝎座（10月24日～11月22日）
    const String sagittarius = '射手座'; //Sagittarius 射手座（11月23日～12月21日）
    String constellation = '';

    int month = dateTime.month;
    int day = dateTime.day;

    switch (month) {
      case DateTime.january:
        constellation = day < 21 ? capricorn : aquarius;
        break;
      case DateTime.february:
        constellation = day < 20 ? aquarius : pisces;
        break;
      case DateTime.march:
        constellation = day < 21 ? pisces : aries;
        break;
      case DateTime.april:
        constellation = day < 21 ? aries : taurus;
        break;
      case DateTime.may:
        constellation = day < 22 ? taurus : gemini;
        break;
      case DateTime.june:
        constellation = day < 22 ? gemini : cancer;
        break;
      case DateTime.july:
        constellation = day < 23 ? cancer : leo;
        break;
      case DateTime.august:
        constellation = day < 24 ? leo : virgo;
        break;
      case DateTime.september:
        constellation = day < 24 ? virgo : libra;
        break;
      case DateTime.october:
        constellation = day < 24 ? libra : scorpio;
        break;
      case DateTime.november:
        constellation = day < 23 ? scorpio : sagittarius;
        break;
      case DateTime.december:
        constellation = day < 22 ? sagittarius : capricorn;
        break;
    }

    return constellation;
  }
}

class TimeFormat {
  TimeFormat._();

  static final MMMd = DateFormat.MMMd();
  static final yMMMMd = DateFormat.yMMMMd();
  static final yMMMMdHms = yMMMMd.add_Hms();
  static final yyMMdd = DateFormat('yyMMdd');
  static final yyyyMMdd = DateFormat('yyyy-MM-dd');
  static final yyyyMMddHms = yyyyMMdd.add_Hms();

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
