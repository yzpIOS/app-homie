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
      desc: json['description'] as String?,
      location: json['location'] as String?,
      starSign: json['star_sign'] as String?,
      ageShow: json['age_show'] as String?,
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

      chat_bubble: json["chat_bubble"] as String?,
      avatar_frame: json['avatar_frame'] as String?,
      voice_party_background: json['voice_party_background'] as String?,
      approach_special_effect: json['approach_special_effect'] as String?,
    );

Map<String, dynamic> _$$_MyInfoDtoToJson(_$_MyInfoDto instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'public_id': instance.account,
      'avatar_url': instance.avatar,
      'avatar_extra': instance.avatarEx,
      'username': instance.nickName,
      'description': instance.desc,
      'location': instance.location,
      'star_sign': instance.starSign,
      'age_show': instance.ageShow,
      'sex': _$GenderEnumEnumMap[instance.gender],
      'level': instance.level,
      'data_birth': const EpochDateTimeConverter().toJson(instance.birthDay),
      'fans_count': instance.fansCount,
      'follow_count': instance.followCount,
      'access_user_count': instance.accessCount,
      'real_name_type': instance.realNameType,
      'addr': instance.addr,
      'show_winning_lottery': instance.showWinningLottery,
    "chat_bubble": instance.chat_bubble,
    "avatar_frame":instance.avatar_frame,
    "voice_party_background":instance.voice_party_background,
    "approach_special_effect":instance.approach_special_effect,
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
