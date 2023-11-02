part of '../api.dart';

class ApiCommon extends ApiBase {
  const ApiCommon(super.path);

  Future<Tuple3<int, String, String?>> addMedia({required UploadMediaAttach attach, bool blurHash = true}) async {
    var result2 = await upImageAddMedia(attach: attach, blurHash: blurHash);

    return Tuple3(result2.value1, result2.value2, result2.value3);
  }

  Future<Tuple4<int, String, String?, Map>> upImageAddMedia({required UploadMediaAttach attach, bool blurHash = true, bool? need_audit}) async {
    final result = await attach.upLoad({'blurHash': blurHash});

    final extra = result.value2;

    final data = {
      'type': attach.upType,
      'media_file_name': result.value1,
      if (extra != null) 'extra': extra,
      if (need_audit != null) 'need_audit' : need_audit,
    };

    final uri = Env.apiImgUrl.replace(
      path: _withBasePath('document/media/upload/handle'),
    );

    final resp = await _doPost2(uri.toString(), data: data);

    return Tuple4(resp['id'], resp['media_url'], extra, resp);
  }

  Future<Tuple4<int, String, String?, Map>> upImage({required ImageAttach attach, bool blurHash = true, bool? need_audit}) {
    return upImageAddMedia(attach: attach, blurHash: blurHash, need_audit: need_audit);
  }

  ///type 媒体类型，0：图片， 1：视频
  Future upToken({required int type}) {
    final data = {
      'type': type,
    };

    final uri = Env.apiImgUrl.replace(
      path: _withBasePath('document/media/upload/get'),
    );

    return _doPost2(uri.toString(), data: data);
  }

  Future banner() {
    final data = {
      'status': 1,
    };

    return _doPost('advert/banner/list', data: data);
  }

  Future imToken() {
    return _doPost('im/token/get').then((val) => val['token']);
  }

  ///加载单聊记录
  Future imSingleChatLoad({required String? accept_uid, required int? send_at}) {
    final data = {
      if (accept_uid != null) 'accept_uid': accept_uid,
      if (send_at != null) 'send_at': send_at,
    };

    return _doPost('im/single_chat/load', data: data);
  }

  ///type 类型：1.房间 2.用户 3.动态
  ///report_type 举报类型 1.语音 2.个人信息 3.私信 4.公聊&留言板
  ///report_reason 举报原因 1.低俗色情 2.侮辱谩骂 3.谣言政治 4.漫骂攻击 5.虚假消息 6.推销广告 7.抄袭内容 8.危害未成年人 9.侵犯权益 10.其他
  Future report({
    required int type,
    required Object id,
    int? reportType,
    int? reason,
    String? context,
    List<String>? medias,
  }) async {
    final data = {
      'type': type,
      if (type == 1) 'room_id': id else if (type == 2) 'uid': id else if (type == 3) 'dynamic_id': id,
      if (reportType != null) 'report_type': reportType,
      if (reason != null) 'report_reason': reason,
      if (medias != null) 'medias': medias,
      if (context != null) 'context': context,
    };

    return _doPost('feedback/report/create', data: data);
  }

  Future config() {
    return _doPost('configure/query');
  }

  /// 获取房间系统公告
  Future systemQuery() {
    return _doPost('configure/system/query');
  }
}
