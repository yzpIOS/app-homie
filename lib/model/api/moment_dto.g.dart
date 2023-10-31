// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MomentDtoImpl _$$MomentDtoImplFromJson(Map<String, dynamic> json) =>
    _$MomentDtoImpl(
      content: MomentContent.fromJson(json['dynamic'] as Map<String, dynamic>),
      more: MomentMore.fromJson(json['more'] as Map<String, dynamic>),
      count: MomentCount.fromJson(json['count'] as Map<String, dynamic>),
      topic: (json['topic_list'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      liveState: json['liveState'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$MomentDtoImplToJson(_$MomentDtoImpl instance) =>
    <String, dynamic>{
      'dynamic': instance.content,
      'more': instance.more,
      'count': instance.count,
      'topic_list': instance.topic,
      'liveState': instance.liveState,
    };

_$MomentContentImpl _$$MomentContentImplFromJson(Map<String, dynamic> json) =>
    _$MomentContentImpl(
      id: json['dynamic_id'] as int,
      author: json['author_id'] as String,
      text: json['text'] as String,
      media: const MediaConverter().fromJson(json['dynamic_media'] as Map?),
      dateTime:
          const EpochDateTimeConverter().fromJson(json['created_at'] as int?),
      scope: json['auth'] as int,
      status: json['release_status'] as int,
    );

Map<String, dynamic> _$$MomentContentImplToJson(_$MomentContentImpl instance) =>
    <String, dynamic>{
      'dynamic_id': instance.id,
      'author_id': instance.author,
      'text': instance.text,
      'dynamic_media': const MediaConverter().toJson(instance.media),
      'created_at': const EpochDateTimeConverter().toJson(instance.dateTime),
      'auth': instance.scope,
      'release_status': instance.status,
    };

_$MomentCountImpl _$$MomentCountImplFromJson(Map<String, dynamic> json) =>
    _$MomentCountImpl(
      giftCount: json['gift_count'] as int,
      commentCount: json['comment_count'] as int,
      likeCount: json['like_count'] as int,
      collectCount: json['collect_count'] as int,
    );

Map<String, dynamic> _$$MomentCountImplToJson(_$MomentCountImpl instance) =>
    <String, dynamic>{
      'gift_count': instance.giftCount,
      'comment_count': instance.commentCount,
      'like_count': instance.likeCount,
      'collect_count': instance.collectCount,
    };

_$MomentMoreImpl _$$MomentMoreImplFromJson(Map<String, dynamic> json) =>
    _$MomentMoreImpl(
      isFollow: json['is_follow'] as bool,
      isLike: json['is_like'] as bool,
      isCollect: json['is_collect'] as bool,
    );

Map<String, dynamic> _$$MomentMoreImplToJson(_$MomentMoreImpl instance) =>
    <String, dynamic>{
      'is_follow': instance.isFollow,
      'is_like': instance.isLike,
      'is_collect': instance.isCollect,
    };
