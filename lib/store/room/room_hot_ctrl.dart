import 'package:app/net/api.dart';
import 'package:app/store/activity_banner_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../banner_ctrl.dart';

class RoomHotCtrl extends PageListCtrl<Map> {
  final top6Rx = Rxn<List<Map>>();
  final bannerCtrl = Get.find<BannerCtrl>();
  final activityBannerCtrl = Get.find<ActivityBannerCtrl>();

  @override
  Future fetchPage(PageNum page) {
    //刷新政策公约banner
    bannerCtrl.doRefresh();
    //刷新活动banner
    activityBannerCtrl.doRefresh();

    return Api.Room.hotRoomList(page: page);
  }

  @override
  Iterable<Map> transform(data) {
    if (paging.value.status == PagingStatus.loadingFirstPage) {
      final iterable = super.transform(data);

      const count = 6;

      top6Rx(
        iterable.take(count).toList(growable: false),
      );

      return iterable.skip(count);
    }

    return super.transform(data);
  }
}
