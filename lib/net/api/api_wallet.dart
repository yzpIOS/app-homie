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

  ///
  /// 查询苹果支付的状态
  ///
  Future checkAppPayStatus(String recordNumber, String transaction_id) {
    return _doPost3("apple_iap/callback", data: {"record_number": recordNumber, "transaction_id": transaction_id});
  }

  ///
  /// 完成充值订单上报
  ///
  Future rechargeRecordReportFinish({required List<int> idList}) {
    final data = {
      'id_list': idList,
    };

    return _doPost('recharge_record/report/finish', data: data);
  }

  ///
  /// 查询未上报的充值订单
  ///
  Future rechargeRecordNotReportQuery() {
    return _doPost('recharge_record/not_report/query',);
  }
}
