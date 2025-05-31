part of '../api.dart';

class ApiDressUp extends ApiBase {
  const ApiDressUp(super.path);

  Future my() {
    return _doPost('user_current_dress_up/query').then((val) => val['product_list'] ?? []);
  }

  ///
  /// 套装，头发，上装，下装，鞋子等tab
  ///
  Future myList({required PageNum page, int? categoryId}) {
    final data = <String, dynamic>{
      'group_id_list': [Get.find<ClothSelectorCtrl>().groupListId.value],
      if (categoryId != null) //
        'category_id_list': [categoryId],
    };

    return _doPost('warehouse/query', data: page + data);
  }

  ///
  /// 商城穿衣保存
  ///
  Future<S_SaveUserCurrentDressUp?> save({required List<int> ids}) {
    // 保存
    C_SaveUserCurrentDressUp c_saveUserCurrentDressUp = C_SaveUserCurrentDressUp();
    c_saveUserCurrentDressUp.productIdList.addAll(ids.map((e) => Int64(e)));

    return SocketCtrl.ins.sendByteAsyncServer(
      CMD.C_SaveUserCurrentDressUp,
      datas: c_saveUserCurrentDressUp.writeToBuffer(),
      resCmd: CMD.S_SaveUserCurrentDressUp
    );

    final data = {
      'product_id_list': ids,
    };

    return _doPost('user_current_dress_up/update', data: data).then((val) => val['items']);
  }

  Future<S_UseProductAndSaveUserCurrentDressUp?> useAndSave({required List<int> useIds, required List<int> saveIds}) {
    C_UseProductAndSaveUserCurrentDressUp dressUp = C_UseProductAndSaveUserCurrentDressUp.create();
    dressUp.saveDressUpProductIdList.addAll(saveIds.map((e) => Int64(e)).toList());
    dressUp.useProductIdList.addAll(useIds.map((e) => Int64(e)).toList());

    return SocketCtrl.ins.sendByteAsyncServer(
        CMD.C_UseProductAndSaveUserCurrentDressUp,
      datas: dressUp.writeToBuffer(),
      resCmd: CMD.S_UseProductAndSaveUserCurrentDressUp
    );

    // final data = {
    //   'use_product_id_list': useIds,
    //   'save_dress_up_product_id_list': saveIds,
    // };
    //
    // return _doPost('use_and_save', data: data);
  }

  Future give({required UID uid, required List<int> ids}) {
    final data = {
      'access_uid': uid,
      'product_id_list': ids,
      'count': 1,
    };

    return _doPost('give', data: data);
  }

  Future hotList({required PageNum page}) {
    return _doPost('hot/query', data: page + {});
  }

  Future fav({required int productId}) {
    final data = {
      'group_id': productId,
      'product_id': productId,
    };

    return _doPost('collect/create', data: data);
  }

  Future delFav(String id) {
    final data = {
      'id': id,
    };

    return _doPost('collect/delete', data: data);
  }

  Future favList({required PageNum page}) {
    return _doPost('collect/query', data: page + {});
  }

  Future snapshot() {
    return _doPost('user_dress_up/create');
  }

  Future delSnapshot(int id) {
    final data = {
      'id': id,
    };

    return _doPost('user_dress_up/delete', data: data);
  }

  Future snapshotList() {
    return _doPost('user_dress_up/query');
  }

  Future dressUp({required int id, required List<int> productIds}) {
    final data = {
      'id': id,
      'product_id_list': productIds,
    };

    return _doPost('user_dress_up/update', data: data);
  }

  Future backpackUse({required List<int> ids}) {
    final data = {
      'product_id_list': ids,
    };

    return _doPost('backpack/use', data: data).then((val) => val['items']);
  }

  Future backpackList2(String paramName, {List? categories = null}) {
    //
    // if(categories != null)
    //   "category_id_list": categories,
    return _doPost('backpack/query', data: {
      if(categories != null)
        "$paramName": categories,
    }).then((val) => val['items']);
  }

  Future backpackList({List? categories = null}) {
    return _doPost('backpack/query', data: {
      'group_id_list': [Get.find<ClothSelectorCtrl>().groupListId.value],
    });
  }

  Future myAnimeList() {
    return _doPost('action_warehouse/query').then((val) => val['items']);
  }

  ///
  /// 购买商品
  /// http://192.168.1.156:20000/project/15/interface/api/776
  ///
  Future buyGoods(int productId) {
    return _doPost3('buy', data: {"product_id": productId});
  }

  ///
  /// 背包里穿上衣服
  ///
  Future dressUp2(int productId) {
    return _doPost("warehouse/dress_up", data: {"product_id": productId});
  }
}
