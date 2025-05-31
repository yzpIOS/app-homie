import 'package:app/net/api.dart';
import 'package:app/widgets.dart';

import 'package:app/ui/home/room_item_view.dart';

class CityRoomView extends StatefulWidget {
  const CityRoomView({super.key});

  @override
  State<CityRoomView> createState() => _CityRoomViewState();
}

class _CityRoomViewState extends State<CityRoomView> {
  @override
  Widget build(BuildContext context) {
    return _DataView();
  }
}

class _DataView extends SimplePageView<Map> {
  @override
  BaseConfig get config {
    return GridConfig(
      padding: Pad(horizontal: 10, top: 10, bottom: 30),
      gridDelegate: RoomItemView.delegate,
    );
  }

  @override
  Future fetchPage(PageNum page) => Api.Room.locationRoomList(page: page);

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    return RoomItemView(data: item);
  }
}
