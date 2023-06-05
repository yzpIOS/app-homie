import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/types.dart';
import 'package:app/ui/room/chat/msg_adapter/data/base_msg_data.dart';

class UserMsgData<T> extends BaseMsgData<T> {
  final UID uid;

  UserMsgData({required super.data, required this.uid});
}

class TxtMsgData extends UserMsgData<String> {
  TxtMsgData({required super.data, required super.uid});
}

class UserInMsgData extends UserMsgData<void> {
  UserInMsgData({required super.uid}) : super(data: null);
}

class GiftMsgAdapter extends UserMsgData<Map> {
  final Map<UID, UserInfoDto> users;
  final String acceptUid;

  GiftMsgAdapter({required super.uid, required this.acceptUid, required this.users, required super.data});

  late final int giftCount = data['count'];
  late final String giftName = data['name'];
  late final String giftCover = data['cover'];
}
