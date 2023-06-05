import 'package:app/net/api.dart';
import 'package:app/tools.dart';

import 'package:app/store/common/async_ctrl.dart';

class MyGiftCtrl extends AsyncListCtrl<Map> {
  MyGiftCtrl({required super.uid}) : super(boxName: 'MyGiftData');

  @override
  Future get api => Api.Gift.backpack();

  @override
  List<Map> transform(data) {
    final items = data?['items'];

    return [
      if (items is Iterable)
        for (final item in items) {...item, 'backpack_count': item['count']}
    ];
  }

  @override
  void readCache(box) {}

  @override
  void saveCache(box, data) {}
}
