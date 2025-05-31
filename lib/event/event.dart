import 'dart:convert';
import 'dart:ui';

import 'package:app/3rd/tencent/im.dart' show V2TimMessage;
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/exception.dart';
import 'package:app/model/enum/money_type.dart';
import 'package:app/model/enum/unity_event_enum.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';

import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/tools/bus.dart';
import 'package:app/ui/room/chat/msg_adapter/data/user_msg_data.dart';
import 'package:protobuf/protobuf.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message_receipt.dart';

part 'app_event.dart';
part 'broadcast_event.dart';
part 'im_event.dart';
part 'room_event_pb.dart';
part 'rtc_event.dart';
part 'unity_event.dart';

class Event {
  String get name => '$runtimeType';

  const Event();

  void fire() => Bus.fire(this);

  @override
  String toString() {
    return '$runtimeType{name:$name}';
  }
}

class RefreshEvent extends Event {
  const RefreshEvent();
}

class MomentRefreshEvent extends RefreshEvent {
  const MomentRefreshEvent();
}

class ConvRefreshEvent extends RefreshEvent {
  const ConvRefreshEvent();
}

class ShopRefreshEvent extends RefreshEvent {
  const ShopRefreshEvent();
}

class UserInfoRefreshEvent extends RefreshEvent {
  const UserInfoRefreshEvent();
}

class ExitDressUpEvent extends Event {
  final bool isNewDressUp;

  const ExitDressUpEvent(this.isNewDressUp);
}

class NoAuthEvent extends Event {
  final String? msg;

  const NoAuthEvent([this.msg]);
}

class NeedRealName extends Event {
  final String? msg;

  const NeedRealName([this.msg]);
}

class AppLifecycleEvent extends Event {
  final AppLifecycleState state;

  AppLifecycleEvent(this.state);

  @override
  String toString() {
    return '$runtimeType{state: $state}';
  }
}



class AppLinkEvent extends Event {
  final Uri link;

  AppLinkEvent(this.link);

  late final isHomie = link.isScheme('homie');
}

class CloseOverlayEvent extends Event {
  final Object key;

  const CloseOverlayEvent(this.key);
}
