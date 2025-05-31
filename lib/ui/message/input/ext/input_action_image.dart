import 'package:app/tools.dart';
import 'package:app/ui/message/input/ext/input_ext.dart';
import 'package:photo_manager/photo_manager.dart';

mixin ImageSender implements MsgSender {
  void sendImage(AssetEntity data);

  void sendVideo(AssetEntity data);
}

class InputAction$Image extends InputExt<ImageSender> with ActionMixin {
  InputAction$Image(super.inputCtrl);

  @override
  final String title = '相册';

  @override
  void onTap() {
    mediaPicker(
      max: 1,
      okCall: (it) {
        final item = it.first;

        switch (item.type) {
          case AssetType.image:
            $handle.sendImage(item);
            break;
          case AssetType.video:
            $handle.sendVideo(item);
            break;
          default:
            assert(false, '数据错误 -> $item');
        }
      },
    );
  }
}
