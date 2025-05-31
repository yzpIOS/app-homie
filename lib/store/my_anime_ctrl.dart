import 'package:app/net/api.dart';
import 'package:app/store/common/async_ctrl.dart';
import 'package:app/tools.dart';

class MyAnimeCtrl extends AsyncListCtrl<Map> with BusGetLifeMixin {
  MyAnimeCtrl({required super.uid}) : super(boxName: 'MyAnimeData');

  @override
  Future get api => Api.DressUp.myAnimeList();
}
