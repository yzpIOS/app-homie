// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'moment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MomentDto _$MomentDtoFromJson(Map<String, dynamic> json) {
  return _MomentDto.fromJson(json);
}

/// @nodoc
mixin _$MomentDto {
  @JsonKey(name: 'dynamic')
  MomentContent get content => throw _privateConstructorUsedError;
  MomentMore get more => throw _privateConstructorUsedError;
  MomentCount get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'topic_list')
  List<Map>? get topic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MomentDtoCopyWith<MomentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MomentDtoCopyWith<$Res> {
  factory $MomentDtoCopyWith(MomentDto value, $Res Function(MomentDto) then) =
      _$MomentDtoCopyWithImpl<$Res, MomentDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'dynamic') MomentContent content,
      MomentMore more,
      MomentCount count,
      @JsonKey(name: 'topic_list') List<Map>? topic});

  $MomentContentCopyWith<$Res> get content;
  $MomentMoreCopyWith<$Res> get more;
  $MomentCountCopyWith<$Res> get count;
}

/// @nodoc
class _$MomentDtoCopyWithImpl<$Res, $Val extends MomentDto>
    implements $MomentDtoCopyWith<$Res> {
  _$MomentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? more = null,
    Object? count = null,
    Object? topic = freezed,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as MomentContent,
      more: null == more
          ? _value.more
          : more // ignore: cast_nullable_to_non_nullable
              as MomentMore,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as MomentCount,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as List<Map>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MomentContentCopyWith<$Res> get content {
    return $MomentContentCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MomentMoreCopyWith<$Res> get more {
    return $MomentMoreCopyWith<$Res>(_value.more, (value) {
      return _then(_value.copyWith(more: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MomentCountCopyWith<$Res> get count {
    return $MomentCountCopyWith<$Res>(_value.count, (value) {
      return _then(_value.copyWith(count: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MomentDtoCopyWith<$Res> implements $MomentDtoCopyWith<$Res> {
  factory _$$_MomentDtoCopyWith(
          _$_MomentDto value, $Res Function(_$_MomentDto) then) =
      __$$_MomentDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'dynamic') MomentContent content,
      MomentMore more,
      MomentCount count,
      @JsonKey(name: 'topic_list') List<Map>? topic});

  @override
  $MomentContentCopyWith<$Res> get content;
  @override
  $MomentMoreCopyWith<$Res> get more;
  @override
  $MomentCountCopyWith<$Res> get count;
}

/// @nodoc
class __$$_MomentDtoCopyWithImpl<$Res>
    extends _$MomentDtoCopyWithImpl<$Res, _$_MomentDto>
    implements _$$_MomentDtoCopyWith<$Res> {
  __$$_MomentDtoCopyWithImpl(
      _$_MomentDto _value, $Res Function(_$_MomentDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? more = null,
    Object? count = null,
    Object? topic = freezed,
  }) {
    return _then(_$_MomentDto(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as MomentContent,
      more: null == more
          ? _value.more
          : more // ignore: cast_nullable_to_non_nullable
              as MomentMore,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as MomentCount,
      topic: freezed == topic
          ? _value._topic
          : topic // ignore: cast_nullable_to_non_nullable
              as List<Map>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MomentDto implements _MomentDto {
  _$_MomentDto(
      {@JsonKey(name: 'dynamic') required this.content,
      required this.more,
      required this.count,
      @JsonKey(name: 'topic_list') final List<Map>? topic})
      : _topic = topic;

  factory _$_MomentDto.fromJson(Map<String, dynamic> json) =>
      _$$_MomentDtoFromJson(json);

  @override
  @JsonKey(name: 'dynamic')
  final MomentContent content;
  @override
  final MomentMore more;
  @override
  final MomentCount count;
  final List<Map>? _topic;
  @override
  @JsonKey(name: 'topic_list')
  List<Map>? get topic {
    final value = _topic;
    if (value == null) return null;
    if (_topic is EqualUnmodifiableListView) return _topic;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MomentDto(content: $content, more: $more, count: $count, topic: $topic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MomentDto &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.more, more) || other.more == more) &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._topic, _topic));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, content, more, count,
      const DeepCollectionEquality().hash(_topic));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MomentDtoCopyWith<_$_MomentDto> get copyWith =>
      __$$_MomentDtoCopyWithImpl<_$_MomentDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MomentDtoToJson(
      this,
    );
  }
}

abstract class _MomentDto implements MomentDto {
  factory _MomentDto(
      {@JsonKey(name: 'dynamic') required final MomentContent content,
      required final MomentMore more,
      required final MomentCount count,
      @JsonKey(name: 'topic_list') final List<Map>? topic}) = _$_MomentDto;

  factory _MomentDto.fromJson(Map<String, dynamic> json) =
      _$_MomentDto.fromJson;

  @override
  @JsonKey(name: 'dynamic')
  MomentContent get content;
  @override
  MomentMore get more;
  @override
  MomentCount get count;
  @override
  @JsonKey(name: 'topic_list')
  List<Map>? get topic;
  @override
  @JsonKey(ignore: true)
  _$$_MomentDtoCopyWith<_$_MomentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

MomentContent _$MomentContentFromJson(Map<String, dynamic> json) {
  return _MomentContent.fromJson(json);
}

/// @nodoc
mixin _$MomentContent {
  @JsonKey(name: 'dynamic_id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_id')
  String get author => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'dynamic_media')
  @MediaConverter()
  List<dynamic>? get media => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @EpochDateTimeConverter()
  DateTime? get dateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'auth')
  int get scope => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_status')
  int get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MomentContentCopyWith<MomentContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MomentContentCopyWith<$Res> {
  factory $MomentContentCopyWith(
          MomentContent value, $Res Function(MomentContent) then) =
      _$MomentContentCopyWithImpl<$Res, MomentContent>;
  @useResult
  $Res call(
      {@JsonKey(name: 'dynamic_id') int id,
      @JsonKey(name: 'author_id') String author,
      String text,
      @JsonKey(name: 'dynamic_media') @MediaConverter() List<dynamic>? media,
      @JsonKey(name: 'created_at') @EpochDateTimeConverter() DateTime? dateTime,
      @JsonKey(name: 'auth') int scope,
      @JsonKey(name: 'release_status') int status});
}

/// @nodoc
class _$MomentContentCopyWithImpl<$Res, $Val extends MomentContent>
    implements $MomentContentCopyWith<$Res> {
  _$MomentContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? text = null,
    Object? media = freezed,
    Object? dateTime = freezed,
    Object? scope = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MomentContentCopyWith<$Res>
    implements $MomentContentCopyWith<$Res> {
  factory _$$_MomentContentCopyWith(
          _$_MomentContent value, $Res Function(_$_MomentContent) then) =
      __$$_MomentContentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'dynamic_id') int id,
      @JsonKey(name: 'author_id') String author,
      String text,
      @JsonKey(name: 'dynamic_media') @MediaConverter() List<dynamic>? media,
      @JsonKey(name: 'created_at') @EpochDateTimeConverter() DateTime? dateTime,
      @JsonKey(name: 'auth') int scope,
      @JsonKey(name: 'release_status') int status});
}

/// @nodoc
class __$$_MomentContentCopyWithImpl<$Res>
    extends _$MomentContentCopyWithImpl<$Res, _$_MomentContent>
    implements _$$_MomentContentCopyWith<$Res> {
  __$$_MomentContentCopyWithImpl(
      _$_MomentContent _value, $Res Function(_$_MomentContent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? text = null,
    Object? media = freezed,
    Object? dateTime = freezed,
    Object? scope = null,
    Object? status = null,
  }) {
    return _then(_$_MomentContent(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      media: freezed == media
          ? _value._media
          : media // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MomentContent implements _MomentContent {
  _$_MomentContent(
      {@JsonKey(name: 'dynamic_id')
          required this.id,
      @JsonKey(name: 'author_id')
          required this.author,
      required this.text,
      @JsonKey(name: 'dynamic_media')
      @MediaConverter()
          final List<dynamic>? media,
      @JsonKey(name: 'created_at')
      @EpochDateTimeConverter()
          required this.dateTime,
      @JsonKey(name: 'auth')
          required this.scope,
      @JsonKey(name: 'release_status')
          required this.status})
      : _media = media;

  factory _$_MomentContent.fromJson(Map<String, dynamic> json) =>
      _$$_MomentContentFromJson(json);

  @override
  @JsonKey(name: 'dynamic_id')
  final int id;
  @override
  @JsonKey(name: 'author_id')
  final String author;
  @override
  final String text;
  final List<dynamic>? _media;
  @override
  @JsonKey(name: 'dynamic_media')
  @MediaConverter()
  List<dynamic>? get media {
    final value = _media;
    if (value == null) return null;
    if (_media is EqualUnmodifiableListView) return _media;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  @EpochDateTimeConverter()
  final DateTime? dateTime;
  @override
  @JsonKey(name: 'auth')
  final int scope;
  @override
  @JsonKey(name: 'release_status')
  final int status;

  @override
  String toString() {
    return 'MomentContent(id: $id, author: $author, text: $text, media: $media, dateTime: $dateTime, scope: $scope, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MomentContent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._media, _media) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, author, text,
      const DeepCollectionEquality().hash(_media), dateTime, scope, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MomentContentCopyWith<_$_MomentContent> get copyWith =>
      __$$_MomentContentCopyWithImpl<_$_MomentContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MomentContentToJson(
      this,
    );
  }
}

abstract class _MomentContent implements MomentContent {
  factory _MomentContent(
      {@JsonKey(name: 'dynamic_id')
          required final int id,
      @JsonKey(name: 'author_id')
          required final String author,
      required final String text,
      @JsonKey(name: 'dynamic_media')
      @MediaConverter()
          final List<dynamic>? media,
      @JsonKey(name: 'created_at')
      @EpochDateTimeConverter()
          required final DateTime? dateTime,
      @JsonKey(name: 'auth')
          required final int scope,
      @JsonKey(name: 'release_status')
          required final int status}) = _$_MomentContent;

  factory _MomentContent.fromJson(Map<String, dynamic> json) =
      _$_MomentContent.fromJson;

  @override
  @JsonKey(name: 'dynamic_id')
  int get id;
  @override
  @JsonKey(name: 'author_id')
  String get author;
  @override
  String get text;
  @override
  @JsonKey(name: 'dynamic_media')
  @MediaConverter()
  List<dynamic>? get media;
  @override
  @JsonKey(name: 'created_at')
  @EpochDateTimeConverter()
  DateTime? get dateTime;
  @override
  @JsonKey(name: 'auth')
  int get scope;
  @override
  @JsonKey(name: 'release_status')
  int get status;
  @override
  @JsonKey(ignore: true)
  _$$_MomentContentCopyWith<_$_MomentContent> get copyWith =>
      throw _privateConstructorUsedError;
}

MomentCount _$MomentCountFromJson(Map<String, dynamic> json) {
  return _MomentCount.fromJson(json);
}

/// @nodoc
mixin _$MomentCount {
  @JsonKey(name: 'gift_count')
  int get giftCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment_count')
  int get commentCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'like_count')
  int get likeCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'collect_count')
  int get collectCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MomentCountCopyWith<MomentCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MomentCountCopyWith<$Res> {
  factory $MomentCountCopyWith(
          MomentCount value, $Res Function(MomentCount) then) =
      _$MomentCountCopyWithImpl<$Res, MomentCount>;
  @useResult
  $Res call(
      {@JsonKey(name: 'gift_count') int giftCount,
      @JsonKey(name: 'comment_count') int commentCount,
      @JsonKey(name: 'like_count') int likeCount,
      @JsonKey(name: 'collect_count') int collectCount});
}

/// @nodoc
class _$MomentCountCopyWithImpl<$Res, $Val extends MomentCount>
    implements $MomentCountCopyWith<$Res> {
  _$MomentCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? giftCount = null,
    Object? commentCount = null,
    Object? likeCount = null,
    Object? collectCount = null,
  }) {
    return _then(_value.copyWith(
      giftCount: null == giftCount
          ? _value.giftCount
          : giftCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      collectCount: null == collectCount
          ? _value.collectCount
          : collectCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MomentCountCopyWith<$Res>
    implements $MomentCountCopyWith<$Res> {
  factory _$$_MomentCountCopyWith(
          _$_MomentCount value, $Res Function(_$_MomentCount) then) =
      __$$_MomentCountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'gift_count') int giftCount,
      @JsonKey(name: 'comment_count') int commentCount,
      @JsonKey(name: 'like_count') int likeCount,
      @JsonKey(name: 'collect_count') int collectCount});
}

/// @nodoc
class __$$_MomentCountCopyWithImpl<$Res>
    extends _$MomentCountCopyWithImpl<$Res, _$_MomentCount>
    implements _$$_MomentCountCopyWith<$Res> {
  __$$_MomentCountCopyWithImpl(
      _$_MomentCount _value, $Res Function(_$_MomentCount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? giftCount = null,
    Object? commentCount = null,
    Object? likeCount = null,
    Object? collectCount = null,
  }) {
    return _then(_$_MomentCount(
      giftCount: null == giftCount
          ? _value.giftCount
          : giftCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      collectCount: null == collectCount
          ? _value.collectCount
          : collectCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MomentCount implements _MomentCount {
  _$_MomentCount(
      {@JsonKey(name: 'gift_count') required this.giftCount,
      @JsonKey(name: 'comment_count') required this.commentCount,
      @JsonKey(name: 'like_count') required this.likeCount,
      @JsonKey(name: 'collect_count') required this.collectCount});

  factory _$_MomentCount.fromJson(Map<String, dynamic> json) =>
      _$$_MomentCountFromJson(json);

  @override
  @JsonKey(name: 'gift_count')
  final int giftCount;
  @override
  @JsonKey(name: 'comment_count')
  final int commentCount;
  @override
  @JsonKey(name: 'like_count')
  final int likeCount;
  @override
  @JsonKey(name: 'collect_count')
  final int collectCount;

  @override
  String toString() {
    return 'MomentCount(giftCount: $giftCount, commentCount: $commentCount, likeCount: $likeCount, collectCount: $collectCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MomentCount &&
            (identical(other.giftCount, giftCount) ||
                other.giftCount == giftCount) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.collectCount, collectCount) ||
                other.collectCount == collectCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, giftCount, commentCount, likeCount, collectCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MomentCountCopyWith<_$_MomentCount> get copyWith =>
      __$$_MomentCountCopyWithImpl<_$_MomentCount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MomentCountToJson(
      this,
    );
  }
}

abstract class _MomentCount implements MomentCount {
  factory _MomentCount(
          {@JsonKey(name: 'gift_count') required final int giftCount,
          @JsonKey(name: 'comment_count') required final int commentCount,
          @JsonKey(name: 'like_count') required final int likeCount,
          @JsonKey(name: 'collect_count') required final int collectCount}) =
      _$_MomentCount;

  factory _MomentCount.fromJson(Map<String, dynamic> json) =
      _$_MomentCount.fromJson;

  @override
  @JsonKey(name: 'gift_count')
  int get giftCount;
  @override
  @JsonKey(name: 'comment_count')
  int get commentCount;
  @override
  @JsonKey(name: 'like_count')
  int get likeCount;
  @override
  @JsonKey(name: 'collect_count')
  int get collectCount;
  @override
  @JsonKey(ignore: true)
  _$$_MomentCountCopyWith<_$_MomentCount> get copyWith =>
      throw _privateConstructorUsedError;
}

MomentMore _$MomentMoreFromJson(Map<String, dynamic> json) {
  return _MomentMore.fromJson(json);
}

/// @nodoc
mixin _$MomentMore {
  @JsonKey(name: 'is_follow')
  bool get isFollow => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_like')
  bool get isLike => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_collect')
  bool get isCollect => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MomentMoreCopyWith<MomentMore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MomentMoreCopyWith<$Res> {
  factory $MomentMoreCopyWith(
          MomentMore value, $Res Function(MomentMore) then) =
      _$MomentMoreCopyWithImpl<$Res, MomentMore>;
  @useResult
  $Res call(
      {@JsonKey(name: 'is_follow') bool isFollow,
      @JsonKey(name: 'is_like') bool isLike,
      @JsonKey(name: 'is_collect') bool isCollect});
}

/// @nodoc
class _$MomentMoreCopyWithImpl<$Res, $Val extends MomentMore>
    implements $MomentMoreCopyWith<$Res> {
  _$MomentMoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFollow = null,
    Object? isLike = null,
    Object? isCollect = null,
  }) {
    return _then(_value.copyWith(
      isFollow: null == isFollow
          ? _value.isFollow
          : isFollow // ignore: cast_nullable_to_non_nullable
              as bool,
      isLike: null == isLike
          ? _value.isLike
          : isLike // ignore: cast_nullable_to_non_nullable
              as bool,
      isCollect: null == isCollect
          ? _value.isCollect
          : isCollect // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MomentMoreCopyWith<$Res>
    implements $MomentMoreCopyWith<$Res> {
  factory _$$_MomentMoreCopyWith(
          _$_MomentMore value, $Res Function(_$_MomentMore) then) =
      __$$_MomentMoreCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'is_follow') bool isFollow,
      @JsonKey(name: 'is_like') bool isLike,
      @JsonKey(name: 'is_collect') bool isCollect});
}

/// @nodoc
class __$$_MomentMoreCopyWithImpl<$Res>
    extends _$MomentMoreCopyWithImpl<$Res, _$_MomentMore>
    implements _$$_MomentMoreCopyWith<$Res> {
  __$$_MomentMoreCopyWithImpl(
      _$_MomentMore _value, $Res Function(_$_MomentMore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFollow = null,
    Object? isLike = null,
    Object? isCollect = null,
  }) {
    return _then(_$_MomentMore(
      isFollow: null == isFollow
          ? _value.isFollow
          : isFollow // ignore: cast_nullable_to_non_nullable
              as bool,
      isLike: null == isLike
          ? _value.isLike
          : isLike // ignore: cast_nullable_to_non_nullable
              as bool,
      isCollect: null == isCollect
          ? _value.isCollect
          : isCollect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MomentMore implements _MomentMore {
  _$_MomentMore(
      {@JsonKey(name: 'is_follow') required this.isFollow,
      @JsonKey(name: 'is_like') required this.isLike,
      @JsonKey(name: 'is_collect') required this.isCollect});

  factory _$_MomentMore.fromJson(Map<String, dynamic> json) =>
      _$$_MomentMoreFromJson(json);

  @override
  @JsonKey(name: 'is_follow')
  final bool isFollow;
  @override
  @JsonKey(name: 'is_like')
  final bool isLike;
  @override
  @JsonKey(name: 'is_collect')
  final bool isCollect;

  @override
  String toString() {
    return 'MomentMore(isFollow: $isFollow, isLike: $isLike, isCollect: $isCollect)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MomentMore &&
            (identical(other.isFollow, isFollow) ||
                other.isFollow == isFollow) &&
            (identical(other.isLike, isLike) || other.isLike == isLike) &&
            (identical(other.isCollect, isCollect) ||
                other.isCollect == isCollect));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isFollow, isLike, isCollect);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MomentMoreCopyWith<_$_MomentMore> get copyWith =>
      __$$_MomentMoreCopyWithImpl<_$_MomentMore>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MomentMoreToJson(
      this,
    );
  }
}

abstract class _MomentMore implements MomentMore {
  factory _MomentMore(
          {@JsonKey(name: 'is_follow') required final bool isFollow,
          @JsonKey(name: 'is_like') required final bool isLike,
          @JsonKey(name: 'is_collect') required final bool isCollect}) =
      _$_MomentMore;

  factory _MomentMore.fromJson(Map<String, dynamic> json) =
      _$_MomentMore.fromJson;

  @override
  @JsonKey(name: 'is_follow')
  bool get isFollow;
  @override
  @JsonKey(name: 'is_like')
  bool get isLike;
  @override
  @JsonKey(name: 'is_collect')
  bool get isCollect;
  @override
  @JsonKey(ignore: true)
  _$$_MomentMoreCopyWith<_$_MomentMore> get copyWith =>
      throw _privateConstructorUsedError;
}
