part of '../api.dart';

class ApiGift extends ApiBase {
  const ApiGift(super.path);

  Future list() {
    return _doPost('query').then(((it) => it['items']));
  }

  Future backpack() {
    return _doPost('backpack/query');
  }

  Future<S_GiveGiftByRoom?> sendGift2Room({
    required int roomId,
    required int giftId,
    required int count,
    required bool isBackpack,
    required List<String> uid,
  }) async {

    C_GiveGiftByRoom c_giveGiftByRoom = C_GiveGiftByRoom.create();
    c_giveGiftByRoom.acceptUidList.addAll(uid);
    c_giveGiftByRoom.roomId = Int64(roomId);
    c_giveGiftByRoom.giftId = Int64(giftId);
    c_giveGiftByRoom.count = count;

    return await SocketCtrl.ins.sendByteAsyncServer(
        CMD.C_GiveGiftByRoom,
        datas: c_giveGiftByRoom.writeToBuffer(),
        resCmd: CMD.S_GiveGiftByRoom
    );

    // final data = {
    //   'room_id': roomId,
    //   'gift_id': giftId,
    //   'count': count,
    //   'uid_list': uid,
    //   'is_backpack': isBackpack,
    // };
    //
    // return _doPost('room/send', data: data);
  }

  Future<S_GiveGiftByDynamic?> sendGift2Moment({
    required int id,
    required int giftId,
    required int count,
    required bool isBackpack,
  }) async {
    C_GiveGiftByDynamic c_giveGiftByRoom = C_GiveGiftByDynamic.create();
    c_giveGiftByRoom.dynamicId = Int64(id);
    c_giveGiftByRoom.giftId = Int64(giftId);
    c_giveGiftByRoom.count = count;

    return await SocketCtrl.ins.sendByteAsyncServer(
        CMD.C_GiveGiftByDynamic,
        datas: c_giveGiftByRoom.writeToBuffer(),
        resCmd: CMD.S_GiveGiftByDynamic
    );

    // final data = <String, dynamic>{
    //   'dynamic_id': id,
    //   'gift_id': giftId,
    //   'count': count,
    //   'is_backpack': isBackpack,
    // };
    //
    // return _doPost('dynamic/send', data: data);
  }

  Future sendGift2ImUser({
    required UID uid,
    required int giftId,
    required int count,
  }) async {

    // C_GiveGiftByIm c_giveGiftByRoom = C_GiveGiftByIm.create();
    // c_giveGiftByRoom.acceptUid = uid;
    // c_giveGiftByRoom.giftId = Int64(giftId);
    // c_giveGiftByRoom.count = count;
    //
    // return await SocketCtrl.ins.sendByteAsyncServer(
    //     CMD.C_GiveGiftByIm,
    //     datas: c_giveGiftByRoom.writeToBuffer(),
    //     resCmd: CMD.S_GiveGiftByIm
    // );

    final data = <String, dynamic>{
      'accept_uid': uid,
      'gift_id': giftId,
      'count': count,
    };

    return _doPost('backpack/give', data: data);
  }
}
