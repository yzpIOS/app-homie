import 'package:app/net/api.dart';
import 'package:app/store/common/async_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/web_page.dart';
import 'package:app/ui/podcast/version_updating_dialog.dart';

class ConfigCtrl extends AsyncMapCtrl {
  ConfigCtrl() : super(boxName: 'ConfigData', uid: '');

  static ConfigCtrl get ins => Get.find<ConfigCtrl>();


  @override
  void onInit() async {
    super.onInit();
    super.doRefresh();
  }

  @override
  Future get api async {
    var result = await Api.Common.config();

    return result;
  }

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

  /// 版本更新
  void versionQuery() {
    // simpleTry(
    //   () => Api.Common.versionQuery(),
    //   callback: (resp) {
    //     if (resp != null && resp is Map && resp.isNotEmpty) {
    //       Get.dialog(VersionUpdatingDialog(versionData: resp), barrierDismissible: false);
    //     }
    //   }
    // );
  }

  Future<bool> canBlinkBoxSend() async {
    if(dataRx.isNotEmpty) {
      return dataRx["blind_box_gift_is_direct_send"] ?? false;
    }
    await doRefresh();
    return dataRx["blind_box_gift_is_direct_send"] ?? false;
  }

  bool canBlinkBoxSend2() {
    if(dataRx.isNotEmpty) {
      return dataRx["blind_box_gift_is_direct_send"] ?? false;
    }
    return dataRx["blind_box_gift_is_direct_send"] ?? false;
  }

}
