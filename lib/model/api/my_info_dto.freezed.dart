// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyInfoDto _$MyInfoDtoFromJson(Map<String, dynamic> json) {
  return _MyInfoDto.fromJson(json);
}

/// @nodoc
mixin _$MyInfoDto {
  @JsonKey(name: 'uid')
  UID get uid => throw _privateConstructorUsedError;
  @JsonKey(name: 'public_id')
  String? get account => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_extra')
  String? get avatarEx => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String? get nickName => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get desc => throw _privateConstructorUsedError;
  @JsonKey(name: 'location')
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'star_sign')
  String? get starSign => throw _privateConstructorUsedError;
  @JsonKey(name: 'age_show')
  String? get ageShow => throw _privateConstructorUsedError;
  @JsonKey(name: 'sex')
  GenderEnum? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'level')
  String? get level => throw _privateConstructorUsedError;
  @JsonKey(name: 'data_birth')
  @EpochDateTimeConverter()
  DateTime? get birthDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'fans_count')
  int? get fansCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'follow_count')
  int? get followCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_user_count')
  int? get accessCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'real_name_type')
  int? get realNameType => throw _privateConstructorUsedError;
  @JsonKey(name: 'addr')
  MyAddrDto? get addr => throw _privateConstructorUsedError;
  @JsonKey(name: 'show_winning_lottery')
  bool? get showWinningLottery => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyInfoDtoCopyWith<MyInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyInfoDtoCopyWith<$Res> {
  factory $MyInfoDtoCopyWith(MyInfoDto value, $Res Function(MyInfoDto) then) =
      _$MyInfoDtoCopyWithImpl<$Res, MyInfoDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'uid') UID uid,
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
      @JsonKey(name: 'show_winning_lottery') bool? showWinningLottery});

  $MyAddrDtoCopyWith<$Res>? get addr;
}

/// @nodoc
class _$MyInfoDtoCopyWithImpl<$Res, $Val extends MyInfoDto>
    implements $MyInfoDtoCopyWith<$Res> {
  _$MyInfoDtoCopyWithImpl(this._value, this._then);

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
    Object? desc = freezed,
    Object? location = freezed,
    Object? starSign = freezed,
    Object? ageShow = freezed,
    Object? gender = freezed,
    Object? level = freezed,
    Object? birthDay = freezed,
    Object? fansCount = freezed,
    Object? followCount = freezed,
    Object? accessCount = freezed,
    Object? realNameType = freezed,
    Object? addr = freezed,
    Object? showWinningLottery = freezed,
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
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      starSign: freezed == starSign
          ? _value.starSign
          : starSign // ignore: cast_nullable_to_non_nullable
              as String?,
      ageShow: freezed == ageShow
          ? _value.ageShow
          : ageShow // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as GenderEnum?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDay: freezed == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fansCount: freezed == fansCount
          ? _value.fansCount
          : fansCount // ignore: cast_nullable_to_non_nullable
              as int?,
      followCount: freezed == followCount
          ? _value.followCount
          : followCount // ignore: cast_nullable_to_non_nullable
              as int?,
      accessCount: freezed == accessCount
          ? _value.accessCount
          : accessCount // ignore: cast_nullable_to_non_nullable
              as int?,
      realNameType: freezed == realNameType
          ? _value.realNameType
          : realNameType // ignore: cast_nullable_to_non_nullable
              as int?,
      addr: freezed == addr
          ? _value.addr
          : addr // ignore: cast_nullable_to_non_nullable
              as MyAddrDto?,
      showWinningLottery: freezed == showWinningLottery
          ? _value.showWinningLottery
          : showWinningLottery // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MyAddrDtoCopyWith<$Res>? get addr {
    if (_value.addr == null) {
      return null;
    }

    return $MyAddrDtoCopyWith<$Res>(_value.addr!, (value) {
      return _then(_value.copyWith(addr: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MyInfoDtoCopyWith<$Res> implements $MyInfoDtoCopyWith<$Res> {
  factory _$$_MyInfoDtoCopyWith(
          _$_MyInfoDto value, $Res Function(_$_MyInfoDto) then) =
      __$$_MyInfoDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'uid') UID uid,
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
      @JsonKey(name: 'show_winning_lottery') bool? showWinningLottery});

  @override
  $MyAddrDtoCopyWith<$Res>? get addr;
}

/// @nodoc
class __$$_MyInfoDtoCopyWithImpl<$Res>
    extends _$MyInfoDtoCopyWithImpl<$Res, _$_MyInfoDto>
    implements _$$_MyInfoDtoCopyWith<$Res> {
  __$$_MyInfoDtoCopyWithImpl(
      _$_MyInfoDto _value, $Res Function(_$_MyInfoDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? account = freezed,
    Object? avatar = freezed,
    Object? avatarEx = freezed,
    Object? nickName = freezed,
    Object? desc = freezed,
    Object? location = freezed,
    Object? starSign = freezed,
    Object? ageShow = freezed,
    Object? gender = freezed,
    Object? level = freezed,
    Object? birthDay = freezed,
    Object? fansCount = freezed,
    Object? followCount = freezed,
    Object? accessCount = freezed,
    Object? realNameType = freezed,
    Object? addr = freezed,
    Object? showWinningLottery = freezed,
  }) {
    return _then(_$_MyInfoDto(
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
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      starSign: freezed == starSign
          ? _value.starSign
          : starSign // ignore: cast_nullable_to_non_nullable
              as String?,
      ageShow: freezed == ageShow
          ? _value.ageShow
          : ageShow // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as GenderEnum?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDay: freezed == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fansCount: freezed == fansCount
          ? _value.fansCount
          : fansCount // ignore: cast_nullable_to_non_nullable
              as int?,
      followCount: freezed == followCount
          ? _value.followCount
          : followCount // ignore: cast_nullable_to_non_nullable
              as int?,
      accessCount: freezed == accessCount
          ? _value.accessCount
          : accessCount // ignore: cast_nullable_to_non_nullable
              as int?,
      realNameType: freezed == realNameType
          ? _value.realNameType
          : realNameType // ignore: cast_nullable_to_non_nullable
              as int?,
      addr: freezed == addr
          ? _value.addr
          : addr // ignore: cast_nullable_to_non_nullable
              as MyAddrDto?,
      showWinningLottery: freezed == showWinningLottery
          ? _value.showWinningLottery
          : showWinningLottery // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyInfoDto implements _MyInfoDto {
  _$_MyInfoDto(
      {@JsonKey(name: 'uid') required this.uid,
      @JsonKey(name: 'public_id') this.account,
      @JsonKey(name: 'avatar_url') this.avatar,
      @JsonKey(name: 'avatar_extra') this.avatarEx,
      @JsonKey(name: 'username') this.nickName,
      @JsonKey(name: 'description') this.desc,
      @JsonKey(name: 'location') this.location,
      @JsonKey(name: 'star_sign') this.starSign,
      @JsonKey(name: 'age_show') this.ageShow,
      @JsonKey(name: 'sex') this.gender,
      @JsonKey(name: 'level') this.level,
      @JsonKey(name: 'data_birth') @EpochDateTimeConverter() this.birthDay,
      @JsonKey(name: 'fans_count') this.fansCount,
      @JsonKey(name: 'follow_count') this.followCount,
      @JsonKey(name: 'access_user_count') this.accessCount,
      @JsonKey(name: 'real_name_type') this.realNameType,
      @JsonKey(name: 'addr') this.addr,
      @JsonKey(name: 'show_winning_lottery') this.showWinningLottery});

  factory _$_MyInfoDto.fromJson(Map<String, dynamic> json) =>
      _$$_MyInfoDtoFromJson(json);

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
  final String? nickName;
  @override
  @JsonKey(name: 'description')
  final String? desc;
  @override
  @JsonKey(name: 'location')
  final String? location;
  @override
  @JsonKey(name: 'star_sign')
  final String? starSign;
  @override
  @JsonKey(name: 'age_show')
  final String? ageShow;
  @override
  @JsonKey(name: 'sex')
  final GenderEnum? gender;
  @override
  @JsonKey(name: 'level')
  final String? level;
  @override
  @JsonKey(name: 'data_birth')
  @EpochDateTimeConverter()
  final DateTime? birthDay;
  @override
  @JsonKey(name: 'fans_count')
  final int? fansCount;
  @override
  @JsonKey(name: 'follow_count')
  final int? followCount;
  @override
  @JsonKey(name: 'access_user_count')
  final int? accessCount;
  @override
  @JsonKey(name: 'real_name_type')
  final int? realNameType;
  @override
  @JsonKey(name: 'addr')
  final MyAddrDto? addr;
  @override
  @JsonKey(name: 'show_winning_lottery')
  final bool? showWinningLottery;

  @override
  String toString() {
    return 'MyInfoDto(uid: $uid, account: $account, avatar: $avatar, avatarEx: $avatarEx, nickName: $nickName, desc: $desc, location: $location, starSign: $starSign, ageShow: $ageShow, gender: $gender, level: $level, birthDay: $birthDay, fansCount: $fansCount, followCount: $followCount, accessCount: $accessCount, realNameType: $realNameType, addr: $addr, showWinningLottery: $showWinningLottery)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyInfoDto &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.avatarEx, avatarEx) ||
                other.avatarEx == avatarEx) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.starSign, starSign) ||
                other.starSign == starSign) &&
            (identical(other.ageShow, ageShow) || other.ageShow == ageShow) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.birthDay, birthDay) ||
                other.birthDay == birthDay) &&
            (identical(other.fansCount, fansCount) ||
                other.fansCount == fansCount) &&
            (identical(other.followCount, followCount) ||
                other.followCount == followCount) &&
            (identical(other.accessCount, accessCount) ||
                other.accessCount == accessCount) &&
            (identical(other.realNameType, realNameType) ||
                other.realNameType == realNameType) &&
            (identical(other.addr, addr) || other.addr == addr) &&
            (identical(other.showWinningLottery, showWinningLottery) ||
                other.showWinningLottery == showWinningLottery));
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
      desc,
      location,
      starSign,
      ageShow,
      gender,
      level,
      birthDay,
      fansCount,
      followCount,
      accessCount,
      realNameType,
      addr,
      showWinningLottery);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyInfoDtoCopyWith<_$_MyInfoDto> get copyWith =>
      __$$_MyInfoDtoCopyWithImpl<_$_MyInfoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyInfoDtoToJson(
      this,
    );
  }
}

abstract class _MyInfoDto implements MyInfoDto {
  factory _MyInfoDto(
      {@JsonKey(name: 'uid') required final UID uid,
      @JsonKey(name: 'public_id') final String? account,
      @JsonKey(name: 'avatar_url') final String? avatar,
      @JsonKey(name: 'avatar_extra') final String? avatarEx,
      @JsonKey(name: 'username') final String? nickName,
      @JsonKey(name: 'description') final String? desc,
      @JsonKey(name: 'location') final String? location,
      @JsonKey(name: 'star_sign') final String? starSign,
      @JsonKey(name: 'age_show') final String? ageShow,
      @JsonKey(name: 'sex') final GenderEnum? gender,
      @JsonKey(name: 'level') final String? level,
      @JsonKey(name: 'data_birth')
      @EpochDateTimeConverter()
      final DateTime? birthDay,
      @JsonKey(name: 'fans_count') final int? fansCount,
      @JsonKey(name: 'follow_count') final int? followCount,
      @JsonKey(name: 'access_user_count') final int? accessCount,
      @JsonKey(name: 'real_name_type') final int? realNameType,
      @JsonKey(name: 'addr') final MyAddrDto? addr,
      @JsonKey(name: 'show_winning_lottery')
          final bool? showWinningLottery}) = _$_MyInfoDto;

  factory _MyInfoDto.fromJson(Map<String, dynamic> json) =
      _$_MyInfoDto.fromJson;

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
  String? get nickName;
  @override
  @JsonKey(name: 'description')
  String? get desc;
  @override
  @JsonKey(name: 'location')
  String? get location;
  @override
  @JsonKey(name: 'star_sign')
  String? get starSign;
  @override
  @JsonKey(name: 'age_show')
  String? get ageShow;
  @override
  @JsonKey(name: 'sex')
  GenderEnum? get gender;
  @override
  @JsonKey(name: 'level')
  String? get level;
  @override
  @JsonKey(name: 'data_birth')
  @EpochDateTimeConverter()
  DateTime? get birthDay;
  @override
  @JsonKey(name: 'fans_count')
  int? get fansCount;
  @override
  @JsonKey(name: 'follow_count')
  int? get followCount;
  @override
  @JsonKey(name: 'access_user_count')
  int? get accessCount;
  @override
  @JsonKey(name: 'real_name_type')
  int? get realNameType;
  @override
  @JsonKey(name: 'addr')
  MyAddrDto? get addr;
  @override
  @JsonKey(name: 'show_winning_lottery')
  bool? get showWinningLottery;
  @override
  @JsonKey(ignore: true)
  _$$_MyInfoDtoCopyWith<_$_MyInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

MyAddrDto _$MyAddrDtoFromJson(Map<String, dynamic> json) {
  return _MyAddrDto.fromJson(json);
}

/// @nodoc
mixin _$MyAddrDto {
  int get country => throw _privateConstructorUsedError;
  int get province => throw _privateConstructorUsedError;
  int get city => throw _privateConstructorUsedError;
  int get district => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyAddrDtoCopyWith<MyAddrDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyAddrDtoCopyWith<$Res> {
  factory $MyAddrDtoCopyWith(MyAddrDto value, $Res Function(MyAddrDto) then) =
      _$MyAddrDtoCopyWithImpl<$Res, MyAddrDto>;
  @useResult
  $Res call({int country, int province, int city, int district});
}

/// @nodoc
class _$MyAddrDtoCopyWithImpl<$Res, $Val extends MyAddrDto>
    implements $MyAddrDtoCopyWith<$Res> {
  _$MyAddrDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
    Object? province = null,
    Object? city = null,
    Object? district = null,
  }) {
    return _then(_value.copyWith(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as int,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as int,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as int,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyAddrDtoCopyWith<$Res> implements $MyAddrDtoCopyWith<$Res> {
  factory _$$_MyAddrDtoCopyWith(
          _$_MyAddrDto value, $Res Function(_$_MyAddrDto) then) =
      __$$_MyAddrDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int country, int province, int city, int district});
}

/// @nodoc
class __$$_MyAddrDtoCopyWithImpl<$Res>
    extends _$MyAddrDtoCopyWithImpl<$Res, _$_MyAddrDto>
    implements _$$_MyAddrDtoCopyWith<$Res> {
  __$$_MyAddrDtoCopyWithImpl(
      _$_MyAddrDto _value, $Res Function(_$_MyAddrDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
    Object? province = null,
    Object? city = null,
    Object? district = null,
  }) {
    return _then(_$_MyAddrDto(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as int,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as int,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as int,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyAddrDto implements _MyAddrDto {
  _$_MyAddrDto(
      {required this.country,
      required this.province,
      required this.city,
      required this.district});

  factory _$_MyAddrDto.fromJson(Map<String, dynamic> json) =>
      _$$_MyAddrDtoFromJson(json);

  @override
  final int country;
  @override
  final int province;
  @override
  final int city;
  @override
  final int district;

  @override
  String toString() {
    return 'MyAddrDto(country: $country, province: $province, city: $city, district: $district)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyAddrDto &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.district, district) ||
                other.district == district));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, country, province, city, district);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyAddrDtoCopyWith<_$_MyAddrDto> get copyWith =>
      __$$_MyAddrDtoCopyWithImpl<_$_MyAddrDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyAddrDtoToJson(
      this,
    );
  }
}

abstract class _MyAddrDto implements MyAddrDto {
  factory _MyAddrDto(
      {required final int country,
      required final int province,
      required final int city,
      required final int district}) = _$_MyAddrDto;

  factory _MyAddrDto.fromJson(Map<String, dynamic> json) =
      _$_MyAddrDto.fromJson;

  @override
  int get country;
  @override
  int get province;
  @override
  int get city;
  @override
  int get district;
  @override
  @JsonKey(ignore: true)
  _$$_MyAddrDtoCopyWith<_$_MyAddrDto> get copyWith =>
      throw _privateConstructorUsedError;
}
