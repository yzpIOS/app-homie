import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';

abstract class RoomGetView<T extends SceneCtrl> extends GetView<SceneCtrl> {
  @override
  String? get tag => '$T';

  @override
  T get controller {
    if (T == SceneCtrl) {
      return Get.find<RoomManagerCtrl>().sceneCtrl as T;
    } else {
      return super.controller as T;
    }
  }

  const RoomGetView({super.key});
}
