part of '../api.dart';

class ApiMoment extends ApiBase {
  const ApiMoment(super.path);

  Future create({
    required String text,
    required int scope,
    required List<int> medias,
    int? topicId,
  }) {
    final data = <String, dynamic>{
      'text': text,
      'auth': scope,
      'release_status': 1,
      'media_id_list': medias,
      if (topicId != null) 'topic_id_list': [topicId],
    };

    return _doPost('create', data: data);
  }

  Future list({required PageNum page, UID? uid, int? topicId}) {
    if (topicId != null) {
      final data = <String, dynamic>{
        'topic_id': topicId,
        'created_at_order_by': 2,
      };

      return _doPost('query/topic', data: page + data);
    }

    final data = <String, dynamic>{
      if (uid != null) 'uid': uid,
      'created_at_order_by': 2,
    };

    return _doPost('query/user', data: page + data);
  }

  Future secretList({required PageNum page}) {
    final data = <String, dynamic>{
      'created_at_order_by': 2,
    };

    return _doPost('user/private', data: page + data);
  }

  Future detail({required int id}) {
    final data = const PageNum(size: 1) +
        {
          'dynamic_id_list': [id],
        };

    return _doPost('query/dynamic_id', data: data).then((val) => (val['items'] as Iterable?)?.firstOrNull);
  }

  Future delete({required int id}) {
    final data = <String, dynamic>{
      'id': id,
    };

    return _doPost('delete', data: data);
  }

  Future deleteComment({required int dynamicId, required int commentId}) {
    final data = <String, dynamic>{
      'dynamic_id': dynamicId,
      'comment_id': commentId,
    };

    return _doPost('comment/delete', data: data);
  }

  Future followList({required PageNum page}) {
    final data = <String, dynamic>{
      //
    };

    return _doPost('follow/query', data: page + data);
  }

  Future nearbyList({required PageNum page}) {
    final data = <String, dynamic>{
      //
    };

    return _doPost('nearby/query', data: page + data);
  }

  Future recommendList({required PageNum page}) {
    final data = <String, dynamic>{
      //
    };

    return _doPost('recommend/query', data: page + data);
  }

  ///测试-推荐接口
  Future recommend(List ids) {
    final data = {
      'items': ids.map((it) {
        return {
          'dynamic_id': it,
          'weight': 0,
        };
      }).toList(growable: false)
    };

    return _doPost('recommend/update', data: data);
  }

  Future like({required int id, required bool doLike}) {
    final data = <String, dynamic>{
      'dynamic_id': id,
    };

    return doLike //
        ? _doPost('like/create', data: data)
        : _doPost('like/delete', data: data);
  }

  Future commentList({required PageNum page, required int id, bool? desc}) {
    final data = <String, dynamic>{
      'dynamic_id': id,
      if (desc != null) 'created_at_order_by': 2,
      'reply_comment_count': 2,
    };

    return _doPost('comment/query', data: page + data);
  }

  Future commentLike({required int id, required bool doLike}) {
    final data = <String, dynamic>{
      'comment_id': id,
    };

    return doLike //
        ? _doPost('comment/like/create', data: data)
        : _doPost('comment/like/delete', data: data);
  }

  Future replyLike({required int id, required bool doLike}) {
    final data = <String, dynamic>{
      'reply_comment_id': id,
    };

    return doLike //
        ? _doPost('reply_comment/like/create', data: data)
        : _doPost('reply_comment/like/delete', data: data);
  }

  Future comment({required int id, required String text}) {
    final data = <String, dynamic>{
      'dynamic_id': id,
      'text': text,
    };

    return _doPost('comment/create', data: data);
  }

  Future commentReply({required int id, required String text, String? replyId}) {
    final data = <String, dynamic>{
      'comment_id': id,
      if (replyId != null) 'reply_comment_id': replyId,
      'text': text,
    };

    return _doPost('reply_comment/create', data: data);
  }

  Future commentReplyList({required PageNum page, required int id}) {
    final data = <String, dynamic>{
      'comment_id_list': [id],
      'created_at_order_by': 1,
    };

    return _doPost('reply_comment/query', data: page + data);
  }

  Future favList({required PageNum page}) {
    final data = <String, dynamic>{
      'created_at_order_by': 2,
    };

    return _doPost('collect/query', data: page + data);
  }

  Future likeList({required PageNum page}) {
    final data = <String, dynamic>{
      'created_at_order_by': 2,
    };

    return _doPost('like/query', data: page + data);
  }

  Future fav({required int id, required bool doFav}) {
    final data = <String, dynamic>{
      'dynamic_id': id,
    };

    return doFav //
        ? _doPost('collect/create', data: data)
        : _doPost('collect/delete', data: data);
  }

  Future topicDetail({required int id}) {
    final data = const PageNum(size: 1) +
        {
          'id_list': [id],
        };

    return _doPost('topic/query', data: data).then((val) => (val['items'] as Iterable?)?.firstOrNull);
  }

  Future topicList({required PageNum page, String? name}) {
    final data = <String, dynamic>{
      if (name != null) 'name': name,
    };

    return _doPost('topic/query', data: page + data);
  }
}
