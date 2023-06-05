import 'package:get/get.dart';

enum MomentAttachEnum {
  image(0),
  video(1);

  final int val;

  const MomentAttachEnum(this.val);

  static MomentAttachEnum? fromVal(int val) {
    return MomentAttachEnum.values.firstWhereOrNull((it) => it.val == val);
  }
}
