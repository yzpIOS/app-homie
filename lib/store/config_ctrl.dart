import 'package:app/net/api.dart';
import 'package:app/store/common/async_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/web_page.dart';

class ConfigCtrl extends AsyncMapCtrl {
  ConfigCtrl() : super(boxName: 'ConfigData', uid: '');

  @override
  Future get api => Api.Common.config();

  Uri? _getUri(String key) {
    final url = dataRx[key];

    if (url is String && url.isNotEmpty) {
      try {
        return Uri.parse(url);
      } catch (e, s) {
        errLog(e, s);
      }
    }

    return null;
  }

  void onTapLink(String title, String key) {
    void go(Uri uri) => Get.to(() => WebPage(uri: uri, title: title));

    final uri = _getUri(key);

    if (uri == null) {
      simpleSub(
        doRefresh,
        callback: () {
          final uri = _getUri(key);

          if (uri == null) return;

          go(uri);
        },
      );

      return;
    }

    go(uri);
  }
}
