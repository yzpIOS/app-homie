
import 'package:app/tools.dart';
import 'package:app/ui/my/my_guild/anchor_apply_list_page.dart';

/// 主播列表控制器
class AnchorListController extends GetxController {

  /// 点击主播申请列表
  void clickAnchorApplyList() {
    Get.to(() => const AnchorApplyListPage());
  }
}