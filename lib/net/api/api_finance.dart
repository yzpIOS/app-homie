part of '../api.dart';

class ApiFinance extends ApiBase {
  const ApiFinance(super.path);

  Future record({int? type, required PageNum page}) {
    final data = <String, dynamic>{
      if (type != null) 'type' : type,//1:收入，2：兑换，3：提现，4：用户退款
      'created_at_order_by': 2,
    };

    return _doPost('earnings/query', data: page + data);
  }

  Future diamondDetail({int? type, required PageNum page}) {
    final data = <String, dynamic>{
      if (type != null) 'type' : type,//查询类型，1：收入，2：支出(不传，默认是全部)
      'created_at_order_by': 2,//根据创建时间排序, 1代表升序，2代表降序
    };

    return _doPost('diamond/detail', data: page + data);
  }
}
