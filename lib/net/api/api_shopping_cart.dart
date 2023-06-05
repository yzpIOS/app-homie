part of '../api.dart';

class ApiShoppingCart extends ApiBase {
  const ApiShoppingCart(super.path);

  Future buy() {
    return _doPost('buy');
  }

  Future clean() {
    return _doPost('empty');
  }

  Future list() {
    return _doPost('query');
  }

  Future<bool> set({required int recordId, required int count}) {
    final data = {
      'id': recordId,
      'count': count,
    };

    return _doPost('update', data: data).then((_) => true);
  }

  Future add({required int productId}) {
    final data = {
      'product_id': productId,
    };

    return _doPost('create', data: data);
  }

  Future<bool> del({required int productId}) {
    final data = {
      'product_id': productId,
    };

    return _doPost('delete', data: data).then((_) => true);
  }
}
