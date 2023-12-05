import 'dart:ui';

import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/store/common/buy_done_dialog.dart';
import 'package:app/store/wallet_ctrl.dart';
import 'package:app/tools.dart';

import 'package:app/store/cloth_selector_ctrl.dart';
import 'package:app/store/common/async_ctrl.dart';
import 'package:app/store/my_wardrobe_ctrl.dart';

class ShoppingCartCtrl extends AsyncListCtrl<Map> with BusGetLifeMixin {
  ShoppingCartCtrl({required super.uid}) : super(boxName: 'ShoppingCart');

  @override
  Future get api => Api.ShoppingCart.list().then((val) => val['items']);

  final showCarRx = RxBool(false);
  final activityItem = RxMap();
  final markSelectedActivityItemList = [];//记录已选中的活动获得商品数组

  int count() => dataRx.map<int>((it) => it['count']).sum;

  Map? findOneById(int id) {
    return dataRx.firstWhereOrNull((it) => it['product_id'] == id);
  }

  Future<bool> doAdd(int id) {
    final item = findOneById(id);

    if (item != null) {
      final count = item['count'] + 1;

      return Api.ShoppingCart.set(recordId: item['id'], count: count).then((val) {
        item['count'] = count;

        dataRx.refresh();

        return val;
      });
    } else {
      return Api.ShoppingCart.add(productId: id).then((val) {
        dataRx.insert(0, val);

        return true;
      });
    }
  }

  Future<bool> doDel(int id) {
    return Api.ShoppingCart.del(productId: id).then((val) {
      dataRx.removeWhere(
        (it) => it['product_id'] == id,
      );

      ShoppingCartDelEvent(productId: id).fire();

      return val;
    });
  }

  Future<bool> doUpdate(int id, int count) {
    final item = findOneById(id);

    if (item != null) {
      return Api.ShoppingCart.set(recordId: item['id'], count: count).then((val) {
        item['count'] = count;

        dataRx.refresh();

        return val;
      });
    } else {
      return Future.value(false);
    }
  }

  void doClean() {
    Get.alertSub(
      () => Api.ShoppingCart.clean(),
      alert: '确定清空购物车？',
      callback: () {
        Get.back();

        _doReset();
      },
    );
  }

  void doBuy({VoidCallback? callback}) {
    simpleSub(
      Api.ShoppingCart.buy(),
      callback1: (resp) {
        callback?.call();

        _doReset();
        Get.find<WalletCtrl>().doRefresh();

        BuyDoneDialog(data: resp['items']).also((it) {
          Get.find<MyWardrobeCtrl>().doRefresh();

          Get.dialog(it, routeSettings: it.toRouteSettings());
        });
      },
    );
  }

  void _doReset() {
    dataRx.clear();
    Get.find<ClothSelectorCtrl>().selectorShop.doReset();
  }
}
