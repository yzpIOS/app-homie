import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/types.dart';
import 'package:app/ui/room/chat/msg_adapter/data/base_msg_data.dart';

class UserMsgData<T> extends BaseMsgData<T> {
  final UID uid;

  final NUID nuid;

  UserMsgData({required super.data, required this.uid, required this.nuid});
}

class TxtMsgData extends UserMsgData<String> {
  TxtMsgData({required super.data, required super.uid, required super.nuid});
}

class UserInMsgData extends UserMsgData<void> {
  UserInMsgData({required super.uid, required super.nuid}) : super(data: null);
}

class GiftMsgAdapter extends UserMsgData<S_GiftPlay> {
  final Map<UID, UserInfoDto> users;
  final String acceptUid;

  GiftMsgAdapter({required super.uid, required this.acceptUid, required super.nuid, required this.users, required super.data});

  late final int giftCount = data.count;
  late final String giftName = data.name;
  late final String giftCover = data.cover;
}

class LuckMsgAdapter extends UserMsgData<LuckScreenItem> {

  LuckMsgAdapter({required super.uid, required super.nuid, required super.data});

  late final int giftCount = data.count;
  late final String giftName = data.giftName;
  late final String gameName = data.gameName;
  late final int prize = data.price;
}

class BlindBoxGiftOpenMsgAdapter extends UserMsgData<S_MoreGiftPlay> {
  final Map<UID, UserInfoDto> users;
  final String acceptUid;
  final List<S_GiftPlay> items;

  BlindBoxGiftOpenMsgAdapter({required this.acceptUid, required super.nuid, required this.users, required super.uid, required this.items, required super.data});

  late final int blindBoxCount = data.blindBoxCount;
  late final String blindBoxName = data.blindBoxName;
  late final String blindBoxCover = data.blindBoxCover;
}

class LocalMsgData extends BaseMsgData<String> {
  LocalMsgData({required super.data});
}