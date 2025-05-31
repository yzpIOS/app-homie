import 'package:app/event/event.dart';
import 'package:app/tools.dart';
import 'package:link_kit/link_kit.dart';

class LinkCtrl extends GetxService {
  @override
  void onInit() async {
    super.onInit();

    final instance = LinkKitPlatform.instance;

    try {
      final link = await instance.getInitialLink();

      if (link != null) onLinkClick(link);
    } catch (e, s) {
      errLog(e, s);
    }

    instance.linkClickStream().listen(onLinkClick);
  }

  void onLinkClick(String link) {
    final uri = Uri.parse(link);

    AppLinkEvent(uri).fire();
  }
}
