import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';

abstract class RoomGetView<T extends SceneCtrl> extends GetView<SceneCtrl> {
  @override
  String? get tag => '$T';

  @override
  T get controller {
    var controller = Get.find<RoomManagerCtrl>().sceneCtrl2;
    if (controller is SceneCtrl) {
      return controller as T;
    } else {
      return super.controller as T;
    }
  }

  const RoomGetView({super.key});
}
