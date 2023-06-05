part of '../api.dart';

class ApiFinance extends ApiBase {
  const ApiFinance(super.path);

  Future record({required PageNum page}) {
    final data = <String, dynamic>{
      'created_at_order_by': 2,
    };

    return _doPost('earnings/query', data: page + data);
  }
}
