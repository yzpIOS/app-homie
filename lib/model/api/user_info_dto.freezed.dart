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
  @JsonKey(name: 'role_id')
  @MyJsonConverter()
  int? get nuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'public_id')
  String? get account => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get desc => throw _privateConstructorUsedError;
  @JsonKey(name: 'star_sign')
  String? get starSign => throw _privateConstructorUsedError;
  @JsonKey(name: 'location')
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'age_show')
  String? get ageShow => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_extra')
  String? get avatarEx => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  @Deprecated("使用 showName")
  String? get nickName => throw _privateConstructorUsedError;
  @JsonKey(name: 'sex')
  GenderEnum get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'level')
  String? get level => throw _privateConstructorUsedError;
  @JsonKey(name: 'data_birth')
  @EpochDateTimeConverter()
  DateTime? get birthDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'charm_level')
  String? get charmLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'remarks_name')
  String? get remarkName => throw _privateConstructorUsedError;
  @JsonKey(name: 'real_name_type')
  int? get realNameType => throw _privateConstructorUsedError;

  @JsonKey(name: 'avatar_frame')
  String? get avatar_frame => throw _privateConstructorUsedError;

  @JsonKey(name: 'voice_party_background')
  String? get voice_party_background  => throw _privateConstructorUsedError;

  @JsonKey(name: 'approach_special_effect')
  String? get approach_special_effect  => throw _privateConstructorUsedError;

  @JsonKey(name: 'chat_bubble')
  String? get chat_bubble  => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'role_id') int? nuid,
      @JsonKey(name: 'public_id') String? account,
      @JsonKey(name: 'avatar_url') String? avatar,
      @JsonKey(name: 'description') String? desc,
      @JsonKey(name: 'star_sign') String? starSign,
      @JsonKey(name: 'location') String? location,
      @JsonKey(name: 'age_show') String? ageShow,
      @JsonKey(name: 'avatar_extra') String? avatarEx,
      @JsonKey(name: 'username') @Deprecated("使用 showName") String? nickName,
      @JsonKey(name: 'sex') GenderEnum gender,
      @JsonKey(name: 'level') String? level,
      @JsonKey(name: 'data_birth') @EpochDateTimeConverter() DateTime? birthDay,
      @JsonKey(name: 'charm_level') String? charmLevel,
      @JsonKey(name: 'remarks_name') String? remarkName,
        @JsonKey(name: 'real_name_type') int? realNameType,

      @JsonKey(name: 'avatar_frame') String? avatar_frame,
        @JsonKey(name: 'chat_bubble') String? chat_bubble,
      @JsonKey(name: 'voice_party_background') String? voice_party_background,
      @JsonKey(name: 'approach_special_effect') String? approach_special_effect,
      });
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
    Object? nuid = freezed,
    Object? account = freezed,
    Object? avatar = freezed,
    Object? desc = freezed,
    Object? starSign = freezed,
    Object? location = freezed,
    Object? ageShow = freezed,
    Object? avatarEx = freezed,
    Object? nickName = freezed,
    Object? gender = null,
    Object? level = freezed,
    Object? birthDay = freezed,
    Object? charmLevel = freezed,
    Object? remarkName = freezed,
    Object? realNameType = freezed,


    Object? avatar_frame = freezed,
    Object? chat_bubble = freezed,
    Object? voice_party_background = freezed,
    Object? approach_special_effect = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as UID,
      nuid: freezed == nuid
          ? _value.nuid
          : nuid // ignore: cast_nullable_to_non_nullable
              as int?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      starSign: freezed == starSign
          ? _value.starSign
          : starSign // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      ageShow: freezed == ageShow
          ? _value.ageShow
          : ageShow // ignore: cast_nullable_to_non_nullable
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
      birthDay: freezed == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      charmLevel: freezed == charmLevel
          ? _value.charmLevel
          : charmLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      remarkName: freezed == remarkName
          ? _value.remarkName
          : remarkName // ignore: cast_nullable_to_non_nullable
              as String?,
      realNameType: freezed == realNameType
          ? _value.realNameType
          : realNameType // ignore: cast_nullable_to_non_nullable
          as int?,
      avatar_frame: freezed == avatar_frame
          ? _value.avatar_frame
          : avatar_frame // ignore: cast_nullable_to_non_nullable
        as String?,
      voice_party_background: freezed == voice_party_background
          ? _value.voice_party_background
          : voice_party_background // ignore: cast_nullable_to_non_nullable
      as String?,
      approach_special_effect: freezed == approach_special_effect
          ? _value.approach_special_effect
          : approach_special_effect // ignore: cast_nullable_to_non_nullable
      as String?,
      chat_bubble: freezed == chat_bubble
          ? _value.chat_bubble
          :  chat_bubble // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'role_id') int? nuid,
      @JsonKey(name: 'public_id') String? account,
      @JsonKey(name: 'avatar_url') String? avatar,
      @JsonKey(name: 'description') String? desc,
      @JsonKey(name: 'star_sign') String? starSign,
      @JsonKey(name: 'location') String? location,
      @JsonKey(name: 'age_show') String? ageShow,
      @JsonKey(name: 'avatar_extra') String? avatarEx,
      @JsonKey(name: 'username') @Deprecated("使用 showName") String? nickName,
      @JsonKey(name: 'sex') GenderEnum gender,
      @JsonKey(name: 'level') String? level,
      @JsonKey(name: 'data_birth') @EpochDateTimeConverter() DateTime? birthDay,
      @JsonKey(name: 'charm_level') String? charmLevel,
      @JsonKey(name: 'remarks_name') String? remarkName,
      @JsonKey(name: 'real_name_type') int? realNameType,
      @JsonKey(name: 'avatar_frame') String? avatar_frame,
        @JsonKey(name: 'chat_bubble') String? chat_bubble,
      @JsonKey(name: 'voice_party_background') String? voice_party_background,
      @JsonKey(name: 'approach_special_effect') String? approach_special_effect,
      });
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
    Object? nuid = freezed,
    Object? account = freezed,
    Object? avatar = freezed,
    Object? desc = freezed,
    Object? starSign = freezed,
    Object? location = freezed,
    Object? ageShow = freezed,
    Object? avatarEx = freezed,
    Object? nickName = freezed,
    Object? gender = null,
    Object? level = freezed,
    Object? birthDay = freezed,
    Object? charmLevel = freezed,
    Object? remarkName = freezed,
    Object? realNameType = freezed,
    Object? avatar_frame = freezed,
    Object? voice_party_background = freezed,
    Object? approach_special_effect = freezed,
    Object? chat_bubble = freezed,
  }) {
    return _then(_$_UserInfoDto(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as UID,
      nuid: freezed == nuid
          ? _value.nuid
          : nuid // ignore: cast_nullable_to_non_nullable
              as int?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      starSign: freezed == starSign
          ? _value.starSign
          : starSign // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      ageShow: freezed == ageShow
          ? _value.ageShow
          : ageShow // ignore: cast_nullable_to_non_nullable
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
      birthDay: freezed == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      charmLevel: freezed == charmLevel
          ? _value.charmLevel
          : charmLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      remarkName: freezed == remarkName
          ? _value.remarkName
          : remarkName // ignore: cast_nullable_to_non_nullable
              as String?,
      realNameType: freezed == realNameType
          ? _value.realNameType
          : realNameType // ignore: cast_nullable_to_non_nullable
        as int?,
        avatar_frame: freezed == avatar_frame
            ? _value.avatar_frame
            : avatar_frame // ignore: cast_nullable_to_non_nullable
        as String?,
        voice_party_background: freezed == voice_party_background
            ? _value.voice_party_background
            : voice_party_background // ignore: cast_nullable_to_non_nullable
        as String?,
        approach_special_effect: freezed == approach_special_effect
            ? _value.approach_special_effect
            : approach_special_effect // ignore: cast_nullable_to_non_nullable
        as String?,
      chat_bubble: freezed == chat_bubble
          ? _value.chat_bubble
          : chat_bubble // ignore: cast_nullable_to_non_nullable
      as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserInfoDto implements _UserInfoDto {
  _$_UserInfoDto(
      {@JsonKey(name: 'uid') required this.uid,
      @JsonKey(name: 'role_id') int? this.nuid,
      @JsonKey(name: 'public_id') this.account,
      @JsonKey(name: 'avatar_url') this.avatar,
      @JsonKey(name: 'description') this.desc,
      @JsonKey(name: 'star_sign') this.starSign,
      @JsonKey(name: 'location') this.location,
      @JsonKey(name: 'age_show') this.ageShow,
      @JsonKey(name: 'avatar_extra') this.avatarEx,
      @JsonKey(name: 'username') @Deprecated("使用 showName") this.nickName,
      @JsonKey(name: 'sex') required this.gender,
      @JsonKey(name: 'level') this.level,
      @JsonKey(name: 'data_birth') @EpochDateTimeConverter() this.birthDay,
      @JsonKey(name: 'charm_level') this.charmLevel,
      @JsonKey(name: 'remarks_name') this.remarkName,
      @JsonKey(name: 'real_name_type') this.realNameType,
      @JsonKey(name: 'avatar_frame') this.avatar_frame,
      @JsonKey(name: 'chat_bubble') this.chat_bubble,
      @JsonKey(name: 'voice_party_background') this.voice_party_background,
      @JsonKey(name: 'approach_special_effect') this.approach_special_effect,
      });

  factory _$_UserInfoDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserInfoDtoFromJson(json);

  @override
  @JsonKey(name: 'uid')
  final UID uid;
  @override
  @JsonKey(name: 'role_id')
  @MyJsonConverter()
  final int? nuid;
  @override
  @JsonKey(name: 'public_id')
  final String? account;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatar;
  @override
  @JsonKey(name: 'description')
  final String? desc;
  @override
  @JsonKey(name: 'star_sign')
  final String? starSign;
  @override
  @JsonKey(name: 'location')
  final String? location;
  @override
  @JsonKey(name: 'age_show')
  final String? ageShow;
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
  @JsonKey(name: 'data_birth')
  @EpochDateTimeConverter()
  final DateTime? birthDay;
  @override
  @JsonKey(name: 'charm_level')
  final String? charmLevel;
  @override
  @JsonKey(name: 'remarks_name')
  final String? remarkName;
  @override
  @JsonKey(name: 'real_name_type')
  final int? realNameType;
  @override
  @JsonKey(name: 'avatar_frame')
  final String? avatar_frame;
  @override
  @JsonKey(name: 'voice_party_background')
  final String? voice_party_background;
  @override
  @JsonKey(name: 'approach_special_effect')
  final String? approach_special_effect;
  @override
  @JsonKey(name: 'chat_bubble')
  final String? chat_bubble;

  @override
  String toString() {
    return 'UserInfoDto(uid: $uid, nuid: $nuid, account: $account, avatar: $avatar, desc: $desc, starSign: $starSign, location: $location, ageShow: $ageShow, avatarEx: $avatarEx, nickName: $nickName, gender: $gender, level: $level, birthDay: $birthDay, charmLevel: $charmLevel, remarkName: $remarkName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInfoDto &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            (identical(other.nuid, nuid) || other.nuid == nuid) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.starSign, starSign) ||
                other.starSign == starSign) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.ageShow, ageShow) || other.ageShow == ageShow) &&
            (identical(other.avatarEx, avatarEx) ||
                other.avatarEx == avatarEx) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.birthDay, birthDay) ||
                other.birthDay == birthDay) &&
            (identical(other.charmLevel, charmLevel) ||
                other.charmLevel == charmLevel) &&
            (identical(other.remarkName, remarkName) ||
                other.remarkName == remarkName) &&
            (identical(other.realNameType, realNameType) ||
                other.realNameType == realNameType) &&
            (identical(other.avatar_frame, avatar_frame) ||
                other.avatar_frame == avatar_frame) &&
            (identical(other.voice_party_background, voice_party_background) ||
                other.voice_party_background == voice_party_background) &&
            (identical(other.approach_special_effect, approach_special_effect) ||
                other.approach_special_effect == approach_special_effect) &&
            (identical(other.chat_bubble, chat_bubble) ||
                other.chat_bubble == chat_bubble)
        );
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      nuid,
      account,
      avatar,
      desc,
      starSign,
      location,
      ageShow,
      avatarEx,
      nickName,
      gender,
      level,
      birthDay,
      charmLevel,
      remarkName,
      realNameType,
      avatar_frame,
      voice_party_background,
      approach_special_effect,
  );

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
          {@JsonKey(name: 'uid') required final UID uid,
          @JsonKey(name: 'role_id') int? nuid,
          @JsonKey(name: 'public_id') final String? account,
          @JsonKey(name: 'avatar_url') final String? avatar,
          @JsonKey(name: 'description') final String? desc,
          @JsonKey(name: 'star_sign') final String? starSign,
          @JsonKey(name: 'location') final String? location,
          @JsonKey(name: 'age_show') final String? ageShow,
          @JsonKey(name: 'avatar_extra') final String? avatarEx,
          @JsonKey(name: 'username')
          @Deprecated("使用 showName")
          final String? nickName,
          @JsonKey(name: 'sex') required final GenderEnum gender,
          @JsonKey(name: 'level') final String? level,
          @JsonKey(name: 'data_birth')
          @EpochDateTimeConverter()
          final DateTime? birthDay,
          @JsonKey(name: 'charm_level') final String? charmLevel,
          @JsonKey(name: 'remarks_name') final String? remarkName,
          @JsonKey(name: 'real_name_type') int? realNameType,

          @JsonKey(name: 'avatar_frame') String? avatar_frame,
          @JsonKey(name: 'chat_bubble') String? chat_bubble,
          @JsonKey(name: 'voice_party_background') String? voice_party_background,
          @JsonKey(name: 'approach_special_effect') String? approach_special_effect,
          }) =
    _$_UserInfoDto;

  factory _UserInfoDto.fromJson(Map<String, dynamic> json) =
      _$_UserInfoDto.fromJson;

  @override
  @JsonKey(name: 'uid')
  UID get uid;
  @override
  @JsonKey(name: 'role_id')
  @MyJsonConverter()
  int? get nuid;
  @override
  @JsonKey(name: 'public_id')
  String? get account;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatar;
  @override
  @JsonKey(name: 'description')
  String? get desc;
  @override
  @JsonKey(name: 'star_sign')
  String? get starSign;
  @override
  @JsonKey(name: 'location')
  String? get location;
  @override
  @JsonKey(name: 'age_show')
  String? get ageShow;
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
  @JsonKey(name: 'data_birth')
  @EpochDateTimeConverter()
  DateTime? get birthDay;
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

  @override
  @JsonKey(name: 'avatar_frame')
  String? get avatar_frame;
  @override
  @JsonKey(name: 'voice_party_background')
  String? get voice_party_background;
  @override
  @JsonKey(name: 'approach_special_effect')
  String? get approach_special_effect;
  @override
  @JsonKey(name: 'chat_bubble')
  String? get chat_bubble;
}
