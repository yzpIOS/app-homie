import 'package:app/tools.dart';

enum MoneyType {
  diamond(0, '紫钻'),
  gold(1, '黄钻'),
  homie(2, '黑钻'),
  activity(3, '活跃度'),
  ;

  final int val;
  final String label;

  const MoneyType(this.val, this.label);

  static MoneyType? fromVal(int? val) {
    if (val is! int) return null;

    return MoneyType.values.firstWhereOrNull((it) => it.val == val);
  }
}
