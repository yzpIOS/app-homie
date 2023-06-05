import 'package:intl/intl.dart';

extension XNum on num {
  String format({String pattern = '0.##'}) => NumberFormat(pattern).format(this);
}

extension XStringNum on String {
  String format({String pattern = '0.##'}) => num.parse(this).format(pattern: pattern);
}
