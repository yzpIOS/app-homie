// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInfoDto _$$_UserInfoDtoFromJson(Map<String, dynamic> json) =>
    _$_UserInfoDto(
      uid: json['uid'],
      nuid: const MyJsonConverter().fromJson(json['role_id']),
      account: json['public_id'] as String?,
      avatar: json['avatar_url'] as String?,
      desc: json['description'] as String?,
      location: json['location'] as String?,
      starSign: json['star_sign'] as String?,
      ageShow: json['age_show'] as String?,
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
      'role_id': _$JsonConverterToJson<dynamic, Int64>(
          instance.nuid, const MyJsonConverter().toJson),
      'public_id': instance.account,
      'avatar_url': instance.avatar,
      'description': instance.desc,
      'location': instance.location,
      'star_sign': instance.starSign,
      'age_show': instance.ageShow,
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

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
