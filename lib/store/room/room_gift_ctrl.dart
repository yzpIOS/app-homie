import 'package:app/event/event.dart';
import 'package:app/store/svga_effect_ctrl.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/tools.dart';

class RoomGiftCtrl extends SvgaEffectCtrl with BusGetLifeMixin {
  @override
  void onInit() {
    super.onInit();

    final sendCmd2Unity = Get.find<UnityCtrl>().sendCmd;

    on<GiftEvent>(
      (event) {
        final data = event.data;
        if(data == null) {
          return;
        }

        //0-2D静态礼物，1-2D动态礼物，2-3D礼物，4-烟花
        switch (data.type) {
          case 0:
            break;
          case 1:
            play(data.sendEffectUrl);
            break;
          case 2:
          case 4:
            // 不需要了，unity那边直接监听协义
            // sendCmd2Unity(App2UnityEnum.FTU_GIVEGIFT, data: data.toProto3Json());
            break;
          default:
            // assert(false, '未处理的业务 -> $data');
        }
      },
    );
  }
}
