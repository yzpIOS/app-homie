part of '../api.dart';

class ApiRoom extends ApiBase {
  const ApiRoom(super.path);

  Future<S_CreateScene?> open({
    required String title,
    required String notice,
    required String? image,
    int? scene,
    bool? freeMic,
    String? pwd,
  }) async {
    C_CreateScene c_createScene = C_CreateScene.create();
    // 房间密码
    if(isEmpty(pwd)) {
      c_createScene.privateStatus = ApiSwitch.open.code;
    } else {
      c_createScene.privateStatus = ApiSwitch.close.code;
    }
    c_createScene.roomPassword = pwd ?? "";
    c_createScene.image = image ?? "";
    c_createScene.name = title;
    c_createScene.noticeMessage = notice;
    c_createScene.maxNum = 0;
    c_createScene.sceneId = scene ?? 0;
    if(freeMic != null && freeMic == true) {
      c_createScene.mikeStatus = ApiSwitch.open.code;
    } else {
      c_createScene.mikeStatus = ApiSwitch.close.code;
    }
    // 发送数据
    S_CreateScene? response = await SocketCtrl.ins.sendByteAsyncServer(
        CMD.C_CreateScene,
        resCmd: CMD.S_CreateScene,
        datas: c_createScene.writeToBuffer()
    );
    return response;
  }

  ///
  /// 退出房间
  ///
  Future close() async {
    var result = await SocketCtrl.ins.sendByteAsyncServer(
        CMD.C_CloseScene,
        resCmd: CMD.S_CloseScene
    );
    return result;

    return _doPost('out');
  }

  ///type 1.自定义 2工会 3.广场
  Future info({int? roomId, RoomType? type, int tryTimes = 0}) {
    final data = {
      if (roomId != null) 'room_id': roomId,
      if (type != null) 'room_type': type.code,
    };

    return _doPost('get', data: data, tryTimes: tryTimes);
  }

  Future homeRoom() {
    return _doPost('scene-group/list');
  }

  Future onlineUser({required PageNum page, required int roomId}) {
    final data = {
      'room_id': roomId,
    };

    return _doPost('on-line', data: page + data);
  }

  Future wealthyRankUserList({required PageNum page, required int roomId, required int type}) {
    final data = {
      'room_id': roomId,
      'rank_date_type': type,
    };

    return _doPost('rank', data: page + data);
  }

  Future charmRankUserList({required PageNum page, required int roomId, required int type}) {
    final data = {
      'room_id': roomId,
      'rank_date_type': type,
    };

    return _doPost('/charm/rank', data: page + data);
  }

  Future<S_JoinScene?> joinRoom(int id, {String? pwd, int timeout = 16}) async {
    // 发送加入房间的socket
    C_JoinScene c_joinScene = C_JoinScene();
    c_joinScene.roomId = Int64(id);
    c_joinScene.roomPassword = pwd ?? "";
    return await SocketCtrl.ins.sendByteAsyncServer(
      CMD.C_JoinScene,
      datas: c_joinScene.writeToBuffer(),
      resCmd: CMD.S_JoinScene,
      timeout: timeout
    );
  }

  Future getRoomInfo(int id, {String? pwd}) {
    final data = {
      'room_id': id,
      'password': pwd,
    };
    // 数据回来后
    return _doPost('join/init', data: data, tryTimes: 2);
  }

  ///
  /// 退出房间
  ///
  Future<dynamic> outRoom(int id) async {
    // 发送加入房间的socket
    return await SocketCtrl.ins.sendByteAsyncServer(
        CMD.C_OutScene, resCmd: CMD.S_OutScene);


    final data = {
      'room_id': id,
    };

    return _doPost('out-room', data: data);
  }

  ///
  /// 房间下麦
  ///
  void micDown({Int64? uid, List<Int64>? uids}) {
    C_OutMike c_outMike = C_OutMike.create();
    if(uid != null) {
      c_outMike.roleId = uid;
    }
    if(uids != null) {
      c_outMike.roleIds.addAll(uids);
    }
    SocketCtrl.ins.sendSever(
      CMD.C_OutMike,
      message: c_outMike,
    );

    // final data = {
    //   'mike_id': micId,
    // };
    //
    // return _doPost('out-mike', data: data);
  }

  ///
  /// 房间上麦
  ///
  Future<S_UpMike?> micUp({required int roomId, required String no, NUID? uid}) async {
    C_UpMike c_upMike = C_UpMike();
    if(uid != null) {
      c_upMike.roleId = uid;
    }
    c_upMike.mikeNo = no;

    return SocketCtrl.ins.sendByteAsyncServer(
        CMD.C_UpMike,
        datas: c_upMike.writeToBuffer(),
      resCmd: CMD.S_UpMike
    );

    final data = {
      'room_id': roomId,
      'mike_no': no,
      if (uid != null) 'uid': uid,
    };

    // return _doPost('up-mike', data: data);
  }

  ///
  /// 麦克风确认【待定】
  /// type 1 申请 2.邀请
  /// status 1.确认 2.拒绝
  ///
  Future micConfirm({required int mikeId, required bool isAgree, required int type, int? uid, int? roomId}) {
    final data = {
      'mike_id': mikeId,
      'type': type,
      'status': isAgree ? 1 : 2,
      if(uid != null)
        "role_id": uid.toInt(),
      if(roomId != null)
        "room_id": roomId,
    };

    return _doPost('mike/confirm', data: data);
  }

  Future search({required PageNum page, required String keyword}) {
    final data = {
      'Keyword': keyword,
      'room_type_list': const [1, 2],
    };

    return _doPost('list', data: page + data);
  }

  Future locationRoomList({required PageNum page}) {
    return _doPost('location/list', data: page + {});
  }

  Future hotRoomList({required PageNum page}) {
    return _doPost('hot', data: page + {});
  }

  Future hotFollowList({required PageNum page}) {
    return _doPost('hot/follow', data: page + {});
  }

  Future micList({required int roomId}) {
    final data = {
      'room_id': roomId,
      'status': 1,
    };

    return _doPost('mike/list', data: const PageNum(size: 999) + data);
  }

  Future micReqList({required PageNum page, required int roomId}) {
    final data = {
      'room_id': roomId,
      'status': 3,
    };

    return _doPost('mike/list', data: page + data);
  }

  Future micMute({required NUID roleId, required bool isMute}) {
    C_BanMike c_banMike = C_BanMike.create();
    c_banMike.roleId = roleId;
    c_banMike.status = isMute ? 2 : 1;
    SocketCtrl.ins.sendSever(CMD.C_BanMike, message: c_banMike);
    return Future.value();

    final data = {
      'mike_id': roleId,
      'status': isMute ? 2 : 1,
    };

    return _doPost('mike/ban', data: data);
  }

  Future setManager({required int roomId, required UID uid, required bool isAdd}) async {
    C_SetAdministrator cSetnoticemessage = C_SetAdministrator.create();
    cSetnoticemessage.status = isAdd ? 1 : 2;//1添加  2移除
    cSetnoticemessage.uid = uid;
    await SocketCtrl.ins.sendByteAsyncServer(
        CMD.C_SetAdministrator,
        datas: cSetnoticemessage.writeToBuffer(),
        resCmd: CMD.S_SetAdministrator
    );
    return Future.value(1);
  }

  Future managerList({required int roomId}) {
    final data = {
      'room_id': roomId,
      'status': 3,
    };

    return _doPost('get-admin', data: const PageNum(size: 999) + data);
  }

  Future setBlock({required UID uid, required int roomId, required bool isAdd}) {
    C_SetBlack c_setBlack = C_SetBlack.create();
    c_setBlack.status = isAdd ? 1 : 2;//1拉黑  2拉白
    c_setBlack.uid = uid;
    SocketCtrl.ins.sendSever(CMD.C_SetBlack, message: c_setBlack);
    return Future.value(1);

    final data = {
      'room_id': roomId,
      'uid': uid,
      'status': isAdd ? 1 : 2,
    };

    return _doPost('set-black', data: data);
  }

  Future blockList({required PageNum page, required int roomId}) {
    final data = {
      'room_id': roomId,
      'status': 3,
    };

    return _doPost('black-list', data: page + data);
  }

  bool setNotice({required int roomId, required String notice}) {
    C_SetNoticeMessage c_setNoticeMessage = C_SetNoticeMessage.create();
    c_setNoticeMessage.message = notice;
    return SocketCtrl.ins.sendSever(CMD.C_SetNoticeMessage, message: c_setNoticeMessage);
  }

  Future notice({required int roomId}) {
    final data = {
      'room_id': roomId,
    };

    return _doPost('get-notice', data: data);
  }

  ///
  /// 清除麦克风热度计数器
  /// https://yapi.pro/project/11739/interface/api/457358
  ///
  Future resetHotCount(List<Int64> roleIds) {
    C_AccMikeClear cAccmikeclear = C_AccMikeClear.create();
    cAccmikeclear.roleIdList.addAll(roleIds);

    SocketCtrl.ins.sendSever(CMD.C_AccMikeClear, message: cAccmikeclear);
    return Future.value(1);

  }

  Future hotCount({required int roomId}) {
    final data = {
      'room_id': roomId,
    };

    return _doPost('mike/hots', data: data);
  }

  Future follow({required int roomId, required bool doFollow}) {
    final data = {
      'room_id': roomId,
    };

    return doFollow //
        ? _doPost('collect/add', data: data)
        : _doPost('collect/del', data: data);
  }

  Future followList({required PageNum page}) {
    return _doPost('collect/list', data: page + {});
  }

  Future historyList({required PageNum page}) {
    return _doPost('history/list', data: page + {});
  }

  Future heartbeat({required int roomId}) {
    final data = {
      'room_id': roomId,
    };

    return _doPost('heartbeat', data: data);
  }

  /// 获取PK房间列表
  Future getPKRoomList({required PageNum page}) async {
    C_PKRoomList c_pkRoomList = C_PKRoomList.create();
    c_pkRoomList.limit = Int64(page.limit);
    c_pkRoomList.offset = Int64(page.offset);

    S_PKRoomList? roomList = await SocketCtrl.ins.sendByteAsyncServer(
      CMD.C_PKRoomList,
      datas: c_pkRoomList.writeToBuffer(),
      resCmd: CMD.S_PKRoomList
    );

    return roomList?.roomList.map((e) {
      return {
        'roomId' : e.roomId.toInt(),//房间id
        'roomName' : e.roomName,//房间名称
        'roomImage' : e.roomImage,//房间图片
        'hotValue' : e.hotValue,//房间热度
        'isInvite' : e.isInvite,//是否已被邀请
      };
    }).toList();
  }

  /// 与房间服务器通信，对战前的匹配，仅管理可以操作
  /// F告诉S端想新建对战，邀请与另一队对战
  bool sendPKInvite({required int selfGuildId, required int invitedGuildId}) {
    C_PKInvite c_pkInvite = C_PKInvite.create();
    c_pkInvite.selfGuildId = Int64(selfGuildId);//己方公会ID
    c_pkInvite.invitedGuildId = Int64(invitedGuildId);//被邀请的公会ID
    return SocketCtrl.ins.sendSever(
      CMD.C_PKInvite,
      message: c_pkInvite,
    );
  }

  /// 被邀请的F端选择是否接受邀请
  bool pkAccept({required bool accept, required Int64 invitingGuildId}) {
    C_PKAccept c_pkAccept = C_PKAccept.create();
    c_pkAccept.accept = accept;//true为接受，false为拒绝
    c_pkAccept.invitingGuildId = invitingGuildId;//接受了谁的邀请
    return SocketCtrl.ins.sendSever(
      CMD.C_PKAccept,
      message: c_pkAccept,
    );
  }

  /// 获取主播直播状态
  Future anchorLiveState({required List<int?> roleIdList}) {
    final data = {
      'role_id_list': roleIdList,//角色用户id集
    };

    return _doPost('anchor/live/state', data: data);
  }

  ///
  /// 获取随机在线房间
  ///
  Future getRandomRoom() async {
    return _doPost('random');
  }

  ///
  /// 开禁麦
  /// [roomId] 房间id
  /// [status] 1.开麦 2.闭麦
  /// [role_id_list] 角色id组，不传默认是全员闭麦
  ///
  Future speaking(int roomId, int status, {List<String>? role_id_list}) {
    final data = {
      'room_id': roomId,
      'status': status,
      if(role_id_list != null)
        'role_id_list': role_id_list,
    };
    return _doPost("mike/speaking", data: data);
  }

  ///
  /// 查询用户是否在公会中
  /// [guildId] 公会id
  ///
  Future userGuildStatus(String guildId) {
    return _doPost("guild/confirm", data: {
      "guild_id": guildId,
    });
  }

  ///
  /// 加入公会
  /// http://192.168.1.156:20000/project/15/interface/api/2320
  /// [status] 状态： 1.确认， 2.邀请中 3.已拒绝
  ///
  Future joinGuild(int guildId, int status) {
    return _doPost("guild/confirm", data: {
      "guild_id": guildId,
      "status": status,
    });
  }

  ///
  /// 热播分类
  ///
  Future getCategory() {
    return _doPost("classify/list");
  }

  Future getCategoryItemList(PageNum page, dynamic classify_id) {
    return _doPost("list", data: page + {"classify_id": classify_id});
  }
}
