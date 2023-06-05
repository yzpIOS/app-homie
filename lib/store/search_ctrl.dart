import 'package:app/tools.dart';

class HomeSearchCtrl extends GetxController {
  final UserLazyBox _box;

  HomeSearchCtrl(this._box);

  final dataRx = RxList<String>();

  static const _boxKey = 'UserSearch';

  @override
  void onInit() {
    super.onInit();

    _box //
        .use((box) => box.get(_boxKey))
        .onType<Iterable>((val) => dataRx.assignAll(val.cast()));
  }

  void addKeyword(String keyword) {
    final index = dataRx.indexWhere((val) => val == keyword);

    if (index == -1) {
      if (dataRx.length >= 20) dataRx.removeLast();

      dataRx
        ..insert(0, keyword)
        ..refresh();
    } else {
      dataRx
        ..removeAt(index)
        ..insert(0, keyword)
        ..refresh();
    }

    _box.use((box) => box.put(_boxKey, dataRx));
  }

  void doClear() async {
    await _box.use((box) => box.delete(_boxKey));

    dataRx.clear();
  }
}
