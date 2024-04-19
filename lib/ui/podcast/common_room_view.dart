import 'package:app/net/api.dart';
import 'package:app/widgets.dart';

import 'package:app/ui/home/room_item_view.dart';

class CommonRoomView extends StatefulWidget {
  final dynamic classifyId;
  const CommonRoomView(this.classifyId, {super.key});

  @override
  State<CommonRoomView> createState() => _CommonRoomViewState();
}

class _CommonRoomViewState extends State<CommonRoomView> {
  @override
  Widget build(BuildContext context) {
    return _DataView(widget.classifyId);
  }
}

class _DataView extends SimplePageView<Map> {

  final dynamic classifyId;

  _DataView(this.classifyId);

  @override
  BaseConfig get config {
    return GridConfig(
      padding: Pad(horizontal: 10, top: 10, bottom: 30),
      gridDelegate: RoomItemView.delegate,
    );
  }

  @override
  Future fetchPage(PageNum page) => Api.Room.getCategoryItemList(page, classifyId);

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    return RoomItemView(data: item);
  }
}
