import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/types.dart';
import 'package:app/ui/room/chat/msg_adapter/data/base_msg_data.dart';

class UserMsgData<T> extends BaseMsgData<T> {
  final UID uid;

  NUID? nuid;

  UserMsgData({required super.data, required this.uid, this.nuid});
}

class TxtMsgData extends UserMsgData<String> {
  TxtMsgData({required super.data, required super.uid, super.nuid});
}

class UserInMsgData extends UserMsgData<void> {
  UserInMsgData({required super.uid, super.nuid}) : super(data: null);
}

class GiftMsgAdapter extends UserMsgData<Map> {
  final Map<UID, UserInfoDto> users;
  final String acceptUid;

  GiftMsgAdapter({required super.uid, required this.acceptUid, super.nuid, required this.users, required super.data});

  late final int giftCount = data['count'];
  late final String giftName = data['name'];
  late final String giftCover = data['cover'];
}
