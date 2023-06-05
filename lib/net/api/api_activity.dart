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
}
