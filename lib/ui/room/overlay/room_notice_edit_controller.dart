
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';

/// 房间公告编辑
class RoomNoticeEditController extends GetxController {
  int roomId;
  RoomNoticeEditController({required this.roomId});
  final TextEditingController contentController = TextEditingController();

  /// 点击确认
  void clickConfirm(){
    if(contentController.text == null || contentController.text.isEmpty){
      return;
    }
    simpleTry(
            () => Api.Room.editRoomNotice(roomId: roomId, notice: contentController.text),showProgress: true, callback: (result) {
      if(result != null){
        showToast('修改成功');
        Get.back<String>(result: contentController.text);
      }else{
        showToast('修改失败');
      }
    });
  }
}