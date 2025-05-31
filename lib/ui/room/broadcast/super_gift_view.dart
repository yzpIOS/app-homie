import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/model/api/user_info_model.dart';
import 'package:app/model/enum/room_state.dart';
import 'package:app/net/api.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';

class SuperGiftView extends StatelessWidget {
  final UID acceptUid;
  final Map<UID, UserInfoModel> users;
  final S_FloatingScreen data;

  SuperGiftView({required this.data, required this.acceptUid, required this.users}) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    final user = users[data.sendId];

    Widget child = XRichText(
      TextSpan(
        children: [
          TextSpan(text: user?.showName ?? '--'),
          const TextSpan(text: '在'),
          TextSpan(text: data.roomName),
          const TextSpan(text: '直播间赠送'),
          TextSpan(text: users[acceptUid]?.showName ?? '--'),
        ],
      ),
      overflow: TextOverflow.fade,
    );

    child = Row(
      children: [
        Flexible(child: child),
        Padding(
          padding: const Pad(horizontal: 2),
          child: GiftImgState(
            child: NetImage(data.cover, width: 30, height: 34),
          ),
        ),
        XText(
          'x${data.count}',
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );

    child = DefaultTextStyle(
      style: const TextStyle(fontSize: 12, color: AppPalette.colorY),
      child: child,
    );

    child = Stack(
      children: [
        Image.asset(IMG.format('room/广播背景'), width: 355, height: 50, scale: 2),
        Positioned(
          top: 8,
          left: 28,
          child: AvatarView(user?.avatarUrl, blur: user?.avatarExtra, size: 30),
        ),
        Positioned(
          top: 6,
          left: 63,
          right: 60,
          child: child,
        ),
        Positioned(
          top: 6,
          right: 0,
          left: 300,
          child: toRoomView(),
        ),
      ],
    );

    child = Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: AppSize.width * (355 / 375),
        child: FittedBox(fit: BoxFit.fitWidth, child: child),
      ),
    );

    return LayoutBuilder(
      builder: (_, c) {
        return SizedBox(width: c.maxWidth, child: child);
      },
    );
  }

  Widget toRoomView() {
    // 当前直播间，不显示去围观
    try {
      if(RoomManagerCtrl.ins.sceneCtrl.roomId == data.roomId.toInt()) {
        return const SizedBox();
      }
    } catch(e) {
    }
    Widget child = Image.asset(IMG.format('room/围观'), width: 35, height: 20, scale: 3);

    child = Box(
      alignment: Alignment.topLeft,
      padding: const Pad(top: 9, bottom: 5),
      child: child,
    );

    child = OpacityButton(
      child: child,
      onTap: () {
        final managerCtrl = Get.find<RoomManagerCtrl>();
        final roomId = data.roomId;

        if (managerCtrl.sceneCtrl.roomId != roomId) {
          Get.simpleDialog(msg: '确定切换房间').onResult(okCall: () {
            const SwitchRoomEvent().fire();

            simpleSub(
              Future.wait([Api.Room.info(roomId: roomId.toInt()), Future.delayed(const Duration(seconds: 1))]),
              callback1: (resp) {
                final data = resp[0];

                switch (RoomType.fromVal(data['room_type'])) {
                  case RoomType.customize:
                  case RoomType.guild:
                    managerCtrl.toRoom(roomId: roomId.toInt(), data: data);
                    break;
                  case RoomType.square:
                    managerCtrl.toSquare(data: data);
                    break;
                  default:
                    showToast('数据错误');
                }
              },
            );
          });
        }
      },
    );

    return child;
  }
}
