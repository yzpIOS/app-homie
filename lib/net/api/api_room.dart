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
    if(freeMic != null) {
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
  Future info({int? roomId, RoomType? type}) {
    final data = {
      if (roomId != null) 'room_id': roomId,
      if (type != null) 'room_type': type.code,
    };

    return _doPost('get', data: data);
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

  Future<S_JoinScene?> joinRoom(int id, {String? pwd}) async {
    // 发送加入房间的socket
    C_JoinScene c_joinScene = C_JoinScene(roomId: Int64(id), roomPassword: pwd ?? "");
    return await SocketCtrl.ins.sendByteAsyncServer(
        CMD.C_JoinScene,
        datas: c_joinScene.writeToBuffer(),
        resCmd: CMD.S_JoinScene);
  }

  Future getRoomInfo(int id, {String? pwd}) {
    final data = {
      'room_id': id,
      'password': pwd,
    };
    // 数据回来后
    return _doPost('join/init', data: data,);
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
  void micDown({required Int64 uid}) {
    C_OutMike c_outMike = C_OutMike.create();
    c_outMike.roleId = uid;
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
    C_UpMike c_upMike = C_UpMike(mikeNo: no, roleId: uid);
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
  Future micConfirm({required int mikeId, required bool isAgree, required int type}) {
    final data = {
      'mike_id': mikeId,
      'type': type,
      'status': isAgree ? 1 : 2,
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
    cSetnoticemessage.status = isAdd ? 1 : 2;
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
    c_setBlack.status = isAdd ? 1 : 2;
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
  Future resetHotCount({required int roomId, int? micId}) {
    C_AccMikeClear cAccmikeclear = C_AccMikeClear.create();
    cAccmikeclear.mikeId = Int64(micId ?? 0);
    SocketCtrl.ins.sendSever(CMD.C_AccMikeClear, message: cAccmikeclear);
    return Future.value(1);
    
    final data = {
      'room_id': roomId,
      if (micId != null) 'mike_id': micId,
    };

    return _doPost('mike/clear-hots', data: data);
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
}
