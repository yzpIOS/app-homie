import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/tools.dart';
import 'package:app/ui/room/broadcast/super_gift_view.dart';
import 'package:app/ui/room/gift/blind_gift_marquee_view.dart';
import 'package:app/ui/room/gift/common_gift_marquee_view.dart';
import 'package:app/ui/room/gift/special_gift_marquee_view.dart';
import 'package:app/widgets.dart';
import 'package:app/ui/room/updateLevel/charm_level_update_marquee_view.dart';
import 'package:app/ui/room/updateLevel/wealth_level_update_marquee_view.dart';
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
    on<LevelUpdateEvent>(
      (event) => _onLevelUpdateEvent(event.data),
    );
  }

  /// 礼物事件
  void _onGiftEvent(SuperGiftEvent event, S_FloatingScreen data) async {
    final ids = data.acceptUidList;
    final users = await _findByUidX({data.sendId, ...ids}, useNet: true);

    if (ids.isNotEmpty) {
      for (final uid in ids) {
        if (data.bannerType.toInt() == 1) {
          // 1：特殊礼物, 己测试
          addTask(
            SpecialGiftMarqueeView(acceptUid: uid, users: users, data: data),
          );
        } else if (data.bannerType.toInt() == 2) {
          // 2：普通礼物, 己测试
          addTask(
            CommonGiftMarqueeView(acceptUid: uid, users: users, data: data),
          );
        } else if (data.bannerType.toInt() == 3) {
          // 3：盲盒礼物, 己测试
          addTask(
            BlindGiftMarqueeView(
              users: users,
              data: data,
              blinkName: event.blinkName,
              blinkUrl: event.blinkUrl,
            ),
          );
        }
        // else if(data.bannerType.toInt() == 4) {
        //   // 4：服装
        //   addTask(
        //     ClothGiftMarqueeView(acceptUid: uid, users: users, data: data,
        //       blinkName: event.blinkName, blinkUrl: event.blinkUrl,),
        //   );
        // }
        else {
          // 默认样式
          addTask(
            SuperGiftView(acceptUid: uid, users: users, data: data),
          );
        }
      }
    } else {
      if (data.bannerType.toInt() == 3) {
        // 3：盲盒礼物, 己测试
        addTask(
          BlindGiftMarqueeView(
            users: users,
            data: data,
            blinkName: event.blinkName,
            blinkUrl: event.blinkUrl,
          ),
        );
      }
    }
  }

  /// 等级提升事件
  void _onLevelUpdateEvent(S_UpdateLevel_All data) async {
    if(data.type == 1){
      //财富
      addTask(
        WealthLevelUpdateMarqueeView(data: data,),
      );
    }else{
      //魅力
      addTask(
        CharmLevelUpdateMarqueeView(data: data,),
      );
    }
  }

  @override
  AnimeEntity itemBuilder(Widget data) {
    //跑马灯队列机制, 根据数量调整跑马灯停留时间
    int maxRemainMilliseconds = 5000;
    int maxEnterMilliseconds = 1000;
    if(views.length > 12){
      maxRemainMilliseconds = 1000;
      maxEnterMilliseconds = 600;
    }else if(views.length > 9){
      maxRemainMilliseconds = 2000;
      maxEnterMilliseconds = 700;
    }else if(views.length > 6){
      maxRemainMilliseconds = 3000;
      maxEnterMilliseconds = 800;
    }else if(views.length > 3){
      maxRemainMilliseconds = 4000;
      maxEnterMilliseconds = 900;
    }
    return AnimeEntity(
      child: data,
      dock: const Tuple3(1.0, 0.0, -1.0),
      times:  Tuple3( Duration(milliseconds: maxEnterMilliseconds), Duration(milliseconds: maxRemainMilliseconds),
          const Duration(milliseconds: 400)),
      offsetTop: AppSize.safeTop + AppSize.appBar - 10,
    );
  }
}
