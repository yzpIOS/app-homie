import 'package:app/tools.dart';

class SettingCtrl extends GetxController with GetDisposableMixin {
  final UserLazyBox _box;

  SettingCtrl(this._box);

  final dataRx = RxMap();

  @override
  void onInit() {
    super.onInit();

    _init();
  }

  void _init() async {
    final data = await _box.use((box) => box.get('UserSetting'));

    if (data is Map) dataRx(data);

    bindWorker(
      interval<Map>(
        dataRx,
        (data) => _box.use((box) => box.put('UserSetting', data)),
      ),
    );
  }

  bool boolValGet(String key, {bool orElse = true}) {
    return dataRx[key] ?? orElse;
  }
}
