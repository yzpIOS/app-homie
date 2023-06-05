import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'code')
enum ApiSwitch {
  open(1, '开放'),
  close(2, '关闭'),
  ;

  final int code;
  final String label;

  const ApiSwitch(this.code, this.label);
}
