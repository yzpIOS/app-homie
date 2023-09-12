import 'package:app/store/room/room_chat_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/room/overlay/big_gift_overlay.dart';
import 'package:app/ui/room/overlay/welcome_overlay.dart';
import 'package:app/widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class RoomChatView extends GetView<RoomChatCtrl> {
  const RoomChatView({super.key});

  @override
  Widget build(BuildContext context) {
    const padding = 10.0;

    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigGiftOverlay(padding: padding),
        WelcomeOverlay(padding: padding),
        Box(
          width: 190 + padding * 2,
          height: 150,
          padding: Pad(horizontal: padding),
          child: _DataView(),
        ),
      ],
    );
  }
}

class _DataView extends GetView<RoomChatCtrl> {
  const _DataView();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final data = controller.dataRx;
        final length = data.length;

        return ScrollablePositionedList.separated(
          shrinkWrap: true,
          reverse: true,
          itemCount: length,
          itemBuilder: (_, i) => data[length - 1 - i],
          separatorBuilder: (_, __) => const Spacing(height: 3, flex: null,),
        );
      },
    );
  }
}
