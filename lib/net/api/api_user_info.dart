part of '../api.dart';

class ApiUserInfo extends ApiBase {
  const ApiUserInfo(super.path);

  Future home([UID? uid]) {
    final data = {
      if (uid != null) 'uid': uid,
    };

    return _doPost('homepage/query', data: data);
  }

  Future detail(UID uid) {
    final data = {
      'uid': uid,
    };

    return _doPost('query', data: data);
  }

  Future myInfo({String? token}) {
    return _doPost('detail/query', ext: {HttpHeaders.authorizationHeader: token}, tryTimes: 2);
  }

  Future<Map> simple(List<UID> uid) {
    final data = {
      'uid_list': uid,
    };

    return _doPost('batch_query', data: data).then((it) => it?['profiles'] ?? {});
  }

  Future search({required PageNum page, required String keyword}) {
    final data = {
      'keyword': keyword,
    };

    return _doPost('list', data: page + data);
  }

  Future setInfo({String? nickName, int? avatar, String? desc, DateTime? birth, GenderEnum? gender, String? token}) async {
    final data = <dynamic, dynamic>{
      if (nickName != null) //昵称
        'username': nickName,
      if (gender != null) //性别
        'sex': gender.code,
      if (desc != null) //用户描述
        'description': desc,
      if (avatar != null) //头像
        'media_id': avatar,
      if (birth != null) //出生日期的时间戳
        'data_birth': birth.millisecondsSinceEpoch,
    };

    /// 拉新数据
    await KvBox.read<Map>(PrefKey.OpenInstallBlindData).onNotNull((val) {
      data.addAll(val);
    });

    return _doPost('update', data: data, ext: {HttpHeaders.authorizationHeader: token});
  }

  Future<ErrorCode?> setInfo2(String? nickName) async {
    if(nickName == null) {
      return Future.value(null);
    }
    C_UpdateRole c_updateRole = C_UpdateRole();
    c_updateRole.username = nickName;
    S_UpdateRole? result = await SocketCtrl.ins.sendByteAsyncServer(
      CMD.C_UpdateRole,
      datas: c_updateRole.writeToBuffer(),
      resCmd: CMD.S_UpdateRole
    );
    return result?.code;
  }

  Future follow({required UID uid, required bool doFollow}) {
    final data = <String, dynamic>{
      'follow_uid': uid,
    };

    return doFollow //
        ? _doPost('follow/create', data: data)
        : _doPost('follow/delete', data: data);
  }

  Future remarkName({required UID uid, required String name}) {
    final data = <String, dynamic>{
      'follow_uid': uid,
      'remarks_name': name,
    };

    return _doPost('follow/remarks_name/update', data: data);
  }

  Future fansUserList({required PageNum page}) {
    final data = <String, dynamic>{
      'created_at_order_by': 2,
    };

    return _doPost('fans/query', data: page + data);
  }

  Future friendUserList({required PageNum page}) {
    final data = <String, dynamic>{
      'created_at_order_by': 2,
    };

    return _doPost('friend/query', data: page + data);
  }

  Future followUserList({required PageNum page}) {
    final data = <String, dynamic>{
      'created_at_order_by': 2,
    };

    return _doPost('follow/query', data: page + data);
  }

  Future access(UID uid) {
    final data = {
      'access_uid': uid,
    };

    return _doPost('access/create', data: data);
  }

  Future accessList({required PageNum page}) {
    final data = <String, dynamic>{
      'created_at_order_by': 2,
    };

    return _doPost('access/query', data: page + data);
  }

  Future accessAgg({required PageNum page}) {
    final data = <String, dynamic>{
      'created_at_order_by': 2,
    };

    return _doPost('access/statistics', data: page + data);
  }

  Future realName({required String name, required String number}) {
    final data = {
      'real_name': name,
      'identity_number': number,
    };

    return _doPost('real_name', data: data);
  }

  Future realFace({required String name, required String number}) {
    final data = {
      'real_name': name,
      'identity_number': number,
    };

    return _doPost('face_recognition/create', data: data);
  }

  Future realFaceCallback() {
    return _doPost('face_recognition/callback');
  }

  Future level(UID uid) {
    final data = {
      'uid': uid,
    };

    return _doPost('level/next/query', data: data);
  }

  Future charmLevel(UID uid) {
    final data = {
      'uid': uid,
    };
    return _doPost('charm_level/next/query', data: data);
  }

  Future charm(UID uid) {
    final data = {
      'uid': uid,
    };

    return _doPost('charm_level/next/query', data: data);
  }

  Future showWinningLottery(bool isShow) {
    final data = {
      'is_show': isShow,
    };

    return _doPost('show_winning_lottery', data: data);
  }

  //拉黑
  Future blackListPull(UID uid) {
    final data = {
      'uid': uid,
    };

    return _doPost('black_list/pull', data: data);
  }

  //查询黑名单
  Future blackListQuery({required PageNum page}) {
    return _doPost('black_list/query', data: page + {}).then((it) => it?['uid_list'] ?? []);
  }

  //移出黑名单
  Future blackListDelete(UID uid) {
    final data = {
      'uid': uid,
    };

    return _doPost('black_list/delete', data: data);
  }

  //是否在黑名单内
  Future blackListIsIn(UID uid) {
    final data = {
      'uid': uid,
    };

    return _doPost('black_list/is_in', data: data);
  }

  ///
  /// 礼物墙
  /// [uid] 用户id
  /// [nuid] 新的用户id
  ///
  Future getWallGift({UID? uid, NUID? nuid}) {
    final data = {
      if(uid != null)
        'uid': uid,
      if(nuid != null)
        'role_id': nuid,
    };
    return _doPost('gift_wall', data: data);
  }
}
