import 'package:app/types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_info.freezed.dart';
part 'auth_info.g.dart';

@freezed
class AuthInfo with _$AuthInfo {
  factory AuthInfo({
    required String token,
    required UID uid,
    required NUID nuid,
    required int sex,
    required int real_name_type,
    required String show_name,
  }) = _AuthInfo;

  factory AuthInfo.fromJson(Map<String, dynamic> json) => _$AuthInfoFromJson(json);
}
