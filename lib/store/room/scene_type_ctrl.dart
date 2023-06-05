import 'package:app/net/api.dart';

import 'package:app/store/common/async_ctrl.dart';

class SceneTypeCtrl extends AsyncListCtrl<Map> {
  SceneTypeCtrl({required super.uid}) : super(boxName: 'SceneTypeData');

  @override
  Future get api => Api.Scene.types();
}
