part of '../api.dart';

class ApiRoom extends ApiBase {
  const ApiRoom(super.path);

  Future open({
    required String title,
    required String notice,
    required String? image,
    int? scene,
    bool? freeMic,
    String? pwd,
  }) {
    final _pwd = isEmpty(pwd)
        ? {
      'room_password': null,
      'private_status': ApiSwitch.open.code,
    }
        : {
      'room_password': pwd,
      'private_status': ApiSwitch.close.code,
    };

    final data = {
      'image': image,
      'room_name': title,
      'notice_message': notice,
      'max_num': 0,
      if (scene != null) 'scene_id': scene,
      if (freeMic != null) 'mike_status': freeMic ? ApiSwitch.open.code : ApiSwitch.close.code,
      ..._pwd,
    };

    return _doPost(
      'up',
      data: data,
      ext: {'RECEIVE_TIMEOUT': const Duration(seconds: 30)},
    );
  }

  ///
  /// 退出房间
  ///
  Future close() => _doPost('out');

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

  Future joinRoom(int id, {String? pwd}) {
    final data = {
      'room_id': id,
      'password': pwd,
    };

    return _doPost('join-room', data: data);
  }

  Future outRoom(int id) {
    final data = {
      'room_id': id,
    };

    return _doPost('out-room', data: data);
  }

  Future micDown({required int micId}) {
    final data = {
      'mike_id': micId,
    };

    return _doPost('out-mike', data: data);
  }

  Future micUp({required int roomId, required String no, String? uid}) {
    final data = {
      'room_id': roomId,
      'mike_no': no,
      if (uid != null) 'uid': uid,
    };

    return _doPost('up-mike', data: data);
  }

  ///type 1 申请 2.邀请
  ///status 1.确认 2.拒绝
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

  Future micMute({required int micId, required bool isMute}) {
    final data = {
      'mike_id': micId,
      'status': isMute ? 2 : 1,
    };

    return _doPost('mike/ban', data: data);
  }

  Future setManager({required int roomId, required UID uid, required bool isAdd}) {
    final data = {
      'room_id': roomId,
      'uid': uid,
      'status': isAdd ? 1 : 2,
    };

    return _doPost('set-admin', data: data);
  }

  Future managerList({required int roomId}) {
    final data = {
      'room_id': roomId,
      'status': 3,
    };

    return _doPost('get-admin', data: const PageNum(size: 999) + data);
  }

  Future setBlock({required int roomId, required UID uid, required bool isAdd}) {
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

  Future setNotice({required int roomId, required String notice}) {
    final data = {
      'room_id': roomId,
      'message': notice,
    };

    return _doPost('set-notice', data: data);
  }

  Future notice({required int roomId}) {
    final data = {
      'room_id': roomId,
    };

    return _doPost('get-notice', data: data);
  }

  Future resetHotCount({required int roomId, int? micId}) {
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
