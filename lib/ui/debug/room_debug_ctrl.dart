
import 'package:app/tools.dart';

class RoomDebugCtrl extends GetxController {

  RxList<String>? get rxList {
    return getDebugLogs(LogType.SOCKET);
  }
}