///
//  Generated code. Do not modify.
//  source: CMD.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class CMD extends $pb.ProtobufEnum {
  static const CMD NONE = CMD._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NONE');
  static const CMD G_Heart = CMD._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'G_Heart');
  static const CMD C_GetTime = CMD._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_GetTime');
  static const CMD S_SysTime = CMD._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_SysTime');
  static const CMD S_Err = CMD._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_Err');
  static const CMD S_Tips = CMD._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_Tips');
  static const CMD S_GM = CMD._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_GM');
  static const CMD SS_UserVerify = CMD._(1000, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SS_UserVerify');
  static const CMD C_Role = CMD._(103, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_Role');
  static const CMD S_Role = CMD._(104, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_Role');
  static const CMD C_UploadURL = CMD._(111, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_UploadURL');
  static const CMD S_UploadURL = CMD._(112, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_UploadURL');
  static const CMD C_MediaId = CMD._(113, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_MediaId');
  static const CMD S_MediaId = CMD._(114, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_MediaId');
  static const CMD C_CreateRole = CMD._(121, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_CreateRole');
  static const CMD S_CreateRole = CMD._(122, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_CreateRole');
  static const CMD G_RemoveRole = CMD._(123, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'G_RemoveRole');
  static const CMD C_ReLink = CMD._(131, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_ReLink');
  static const CMD C_ExitGame = CMD._(132, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_ExitGame');
  static const CMD G_SwitchScene = CMD._(200, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'G_SwitchScene');
  static const CMD C_EnterComplete = CMD._(201, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_EnterComplete');
  static const CMD S_SyncRound = CMD._(202, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_SyncRound');
  static const CMD S_SyncAttr = CMD._(203, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_SyncAttr');
  static const CMD S_SyncAttrs = CMD._(204, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_SyncAttrs');
  static const CMD S_SyncMultiAttr = CMD._(205, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_SyncMultiAttr');
  static const CMD S_SyncMultiAttrs = CMD._(206, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_SyncMultiAttrs');
  static const CMD C_RoleDetail = CMD._(207, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_RoleDetail');
  static const CMD S_RoleDetail = CMD._(208, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_RoleDetail');
  static const CMD S_SyncRole = CMD._(209, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_SyncRole');
  static const CMD C_ToZone = CMD._(240, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_ToZone');
  static const CMD C_EnforceZone = CMD._(241, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_EnforceZone');
  static const CMD S_SyncZone = CMD._(242, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_SyncZone');
  static const CMD S_EnforceZone = CMD._(243, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_EnforceZone');
  static const CMD C_StopMove = CMD._(245, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_StopMove');
  static const CMD S_AddRole = CMD._(250, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_AddRole');
  static const CMD S_RemoveObj = CMD._(251, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_RemoveObj');
  static const CMD S_RemoveObjs = CMD._(252, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_RemoveObjs');
  static const CMD C_State = CMD._(260, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_State');
  static const CMD S_State = CMD._(261, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_State');
  static const CMD C_ToSeatInfo = CMD._(280, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_ToSeatInfo');
  static const CMD S_SyncSeatInfo = CMD._(281, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_SyncSeatInfo');
  static const CMD C_CreateScene = CMD._(2100, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_CreateScene');
  static const CMD S_CreateScene = CMD._(2101, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_CreateScene');
  static const CMD C_CloseScene = CMD._(2103, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_CloseScene');
  static const CMD S_CloseScene = CMD._(2104, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_CloseScene');
  static const CMD C_JoinScene = CMD._(2112, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_JoinScene');
  static const CMD S_JoinScene = CMD._(2113, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_JoinScene');
  static const CMD C_OutScene = CMD._(2114, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_OutScene');
  static const CMD S_OutScene = CMD._(2115, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_OutScene');
  static const CMD C_UpMike = CMD._(2122, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_UpMike');
  static const CMD S_UpMike = CMD._(2123, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_UpMike');
  static const CMD C_OutMike = CMD._(2124, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_OutMike');
  static const CMD S_OutMike = CMD._(2125, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_OutMike');
  static const CMD C_BanMike = CMD._(2126, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_BanMike');
  static const CMD S_BanMike = CMD._(2127, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_BanMike');
  static const CMD C_AccMikeClear = CMD._(2130, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_AccMikeClear');
  static const CMD S_AccMikeClear = CMD._(2131, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_AccMikeClear');
  static const CMD C_SetNoticeMessage = CMD._(2140, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_SetNoticeMessage');
  static const CMD S_SetNoticeMessage = CMD._(2141, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_SetNoticeMessage');
  static const CMD C_SetAdministrator = CMD._(2152, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_SetAdministrator');
  static const CMD S_SetAdministrator = CMD._(2153, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_SetAdministrator');
  static const CMD C_SetBlack = CMD._(2162, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_SetBlack');
  static const CMD S_SetBlack = CMD._(2163, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_SetBlack');
  static const CMD C_ChatMessage = CMD._(2180, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_ChatMessage');
  static const CMD S_ChatMessage = CMD._(2181, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_ChatMessage');
  static const CMD S_LiveStartBroadcast = CMD._(2200, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_LiveStartBroadcast');
  static const CMD S_LiveStopBroadcast = CMD._(2201, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_LiveStopBroadcast');
  static const CMD S_JoinBroadcast = CMD._(2210, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_JoinBroadcast');
  static const CMD S_LeaveBroadcast = CMD._(2211, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_LeaveBroadcast');
  static const CMD S_UpMikeBroadcast = CMD._(2220, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_UpMikeBroadcast');
  static const CMD S_DownMikeBroadcast = CMD._(2221, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_DownMikeBroadcast');
  static const CMD S_InviteMikeBroadcast = CMD._(2222, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_InviteMikeBroadcast');
  static const CMD S_CloseMikeBroadcast = CMD._(2223, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_CloseMikeBroadcast');
  static const CMD S_OpenBroadcast = CMD._(2224, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_OpenBroadcast');
  static const CMD S_ApplyUpMikeBroadcast = CMD._(2225, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_ApplyUpMikeBroadcast');
  static const CMD S_RefuseUpMikeBroadcast = CMD._(2226, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_RefuseUpMikeBroadcast');
  static const CMD S_AccMikeBroadcast = CMD._(2230, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_AccMikeBroadcast');
  static const CMD S_NoticeBroadcast = CMD._(2240, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_NoticeBroadcast');
  static const CMD S_BlackBroadcast = CMD._(2250, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_BlackBroadcast');
  static const CMD S_ChatMessageBroadcast = CMD._(2270, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_ChatMessageBroadcast');
  static const CMD S_AdministratorBroadcast = CMD._(2280, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_AdministratorBroadcast');
  static const CMD C_GiveGiftByRoom = CMD._(3100, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_GiveGiftByRoom');
  static const CMD S_GiveGiftByRoom = CMD._(3101, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_GiveGiftByRoom');
  static const CMD S_UpdateLevel = CMD._(3102, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_UpdateLevel');
  static const CMD S_UpdateCharmLevel = CMD._(3103, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_UpdateCharmLevel');
  static const CMD S_GiftPlay = CMD._(3104, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_GiftPlay');
  static const CMD S_FloatingScreen = CMD._(3105, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_FloatingScreen');
  static const CMD C_Robot = CMD._(6661, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_Robot');
  static const CMD S_Robot = CMD._(6662, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_Robot');
  static const CMD C_Test = CMD._(6666, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_Test');
  static const CMD S_Test = CMD._(6667, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_Test');
  static const CMD C_Debug = CMD._(6668, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_Debug');
  static const CMD S_Debug = CMD._(6669, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S_Debug');
  static const CMD C_Verify = CMD._(10000, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_Verify');
  static const CMD C_Exit = CMD._(10001, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_Exit');
  static const CMD G_UFHeart = CMD._(10002, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'G_UFHeart');
  static const CMD C_UFReLink = CMD._(10003, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_UFReLink');
  static const CMD F_GiftShow = CMD._(11000, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'F_GiftShow');

  static const $core.List<CMD> values = <CMD> [
    NONE,
    G_Heart,
    C_GetTime,
    S_SysTime,
    S_Err,
    S_Tips,
    S_GM,
    SS_UserVerify,
    C_Role,
    S_Role,
    C_UploadURL,
    S_UploadURL,
    C_MediaId,
    S_MediaId,
    C_CreateRole,
    S_CreateRole,
    G_RemoveRole,
    C_ReLink,
    C_ExitGame,
    G_SwitchScene,
    C_EnterComplete,
    S_SyncRound,
    S_SyncAttr,
    S_SyncAttrs,
    S_SyncMultiAttr,
    S_SyncMultiAttrs,
    C_RoleDetail,
    S_RoleDetail,
    S_SyncRole,
    C_ToZone,
    C_EnforceZone,
    S_SyncZone,
    S_EnforceZone,
    C_StopMove,
    S_AddRole,
    S_RemoveObj,
    S_RemoveObjs,
    C_State,
    S_State,
    C_ToSeatInfo,
    S_SyncSeatInfo,
    C_CreateScene,
    S_CreateScene,
    C_CloseScene,
    S_CloseScene,
    C_JoinScene,
    S_JoinScene,
    C_OutScene,
    S_OutScene,
    C_UpMike,
    S_UpMike,
    C_OutMike,
    S_OutMike,
    C_BanMike,
    S_BanMike,
    C_AccMikeClear,
    S_AccMikeClear,
    C_SetNoticeMessage,
    S_SetNoticeMessage,
    C_SetAdministrator,
    S_SetAdministrator,
    C_SetBlack,
    S_SetBlack,
    C_ChatMessage,
    S_ChatMessage,
    S_LiveStartBroadcast,
    S_LiveStopBroadcast,
    S_JoinBroadcast,
    S_LeaveBroadcast,
    S_UpMikeBroadcast,
    S_DownMikeBroadcast,
    S_InviteMikeBroadcast,
    S_CloseMikeBroadcast,
    S_OpenBroadcast,
    S_ApplyUpMikeBroadcast,
    S_RefuseUpMikeBroadcast,
    S_AccMikeBroadcast,
    S_NoticeBroadcast,
    S_BlackBroadcast,
    S_ChatMessageBroadcast,
    S_AdministratorBroadcast,
    C_GiveGiftByRoom,
    S_GiveGiftByRoom,
    S_UpdateLevel,
    S_UpdateCharmLevel,
    S_GiftPlay,
    S_FloatingScreen,
    C_Robot,
    S_Robot,
    C_Test,
    S_Test,
    C_Debug,
    S_Debug,
    C_Verify,
    C_Exit,
    G_UFHeart,
    C_UFReLink,
    F_GiftShow,
  ];

  static final $core.Map<$core.int, CMD> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CMD? valueOf($core.int value) => _byValue[value];

  const CMD._($core.int v, $core.String n) : super(v, n);
}

