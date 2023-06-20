import 'package:app/common/nets/socket/proto/Message.pb.dart';
import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/tools.dart';
import 'package:app/ui/room/broadcast/super_gift_view.dart';
import 'package:app/widgets.dart';

import 'package:app/store/common/broadcast_queue_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';

class SuperGiftBroadcastCtrl extends BroadcastQueueCtrl<Widget> {
  late final _findByUidX = Get.find<UserInfoCtrl>().findByUidX;

  @override
  void onInit() {
    super.onInit();

    on<SuperGiftEvent>(
      (event) => _onGiftEvent(event.data),
    );
  }

  void _onGiftEvent(S_FloatingScreen data) async {
    final ids = data.acceptUidList;
    final users = await _findByUidX({data.roleId.toString(), ...ids}, useNet: true);

    for (final uid in ids) {
      addTask(
        SuperGiftView(acceptUid: uid, users: users, data: data),
      );
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
