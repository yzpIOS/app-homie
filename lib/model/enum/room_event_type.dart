import 'package:app/tools.dart';

enum RoomEventType {
  userIn(1),
  userOut(2),
  inviteMicUp(3),
  micUp(4),
  micDown(5),
  notice(6),
  msgTxt(7),
  gift(8),
  managerSet(9),
  userBlock(11),
  micDisabled(12),
  micEnable(13),
  micApply(14),
  micReject(15),
  updateUserLevel(16),
  closeLive(17),
  updateHotCount(18),
  updateCharmLevel(19),
  ;

  final int val;

  const RoomEventType(this.val);

  static RoomEventType? fromVal(int val) {
    return RoomEventType.values.firstWhereOrNull((it) => it.val == val);
  }
}
