
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/guild_information_page.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

/// 公会名片控制器
class GuildBusinessCardController extends GetxController {
  final List<String> roomList = <String>['相亲','男神','女神','点唱','相亲','男神','相亲','男神','女神','点唱','相亲','男神'];

  /// 点击房间信息
  void clickRoomInfo(){
    Get.to(() => const GuildInformationPage());
  }
}