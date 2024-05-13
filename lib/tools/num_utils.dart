import 'package:intl/intl.dart';

extension XNum on num {
  String format({String pattern = '0.##'}) => NumberFormat(pattern).format(this);
}

extension XStringNum on String {
  String format({String pattern = '0.##'}) => num.parse(this).format(pattern: pattern);
}

class NumberUtils {
  NumberUtils._privateConstructor();
  static final NumberUtils _instance = NumberUtils._privateConstructor();
  static NumberUtils get instance => _instance;

  String formatNumber(int number) {
    if(number < 10000){
      return number.toString();
    }else if(number < 10000000){
      return "${(number / 10000.0).toStringAsFixed(1)}W";
    }else{
      return "${(number / 10000000.0).toStringAsFixed(1)}KW";
    }
  }
}
