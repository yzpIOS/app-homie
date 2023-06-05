import 'package:app/tools.dart';
import 'package:app/types.dart';

import 'package:app/ui/my/report_page.dart';
import 'package:app/ui/message/input/input_ctrl.dart';
import 'package:app/ui/message/input/ext/input_ext.dart';

class InputAction$Report extends InputExt with ActionMixin {
  final UID uid;

  InputAction$Report(this.uid, InputCtrl inputCtrl) : super(inputCtrl);

  @override
  final String title = '举报';

  @override
  void onTap() {
    Get.to(() => ReportPage(type: 2, id: uid));
  }
}
