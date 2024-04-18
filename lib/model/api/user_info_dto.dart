import 'package:app/model/enum/gender_enum.dart';
import 'package:app/model/json_converter.dart';
import 'package:app/types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fixnum/fixnum.dart';

import 'package:app/model/converter/epoch_date_time_converter.dart';

part 'user_info_dto.freezed.dart';
part 'user_info_dto.g.dart';

@freezed
class UserInfoDto with _$UserInfoDto {
  factory UserInfoDto({
    @JsonKey(name: 'uid') required UID uid,
    @JsonKey(name: 'role_id') int? nuid,
    @JsonKey(name: 'public_id') String? account,
    @JsonKey(name: 'avatar_url') String? avatar,
    @JsonKey(name: 'description') String? desc,
    @JsonKey(name: 'star_sign') String? starSign,
    @JsonKey(name: 'location') String? location,
    @JsonKey(name: 'age_show') String? ageShow,
    @JsonKey(name: 'avatar_extra') String? avatarEx,
    @JsonKey(name: 'username') @Deprecated("使用 showName") String? nickName,
    @JsonKey(name: 'sex') required GenderEnum gender,
    @JsonKey(name: 'level') String? level,
    @JsonKey(name: 'data_birth') @EpochDateTimeConverter() DateTime? birthDay,
    @JsonKey(name: 'charm_level') String? charmLevel,
    @JsonKey(name: 'remarks_name') String? remarkName,
    @JsonKey(name: 'real_name_type') int? realNameType,

    @JsonKey(name: 'avatar_frame') String? avatar_frame,
    @JsonKey(name: 'chat_bubble') String? chat_bubble,
    @JsonKey(name: 'voice_party_background') String? voice_party_background,
    @JsonKey(name: 'approach_special_effect') String? approach_special_effect,
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

extension UserInfoOnMap on Map {
  String showName() {
    String? tmp;

    tmp = this["remarks_name"];
    if (tmp != null && tmp.isNotEmpty) return tmp;

    tmp = this["username"];
    if (tmp != null && tmp.isNotEmpty) return tmp;

    tmp = this["account"];
    if (tmp != null && tmp.isNotEmpty) return tmp;

    return this["uid"];
  }
}