import 'package:app/model/enum/gender_enum.dart';
import 'package:app/model/json_converter.dart';
import 'package:app/types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fixnum/fixnum.dart';

part 'user_info_dto.freezed.dart';
part 'user_info_dto.g.dart';

@freezed
class UserInfoDto with _$UserInfoDto {
  factory UserInfoDto({
    @JsonKey(name: 'uid') required UID uid,
    @JsonKey(name: 'role_id') @MyJsonConverter() Int64? nuid,
    @JsonKey(name: 'public_id') String? account,
    @JsonKey(name: 'avatar_url') String? avatar,
    @JsonKey(name: 'desc') String? desc,
    @JsonKey(name: 'star_sign') String? starSign,
    @JsonKey(name: 'location') String? location,
    @JsonKey(name: 'age_show') String? ageShow,
    @JsonKey(name: 'avatar_extra') String? avatarEx,
    @JsonKey(name: 'username') @Deprecated("使用 showName") String? nickName,
    @JsonKey(name: 'sex') required GenderEnum gender,
    @JsonKey(name: 'level') String? level,
    @JsonKey(name: 'charm_level') String? charmLevel,
    @JsonKey(name: 'remarks_name') String? remarkName,
  }) = _UserInfoDto;

  factory UserInfoDto.fromJson(Map<String, dynamic> json) => _$UserInfoDtoFromJson(json);

  factory UserInfoDto.fromApi(UID uid, Map data) {
    return UserInfoDto.fromJson(data.cast()).copyWith(uid: uid);
  }
}

extension XUserInfoDto on UserInfoDto {
  String showName() {
    String? tmp;

    tmp = remarkName;
    if (tmp != null && tmp.isNotEmpty) return tmp;

    tmp = nickName;
    if (tmp != null && tmp.isNotEmpty) return tmp;

    tmp = account;
    if (tmp != null && tmp.isNotEmpty) return tmp;

    return uid;
  }
}
