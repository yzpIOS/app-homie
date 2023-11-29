import 'dart:convert';

import 'package:app/event/event.dart';
import 'package:app/tools.dart';

import 'package:app/store/my_dressup_ctrl.dart';
import 'package:app/store/shopping_cart_ctrl.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/store/user/my_info_ctrl.dart';

class ClothSelectorCtrl extends GetxController with GetDisposableMixin, BusGetLifeMixin {
  final selectorShop = _SelectorShop();//商城
  final selectorCloth = _SelectorCloth();//我的-其他
  final selectorWardrobe = _SelectorWardrobe();//我的-衣柜
  bool needGoToMyWardrobe = false;//是否要跳转我的装扮
  bool modelSceneUnityLoadComplete = false;//商城模特unity界面是否加载完成

  final _modeRx = RxInt(0);
  final _mode1Rx = RxBool(true);
  final _mode2Rx = RxBool(true);
  final groupListId = RxInt(2);// 选择的类型(1聚焦头部(头发口红等)、2概览全身(上衣下衣等))

  bool get isShopMode => _modeRx() == 0;

  bool get isWardrobeMode => _modeRx() == 1;

  @override
  void onInit() {
    super.onInit();

    bindWorker(
      ever(_modeRx, (val) {
        switch (val) {
          // case 0:
          //   // 商城
          //   selectorShop.enterTryMode();
          //   break;
          // case 1:
          //   // 我的-衣柜
          //   selectorWardrobe.enterTryMode();
          //   break;
          // case 2:
          //   // 我的-套装，头发等（除了衣柜）
          //   selectorCloth.enterTryMode();
          //
          //   break;
        }
      }),
    );

    bindWorker(
      ever(_mode1Rx, (b) => _modeRx(b ? 0 : (_mode2Rx() ? 1 : 2))),
    );

    bindWorker(
      ever(_mode2Rx, (b) => _modeRx(b ? 1 : 2)),
    );

    on<ShoppingCartDelEvent>(
      (event) {
        final id = event.productId;
        final selector = selectorShop;

        if (selector._dataRx.contains(id)) {
          selector._doTryUse(id);
        } else {
          xlog('数据异常 -> $event');
        }
      },
    );
  }

  @override
  void onReady() async {
    selectorCloth._dataRx.assignAll(
      await Get.find<MyDressUpCtrl>().fetchIds(),
    );
  }

  Future<List<int>> initIds() {
    return isShopMode
        ? selectorShop.dressUpIds()
        : (isWardrobeMode ? selectorWardrobe.dressUpIds() : selectorCloth.dressUpIds());
  }

  void setShopMode(bool isShopMode) {
    _mode1Rx(isShopMode);
  }

  void setWardrobeMode(bool isWardrobe) {
    if (isWardrobeMode == isWardrobe) {
      return;
    }

    setShopMode(false);
    _mode2Rx(isWardrobe);
    sendFlutterSwitchCloth();
  }

  // 发送用户切换了“1:商城”、“2:我的-衣柜”、“3:我的-其他”的指令
  void sendFlutterSwitchCloth() async {
    int instruction = isShopMode ? 1 : (isWardrobeMode ? 2 : 3);
    late final _unity = Get.find<UnityCtrl>();
    final resp = await _unity.sendMessage(
      App2UnityEnum.FTU_SWITCH_CLOTH,
      data: {
        'goodsIds': await Get.find<ClothSelectorCtrl>().initIds(),
        'instruction': instruction,//instruction ：1是商城 2是我的-衣柜 3是我的-其他(套装、上装、下装等tab)
      },
    );

    try {
      final ids = jsonDecode(resp) as Iterable;
      addIds(ids.cast<int>().toList(growable: false));
    } catch (e, s) {
      errLog(e, s);
      addIds([]);
    }
  }

  void addIds(Iterable<int>? items) {
    if (items == null) {
      return;
    }
    isShopMode
        ? selectorShop._dataRx.assignAll(items)
        : (isWardrobeMode ? selectorWardrobe._dataRx.assignAll(items) : selectorCloth._dataRx.assignAll(items));
  }
}

abstract class ClothSelector {
  List<int> get ids => _ids().toList(growable: false);

  Iterable<int> _ids();

  bool isRxEmpty();

  bool isRxSelected(int id);

  Future<void> doSelect(Map item);
}

mixin _UnityDressUpMixin {
  late final _unity = Get.find<UnityCtrl>();
  late final _clothSelectorCtrl = Get.find<ClothSelectorCtrl>();

  // Future<List<int>> calcDressUp(int newId, List<int> ids) async {
  //   final data = {
  //     'newGoodsId': newId,
  //     'currentGoodsIds': ids,
  //   };
  //
  //   final resp = await _unity.sendMessage(App2UnityEnum.FTU_CALCULATE_CLOTH, data: data);
  //
  //   try {
  //     final ids = jsonDecode(resp) as Iterable;
  //
  //     return ids.cast<int>().toList(growable: false);
  //   } catch (e, s) {
  //     errLog(e, s);
  //
  //     return [];
  //   }
  // }

  Future<void> clearDressUp() {
    return _unity.sendMessage(App2UnityEnum.FTU_CLEAR_CLOTH);
  }

  Future<Iterable<int>> setDressUp(List<int> ids) {
    return _doDressUp(ids);
  }

  Future<Iterable<int>> updateDressUp(bool isAdd, int id) {
    // return _doDressUp(isAdd ? 2 : 3, [id]);

    return _doDressUp([id]);
  }

  Future<Iterable<int>> _doDressUp(List<int> ids) async {
    /// 商城模特unity界面没加载成功，不能穿上新服装
    if (_clothSelectorCtrl.modelSceneUnityLoadComplete == false) {
      return [];
    }

    final data = {
      'goodsIds': ids,
    };
    final resp = await _unity.sendMessage(App2UnityEnum.FTU_DRESSUP_CLOTH, data: data);

    try {
      final ids = jsonDecode(resp) as Iterable;
      return ids.cast<int>().toList(growable: false);
    } catch (e, s) {
      errLog(e, s);

      return [];
    }
  }
}

mixin _TryMixin implements _UnityDressUpMixin {
  late final dressUpCtrl = Get.find<MyDressUpCtrl>();

  Future<List<int>> dressUpIds();

  Future<Iterable<int>> enterTryMode() async {
    final ids = await dressUpIds();

    return setDressUp(ids);
  }

  Future<Iterable<int>> doReset2DressUp() async {
    final ids = await dressUpCtrl.fetchIds();

    return setDressUp(ids);
  }
}

mixin _MultiMixin implements ClothSelector, _TryMixin {

  // 数据结构
  // 下面的数据有可能重复，所以在取消选择的时候，需要把map中的其它的数据同时删除
  // {
  // "122": [11, 12, 15, 17, 22],
  // "123":[11, 33, 122, 555],
  // }
  late final _dataRx = RxList<int>();

  @override
  bool isRxEmpty() => _dataRx.isEmpty;

  @override
  bool isRxSelected(int id) => _dataRx.value.contains(id);

  @override
  Future<List<int>> dressUpIds() {
    // if (_dataRx.isEmpty) {
      return dressUpCtrl.fetchIds();
    // } else {
    //   return Future.value(_dataRx.value);
    // }
  }

  void _doAdd(int id) {}

  void _doDel(int id) {}

  Future<void> _doTryUse(int id, {Map? item}) {
    FutureOr Function() task;

    // 保存原来的数据
    // final _dataRx2 = <int>[];
    // _dataRx2.assignAll(_dataRx);

    // true: add, false: delete
    bool addOrDel = false;

    if (_dataRx.contains(id)) {
      addOrDel = false;

      task = () => updateDressUp(false, id).then((val) => _dataRx.value = List.from(val));

      // final keys = _dataRx.keys.toList();
      // final keyIndex = keys.indexOf(id);
      //
      // _dataRx.remove(
      //   keys.removeAt(keyIndex),
      // );
      //
      // task = keys.isEmpty ? doReset2DressUp : () async {
      //   final count = keys.length;
      //   final isLast = keyIndex == keys.length - 1;
      //
      //   if (!isLast) {
      //     for (var i = keyIndex; i < count; ++i) {
      //       final key = keys[i];
      //
      //       final newIds = await calcDressUp(
      //         key,
      //         i == 0 ? dressUpCtrl.ids.toList(growable: false) : _dataRx[keys[i]]!,
      //       );
      //       _dataRx[key] = newIds;
      //     }
      //   }
      //   return setDressUp(_dataRx.values.last);
      // };
    } else {
      addOrDel = true;

      task = () => updateDressUp(true, id).then((val) => _dataRx.value = List.from(val));
    }

    return simpleTry(task, callback: (result) {

      // 是否能购买（活动获得'商品不能购买）
      if (item != null && item.isNotEmpty) {
        var itemBuyAble = true;
        if (item case {'label_list': List lists}) {
          if (lists.isNotEmpty) {
            itemBuyAble = lists.isNotEmpty && lists[0]["is_buy"] == true;
          }
        }

        final cartCtrl = Get.find<ShoppingCartCtrl>();
        if (itemBuyAble == true) {//不是'活动获得'商品，可以购买，调用添加或删除购物车，显示“购买+数量”
          cartCtrl.activityItem.value = {};
        } else {////是'活动获得'商品，不能购买，不用调用添加或删除购物车，显示“活动获得”
          if(addOrDel) {
            cartCtrl.activityItem.value = item;
          } else {
            cartCtrl.activityItem.value = {};
          }
          return;
        }
      }

      // unity成功了
      if(addOrDel) {
        // 添加购物车
        _doAdd(id);
      } else {
        // 删除购物车
        _doDel(id);
      }

      // // 我只是填坑：如果不成功，就重置原来数据
      // if(result is Iterable<int>) {
      //   if(result.isEmpty) {
      //     _dataRx.assignAll(_dataRx2);
      //   } else {
      //     // unity成功了
      //     if(addOrDel) {
      //       // 添加购物车
      //       _doAdd(id);
      //     } else {
      //       // 删除购物车
      //       _doDel(id);
      //     }
      //   }
      // }
      _debugTryUse();
    });
  }

  void _debugTryUse() => xlog(_dataRx);
}

class _SelectorShop extends ClothSelector with _UnityDressUpMixin, _TryMixin, _MultiMixin {
  late final cartCtrl = Get.find<ShoppingCartCtrl>();

  @override
  Iterable<int> _ids() => _dataRx;

  @override
  Future<void> doSelect(Map item) => _doTryUse(item['id'], item: item);

  void doReset() {
    _dataRx.clear();

    // doReset2DressUp();
    clearDressUp();
  }

  @override
  void _doAdd(int id) => simpleTry(() => cartCtrl.doAdd(id));

  @override
  void _doDel(int id) => simpleTry(() => cartCtrl.doDel(id));
}

class _SelectorWardrobe extends ClothSelector with _UnityDressUpMixin, _TryMixin, _MultiMixin {
  late final myInfo = Get.find<MyInfoCtrl>().dataRx;

  //异性选中数据
  final _data2Rx = RxSet<int>();

  @override
  Iterable<int> _ids() => [..._dataRx, ..._data2Rx];

  @override
  bool isRxEmpty() => super.isRxEmpty() && _data2Rx.isEmpty;

  @override
  bool isRxSelected(int id) => super.isRxSelected(id) || _data2Rx.contains(id);

  @override
  Future<void> doSelect(Map item, {bool itemBuyAble = true}) {
    final int id = item['product_id'];

    //gender:3  男女均可使用
    if (myInfo().gender!.code == item['gender'] || item['gender'] == 3) {
      return _doTryUse(id);
    } else {
      if (!_data2Rx.remove(id)) _data2Rx.add(id);

      return Future.value();
    }
  }

  void doReset() {
    // simpleSub(
    //   doReset2DressUp,
    //   callback: _doClear,
    // );
    _doClear();
  }

  void doClear() {
    simpleSub(
      clearDressUp,
      callback: _doClear,
    );
  }

  void _doClear() {
    _dataRx.clear();
    _data2Rx.clear();
  }

  // 返回当前身上穿着的装扮
  Future<List<int>> getCurrentCloth() async {
    late final _unity = Get.find<UnityCtrl>();
    final resp = await _unity.sendMessage(
      App2UnityEnum.FTU_CURRENT_CLOTH,
    );

    try {
      final ids = jsonDecode(resp) as Iterable;
      return ids.cast<int>().toList(growable: false);
    } catch (e, s) {
      errLog(e, s);
      return [];
    }
  }
}

class _SelectorCloth extends ClothSelector with _UnityDressUpMixin, _TryMixin {
  final _dataRx = RxSet<int>();

  @override
  Iterable<int> _ids() => _dataRx;

  @override
  bool isRxEmpty() => _dataRx.isEmpty;

  @override
  bool isRxSelected(int id) => _dataRx.contains(id);

  @override
  Future<void> doSelect(Map item, {bool itemBuyAble = true}) {
    final int id = item['product_id'];

    final isAdd = !isRxSelected(id);

    return simpleTry(
      () => updateDressUp(isAdd, id),
      callback: (resp) => _dataRx.assignAll(resp),
    );
  }

  @override
  Future<List<int>> dressUpIds() => Future.value(ids);

  void doReset() {
    simpleSub(
      doReset2DressUp,
      callback1: (resp) => _dataRx.assignAll(resp),
    );
  }

  void doClear() {
    simpleSub(
      clearDressUp,
      callback1: (resp) {
        final dressUpCtrl = Get.find<MyDressUpCtrl>();
        dressUpCtrl.dataRx.clear();
        // _dataRx.clear();

        /// 修复 - 商城装扮-清除所有单品后，保存按钮置灰状态无法保存初始装
        try {
          final ids = jsonDecode(resp) as Iterable;
          _dataRx.assignAll(ids.cast<int>().toList(growable: false));
        } catch (e, s) {
          errLog(e, s);
          _dataRx.clear();
        }
      }
    );
  }
  void updateDressUp2(List data) {
    _dataRx.assignAll(data.map((e) => e["product_id"]));
  }
}
