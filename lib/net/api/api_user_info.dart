part of '../api.dart';

class ApiUserInfo extends ApiBase {
  const ApiUserInfo(super.path);

  /// 获取用户个人主页
  Future home([UID? uid]) async {
    final data = {
      if (uid != null) 'uid': uid,
    };

    final result = await _doPost('homepage/query', data: data);

    return requestAnchorLiveState(result: result);
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

  /// 检查用户昵称是否合规
  Future userNameCheck({required String user_name, String? token}) async {
    final data = <String, dynamic>{
      'user_name': user_name,
    };

    return _doPost('user_name/check', data: data, ext: {HttpHeaders.authorizationHeader: token});
  }

  Future setInfo({String? nickName, int? avatar, String? desc, DateTime? birth, GenderEnum? gender, String? token}) async {
    final data = <dynamic, dynamic>{
      if (nickName != null) //
        'username': nickName,
      if (gender != null) //
        'sex': gender.code,
      if (desc != null) //
        'description': desc,
      if (avatar != null) //
        'media_id': avatar,
      if (birth != null) //
        'data_birth': birth.millisecondsSinceEpoch,
    };

    /// 拉新数据
    await KvBox.read<Map>(PrefKey.OpenInstallBlindData).onNotNull((val) {
      data.addAll(val);
    });
    print("拉新数据: ${data.toString()}");

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

  /// 粉丝列表
  Future fansUserList({required PageNum page}) async {
    final data = <String, dynamic>{
      'created_at_order_by': 2,
    };

    final result = await _doPost('fans/query', data: page + data);

    return requestAnchorLiveState(result: result);
  }

  /// 朋友列表
  Future friendUserList({required PageNum page, bool requestLiveState = false}) async {
    final data = <String, dynamic>{
      'created_at_order_by': 2,
    };

    final result = await _doPost('friend/query', data: page + data);

    return requestAnchorLiveState(result: result);
  }

  /// 关注列表
  Future followUserList({required PageNum page}) async {
    final data = <String, dynamic>{
      'created_at_order_by': 2,
    };

    final result = await _doPost('follow/query', data: page + data);

    return requestAnchorLiveState(result: result);
  }

  /// 创建访问用户主页记录
  Future access(UID uid) {
    final data = {
      'access_uid': uid,
    };

    return _doPost('access/create', data: data);
  }

  /// 消息页 - 我的访客  （查看访问列表明细）
  Future accessList({required PageNum page}) async {
    final data = <String, dynamic>{
      'created_at_order_by': 2,
    };

    final result = await _doPost('access/query', data: page + data);

    return requestAnchorLiveState(result: result);
  }

  /// 我的页 - 访客
  Future accessAgg({required PageNum page}) async {
    final data = <String, dynamic>{
      'created_at_order_by': 2,
    };

    final result = await _doPost('access/statistics', data: page + data);

    return requestAnchorLiveState(result: result);
  }

  /// 获取主播直播状态
  Future requestAnchorLiveState({required Map result}) async {
    if (result.containsKey('items') && result['items'] != null) {
      List items = result['items'];

      // 提取role_id列表
      List<int> roleIdList = [];
      for (var item in items) {
        if (item.containsKey('role_id')) {
          roleIdList.add(item['role_id']);//角色用户id
        }
      }

      if (roleIdList.isNotEmpty) {
        // 请求接口获取直播状态
        final liveStateList = await Api.Room.anchorLiveState(roleIdList: roleIdList);

        // 将直播状态添加到对应的Map中
        for (var liveState in liveStateList) {
          if (liveState.containsKey('role_id')) {
            int roleId = liveState['role_id'];
            for (var item in items) {
              if (item.containsKey('role_id') && item['role_id'] == roleId) {
                // 将liveState中的数据添加到item中
                item.addAll(liveState);
              }
            }
          }
        }

        // 更新items
        result['items'] = items;
      }
    } else if (result.containsKey('role_id') && result['role_id'] != null) {
      // 提取role_id列表
      List<int> roleIdList = [result['role_id']];
      // 请求接口获取直播状态
      final liveStateList = await Api.Room.anchorLiveState(roleIdList: roleIdList);
      if (liveStateList is List) {
         Map liveState = liveStateList.first;
         if (liveState.isNotEmpty) {
           result.addIf(true, 'liveState', liveState);
         }
      }
    } else if (result.containsKey('roleIdList') && result['roleIdList'] != null) {
      // 请求接口获取直播状态
      final liveStateList = await Api.Room.anchorLiveState(roleIdList: result['roleIdList']);
      return liveStateList;
    }

    return result;
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

  ///
  /// 登录处理
  ///
  Future loginUpdate() {
    return _doPost("login/update");
  }

  /// 获取用户跟随关注信息
  Future followOnline({NUID? nuid}) {
    final data = {
      if(nuid != null)
        'role_id': nuid.toInt(),//角色用户id
    };
    return _doPost('follow/online', data: data);
  }
}
