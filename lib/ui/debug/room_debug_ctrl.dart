
import 'package:app/tools.dart';

class RoomDebugCtrl extends GetxController {

  RxList? rxList;

  @override
  void onInit() {
    rxList = getDebugLogs(LogType.SOCKET);
  }
}