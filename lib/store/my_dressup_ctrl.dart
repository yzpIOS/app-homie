import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/net/api.dart';
import 'package:app/store/common/async_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';

import 'cloth_selector_ctrl.dart';

class MyDressUpCtrl extends AsyncListCtrl<Map> with BusGetLifeMixin {
  RxList<dynamic> myDressList = RxList();

  MyDressUpCtrl({required super.uid}) : super(boxName: 'MyDressUpData');

  Iterable<int> get ids => dataRx.map((it) => (it['product_id'] ?? it['id']) as int);

  @override
  Future get api => Api.DressUp.my();

  Future<List<int>> fetchIds() async {
    if (dataRx.isEmpty) await doRefresh();

    return ids.toList(growable: false);
  }

  void doSave({required List<int> ids}) {
    simpleSub(
      Api.DressUp.save(ids: ids),
      msg: '操作成功',
      callback1: (resp) {
        final selector = Get.find<ClothSelectorCtrl>().selectorCloth;
        selector.updateDressUp2(resp.items.map((e) {
          return {"product_id" : e.id.toInt()};
        }).toList());
        updateDressUp2(resp);
      },
    );
  }

  void updateDressUp(List data) {
    dataRx(
      transform(data),
    );
  }

  void updateDressUp2(S_SaveUserCurrentDressUp? data) {
    if(data == null) {
      return;
    }
    dataRx(
      data.items.map((e) {
        return {"id" : e.id.toInt()};
      }).toList(),
    );
  }

  Future getMyDressList() async {
    myDressList.value = await Api.Shop.categoryList_();
  }
}
