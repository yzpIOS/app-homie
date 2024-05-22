//
//  Generated code. Do not modify.
//  source: CMD.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 注意：因导出规则约定，枚举值注释说明要求全写在值的后面（不要单独起一行）
class CMD extends $pb.ProtobufEnum {
  static const CMD NONE = CMD._(0, _omitEnumNames ? '' : 'NONE');
  static const CMD G_Heart = CMD._(1, _omitEnumNames ? '' : 'G_Heart');
  static const CMD C_GetTime = CMD._(2, _omitEnumNames ? '' : 'C_GetTime');
  static const CMD S_SysTime = CMD._(3, _omitEnumNames ? '' : 'S_SysTime');
  static const CMD S_Err = CMD._(4, _omitEnumNames ? '' : 'S_Err');
  static const CMD S_Tips = CMD._(5, _omitEnumNames ? '' : 'S_Tips');
  static const CMD S_GM = CMD._(6, _omitEnumNames ? '' : 'S_GM');
  static const CMD SS_UserVerify = CMD._(1000, _omitEnumNames ? '' : 'SS_UserVerify');
  static const CMD C_Role = CMD._(103, _omitEnumNames ? '' : 'C_Role');
  static const CMD S_Role = CMD._(104, _omitEnumNames ? '' : 'S_Role');
  static const CMD C_UploadURL = CMD._(111, _omitEnumNames ? '' : 'C_UploadURL');
  static const CMD S_UploadURL = CMD._(112, _omitEnumNames ? '' : 'S_UploadURL');
  static const CMD C_MediaId = CMD._(113, _omitEnumNames ? '' : 'C_MediaId');
  static const CMD S_MediaId = CMD._(114, _omitEnumNames ? '' : 'S_MediaId');
  static const CMD C_CreateRole = CMD._(121, _omitEnumNames ? '' : 'C_CreateRole');
  static const CMD S_CreateRole = CMD._(122, _omitEnumNames ? '' : 'S_CreateRole');
  static const CMD G_RemoveRole = CMD._(123, _omitEnumNames ? '' : 'G_RemoveRole');
  static const CMD C_UpdateRole = CMD._(124, _omitEnumNames ? '' : 'C_UpdateRole');
  static const CMD S_UpdateRole = CMD._(125, _omitEnumNames ? '' : 'S_UpdateRole');
  static const CMD S_UpdateRoleBroadcast = CMD._(126, _omitEnumNames ? '' : 'S_UpdateRoleBroadcast');
  static const CMD C_RoleOnline = CMD._(127, _omitEnumNames ? '' : 'C_RoleOnline');
  static const CMD S_RoleOnline = CMD._(128, _omitEnumNames ? '' : 'S_RoleOnline');
  static const CMD C_ReLink = CMD._(131, _omitEnumNames ? '' : 'C_ReLink');
  static const CMD C_ExitGame = CMD._(132, _omitEnumNames ? '' : 'C_ExitGame');
  static const CMD G_SwitchScene = CMD._(200, _omitEnumNames ? '' : 'G_SwitchScene');
  static const CMD C_EnterComplete = CMD._(201, _omitEnumNames ? '' : 'C_EnterComplete');
  static const CMD S_SyncRound = CMD._(202, _omitEnumNames ? '' : 'S_SyncRound');
  static const CMD S_SyncAttr = CMD._(203, _omitEnumNames ? '' : 'S_SyncAttr');
  static const CMD S_SyncAttrs = CMD._(204, _omitEnumNames ? '' : 'S_SyncAttrs');
  static const CMD S_SyncMultiAttr = CMD._(205, _omitEnumNames ? '' : 'S_SyncMultiAttr');
  static const CMD S_SyncMultiAttrs = CMD._(206, _omitEnumNames ? '' : 'S_SyncMultiAttrs');
  static const CMD S_SyncRole = CMD._(209, _omitEnumNames ? '' : 'S_SyncRole');
  static const CMD C_ToZone = CMD._(240, _omitEnumNames ? '' : 'C_ToZone');
  static const CMD C_EnforceZone = CMD._(241, _omitEnumNames ? '' : 'C_EnforceZone');
  static const CMD S_SyncZone = CMD._(242, _omitEnumNames ? '' : 'S_SyncZone');
  static const CMD S_EnforceZone = CMD._(243, _omitEnumNames ? '' : 'S_EnforceZone');
  static const CMD C_StopMove = CMD._(245, _omitEnumNames ? '' : 'C_StopMove');
  static const CMD C_Animate = CMD._(246, _omitEnumNames ? '' : 'C_Animate');
  static const CMD C_Stage = CMD._(247, _omitEnumNames ? '' : 'C_Stage');
  static const CMD S_AddRole = CMD._(250, _omitEnumNames ? '' : 'S_AddRole');
  static const CMD S_RemoveObj = CMD._(251, _omitEnumNames ? '' : 'S_RemoveObj');
  static const CMD S_RemoveObjs = CMD._(252, _omitEnumNames ? '' : 'S_RemoveObjs');
  static const CMD C_State = CMD._(260, _omitEnumNames ? '' : 'C_State');
  static const CMD S_State = CMD._(261, _omitEnumNames ? '' : 'S_State');
  static const CMD C_ToSeatInfo = CMD._(280, _omitEnumNames ? '' : 'C_ToSeatInfo');
  static const CMD S_SyncSeatInfo = CMD._(281, _omitEnumNames ? '' : 'S_SyncSeatInfo');
  static const CMD S_TopThree = CMD._(282, _omitEnumNames ? '' : 'S_TopThree');
  static const CMD C_GoToRoom = CMD._(300, _omitEnumNames ? '' : 'C_GoToRoom');
  static const CMD S_GoToRoom = CMD._(301, _omitEnumNames ? '' : 'S_GoToRoom');
  static const CMD C_RoomEnterComplete = CMD._(2000, _omitEnumNames ? '' : 'C_RoomEnterComplete');
  static const CMD S_SyncRoomInfo = CMD._(2001, _omitEnumNames ? '' : 'S_SyncRoomInfo');
  static const CMD C_CreateScene = CMD._(2100, _omitEnumNames ? '' : 'C_CreateScene');
  static const CMD S_CreateScene = CMD._(2101, _omitEnumNames ? '' : 'S_CreateScene');
  static const CMD C_CloseScene = CMD._(2103, _omitEnumNames ? '' : 'C_CloseScene');
  static const CMD S_CloseScene = CMD._(2104, _omitEnumNames ? '' : 'S_CloseScene');
  static const CMD C_OnlineList = CMD._(2110, _omitEnumNames ? '' : 'C_OnlineList');
  static const CMD S_OnlineList = CMD._(2111, _omitEnumNames ? '' : 'S_OnlineList');
  static const CMD C_JoinScene = CMD._(2112, _omitEnumNames ? '' : 'C_JoinScene');
  static const CMD S_JoinScene = CMD._(2113, _omitEnumNames ? '' : 'S_JoinScene');
  static const CMD C_OutScene = CMD._(2114, _omitEnumNames ? '' : 'C_OutScene');
  static const CMD S_OutScene = CMD._(2115, _omitEnumNames ? '' : 'S_OutScene');
  static const CMD C_GoBack = CMD._(2116, _omitEnumNames ? '' : 'C_GoBack');
  static const CMD C_MikeList = CMD._(2120, _omitEnumNames ? '' : 'C_MikeList');
  static const CMD S_MikeList = CMD._(2121, _omitEnumNames ? '' : 'S_MikeList');
  static const CMD C_UpMike = CMD._(2122, _omitEnumNames ? '' : 'C_UpMike');
  static const CMD S_UpMike = CMD._(2123, _omitEnumNames ? '' : 'S_UpMike');
  static const CMD C_OutMike = CMD._(2124, _omitEnumNames ? '' : 'C_OutMike');
  static const CMD S_OutMike = CMD._(2125, _omitEnumNames ? '' : 'S_OutMike');
  static const CMD C_BanMike = CMD._(2126, _omitEnumNames ? '' : 'C_BanMike');
  static const CMD S_BanMike = CMD._(2127, _omitEnumNames ? '' : 'S_BanMike');
  static const CMD C_AccMikeClear = CMD._(2130, _omitEnumNames ? '' : 'C_AccMikeClear');
  static const CMD S_AccMikeClear = CMD._(2131, _omitEnumNames ? '' : 'S_AccMikeClear');
  static const CMD C_SetNoticeMessage = CMD._(2140, _omitEnumNames ? '' : 'C_SetNoticeMessage');
  static const CMD S_SetNoticeMessage = CMD._(2141, _omitEnumNames ? '' : 'S_SetNoticeMessage');
  static const CMD C_SetAdministrator = CMD._(2152, _omitEnumNames ? '' : 'C_SetAdministrator');
  static const CMD S_SetAdministrator = CMD._(2153, _omitEnumNames ? '' : 'S_SetAdministrator');
  static const CMD C_SetBlack = CMD._(2162, _omitEnumNames ? '' : 'C_SetBlack');
  static const CMD S_SetBlack = CMD._(2163, _omitEnumNames ? '' : 'S_SetBlack');
  static const CMD C_ChatMessage = CMD._(2180, _omitEnumNames ? '' : 'C_ChatMessage');
  static const CMD S_ChatMessage = CMD._(2181, _omitEnumNames ? '' : 'S_ChatMessage');
  static const CMD C_BanChat = CMD._(2196, _omitEnumNames ? '' : 'C_BanChat');
  static const CMD S_BanChat = CMD._(2197, _omitEnumNames ? '' : 'S_BanChat');
  static const CMD C_OpenShutMike = CMD._(2198, _omitEnumNames ? '' : 'C_OpenShutMike');
  static const CMD S_LiveStartBroadcast = CMD._(2200, _omitEnumNames ? '' : 'S_LiveStartBroadcast');
  static const CMD S_LiveStopBroadcast = CMD._(2201, _omitEnumNames ? '' : 'S_LiveStopBroadcast');
  static const CMD S_JoinBroadcast = CMD._(2210, _omitEnumNames ? '' : 'S_JoinBroadcast');
  static const CMD S_LeaveBroadcast = CMD._(2211, _omitEnumNames ? '' : 'S_LeaveBroadcast');
  static const CMD S_UpMikeBroadcast = CMD._(2220, _omitEnumNames ? '' : 'S_UpMikeBroadcast');
  static const CMD S_DownMikeBroadcast = CMD._(2221, _omitEnumNames ? '' : 'S_DownMikeBroadcast');
  static const CMD S_InviteMikeBroadcast = CMD._(2222, _omitEnumNames ? '' : 'S_InviteMikeBroadcast');
  static const CMD S_CloseMikeBroadcast = CMD._(2223, _omitEnumNames ? '' : 'S_CloseMikeBroadcast');
  static const CMD S_OpenBroadcast = CMD._(2224, _omitEnumNames ? '' : 'S_OpenBroadcast');
  static const CMD S_ApplyUpMikeBroadcast = CMD._(2225, _omitEnumNames ? '' : 'S_ApplyUpMikeBroadcast');
  static const CMD S_RefuseUpMikeBroadcast = CMD._(2226, _omitEnumNames ? '' : 'S_RefuseUpMikeBroadcast');
  static const CMD S_BanMikeBroadcast = CMD._(2227, _omitEnumNames ? '' : 'S_BanMikeBroadcast');
  static const CMD S_AccMikeBroadcast = CMD._(2230, _omitEnumNames ? '' : 'S_AccMikeBroadcast');
  static const CMD S_NoticeBroadcast = CMD._(2240, _omitEnumNames ? '' : 'S_NoticeBroadcast');
  static const CMD S_BlackBroadcast = CMD._(2250, _omitEnumNames ? '' : 'S_BlackBroadcast');
  static const CMD S_ChatMessageBroadcast = CMD._(2270, _omitEnumNames ? '' : 'S_ChatMessageBroadcast');
  static const CMD S_BanChatBroadcast = CMD._(2271, _omitEnumNames ? '' : 'S_BanChatBroadcast');
  static const CMD S_MikeSpeakingBroadcast = CMD._(2272, _omitEnumNames ? '' : 'S_MikeSpeakingBroadcast');
  static const CMD S_AdministratorBroadcast = CMD._(2280, _omitEnumNames ? '' : 'S_AdministratorBroadcast');
  static const CMD S_LiveStopSettlementBroadcast = CMD._(2281, _omitEnumNames ? '' : 'S_LiveStopSettlementBroadcast');
  static const CMD S_LiveLikeBroadcast = CMD._(2282, _omitEnumNames ? '' : 'S_LiveLikeBroadcast');
  static const CMD S_BackgroundBroadcast = CMD._(2283, _omitEnumNames ? '' : 'S_BackgroundBroadcast');
  static const CMD S_WorldChatMessageBroadcast = CMD._(2284, _omitEnumNames ? '' : 'S_WorldChatMessageBroadcast');
  static const CMD S_ClearScreenBroadcast = CMD._(2285, _omitEnumNames ? '' : 'S_ClearScreenBroadcast');
  static const CMD C_GiveGiftByRoom = CMD._(3100, _omitEnumNames ? '' : 'C_GiveGiftByRoom');
  static const CMD S_GiveGiftByRoom = CMD._(3101, _omitEnumNames ? '' : 'S_GiveGiftByRoom');
  static const CMD S_UpdateLevel = CMD._(3102, _omitEnumNames ? '' : 'S_UpdateLevel');
  static const CMD S_UpdateCharmLevel = CMD._(3103, _omitEnumNames ? '' : 'S_UpdateCharmLevel');
  static const CMD S_GiftPlay = CMD._(3104, _omitEnumNames ? '' : 'S_GiftPlay');
  static const CMD S_FloatingScreen = CMD._(3105, _omitEnumNames ? '' : 'S_FloatingScreen');
  static const CMD C_GiveGiftByDynamic = CMD._(3106, _omitEnumNames ? '' : 'C_GiveGiftByDynamic');
  static const CMD S_GiveGiftByDynamic = CMD._(3107, _omitEnumNames ? '' : 'S_GiveGiftByDynamic');
  static const CMD C_GiveGiftByIm = CMD._(3109, _omitEnumNames ? '' : 'C_GiveGiftByIm');
  static const CMD S_GiveGiftByIm = CMD._(3110, _omitEnumNames ? '' : 'S_GiveGiftByIm');
  static const CMD S_MoreGiftPlay = CMD._(3111, _omitEnumNames ? '' : 'S_MoreGiftPlay');
  static const CMD S_MoreGiftFloatingScreen = CMD._(3112, _omitEnumNames ? '' : 'S_MoreGiftFloatingScreen');
  static const CMD S_BlindBox = CMD._(3113, _omitEnumNames ? '' : 'S_BlindBox');
  static const CMD C_GiveGiftByOneClick = CMD._(3114, _omitEnumNames ? '' : 'C_GiveGiftByOneClick');
  static const CMD S_GiveGiftByOneClick = CMD._(3115, _omitEnumNames ? '' : 'S_GiveGiftByOneClick');
  static const CMD S_LuckScreen = CMD._(3116, _omitEnumNames ? '' : 'S_LuckScreen');
  static const CMD S_AllScreen = CMD._(3117, _omitEnumNames ? '' : 'S_AllScreen');
  static const CMD C_SaveUserCurrentDressUp = CMD._(4100, _omitEnumNames ? '' : 'C_SaveUserCurrentDressUp');
  static const CMD S_SaveUserCurrentDressUp = CMD._(4101, _omitEnumNames ? '' : 'S_SaveUserCurrentDressUp');
  static const CMD S_UpdateDressUp = CMD._(4102, _omitEnumNames ? '' : 'S_UpdateDressUp');
  static const CMD C_UseProductAndSaveUserCurrentDressUp = CMD._(4103, _omitEnumNames ? '' : 'C_UseProductAndSaveUserCurrentDressUp');
  static const CMD S_UseProductAndSaveUserCurrentDressUp = CMD._(4104, _omitEnumNames ? '' : 'S_UseProductAndSaveUserCurrentDressUp');
  static const CMD S_UpdateDesignation = CMD._(4105, _omitEnumNames ? '' : 'S_UpdateDesignation');
  static const CMD C_ChangeDesignation = CMD._(4106, _omitEnumNames ? '' : 'C_ChangeDesignation');
  static const CMD S_ChangeDesignation = CMD._(4107, _omitEnumNames ? '' : 'S_ChangeDesignation');
  static const CMD C_QueryDesignation = CMD._(4108, _omitEnumNames ? '' : 'C_QueryDesignation');
  static const CMD S_QueryDesignation = CMD._(4109, _omitEnumNames ? '' : 'S_QueryDesignation');
  static const CMD S_BlindBoxItem = CMD._(4110, _omitEnumNames ? '' : 'S_BlindBoxItem');
  static const CMD S_BulletinBroadcast = CMD._(5000, _omitEnumNames ? '' : 'S_BulletinBroadcast');
  static const CMD C_Robot = CMD._(6661, _omitEnumNames ? '' : 'C_Robot');
  static const CMD S_Robot = CMD._(6662, _omitEnumNames ? '' : 'S_Robot');
  static const CMD C_Test = CMD._(6666, _omitEnumNames ? '' : 'C_Test');
  static const CMD S_Test = CMD._(6667, _omitEnumNames ? '' : 'S_Test');
  static const CMD C_Debug = CMD._(6668, _omitEnumNames ? '' : 'C_Debug');
  static const CMD S_Debug = CMD._(6669, _omitEnumNames ? '' : 'S_Debug');
  static const CMD C_OptTest = CMD._(6670, _omitEnumNames ? '' : 'C_OptTest');
  static const CMD S_OptTest = CMD._(6671, _omitEnumNames ? '' : 'S_OptTest');
  static const CMD C_Verify = CMD._(10000, _omitEnumNames ? '' : 'C_Verify');
  static const CMD C_Exit = CMD._(10001, _omitEnumNames ? '' : 'C_Exit');
  static const CMD G_UFHeart = CMD._(10002, _omitEnumNames ? '' : 'G_UFHeart');
  static const CMD C_UFReLink = CMD._(10003, _omitEnumNames ? '' : 'C_UFReLink');
  static const CMD F_GiftShow = CMD._(11000, _omitEnumNames ? '' : 'F_GiftShow');
  static const CMD C_ControlAppUI = CMD._(11001, _omitEnumNames ? '' : 'C_ControlAppUI');
  static const CMD F_ControlAppUI = CMD._(11002, _omitEnumNames ? '' : 'F_ControlAppUI');
  static const CMD C_GoAwayRoom = CMD._(12000, _omitEnumNames ? '' : 'C_GoAwayRoom');
  static const CMD S_GoAwayRoom = CMD._(12001, _omitEnumNames ? '' : 'S_GoAwayRoom');
  static const CMD C_InFreeMikesArea = CMD._(12002, _omitEnumNames ? '' : 'C_InFreeMikesArea');
  static const CMD S_InFreeMikesArea = CMD._(12003, _omitEnumNames ? '' : 'S_InFreeMikesArea');
  static const CMD C_OutFreeMikesArea = CMD._(12006, _omitEnumNames ? '' : 'C_OutFreeMikesArea');
  static const CMD S_OutFreeMikesArea = CMD._(12007, _omitEnumNames ? '' : 'S_OutFreeMikesArea');
  static const CMD C_PlazaToRoom = CMD._(12004, _omitEnumNames ? '' : 'C_PlazaToRoom');
  static const CMD S_PlazaToRoom = CMD._(12005, _omitEnumNames ? '' : 'S_PlazaToRoom');
  static const CMD C_PushPreload = CMD._(12020, _omitEnumNames ? '' : 'C_PushPreload');
  static const CMD S_PushPreload = CMD._(12021, _omitEnumNames ? '' : 'S_PushPreload');
  static const CMD S_CameraSwitch = CMD._(12030, _omitEnumNames ? '' : 'S_CameraSwitch');
  static const CMD C_PKInvite = CMD._(20001, _omitEnumNames ? '' : 'C_PKInvite');
  static const CMD S_PKInvite = CMD._(20002, _omitEnumNames ? '' : 'S_PKInvite');
  static const CMD C_PKAccept = CMD._(20003, _omitEnumNames ? '' : 'C_PKAccept');
  static const CMD S_PKInviteResult = CMD._(20004, _omitEnumNames ? '' : 'S_PKInviteResult');
  static const CMD C_PKRoomList = CMD._(20005, _omitEnumNames ? '' : 'C_PKRoomList');
  static const CMD S_PKRoomList = CMD._(20006, _omitEnumNames ? '' : 'S_PKRoomList');
  static const CMD C_PKSceneLoaded = CMD._(20010, _omitEnumNames ? '' : 'C_PKSceneLoaded');
  static const CMD S_PKGameInfo = CMD._(20011, _omitEnumNames ? '' : 'S_PKGameInfo');
  static const CMD S_PKUserEnter = CMD._(20012, _omitEnumNames ? '' : 'S_PKUserEnter');
  static const CMD C_PKBattleReady = CMD._(20031, _omitEnumNames ? '' : 'C_PKBattleReady');
  static const CMD S_PKSyncRoles = CMD._(20032, _omitEnumNames ? '' : 'S_PKSyncRoles');
  static const CMD C_PKMove = CMD._(20034, _omitEnumNames ? '' : 'C_PKMove');
  static const CMD C_PKStop = CMD._(20035, _omitEnumNames ? '' : 'C_PKStop');
  static const CMD S_PKSyncRoleAttsLF = CMD._(20036, _omitEnumNames ? '' : 'S_PKSyncRoleAttsLF');
  static const CMD S_PKSyncRoleAttsHF = CMD._(20037, _omitEnumNames ? '' : 'S_PKSyncRoleAttsHF');
  static const CMD S_PKSceneToxic = CMD._(20038, _omitEnumNames ? '' : 'S_PKSceneToxic');
  static const CMD S_PKSceneGift = CMD._(20039, _omitEnumNames ? '' : 'S_PKSceneGift');
  static const CMD S_PKBattleEnd = CMD._(20050, _omitEnumNames ? '' : 'S_PKBattleEnd');
  static const CMD C_PKContinue = CMD._(20051, _omitEnumNames ? '' : 'C_PKContinue');
  static const CMD S_PKContinue = CMD._(20052, _omitEnumNames ? '' : 'S_PKContinue');
  static const CMD C_Move = CMD._(100201, _omitEnumNames ? '' : 'C_Move');
  static const CMD S_Move = CMD._(100202, _omitEnumNames ? '' : 'S_Move');
  static const CMD S_Dialog = CMD._(210001, _omitEnumNames ? '' : 'S_Dialog');

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
    C_UpdateRole,
    S_UpdateRole,
    S_UpdateRoleBroadcast,
    C_RoleOnline,
    S_RoleOnline,
    C_ReLink,
    C_ExitGame,
    G_SwitchScene,
    C_EnterComplete,
    S_SyncRound,
    S_SyncAttr,
    S_SyncAttrs,
    S_SyncMultiAttr,
    S_SyncMultiAttrs,
    S_SyncRole,
    C_ToZone,
    C_EnforceZone,
    S_SyncZone,
    S_EnforceZone,
    C_StopMove,
    C_Animate,
    C_Stage,
    S_AddRole,
    S_RemoveObj,
    S_RemoveObjs,
    C_State,
    S_State,
    C_ToSeatInfo,
    S_SyncSeatInfo,
    S_TopThree,
    C_GoToRoom,
    S_GoToRoom,
    C_RoomEnterComplete,
    S_SyncRoomInfo,
    C_CreateScene,
    S_CreateScene,
    C_CloseScene,
    S_CloseScene,
    C_OnlineList,
    S_OnlineList,
    C_JoinScene,
    S_JoinScene,
    C_OutScene,
    S_OutScene,
    C_GoBack,
    C_MikeList,
    S_MikeList,
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
    C_BanChat,
    S_BanChat,
    C_OpenShutMike,
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
    S_BanMikeBroadcast,
    S_AccMikeBroadcast,
    S_NoticeBroadcast,
    S_BlackBroadcast,
    S_ChatMessageBroadcast,
    S_BanChatBroadcast,
    S_MikeSpeakingBroadcast,
    S_AdministratorBroadcast,
    S_LiveStopSettlementBroadcast,
    S_LiveLikeBroadcast,
    S_BackgroundBroadcast,
    S_WorldChatMessageBroadcast,
    S_ClearScreenBroadcast,
    C_GiveGiftByRoom,
    S_GiveGiftByRoom,
    S_UpdateLevel,
    S_UpdateCharmLevel,
    S_GiftPlay,
    S_FloatingScreen,
    C_GiveGiftByDynamic,
    S_GiveGiftByDynamic,
    C_GiveGiftByIm,
    S_GiveGiftByIm,
    S_MoreGiftPlay,
    S_MoreGiftFloatingScreen,
    S_BlindBox,
    C_GiveGiftByOneClick,
    S_GiveGiftByOneClick,
    S_LuckScreen,
    S_AllScreen,
    C_SaveUserCurrentDressUp,
    S_SaveUserCurrentDressUp,
    S_UpdateDressUp,
    C_UseProductAndSaveUserCurrentDressUp,
    S_UseProductAndSaveUserCurrentDressUp,
    S_UpdateDesignation,
    C_ChangeDesignation,
    S_ChangeDesignation,
    C_QueryDesignation,
    S_QueryDesignation,
    S_BlindBoxItem,
    S_BulletinBroadcast,
    C_Robot,
    S_Robot,
    C_Test,
    S_Test,
    C_Debug,
    S_Debug,
    C_OptTest,
    S_OptTest,
    C_Verify,
    C_Exit,
    G_UFHeart,
    C_UFReLink,
    F_GiftShow,
    C_ControlAppUI,
    F_ControlAppUI,
    C_GoAwayRoom,
    S_GoAwayRoom,
    C_InFreeMikesArea,
    S_InFreeMikesArea,
    C_OutFreeMikesArea,
    S_OutFreeMikesArea,
    C_PlazaToRoom,
    S_PlazaToRoom,
    C_PushPreload,
    S_PushPreload,
    S_CameraSwitch,
    C_PKInvite,
    S_PKInvite,
    C_PKAccept,
    S_PKInviteResult,
    C_PKRoomList,
    S_PKRoomList,
    C_PKSceneLoaded,
    S_PKGameInfo,
    S_PKUserEnter,
    C_PKBattleReady,
    S_PKSyncRoles,
    C_PKMove,
    C_PKStop,
    S_PKSyncRoleAttsLF,
    S_PKSyncRoleAttsHF,
    S_PKSceneToxic,
    S_PKSceneGift,
    S_PKBattleEnd,
    C_PKContinue,
    S_PKContinue,
    C_Move,
    S_Move,
    S_Dialog,
  ];

  static final $core.Map<$core.int, CMD> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CMD? valueOf($core.int value) => _byValue[value];

  const CMD._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
