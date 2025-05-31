import 'package:app/tools.dart';

enum PersonMicStatus {
  none(0, '上麦'),
  open(1, '你已上麦'),
  close(2, '闭麦中'),
  disable(3, '房主闭麦中'),
  ;

  final int val;
  final String label;

  const PersonMicStatus(this.val, this.label);

  static PersonMicStatus? fromVal(int? val) {
    if (val is! int) return null;

    return PersonMicStatus.values.firstWhereOrNull((it) => it.val == val);
  }
}