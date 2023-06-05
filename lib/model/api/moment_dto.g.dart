// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MomentDto _$$_MomentDtoFromJson(Map<String, dynamic> json) => _$_MomentDto(
      content: MomentContent.fromJson(json['dynamic'] as Map<String, dynamic>),
      more: MomentMore.fromJson(json['more'] as Map<String, dynamic>),
      count: MomentCount.fromJson(json['count'] as Map<String, dynamic>),
      topic: (json['topic_list'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$_MomentDtoToJson(_$_MomentDto instance) =>
    <String, dynamic>{
      'dynamic': instance.content,
      'more': instance.more,
      'count': instance.count,
      'topic_list': instance.topic,
    };

_$_MomentContent _$$_MomentContentFromJson(Map<String, dynamic> json) =>
    _$_MomentContent(
      id: json['dynamic_id'] as int,
      author: json['author_id'] as String,
      text: json['text'] as String,
      media: const MediaConverter().fromJson(json['dynamic_media'] as Map?),
      dateTime:
          const EpochDateTimeConverter().fromJson(json['created_at'] as int?),
      scope: json['auth'] as int,
      status: json['release_status'] as int,
    );

Map<String, dynamic> _$$_MomentContentToJson(_$_MomentContent instance) =>
    <String, dynamic>{
      'dynamic_id': instance.id,
      'author_id': instance.author,
      'text': instance.text,
      'dynamic_media': const MediaConverter().toJson(instance.media),
      'created_at': const EpochDateTimeConverter().toJson(instance.dateTime),
      'auth': instance.scope,
      'release_status': instance.status,
    };

_$_MomentCount _$$_MomentCountFromJson(Map<String, dynamic> json) =>
    _$_MomentCount(
      giftCount: json['gift_count'] as int,
      commentCount: json['comment_count'] as int,
      likeCount: json['like_count'] as int,
      collectCount: json['collect_count'] as int,
    );

Map<String, dynamic> _$$_MomentCountToJson(_$_MomentCount instance) =>
    <String, dynamic>{
      'gift_count': instance.giftCount,
      'comment_count': instance.commentCount,
      'like_count': instance.likeCount,
      'collect_count': instance.collectCount,
    };

_$_MomentMore _$$_MomentMoreFromJson(Map<String, dynamic> json) =>
    _$_MomentMore(
      isFollow: json['is_follow'] as bool,
      isLike: json['is_like'] as bool,
      isCollect: json['is_collect'] as bool,
    );

Map<String, dynamic> _$$_MomentMoreToJson(_$_MomentMore instance) =>
    <String, dynamic>{
      'is_follow': instance.isFollow,
      'is_like': instance.isLike,
      'is_collect': instance.isCollect,
    };
