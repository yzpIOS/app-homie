import 'package:app/tools.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'code')
enum GenderEnum {
  unknown(0, '未知'),
  male(1, '男'),
  female(2, '女'),
  ;

  final int code;
  final String label;

  const GenderEnum(this.code, this.label);

  static GenderEnum? fromCode(int? code) {
    if (code is! int) return null;

    return GenderEnum.values.firstWhereOrNull((it) => it.code == code);
  }
}
