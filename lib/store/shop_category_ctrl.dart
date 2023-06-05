import 'package:app/net/api.dart';
import 'package:app/store/common/async_ctrl.dart';
import 'package:app/tools.dart';

class ShopCategoryCtrl extends AsyncListCtrl<Map> {
  ShopCategoryCtrl({required super.uid}) : super(boxName: 'ShopCategoryData');

  @override
  Future get api => Api.Shop.categoryList();
}
