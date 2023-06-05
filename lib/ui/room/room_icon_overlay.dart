import 'package:app/model/enum/room_state.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/room/room_mini_view.dart';
import 'package:app/widgets.dart';

class RoomIconOverlay extends StatelessWidget {
  const RoomIconOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<RoomManagerCtrl>(
      builder: (it) {
        switch (it.stateRx()) {
          case RoomState.Mini:
            return const RoomMiniView();
          default:
            return Spacing.blank;
        }
      },
    );
  }
}
