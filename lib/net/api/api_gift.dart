part of '../api.dart';

class ApiGift extends ApiBase {
  const ApiGift(super.path);

  Future list() {
    return _doPost('query').then(((it) => it['items']));
  }

  Future backpack() {
    return _doPost('backpack/query');
  }

  Future sendGift2Room({
    required int roomId,
    required int giftId,
    required int count,
    required bool isBackpack,
    required List<String> uid,
  }) {
    final data = {
      'room_id': roomId,
      'gift_id': giftId,
      'count': count,
      'uid_list': uid,
      'is_backpack': isBackpack,
    };

    return _doPost('room/send', data: data);
  }

  Future sendGift2Moment({
    required int id,
    required int giftId,
    required int count,
    required bool isBackpack,
  }) {
    final data = <String, dynamic>{
      'dynamic_id': id,
      'gift_id': giftId,
      'count': count,
      'is_backpack': isBackpack,
    };

    return _doPost('dynamic/send', data: data);
  }

  Future sendGift2ImUser({
    required UID uid,
    required int giftId,
    required int count,
  }) {
    final data = <String, dynamic>{
      'accept_uid': uid,
      'gift_id': giftId,
      'count': count,
    };

    return _doPost('backpack/give', data: data);
  }
}
