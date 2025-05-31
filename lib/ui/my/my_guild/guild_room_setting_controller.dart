
import 'package:app/event/event.dart';
import 'package:app/model/local_attach.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';

/// 房间设置
class GuildRoomSettingController extends GetxController {
  int roomId;
  bool isOpen;
  GuildRoomSettingController({required this.roomId,required this.isOpen});

  final isOpenLive = false.obs;

  @override
  void onInit() {
    super.onInit();
    isOpenLive.value = isOpen;
  }

  /// 直播间运营状态
  void clickChangeOpenStatus(){
    Future.delayed(const Duration(microseconds:200),(){
      simpleTry(
              () => Api.Guild.changeGuildRoomLiveStatus(roomId: roomId, isLive: !isOpenLive.value),
          showProgress: true,
          callback: (resp) {
            if (resp != null ) {
              isOpenLive.value = !isOpenLive.value;
              showToast(isOpenLive.value ? '已开播' : '已关播');
              RoomLiveStatusChangeEvent(roomId:roomId,isLive: isOpenLive.value).fire();
            }else{
              showToast('切换失败');
            }
          });
    });
  }

  /// 更换直播间背景
  void clickChangeRoomBackground(){
    imagePicker(
      max: 1,
      okCall: (it) async {
        final asset = it.first;
        simpleSub(
          Api.Common.upImage(attach: AssetImageAttach(asset: asset)),
          callback1: (resp) {
            if(resp != null){
              final String imagePath = (resp as Tuple4).value2;
              updateRoomBackground(filePath: imagePath);
            }else{
              showToast('上传失败');
            }
          },
        );
      },
    );
  }

  /// 更新直播间背景
  void updateRoomBackground({required String filePath}){
    simpleTry(
            () => Api.Guild.changeGuildRoomBackground(roomId: roomId, image: filePath),
        showProgress: true,
        callback: (resp) {
          if (resp != null ) {
            showToast('更换成功');
          }else{
            showToast('更换失败');
          }
        });
  }
}