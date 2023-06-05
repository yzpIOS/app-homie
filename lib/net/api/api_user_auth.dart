part of '../api.dart';

class ApiUserAuth extends ApiBase {
  const ApiUserAuth(super.path);

  Future sms({required String phone, required VerifyCodeEnum type}) {
    final data = {
      'phone': phone,
      'scope': type.code,
    };

    return _doPost('sms/send', data: data);
  }

  Future loginByPwd({required String name, required String pwd}) {
    final data = {
      'username': name,
      'password': pwd,
    };

    return _doPost('login/password', data: data);
  }

  Future loginBySms({required String phone, required String smsToken, required String smsCode, String? thirdToken}) {
    final data = {
      'phone': phone,
      'sms_code': smsCode,
      'sms_token': smsToken,
      if (thirdToken != null) 'third_party_token': thirdToken,
    };

    return _doPost('login/sms', data: data);
  }

  Future loginByWx({required String code}) {
    final data = {
      'code': code,
    };

    return _doPost('login/wechat', data: data);
  }

  Future loginByOneClick(String token) {
    final data = {
      'auth_token': token,
    };

    return _doPost('login/phone', data: data);
  }

  Future findPwdBySms({required String phone, required String smsToken, required String smsCode, String? thirdToken}) {
    final data = {
      'phone': phone,
      'sms_code': smsCode,
      'sms_token': smsToken,
      if (thirdToken != null) 'third_party_token': thirdToken,
    };

    return _doPost('password/back', data: data);
  }

  Future updatePwd({required String pwd, String? oldPwd}) {
    final data = {
      'password': pwd,
      if (oldPwd != null) 'old_password': oldPwd,
    };

    return _doPost('password/update', data: data);
  }

  Future privacy() {
    return _doPost('privacy/query');
  }

  Future logout() {
    return _doPost('logout');
  }

  Future tooYoung() {
    return _doPost('adolescent_model/start');
  }

  Future cancelAccount() {
    return _doPost('cancel_account');
  }

  Future bindQuery() {
    return _doPost('bind/query');
  }

  Future bindWechat(String code) {
    final data = {
      'code': code,
    };

    return _doPost('bind/wechat', data: data);
  }

  Future unbindWechat() {
    return _doPost('unbind/wechat');
  }
}
