import 'package:app/net/api.dart';
import 'package:app/store/common/async_ctrl.dart';
import 'package:app/tools.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ActivityBannerCtrl extends AsyncListCtrl<Map> {
  ActivityBannerCtrl() : super(boxName: 'ActivityBannerCtrl', uid: '');

  final controller = CarouselController();

  @override
  Future get api => Api.Activity.getBanner();

  @override
  List<Map> transform(data) => super.transform(data ?? []);
}
