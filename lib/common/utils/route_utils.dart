
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/web_page.dart';
import 'package:app/ui/my/user_home_page.dart';
import 'package:app/ui/my/wallet/recharge_page.dart';

class RouteUtil {

  ///
  /// 跳转到个页面
  ///
  static void jump(String? path) {
    // 判断数据
    if(path == null || path.isEmpty) {
      return;
    }
    // uri
    Uri? uri = Uri.tryParse(path);
    if(uri == null || uri.scheme != "homie") {
      return;
    }
    var data = uri.queryParameters;
    switch(uri.host.toLowerCase()) {
      case "room":
        // 房间
        String? roomId = data["roomId"];
        if(roomId == null) {
          return;
        }
        int? roomIdInt = int.tryParse(roomId);
        if(roomIdInt == null) {
          return;
        }
        RoomManagerCtrl.ins.toRoom(roomId: roomIdInt, data: uri.data?.parameters);
        break;
      case "webview":
        // 跳到webview
        var jumpUrl = data['url'];
        if(jumpUrl == null || jumpUrl.isEmpty) {
          return;
        }
        Get.to(() => WebPage(title: data['title'] ?? "", uri: Uri.parse(jumpUrl)));
        break;
      case "charge":
        // 跳到webview
        Get.to(() => RechargePage(hasShowUnityView: false,));
        break;
      case "usercenter":
        // 跳到webview
        var userId = data['userId'];
        if(userId == null || userId.isEmpty) {
          return;
        }
        Get.to(() => UserHomePage(uid: userId,));
        break;
    }
  }

  static String generateShareRoom(String roomId) {
    return 'http://app.web.homieyy.com/?channelCode=1&invite_uid=${OAuthCtrl.uid}&data=homie://room?roomId=$roomId';
  }
}