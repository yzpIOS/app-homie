// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyInfoDto _$$_MyInfoDtoFromJson(Map<String, dynamic> json) => _$_MyInfoDto(
      uid: json['uid'],
      account: json['public_id'] as String?,
      avatar: json['avatar_url'] as String?,
      avatarEx: json['avatar_extra'] as String?,
      nickName: json['username'] as String?,
      desc: json['desc'] as String?,
      gender: $enumDecodeNullable(_$GenderEnumEnumMap, json['sex']),
      level: json['level'] as String?,
      birthDay:
          const EpochDateTimeConverter().fromJson(json['data_birth'] as int?),
      fansCount: json['fans_count'] as int?,
      followCount: json['follow_count'] as int?,
      accessCount: json['access_user_count'] as int?,
      realNameType: json['real_name_type'] as int?,
      addr: json['addr'] == null
          ? null
          : MyAddrDto.fromJson(json['addr'] as Map<String, dynamic>),
      showWinningLottery: json['show_winning_lottery'] as bool?,
    );

Map<String, dynamic> _$$_MyInfoDtoToJson(_$_MyInfoDto instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'public_id': instance.account,
      'avatar_url': instance.avatar,
      'avatar_extra': instance.avatarEx,
      'username': instance.nickName,
      'desc': instance.desc,
      'sex': _$GenderEnumEnumMap[instance.gender],
      'level': instance.level,
      'data_birth': const EpochDateTimeConverter().toJson(instance.birthDay),
      'fans_count': instance.fansCount,
      'follow_count': instance.followCount,
      'access_user_count': instance.accessCount,
      'real_name_type': instance.realNameType,
      'addr': instance.addr,
      'show_winning_lottery': instance.showWinningLottery,
    };

const _$GenderEnumEnumMap = {
  GenderEnum.unknown: 0,
  GenderEnum.male: 1,
  GenderEnum.female: 2,
};

_$_MyAddrDto _$$_MyAddrDtoFromJson(Map<String, dynamic> json) => _$_MyAddrDto(
      country: json['country'] as int,
      province: json['province'] as int,
      city: json['city'] as int,
      district: json['district'] as int,
    );

Map<String, dynamic> _$$_MyAddrDtoToJson(_$_MyAddrDto instance) =>
    <String, dynamic>{
      'country': instance.country,
      'province': instance.province,
      'city': instance.city,
      'district': instance.district,
    };
