import 'package:app/net/api.dart';
import 'package:app/tools.dart';

import 'package:app/store/common/async_ctrl.dart';

class GiftCtrl extends AsyncListCtrl<Map> {
  GiftCtrl({required super.uid}) : super(boxName: 'GiftData');

  @override
  Future get api => Api.Gift.list();
}
