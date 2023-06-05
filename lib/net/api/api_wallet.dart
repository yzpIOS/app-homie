part of '../api.dart';

class ApiWallet extends ApiBase {
  const ApiWallet(super.path);

  Future myWallet() {
    return _doPost('query');
  }

  Future rechargeCombo() {
    //1：ios，2：android，3：h5
    final data = {
      'recharge_platform': Platform.isIOS ? 1 : (Platform.isAndroid ? 2 : -1),
    };

    return _doPost('diamond/recharge_combo/query', data: data);
  }

  Future recharge({required int id, required int payType}) {
    final data = {
      'recharge_diamond_combo_id': id,
      'pay_type': payType,
    };

    return _doPost('diamond/recharge', data: data);
  }

  Future info({required int id}) {
    final data = const PageNum(size: 1) +
        {
          'record_number_list': [id],
        };

    return _doPost('record/query', data: data).then((val) => (val['items'] as Iterable?)?.firstOrNull);
  }

  Future exchangeGold(int diamond) {
    final data = <String, dynamic>{
      'exchange_amount_diamond': diamond,
    };

    return _doPost('gold_coins/exchange', data: data);
  }
}
