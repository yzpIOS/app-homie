import 'package:app/net/api.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';

import 'package:app/store/common/async_ctrl.dart';

class GiftCtrl extends AsyncListCtrl<Map> {
  GiftCtrl({required super.uid}) : super(boxName: 'GiftData');

  @override
  Future get api {
    // 是否pk直播间的礼物列表
    return Get.find<RoomManagerCtrl>().sceneCtrl.isInPKRoom() ? Api.Gift.roomPKList() : Api.Gift.list();
  }
}
