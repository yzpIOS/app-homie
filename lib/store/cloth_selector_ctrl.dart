import 'dart:convert';

import 'package:app/event/event.dart';
import 'package:app/tools.dart';

import 'package:app/store/my_dressup_ctrl.dart';
import 'package:app/store/shopping_cart_ctrl.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/store/user/my_info_ctrl.dart';

class ClothSelectorCtrl extends GetxController with GetDisposableMixin, BusGetLifeMixin {
  final selector$Shop = _Selector$Shop();
  final selector$Cloth = _Selector$Cloth();
  final selector$Wardrobe = _Selector$Wardrobe();

  final _modeRx = RxInt(0);
  final _mode1Rx = RxBool(true);
  final _mode2Rx = RxBool(true);

  bool get isShopMode => _modeRx() == 0;

  bool get isWardrobeMode => _modeRx() == 1;

  @override
  void onInit() {
    super.onInit();

    bindWorker(
      ever(_modeRx, (val) {
        switch (val) {
          case 0:
            selector$Shop.enterTryMode();
            break;
          case 1:
            selector$Wardrobe.enterTryMode();
            break;
          case 2:
            selector$Cloth.enterTryMode();
            break;
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
        final selector = selector$Shop;

        if (selector._dataRx.containsKey(id)) {
          selector._doTryUse(id);
        } else {
          xlog('数据异常 -> $event');
        }
      },
    );
  }

  @override
  void onReady() async {
    selector$Cloth._dataRx.assignAll(
      await Get.find<MyDressUpCtrl>().fetchIds(),
    );
  }

  Future<List<int>> initIds() {
    return isShopMode
        ? selector$Shop.dressUpIds()
        : (isWardrobeMode ? selector$Wardrobe.dressUpIds() : selector$Cloth.dressUpIds());
  }

  void setShopMode(bool isShopMode) {
    _mode1Rx(isShopMode);
  }

  void setWardrobeMode(bool isWardrobe) {
    setShopMode(false);
    _mode2Rx(isWardrobe);
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

  Future<List<int>> calcDressUp(int newId, List<int> ids) async {
    final data = {
      'newGoodsId': newId,
      'currentGoodsIds': ids,
    };

    final resp = await _unity.sendMessage(App2UnityEnum.FTU_CALCULATE_CLOTH, data: data);

    try {
      final ids = jsonDecode(resp) as Iterable;

      return ids.cast<int>().toList(growable: false);
    } catch (e, s) {
      errLog(e, s);

      return [];
    }
  }

  Future<void> clearDressUp() {
    return _unity.sendMessage(App2UnityEnum.FTU_CLEAR_CLOTH);
  }

  Future<Iterable<int>> setDressUp(List<int> ids) {
    return _doDressUp(1, ids);
  }

  Future<Iterable<int>> updateDressUp(bool isAdd, int id) {
    return _doDressUp(isAdd ? 2 : 3, [id]);
  }

  ///action: 1覆盖 2添加 3删除
  Future<Iterable<int>> _doDressUp(int action, List<int> ids) async {
    final data = {
      'goodsIds': ids,
      'instruction': action,
    };

    final resp = await _unity.sendMessage(App2UnityEnum.FTU_DRESSUP_CLOTH, data: data);

    try {
      return (jsonDecode(resp) as Iterable).cast();
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
  final _dataRx = RxMap<int, List<int>>();

  @override
  bool isRxEmpty() => _dataRx.isEmpty;

  @override
  bool isRxSelected(int id) => _dataRx.containsKey(id);

  @override
  Future<List<int>> dressUpIds() {
    if (_dataRx.isEmpty) {
      return dressUpCtrl.fetchIds();
    } else {
      return Future.value(_dataRx.values.last);
    }
  }

  void _doAdd(int id) {}

  void _doDel(int id) {}

  Future<void> _doTryUse(int id) {
    FutureOr Function() task;

    if (_dataRx.containsKey(id)) {
      _doDel(id);

      final keys = _dataRx.keys.toList();
      final keyIndex = keys.indexOf(id);

      _dataRx.remove(
        keys.removeAt(keyIndex),
      );

      task = keys.isEmpty
          ? doReset2DressUp
          : () async {
              final count = keys.length;
              final isLast = keyIndex == keys.length - 1;

              if (!isLast) {
                for (var i = keyIndex; i < count; ++i) {
                  final key = keys[i];

                  final newIds = await calcDressUp(
                    key,
                    i == 0 ? dressUpCtrl.ids.toList(growable: false) : _dataRx[keys[i - 1]]!,
                  );

                  _dataRx[key] = newIds;
                }
              }

              return setDressUp(_dataRx.values.last);
            };
    } else {
      _doAdd(id);

      task = () => updateDressUp(true, id).then((val) => _dataRx[id] = List.from(val, growable: false));
    }

    return simpleTry(task, callback: (_) => _debugTryUse());
  }

  void _debugTryUse() => xlog(_dataRx.debug);
}

class _Selector$Shop extends ClothSelector with _UnityDressUpMixin, _TryMixin, _MultiMixin {
  late final cartCtrl = Get.find<ShoppingCartCtrl>();

  @override
  Iterable<int> _ids() => _dataRx.keys;

  @override
  Future<void> doSelect(Map item) => _doTryUse(item['id']);

  void doReset() {
    _dataRx.clear();

    doReset2DressUp();
  }

  @override
  void _doAdd(int id) => simpleTry(() => cartCtrl.doAdd(id));

  @override
  void _doDel(int id) => simpleTry(() => cartCtrl.doDel(id));
}

class _Selector$Wardrobe extends ClothSelector with _UnityDressUpMixin, _TryMixin, _MultiMixin {
  late final myInfo = Get.find<MyInfoCtrl>().dataRx;

  //异性选中数据
  final _data2Rx = RxSet<int>();

  @override
  Iterable<int> _ids() => [..._dataRx.keys, ..._data2Rx];

  @override
  bool isRxEmpty() => super.isRxEmpty() && _data2Rx.isEmpty;

  @override
  bool isRxSelected(int id) => super.isRxSelected(id) || _data2Rx.contains(id);

  @override
  Future<void> doSelect(Map item) {
    final int id = item['product_id'];

    if (myInfo().gender!.code == item['gender']) {
      return _doTryUse(id);
    } else {
      if (!_data2Rx.remove(id)) _data2Rx.add(id);

      return Future.value();
    }
  }

  void doReset() {
    simpleSub(
      doReset2DressUp,
      callback: _doClear,
    );
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
}

class _Selector$Cloth extends ClothSelector with _UnityDressUpMixin, _TryMixin {
  final _dataRx = RxSet<int>();

  @override
  Iterable<int> _ids() => _dataRx;

  @override
  bool isRxEmpty() => _dataRx.isEmpty;

  @override
  bool isRxSelected(int id) => _dataRx.contains(id);

  @override
  Future<void> doSelect(Map item) {
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
      callback: _dataRx.clear,
    );
  }
}
