import 'package:app/3rd/tencent/im.dart';
import 'package:app/model/conv.dart';
import 'package:app/store/im/conv_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';

abstract class ConvCreator {
  final convManager = Get.find<ConvManagerCtrl>();

  FutureOr<ChatConv> create();
}

class SingleChatConvCreator extends ConvCreator {
  final UID uid;

  SingleChatConvCreator(this.uid);

  @override
  ChatConv create() {
    return ChatConv.by(id: uid, type: ConversationType.V2TIM_C2C);
  }
}
