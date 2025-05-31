import 'package:app/3rd/tencent/im.dart';
import 'package:app/tools.dart';

class ChatConv {
  final String convId;
  final int type;

  ChatConv._({required this.convId, required this.type});

  factory ChatConv.from(V2TimConversation data) {
    return ChatConv._(convId: data.convId, type: data.type!).._conv = data;
  }

  factory ChatConv.by({required String id, required int type}) {
    return ChatConv._(convId: _genConvId(id, type), type: type);
  }

  late final onlyViewRx = RxBool(false);

  late final bool isC2C = type == ConversationType.V2TIM_C2C;
  late final bool isGroup = type == ConversationType.V2TIM_GROUP;
  late final bool isSycConv = convId.startsWith('c2c_service_');

  late final String? userId = isC2C ? convId.replaceFirst('c2c_', '') : null;
  late final String? groupId = isGroup ? convId.replaceFirst('group_', '') : null;

  FutureOr<V2TimConversation>? _conv;

  FutureOr<V2TimConversation> get conv => _conv ??= IM.conv.getConversation(conversationID: convId).dataGet;

  Future<void> markMessageAsRead() async {
    final chat = IM.chat;

    if (isC2C) {
      await chat.markC2CMessageAsRead(userID: userId!);
    } else if (isGroup) {
      await chat.markGroupMessageAsRead(groupID: groupId!);
    } else {
      assert(false, conv);
    }
  }

  static String _genConvId(String id, int type) {
    String _convId;

    switch (type) {
      case ConversationType.V2TIM_C2C:
        _convId = 'c2c_$id';
        break;
      case ConversationType.V2TIM_GROUP:
        _convId = 'group_$id';
        break;
      default:
        assert(false, type);

        _convId = id;

        break;
    }
    return _convId;
  }
}
