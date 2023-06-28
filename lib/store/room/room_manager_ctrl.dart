import 'package:app/event/event.dart';
import 'package:app/exception.dart';
import 'package:app/model/enum/api_switch.dart';
import 'package:app/model/enum/room_state.dart';
import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/room/overlay/room_overlay.dart';
import 'package:app/ui/room/overlay/square_overlay.dart';
import 'package:app/ui/room/room_page.dart';

class RoomManagerCtrl extends GetxController with BusGetLifeMixin, GetDisposableMixin {
  final stateRx = Rx(RoomState.None);

  SceneCtrl? _sceneCtrl;

  SceneCtrl get sceneCtrl => _sceneCtrl!;

  set sceneCtrl(SceneCtrl ctrl) => _sceneCtrl = ctrl;

  @override
  void onInit() {
    super.onInit();

    void _doClose(String? msg) async {
      await doCloseState();

      if (msg != null) Get.alertDialog(msg);
    }

    on<SwitchRoomEvent>(
      test: (_) => stateRx() == RoomState.Mini,
      (_) => _doClose(null),
    );

    on<RoomCloseEvent>(
      test: (_) => stateRx() == RoomState.Mini && !OAuthCtrl.isSelf(sceneCtrl.roomUid),
      (_) => _doClose('主播已下播'),
    );

    on<UserBlockEvent>(
      test: (event) {
        return stateRx() == RoomState.Mini && OAuthCtrl.isSelf(event.uid);
      },
      (_) => _doClose('你被封禁了'),
    );
  }

  @override
  void onClose() {
    super.onClose();

    doCloseState();
  }

  void _show({
    required bool off,
    required FutureOr Function(int?) infoApi,
    required SceneCtrl Function(Tuple2<RoomBaseInfo, String?>) storeCreate,
    int? roomId,
  }) async {
    Future doJoin() async {
      Future<Tuple2<RoomBaseInfo, String?>> api() async {
        final info = await infoApi(roomId);

        if (OAuthCtrl.isSelf(info['uid'])) return Tuple2(info, null);

        final status = info['private_status'];

        if (status == ApiSwitch.open.code) {
          return Tuple2(info, null);
        } else if (status == ApiSwitch.close.code) {
          return holderProgress(
            Get.showInputDialog(title: '请输入密码').then((val) {
              if (val == null) throw const LogicException(-1, '已取消');

              return Tuple2(info, val);
            }),
          );
        } else {
          throw const LogicException(-1, '数据错误');
        }
      }

      void onReady(SceneCtrl store) async {
        Get.put<SceneCtrl>(
          store,
          tag: '${store.runtimeType}',
          permanent: true,
        );

        RoomPage.show(off);
      }

      simpleSub(
        api(),
        callback1: (resp) => onReady(storeCreate(resp)),
        whenErr: off ? doBackWhenErr : null,
      );
    }

    switch (stateRx()) {
      case RoomState.Normal:
        assert(false, '数据错误');
        return;
      case RoomState.Mini:
        if (_sceneCtrl!.roomId == roomId) {
          RoomPage.show();

          return;
        } else {
          const msg = '已在另一个房间，需要切换房间吗';
          const okLabel = '切换';

          final other = await Get.simpleDialog(msg: msg, okLabel: okLabel);

          if (okLabel != other) {
            return;
          } else {
            // 清除原房间资源
            await doCloseState();

            continue join;
          }
        }
      join:
      case RoomState.None:
        await doJoin();
        break;
    }
  }

  void toRoom({required int roomId, Map? data, bool off = false}) {
    return _show(
      roomId: roomId,
      off: off,
      infoApi: (it) => data ?? Api.Room.info(roomId: it),
      storeCreate: (it) => RoomCtrl(info: it.value1, pwd: it.value2, overlay: (_) => RoomOverlay()),
    );
  }

  void toSquare({Map? data}) {
    return _show(
      off: false,
      infoApi: (_) => data ?? Api.Room.info(type: RoomType.square),
      storeCreate: (it) => SquareCtrl(info: it.value1, pwd: it.value2, overlay: (_) => SquareOverlay()),
    );
  }

  void doNormalState() {
    stateRx(RoomState.Normal);
  }

  void doMiniState() {
    stateRx(RoomState.Mini);
  }

  Future<void> doCloseState() async {
    stateRx(RoomState.None);

    final doClose = _sceneCtrl?.doClose;

    _sceneCtrl = null;

    return await doClose?.call();
  }
}
