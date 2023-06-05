// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInfoDto _$UserInfoDtoFromJson(Map<String, dynamic> json) {
  return _UserInfoDto.fromJson(json);
}

/// @nodoc
mixin _$UserInfoDto {
  @JsonKey(name: 'uid')
  UID get uid => throw _privateConstructorUsedError;
  @JsonKey(name: 'public_id')
  String? get account => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_extra')
  String? get avatarEx => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  @Deprecated("使用 showName")
  String? get nickName => throw _privateConstructorUsedError;
  @JsonKey(name: 'sex')
  GenderEnum get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'level')
  String? get level => throw _privateConstructorUsedError;
  @JsonKey(name: 'charm_level')
  String? get charmLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'remarks_name')
  String? get remarkName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoDtoCopyWith<UserInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoDtoCopyWith<$Res> {
  factory $UserInfoDtoCopyWith(
          UserInfoDto value, $Res Function(UserInfoDto) then) =
      _$UserInfoDtoCopyWithImpl<$Res, UserInfoDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'uid') UID uid,
      @JsonKey(name: 'public_id') String? account,
      @JsonKey(name: 'avatar_url') String? avatar,
      @JsonKey(name: 'avatar_extra') String? avatarEx,
      @JsonKey(name: 'username') @Deprecated("使用 showName") String? nickName,
      @JsonKey(name: 'sex') GenderEnum gender,
      @JsonKey(name: 'level') String? level,
      @JsonKey(name: 'charm_level') String? charmLevel,
      @JsonKey(name: 'remarks_name') String? remarkName});
}

/// @nodoc
class _$UserInfoDtoCopyWithImpl<$Res, $Val extends UserInfoDto>
    implements $UserInfoDtoCopyWith<$Res> {
  _$UserInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? account = freezed,
    Object? avatar = freezed,
    Object? avatarEx = freezed,
    Object? nickName = freezed,
    Object? gender = null,
    Object? level = freezed,
    Object? charmLevel = freezed,
    Object? remarkName = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as UID,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarEx: freezed == avatarEx
          ? _value.avatarEx
          : avatarEx // ignore: cast_nullable_to_non_nullable
              as String?,
      nickName: freezed == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as GenderEnum,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      charmLevel: freezed == charmLevel
          ? _value.charmLevel
          : charmLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      remarkName: freezed == remarkName
          ? _value.remarkName
          : remarkName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserInfoDtoCopyWith<$Res>
    implements $UserInfoDtoCopyWith<$Res> {
  factory _$$_UserInfoDtoCopyWith(
          _$_UserInfoDto value, $Res Function(_$_UserInfoDto) then) =
      __$$_UserInfoDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'uid') UID uid,
      @JsonKey(name: 'public_id') String? account,
      @JsonKey(name: 'avatar_url') String? avatar,
      @JsonKey(name: 'avatar_extra') String? avatarEx,
      @JsonKey(name: 'username') @Deprecated("使用 showName") String? nickName,
      @JsonKey(name: 'sex') GenderEnum gender,
      @JsonKey(name: 'level') String? level,
      @JsonKey(name: 'charm_level') String? charmLevel,
      @JsonKey(name: 'remarks_name') String? remarkName});
}

/// @nodoc
class __$$_UserInfoDtoCopyWithImpl<$Res>
    extends _$UserInfoDtoCopyWithImpl<$Res, _$_UserInfoDto>
    implements _$$_UserInfoDtoCopyWith<$Res> {
  __$$_UserInfoDtoCopyWithImpl(
      _$_UserInfoDto _value, $Res Function(_$_UserInfoDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? account = freezed,
    Object? avatar = freezed,
    Object? avatarEx = freezed,
    Object? nickName = freezed,
    Object? gender = null,
    Object? level = freezed,
    Object? charmLevel = freezed,
    Object? remarkName = freezed,
  }) {
    return _then(_$_UserInfoDto(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as UID,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarEx: freezed == avatarEx
          ? _value.avatarEx
          : avatarEx // ignore: cast_nullable_to_non_nullable
              as String?,
      nickName: freezed == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as GenderEnum,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      charmLevel: freezed == charmLevel
          ? _value.charmLevel
          : charmLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      remarkName: freezed == remarkName
          ? _value.remarkName
          : remarkName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserInfoDto implements _UserInfoDto {
  _$_UserInfoDto(
      {@JsonKey(name: 'uid') required this.uid,
      @JsonKey(name: 'public_id') this.account,
      @JsonKey(name: 'avatar_url') this.avatar,
      @JsonKey(name: 'avatar_extra') this.avatarEx,
      @JsonKey(name: 'username') @Deprecated("使用 showName") this.nickName,
      @JsonKey(name: 'sex') required this.gender,
      @JsonKey(name: 'level') this.level,
      @JsonKey(name: 'charm_level') this.charmLevel,
      @JsonKey(name: 'remarks_name') this.remarkName});

  factory _$_UserInfoDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserInfoDtoFromJson(json);

  @override
  @JsonKey(name: 'uid')
  final UID uid;
  @override
  @JsonKey(name: 'public_id')
  final String? account;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatar;
  @override
  @JsonKey(name: 'avatar_extra')
  final String? avatarEx;
  @override
  @JsonKey(name: 'username')
  @Deprecated("使用 showName")
  final String? nickName;
  @override
  @JsonKey(name: 'sex')
  final GenderEnum gender;
  @override
  @JsonKey(name: 'level')
  final String? level;
  @override
  @JsonKey(name: 'charm_level')
  final String? charmLevel;
  @override
  @JsonKey(name: 'remarks_name')
  final String? remarkName;

  @override
  String toString() {
    return 'UserInfoDto(uid: $uid, account: $account, avatar: $avatar, avatarEx: $avatarEx, nickName: $nickName, gender: $gender, level: $level, charmLevel: $charmLevel, remarkName: $remarkName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInfoDto &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.avatarEx, avatarEx) ||
                other.avatarEx == avatarEx) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.charmLevel, charmLevel) ||
                other.charmLevel == charmLevel) &&
            (identical(other.remarkName, remarkName) ||
                other.remarkName == remarkName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      account,
      avatar,
      avatarEx,
      nickName,
      gender,
      level,
      charmLevel,
      remarkName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInfoDtoCopyWith<_$_UserInfoDto> get copyWith =>
      __$$_UserInfoDtoCopyWithImpl<_$_UserInfoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInfoDtoToJson(
      this,
    );
  }
}

abstract class _UserInfoDto implements UserInfoDto {
  factory _UserInfoDto(
      {@JsonKey(name: 'uid')
          required final UID uid,
      @JsonKey(name: 'public_id')
          final String? account,
      @JsonKey(name: 'avatar_url')
          final String? avatar,
      @JsonKey(name: 'avatar_extra')
          final String? avatarEx,
      @JsonKey(name: 'username')
      @Deprecated("使用 showName")
          final String? nickName,
      @JsonKey(name: 'sex')
          required final GenderEnum gender,
      @JsonKey(name: 'level')
          final String? level,
      @JsonKey(name: 'charm_level')
          final String? charmLevel,
      @JsonKey(name: 'remarks_name')
          final String? remarkName}) = _$_UserInfoDto;

  factory _UserInfoDto.fromJson(Map<String, dynamic> json) =
      _$_UserInfoDto.fromJson;

  @override
  @JsonKey(name: 'uid')
  UID get uid;
  @override
  @JsonKey(name: 'public_id')
  String? get account;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatar;
  @override
  @JsonKey(name: 'avatar_extra')
  String? get avatarEx;
  @override
  @JsonKey(name: 'username')
  @Deprecated("使用 showName")
  String? get nickName;
  @override
  @JsonKey(name: 'sex')
  GenderEnum get gender;
  @override
  @JsonKey(name: 'level')
  String? get level;
  @override
  @JsonKey(name: 'charm_level')
  String? get charmLevel;
  @override
  @JsonKey(name: 'remarks_name')
  String? get remarkName;
  @override
  @JsonKey(ignore: true)
  _$$_UserInfoDtoCopyWith<_$_UserInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}
