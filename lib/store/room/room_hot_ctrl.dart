import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class RoomHotCtrl extends PageListCtrl<Map> {
  final top6Rx = Rxn<List<Map>>();

  @override
  Future fetchPage(PageNum page) => Api.Room.hotRoomList(page: page);

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
