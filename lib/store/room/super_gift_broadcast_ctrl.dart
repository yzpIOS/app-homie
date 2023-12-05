import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/tools.dart';
import 'package:app/ui/room/broadcast/super_gift_view.dart';
import 'package:app/ui/room/gift/blind_gift_marquee_view.dart';
import 'package:app/ui/room/gift/cloth_gift_marquee_view.dart';
import 'package:app/ui/room/gift/common_gift_marquee_view.dart';
import 'package:app/ui/room/gift/special_gift_marquee_view.dart';
import 'package:app/widgets.dart';

import 'package:app/store/common/broadcast_queue_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';

class SuperGiftBroadcastCtrl extends BroadcastQueueCtrl<Widget> {
  late final _findByUidX = Get.find<UserInfoCtrl>().findByUidX;

  @override
  void onInit() {
    super.onInit();

    on<SuperGiftEvent>(
      (event) => _onGiftEvent(event, event.data),
    );
  }

  void _onGiftEvent(SuperGiftEvent event, S_FloatingScreen data) async {
    final ids = data.acceptUidList;
    final users = await _findByUidX({data.sendId, ...ids}, useNet: true);

    for (final uid in ids) {
      if(data.bannerType.toInt() == 1) {
        // 1：特殊礼物, 己测试
        addTask(
          SpecialGiftMarqueeView(acceptUid: uid, users: users, data: data),
        );
      } else if(data.bannerType.toInt() == 2) {
        // 2：普通礼物, 己测试
        addTask(
          CommonGiftMarqueeView(acceptUid: uid, users: users, data: data),
        );
      } else if(data.bannerType.toInt() == 3) {
        // 3：盲盒礼物, 己测试
        addTask(
          BlindGiftMarqueeView(acceptUid: uid, users: users, data: data,
            blinkName: event.blinkName, blinkUrl: event.blinkUrl,),
        );
      } else if(data.bannerType.toInt() == 4) {
        // 4：服装
        addTask(
          ClothGiftMarqueeView(acceptUid: uid, users: users, data: data,
            blinkName: event.blinkName, blinkUrl: event.blinkUrl,),
        );
      } else {
        // 默认样式
        addTask(
          SuperGiftView(acceptUid: uid, users: users, data: data),
        );
      }
    }
  }

  @override
  AnimeEntity itemBuilder(Widget data) {
    return AnimeEntity(
      child: data,
      dock: const Tuple3(1.0, 0.0, -1.0),
      times: const Tuple3(Duration(seconds: 1), Duration(milliseconds: 4600), Duration(milliseconds: 400)),
      offsetTop: AppSize.safeTop + AppSize.appBar + 10,
    );
  }
}
