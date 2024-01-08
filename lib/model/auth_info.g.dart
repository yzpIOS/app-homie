// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthInfo _$$_AuthInfoFromJson(Map<String, dynamic> json) => _$_AuthInfo(
      token: json['token'] as String,
      uid: json['uid'],
      nuid: json['nuid'],
      sex: json['sex'] as int,
      real_name_type: json['real_name_type'] as int,
      show_name: json['show_name'] as String? ?? ""
    );

Map<String, dynamic> _$$_AuthInfoToJson(_$_AuthInfo instance) =>
    <String, dynamic>{
      'token': instance.token,
      'uid': instance.uid,
      'nuid': instance.nuid,
      'sex': instance.sex,
      'real_name_type': instance.real_name_type,
      'show_name': instance.show_name,
    };
