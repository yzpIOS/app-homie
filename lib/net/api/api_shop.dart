part of '../api.dart';

class ApiShop extends ApiBase {
  const ApiShop(super.path);

  /// 查询装扮分类
  Future categoryList_({int parentId = 0, List<int>? groupId}) {
    final data = {
      'status': 1,
      'parent_id_list': [parentId],
      if(groupId != null)
        'group_id_list': groupId,
      if(groupId == null)
        'group_id_list': [Get.find<ClothSelectorCtrl>().groupListId.value],
    };

    return _doPost('category/query', data: const PageNum(size: 999) + data).then((val) => val?['items'] ?? []);
  }

  Future get2DGoods() {
    return _doPost('2d/query', data: const PageNum(size: 999) + {}).then((val) => val?['items'] ?? []);
  }

  /// 查询商城分类
  Future categoryList(bool needGroupListId) {
    final data = {
      if (needGroupListId)
        'group_id_list': [Get.find<ClothSelectorCtrl>().groupListId.value],
    };

    return _doPost('sales_category/query', data: const PageNum(size: 999) + data).then((val) => val?['items'] ?? []);
  }

  Future recommendList() {
    return _doPost('recommend/query').then((val) => val?['items'] ?? []);
  }

  Future productList({required PageNum page, int? categoryId, GenderEnum? gender}) {
    final data = {
      'status': 1,
      if (categoryId != null) 'sales_category_id_list': [categoryId],
      if (gender != null) 'gender': gender.code,
      'group_id_list': [Get.find<ClothSelectorCtrl>().groupListId.value],
    };

    return _doPost('product/query', data: page + data);
  }

  //根据用户所属的用户组查看异性商品
  Future oppositeSexProductList({required PageNum page, int? categoryId, GenderEnum? gender}) {
    final data = {
      'status': 1,
      if (categoryId != null) 'sales_category_id_list': [categoryId],
      if (gender != null) 'gender': gender.code,
    };

    return _doPost('product/opposite_sex/query', data: page + data);
  }

  Future buy({required int productId}) {
    final data = {
      'product_id': productId,
    };

    return _doPost('buy', data: data);
  }
}
