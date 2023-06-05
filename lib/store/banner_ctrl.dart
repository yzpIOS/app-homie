import 'package:app/net/api.dart';
import 'package:app/store/common/async_ctrl.dart';
import 'package:app/tools.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerCtrl extends AsyncListCtrl<Map> {
  BannerCtrl() : super(boxName: 'BannerData', uid: '');

  final controller = CarouselController();

  @override
  Future get api => Api.Common.banner();

  @override
  List<Map> transform(data) => super.transform(data ?? []);
}
