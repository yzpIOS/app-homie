import 'package:app/model/converter/epoch_date_time_converter.dart';
import 'package:app/model/converter/media_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'moment_dto.freezed.dart';
part 'moment_dto.g.dart';

@freezed
class MomentDto with _$MomentDto {
  factory MomentDto({
    @JsonKey(name: 'dynamic') required MomentContent content,
    required MomentMore more,
    required MomentCount count,
    @JsonKey(name: 'topic_list') List<Map>? topic,
    required Map? liveState,
  }) = _MomentDto;

  factory MomentDto.fromJson(Map<String, dynamic> json) => _$MomentDtoFromJson(json);
}

@freezed
class MomentContent with _$MomentContent {
  factory MomentContent({
    @JsonKey(name: 'dynamic_id') required int id,
    @JsonKey(name: 'author_id') required String author,
    required String text,
    @JsonKey(name: 'dynamic_media') @MediaConverter() List? media,
    @JsonKey(name: 'created_at') @EpochDateTimeConverter() required DateTime? dateTime,
    @JsonKey(name: 'auth') required int scope,
    @JsonKey(name: 'release_status') required int status,
  }) = _MomentContent;

  factory MomentContent.fromJson(Map<String, dynamic> json) => _$MomentContentFromJson(json);
}

@freezed
class MomentCount with _$MomentCount {
  factory MomentCount({
    @JsonKey(name: 'gift_count') required int giftCount,
    @JsonKey(name: 'comment_count') required int commentCount,
    @JsonKey(name: 'like_count') required int likeCount,
    @JsonKey(name: 'collect_count') required int collectCount,
  }) = _MomentCount;

  factory MomentCount.fromJson(Map<String, dynamic> json) => _$MomentCountFromJson(json);
}

@freezed
class MomentMore with _$MomentMore {
  factory MomentMore({
    @JsonKey(name: 'is_follow') required bool isFollow,
    @JsonKey(name: 'is_like') required bool isLike,
    @JsonKey(name: 'is_collect') required bool isCollect,
  }) = _MomentMore;

  factory MomentMore.fromJson(Map<String, dynamic> json) => _$MomentMoreFromJson(json);
}
