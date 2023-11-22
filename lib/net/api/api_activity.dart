part of '../api.dart';

class ApiActivity extends ApiBase {
  const ApiActivity(super.path);

  Future sign() {
    return _doPost('baily-sign');
  }

  Future list() {
    return _doPost('baily-sign/list');
  }

  Future myList() {
    return _doPost('acc-sign/list');
  }

  Future accSign(int id) {
    return _doPost('acc-sign', data: {'acc_daily_sign_id': id});
  }

  ///
  /// 获取活动
  /// http://192.168.1.156:20000/project/15/interface/api/2126
  ///
  Future getBanner() {
    return _doPost("advertisement/list");
  }
}
