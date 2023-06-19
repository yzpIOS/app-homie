// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';
import 'dart:io';

import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/socket/proto/Message.pb.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/exception.dart';
import 'package:app/model/enum/api_switch.dart';
import 'package:app/model/enum/gender_enum.dart';
import 'package:app/model/enum/room_state.dart';
import 'package:app/model/enum/verify_code_enum.dart';
import 'package:app/model/local_attach.dart';
import 'package:app/net/http.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:fixnum/fixnum.dart';

part 'api/api_activity.dart';
part 'api/api_common.dart';
part 'api/api_dressup.dart';
part 'api/api_finance.dart';
part 'api/api_gift.dart';
part 'api/api_lottery.dart';
part 'api/api_moment.dart';
part 'api/api_room.dart';
part 'api/api_room_msg.dart';
part 'api/api_scene.dart';
part 'api/api_shop.dart';
part 'api/api_shopping_cart.dart';
part 'api/api_user_auth.dart';
part 'api/api_user_info.dart';
part 'api/api_wallet.dart';
part 'api/base.dart';

final Api = _Api._();

class _Api extends ApiBase {
  _Api._() : super('');

  late final Common = ApiCommon('$_path/v1');
  late final UserAuth = ApiUserAuth('$_path/v1/user_auth');
  late final UserInfo = ApiUserInfo('$_path/v1/user_profile');
  late final Moment = ApiMoment('$_path/v1/dynamic');
  late final Wallet = ApiWallet('$_path/v1/wallet');
  late final Finance = ApiFinance('$_path/v1/finance');
  late final Gift = ApiGift('$_path/v1/gift');
  late final Lottery = ApiLottery('$_path/v1');
  late final Scene = ApiScene('$_path/v1/room');
  late final Room = ApiRoom('$_path/v1/room');
  late final RoomMsg = ApiRoomMsg('$_path/v1/message');
  late final DressUp = ApiDressUp('$_path/v1/dress_up');
  late final Shop = ApiShop('$_path/v1/dress_up');
  late final ShoppingCart = ApiShoppingCart('$_path/v1/dress_up/shopping_cart');
  late final Activity = ApiActivity('$_path/v1/activity');
}
