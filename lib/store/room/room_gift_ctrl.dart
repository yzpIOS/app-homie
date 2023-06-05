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

        //0-2D静态礼物，1-2D动态礼物，2-3D礼物，4-烟花
        switch (data['type']) {
          case 0:
            break;
          case 1:
            play(data['send_effect_url']);
            break;
          case 2:
          case 4:
            sendCmd2Unity(App2UnityEnum.FTU_GIVEGIFT, data: data);
            break;
          default:
            assert(false, '未处理的业务 -> $data');
        }
      },
    );
  }
}
