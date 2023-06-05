part of '../api.dart';

class ApiLottery extends ApiBase {
  const ApiLottery(super.path);

  Future list() {
    return _doPost('gift/lottery/medium/query');
  }

  Future pool() {
    return _doPost('activity/lottery/prize_pool/query');
  }

  Future today() {
    return _doPost('activity/lottery/top/today');
  }

  Future yesterday() {
    return _doPost('activity/lottery/top/yesterday');
  }

  Future winning() {
    return _doPost('activity/lottery/user/winning');
  }

  Future buy({required int id, required int count}) {
    final data = {
      'gift_id': id,
      'count': count,
    };

    return _doPost('gift/lottery/medium/buy', data: data);
  }

  Future balance() {
    final data = {
      'is_use': false,
    };

    return _doPost('activity/lottery/medium/total', data: data);
  }

  Future start(int count) {
    final data = {
      'count': count,
    };

    return _doPost(
      'activity/lottery/use',
      data: data,
      ext: {'RECEIVE_TIMEOUT': const Duration(seconds: 20)},
    );
  }
}
