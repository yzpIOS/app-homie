import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';

class RoomAdminCtrl extends GetxController with BusGetLifeMixin {
  final int roomId;
  final RxSet<String> dataRx;

  RoomAdminCtrl(this.roomId, this.dataRx);

  @override
  void onInit() {
    super.onInit();

    on<AdminSetEvent>(
      (data) {
        if (data.isAdd) {
          dataRx.add(data.uid);
        } else {
          dataRx.remove(data.uid);
        }
      },
    );

    doRefresh();
  }

  Future doRefresh() async {
    final Iterable? data = await Api.Room.managerList(roomId: roomId);

    data?.also((it) {
      dataRx.assignAll(
        it.map((it) => it['uid']),
      );
    });
  }
}
