import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/net/api.dart';
import 'package:app/store/common/async_ctrl.dart';
import 'package:app/tools.dart';

class MyDressUpCtrl extends AsyncListCtrl<Map> with BusGetLifeMixin {
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
      callback1: (resp) => updateDressUp2(resp),
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
}
