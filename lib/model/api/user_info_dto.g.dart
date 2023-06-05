// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInfoDto _$$_UserInfoDtoFromJson(Map<String, dynamic> json) =>
    _$_UserInfoDto(
      uid: json['uid'],
      account: json['public_id'] as String?,
      avatar: json['avatar_url'] as String?,
      avatarEx: json['avatar_extra'] as String?,
      nickName: json['username'] as String?,
      gender: $enumDecode(_$GenderEnumEnumMap, json['sex']),
      level: json['level'] as String?,
      charmLevel: json['charm_level'] as String?,
      remarkName: json['remarks_name'] as String?,
    );

Map<String, dynamic> _$$_UserInfoDtoToJson(_$_UserInfoDto instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'public_id': instance.account,
      'avatar_url': instance.avatar,
      'avatar_extra': instance.avatarEx,
      'username': instance.nickName,
      'sex': _$GenderEnumEnumMap[instance.gender]!,
      'level': instance.level,
      'charm_level': instance.charmLevel,
      'remarks_name': instance.remarkName,
    };

const _$GenderEnumEnumMap = {
  GenderEnum.unknown: 0,
  GenderEnum.male: 1,
  GenderEnum.female: 2,
};
