import 'package:app/model/converter/epoch_date_time_converter.dart';
import 'package:app/types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:app/model/enum/gender_enum.dart';

part 'my_info_dto.freezed.dart';

part 'my_info_dto.g.dart';

@freezed
class MyInfoDto with _$MyInfoDto {
  factory MyInfoDto({
    @JsonKey(name: 'uid') required UID uid,
    @JsonKey(name: 'public_id') String? account,
    @JsonKey(name: 'avatar_url') String? avatar,
    @JsonKey(name: 'avatar_extra') String? avatarEx,
    @JsonKey(name: 'username') String? nickName,
    @JsonKey(name: 'description') String? desc,
    @JsonKey(name: 'location') String? location,
    @JsonKey(name: 'star_sign') String? starSign,
    @JsonKey(name: 'age_show') String? ageShow,
    @JsonKey(name: 'sex') GenderEnum? gender,
    @JsonKey(name: 'level') String? level,
    @JsonKey(name: 'data_birth') @EpochDateTimeConverter() DateTime? birthDay,
    @JsonKey(name: 'fans_count') int? fansCount,
    @JsonKey(name: 'follow_count') int? followCount,
    @JsonKey(name: 'access_user_count') int? accessCount,
    @JsonKey(name: 'real_name_type') int? realNameType,
    @JsonKey(name: 'addr') MyAddrDto? addr,
    @JsonKey(name: 'show_winning_lottery') bool? showWinningLottery,

    @JsonKey(name: 'avatar_frame') String? avatar_frame,
    @JsonKey(name: 'chat_bubble') String? chat_bubble,
    @JsonKey(name: 'voice_party_background') String? voice_party_background,
    @JsonKey(name: 'approach_special_effect') String? approach_special_effect,
  }) = _MyInfoDto;

  factory MyInfoDto.fromJson(Map<String, dynamic> json) => _$MyInfoDtoFromJson(json);
}

@freezed
class MyAddrDto with _$MyAddrDto {
  factory MyAddrDto({
    required int country,
    required int province,
    required int city,
    required int district,
  }) = _MyAddrDto;

  factory MyAddrDto.fromJson(Map<String, dynamic> json) => _$MyAddrDtoFromJson(json);
}
