import 'package:app/tools.dart';

class IntroCtrl extends GetxService {
  final dataRx = RxMap();

  @override
  void onInit() {
    super.onInit();

    KvBox.read<Map>('IntroMark').onNotNull(dataRx);
  }

  void doMark(String intro) {
    KvBox.write('IntroMark', dataRx..[intro] = true);
  }

  bool isMarked(String intro) {
    return true; //TODO 先屏蔽
    // return dataRx[intro] == true;
  }
}
