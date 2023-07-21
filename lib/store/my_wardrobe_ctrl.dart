import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/net/api.dart';
import 'package:app/store/common/async_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/dressup/user_select_sheet.dart';
import 'package:app/widgets.dart';

import 'my_dressup_ctrl.dart';

typedef DateItem = Tuple2<RxInt, Map>;

class MyWardrobeCtrl extends AsyncListCtrl<DateItem> with BusGetLifeMixin {
  MyWardrobeCtrl({required super.uid}) : super(boxName: 'MyWardrobeData');

  @override
  Future get api => Api.DressUp.backpackList();

  Map<int, DateItem> get _data => dataRx.groupFoldBy((val) => val.value2['product_id'], (_, val) => val);

  @override
  List<DateItem> transform(data) {
    final items = data?['items'];

    return [
      if (items is Iterable)
        for (final item in items) DateItem(RxInt(item['count']), item)
    ];
  }

  @override
  void onInit() {
    super.onInit();

    doRefresh();
  }

  void doGive({required List<int> ids, VoidCallback? callback}) {
    UserSelectSheet.show().onNotNull((val) {
      simpleSub(
        Api.DressUp.give(uid: val, ids: ids),
        msg: '操作成功',
        callback: () {
          final data = _data;

          for (final id in ids) {
            final tmp = data[id];

            if (tmp == null) {
              assert(false, '数据错误 -> $id');
            } else {
              final count = tmp.value1.value -= 1;

              assert(count >= 0);

              if (count == 0) dataRx.remove(tmp);
            }
          }

          callback?.call();
        },
      );
    });
  }

  void doUse({required List<int> ids, ValueChanged<List>? callback}) {
    simpleSub(
      Api.DressUp.backpackUse(ids: ids),
      callback1: (resp) {
        showToast('成功使用${resp.length}件');

        if (resp.isNotEmpty) {
          final data = _data;

          for (final item in resp) {
            final tmp = data[item['product_id']];

            if (tmp == null) {
              assert(false, '数据错误 -> $item');
            } else {
              final count = tmp.value1.value -= item['count'] as int;

              assert(count >= 0);

              if (count == 0) dataRx.remove(tmp);
            }
          }
        }

        callback?.call(resp);
      },
    );
  }

  void doUseAndSave({required List<int> useIds, required List<int> saveIds, ValueChanged<List>? callback}) {
    simpleSub(
      Api.DressUp.useAndSave(useIds: useIds, saveIds: saveIds),
      msg: '操作成功',
      callback1: (resp) {
        if(resp == null || resp is S_UseProductAndSaveUserCurrentDressUp == false) {
          return;
        }
        S_UseProductAndSaveUserCurrentDressUp dressUp = resp as S_UseProductAndSaveUserCurrentDressUp;
        final List<BackpackProductItem> items = dressUp.useProductList;

        showToast('成功使用${items.length}件');

        if (items.isNotEmpty) {
          final data = _data;

          for (final item in items) {
            final tmp = data[item.productId.toInt()];

            if (tmp == null) {
              assert(false, '数据错误 -> $item');
            } else {
              final count = tmp.value1.value -= item.count as int;

              assert(count >= 0);

              if (count == 0) dataRx.remove(tmp);
            }
          }
        }

        // 数据转化
        var listResult = [];
        dressUp.userDressUpProductList.forEach((element) {
          listResult.add({"product_id": element.id.toInt()});
        });

        callback?.call(listResult);
      },
    );
  }

  @override
  void readCache(box) {}

  @override
  void saveCache(box, data) {}
}
