//
//  Generated code. Do not modify.
//  source: CMD.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use cMDDescriptor instead')
const CMD$json = {
  '1': 'CMD',
  '2': [
    {'1': 'NONE', '2': 0},
    {'1': 'G_Heart', '2': 1},
    {'1': 'C_GetTime', '2': 2},
    {'1': 'S_SysTime', '2': 3},
    {'1': 'S_Err', '2': 4},
    {'1': 'S_Tips', '2': 5},
    {'1': 'S_GM', '2': 6},
    {'1': 'SS_UserVerify', '2': 1000},
    {'1': 'C_Role', '2': 103},
    {'1': 'S_Role', '2': 104},
    {'1': 'C_UploadURL', '2': 111},
    {'1': 'S_UploadURL', '2': 112},
    {'1': 'C_MediaId', '2': 113},
    {'1': 'S_MediaId', '2': 114},
    {'1': 'C_CreateRole', '2': 121},
    {'1': 'S_CreateRole', '2': 122},
    {'1': 'G_RemoveRole', '2': 123},
    {'1': 'C_UpdateRole', '2': 124},
    {'1': 'S_UpdateRole', '2': 125},
    {'1': 'S_UpdateRoleBroadcast', '2': 126},
    {'1': 'C_RoleOnline', '2': 127},
    {'1': 'S_RoleOnline', '2': 128},
    {'1': 'C_ReLink', '2': 131},
    {'1': 'C_ExitGame', '2': 132},
    {'1': 'G_SwitchScene', '2': 200},
    {'1': 'C_EnterComplete', '2': 201},
    {'1': 'S_SyncRound', '2': 202},
    {'1': 'S_SyncAttr', '2': 203},
    {'1': 'S_SyncAttrs', '2': 204},
    {'1': 'S_SyncMultiAttr', '2': 205},
    {'1': 'S_SyncMultiAttrs', '2': 206},
    {'1': 'S_SyncRole', '2': 209},
    {'1': 'C_ToZone', '2': 240},
    {'1': 'C_EnforceZone', '2': 241},
    {'1': 'S_SyncZone', '2': 242},
    {'1': 'S_EnforceZone', '2': 243},
    {'1': 'C_StopMove', '2': 245},
    {'1': 'C_Animate', '2': 246},
    {'1': 'C_Stage', '2': 247},
    {'1': 'S_AddRole', '2': 250},
    {'1': 'S_RemoveObj', '2': 251},
    {'1': 'S_RemoveObjs', '2': 252},
    {'1': 'C_State', '2': 260},
    {'1': 'S_State', '2': 261},
    {'1': 'C_ToSeatInfo', '2': 280},
    {'1': 'S_SyncSeatInfo', '2': 281},
    {'1': 'C_GoToRoom', '2': 300},
    {'1': 'S_GoToRoom', '2': 301},
    {'1': 'C_RoomEnterComplete', '2': 2000},
    {'1': 'S_SyncRoomInfo', '2': 2001},
    {'1': 'C_CreateScene', '2': 2100},
    {'1': 'S_CreateScene', '2': 2101},
    {'1': 'C_CloseScene', '2': 2103},
    {'1': 'S_CloseScene', '2': 2104},
    {'1': 'C_OnlineList', '2': 2110},
    {'1': 'S_OnlineList', '2': 2111},
    {'1': 'C_JoinScene', '2': 2112},
    {'1': 'S_JoinScene', '2': 2113},
    {'1': 'C_OutScene', '2': 2114},
    {'1': 'S_OutScene', '2': 2115},
    {'1': 'C_GoBack', '2': 2116},
    {'1': 'C_MikeList', '2': 2120},
    {'1': 'S_MikeList', '2': 2121},
    {'1': 'C_UpMike', '2': 2122},
    {'1': 'S_UpMike', '2': 2123},
    {'1': 'C_OutMike', '2': 2124},
    {'1': 'S_OutMike', '2': 2125},
    {'1': 'C_BanMike', '2': 2126},
    {'1': 'S_BanMike', '2': 2127},
    {'1': 'C_AccMikeClear', '2': 2130},
    {'1': 'S_AccMikeClear', '2': 2131},
    {'1': 'C_SetNoticeMessage', '2': 2140},
    {'1': 'S_SetNoticeMessage', '2': 2141},
    {'1': 'C_SetAdministrator', '2': 2152},
    {'1': 'S_SetAdministrator', '2': 2153},
    {'1': 'C_SetBlack', '2': 2162},
    {'1': 'S_SetBlack', '2': 2163},
    {'1': 'C_ChatMessage', '2': 2180},
    {'1': 'S_ChatMessage', '2': 2181},
    {'1': 'C_BanChat', '2': 2196},
    {'1': 'S_BanChat', '2': 2197},
    {'1': 'S_LiveStartBroadcast', '2': 2200},
    {'1': 'S_LiveStopBroadcast', '2': 2201},
    {'1': 'S_JoinBroadcast', '2': 2210},
    {'1': 'S_LeaveBroadcast', '2': 2211},
    {'1': 'S_UpMikeBroadcast', '2': 2220},
    {'1': 'S_DownMikeBroadcast', '2': 2221},
    {'1': 'S_InviteMikeBroadcast', '2': 2222},
    {'1': 'S_CloseMikeBroadcast', '2': 2223},
    {'1': 'S_OpenBroadcast', '2': 2224},
    {'1': 'S_ApplyUpMikeBroadcast', '2': 2225},
    {'1': 'S_RefuseUpMikeBroadcast', '2': 2226},
    {'1': 'S_BanMikeBroadcast', '2': 2227},
    {'1': 'S_AccMikeBroadcast', '2': 2230},
    {'1': 'S_NoticeBroadcast', '2': 2240},
    {'1': 'S_BlackBroadcast', '2': 2250},
    {'1': 'S_ChatMessageBroadcast', '2': 2270},
    {'1': 'S_BanChatBroadcast', '2': 2271},
    {'1': 'S_MikeSpeakingBroadcast', '2': 2272},
    {'1': 'S_AdministratorBroadcast', '2': 2280},
    {'1': 'S_LiveStopSettlementBroadcast', '2': 2281},
    {'1': 'S_LiveLikeBroadcast', '2': 2282},
    {'1': 'S_BackgroundBroadcast', '2': 2283},
    {'1': 'S_WorldChatMessageBroadcast', '2': 2284},
    {'1': 'C_GiveGiftByRoom', '2': 3100},
    {'1': 'S_GiveGiftByRoom', '2': 3101},
    {'1': 'S_UpdateLevel', '2': 3102},
    {'1': 'S_UpdateCharmLevel', '2': 3103},
    {'1': 'S_GiftPlay', '2': 3104},
    {'1': 'S_FloatingScreen', '2': 3105},
    {'1': 'C_GiveGiftByDynamic', '2': 3106},
    {'1': 'S_GiveGiftByDynamic', '2': 3107},
    {'1': 'C_GiveGiftByIm', '2': 3109},
    {'1': 'S_GiveGiftByIm', '2': 3110},
    {'1': 'S_MoreGiftPlay', '2': 3111},
    {'1': 'S_MoreGiftFloatingScreen', '2': 3112},
    {'1': 'S_BlindBox', '2': 3113},
    {'1': 'C_GiveGiftByOneClick', '2': 3114},
    {'1': 'S_GiveGiftByOneClick', '2': 3115},
    {'1': 'S_LuckScreen', '2': 3116},
    {'1': 'S_AllScreen', '2': 3117},
    {'1': 'C_SaveUserCurrentDressUp', '2': 4100},
    {'1': 'S_SaveUserCurrentDressUp', '2': 4101},
    {'1': 'S_UpdateDressUp', '2': 4102},
    {'1': 'C_UseProductAndSaveUserCurrentDressUp', '2': 4103},
    {'1': 'S_UseProductAndSaveUserCurrentDressUp', '2': 4104},
    {'1': 'S_UpdateDesignation', '2': 4105},
    {'1': 'C_ChangeDesignation', '2': 4106},
    {'1': 'S_ChangeDesignation', '2': 4107},
    {'1': 'C_QueryDesignation', '2': 4108},
    {'1': 'S_QueryDesignation', '2': 4109},
    {'1': 'S_BlindBoxItem', '2': 4110},
    {'1': 'S_BulletinBroadcast', '2': 5000},
    {'1': 'C_Robot', '2': 6661},
    {'1': 'S_Robot', '2': 6662},
    {'1': 'C_Test', '2': 6666},
    {'1': 'S_Test', '2': 6667},
    {'1': 'C_Debug', '2': 6668},
    {'1': 'S_Debug', '2': 6669},
    {'1': 'C_OptTest', '2': 6670},
    {'1': 'S_OptTest', '2': 6671},
    {'1': 'C_Verify', '2': 10000},
    {'1': 'C_Exit', '2': 10001},
    {'1': 'G_UFHeart', '2': 10002},
    {'1': 'C_UFReLink', '2': 10003},
    {'1': 'F_GiftShow', '2': 11000},
    {'1': 'C_ControlAppUI', '2': 11001},
    {'1': 'F_ControlAppUI', '2': 11002},
    {'1': 'C_GoAwayRoom', '2': 12000},
    {'1': 'S_GoAwayRoom', '2': 12001},
    {'1': 'C_InFreeMikesArea', '2': 12002},
    {'1': 'S_InFreeMikesArea', '2': 12003},
    {'1': 'C_OutFreeMikesArea', '2': 12006},
    {'1': 'S_OutFreeMikesArea', '2': 12007},
    {'1': 'C_PlazaToRoom', '2': 12004},
    {'1': 'S_PlazaToRoom', '2': 12005},
    {'1': 'C_PushPreload', '2': 12020},
    {'1': 'S_PushPreload', '2': 12021},
    {'1': 'S_CameraSwitch', '2': 12030},
    {'1': 'C_PKInvite', '2': 20001},
    {'1': 'S_PKInvite', '2': 20002},
    {'1': 'C_PKAccept', '2': 20003},
    {'1': 'S_PKInviteResult', '2': 20004},
    {'1': 'C_PKRoomList', '2': 20005},
    {'1': 'S_PKRoomList', '2': 20006},
    {'1': 'C_PKSceneLoaded', '2': 20010},
    {'1': 'S_PKGameInfo', '2': 20011},
    {'1': 'S_PKUserEnter', '2': 20012},
    {'1': 'C_PKBattleReady', '2': 20031},
    {'1': 'S_PKSyncRoles', '2': 20032},
    {'1': 'C_PKMove', '2': 20034},
    {'1': 'C_PKStop', '2': 20035},
    {'1': 'S_PKSyncRoleAttsLF', '2': 20036},
    {'1': 'S_PKSyncRoleAttsHF', '2': 20037},
    {'1': 'S_PKSceneToxic', '2': 20038},
    {'1': 'S_PKSceneGift', '2': 20039},
    {'1': 'S_PKBattleEnd', '2': 20050},
    {'1': 'C_PKContinue', '2': 20051},
    {'1': 'S_PKContinue', '2': 20052},
    {'1': 'C_Move', '2': 100201},
    {'1': 'S_Move', '2': 100202},
    {'1': 'S_Dialog', '2': 210001},
  ],
};

/// Descriptor for `CMD`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cMDDescriptor = $convert.base64Decode(
    'CgNDTUQSCAoETk9ORRAAEgsKB0dfSGVhcnQQARINCglDX0dldFRpbWUQAhINCglTX1N5c1RpbW'
    'UQAxIJCgVTX0VychAEEgoKBlNfVGlwcxAFEggKBFNfR00QBhISCg1TU19Vc2VyVmVyaWZ5EOgH'
    'EgoKBkNfUm9sZRBnEgoKBlNfUm9sZRBoEg8KC0NfVXBsb2FkVVJMEG8SDwoLU19VcGxvYWRVUk'
    'wQcBINCglDX01lZGlhSWQQcRINCglTX01lZGlhSWQQchIQCgxDX0NyZWF0ZVJvbGUQeRIQCgxT'
    'X0NyZWF0ZVJvbGUQehIQCgxHX1JlbW92ZVJvbGUQexIQCgxDX1VwZGF0ZVJvbGUQfBIQCgxTX1'
    'VwZGF0ZVJvbGUQfRIZChVTX1VwZGF0ZVJvbGVCcm9hZGNhc3QQfhIQCgxDX1JvbGVPbmxpbmUQ'
    'fxIRCgxTX1JvbGVPbmxpbmUQgAESDQoIQ19SZUxpbmsQgwESDwoKQ19FeGl0R2FtZRCEARISCg'
    '1HX1N3aXRjaFNjZW5lEMgBEhQKD0NfRW50ZXJDb21wbGV0ZRDJARIQCgtTX1N5bmNSb3VuZBDK'
    'ARIPCgpTX1N5bmNBdHRyEMsBEhAKC1NfU3luY0F0dHJzEMwBEhQKD1NfU3luY011bHRpQXR0ch'
    'DNARIVChBTX1N5bmNNdWx0aUF0dHJzEM4BEg8KClNfU3luY1JvbGUQ0QESDQoIQ19Ub1pvbmUQ'
    '8AESEgoNQ19FbmZvcmNlWm9uZRDxARIPCgpTX1N5bmNab25lEPIBEhIKDVNfRW5mb3JjZVpvbm'
    'UQ8wESDwoKQ19TdG9wTW92ZRD1ARIOCglDX0FuaW1hdGUQ9gESDAoHQ19TdGFnZRD3ARIOCglT'
    'X0FkZFJvbGUQ+gESEAoLU19SZW1vdmVPYmoQ+wESEQoMU19SZW1vdmVPYmpzEPwBEgwKB0NfU3'
    'RhdGUQhAISDAoHU19TdGF0ZRCFAhIRCgxDX1RvU2VhdEluZm8QmAISEwoOU19TeW5jU2VhdElu'
    'Zm8QmQISDwoKQ19Hb1RvUm9vbRCsAhIPCgpTX0dvVG9Sb29tEK0CEhgKE0NfUm9vbUVudGVyQ2'
    '9tcGxldGUQ0A8SEwoOU19TeW5jUm9vbUluZm8Q0Q8SEgoNQ19DcmVhdGVTY2VuZRC0EBISCg1T'
    'X0NyZWF0ZVNjZW5lELUQEhEKDENfQ2xvc2VTY2VuZRC3EBIRCgxTX0Nsb3NlU2NlbmUQuBASEQ'
    'oMQ19PbmxpbmVMaXN0EL4QEhEKDFNfT25saW5lTGlzdBC/EBIQCgtDX0pvaW5TY2VuZRDAEBIQ'
    'CgtTX0pvaW5TY2VuZRDBEBIPCgpDX091dFNjZW5lEMIQEg8KClNfT3V0U2NlbmUQwxASDQoIQ1'
    '9Hb0JhY2sQxBASDwoKQ19NaWtlTGlzdBDIEBIPCgpTX01pa2VMaXN0EMkQEg0KCENfVXBNaWtl'
    'EMoQEg0KCFNfVXBNaWtlEMsQEg4KCUNfT3V0TWlrZRDMEBIOCglTX091dE1pa2UQzRASDgoJQ1'
    '9CYW5NaWtlEM4QEg4KCVNfQmFuTWlrZRDPEBITCg5DX0FjY01pa2VDbGVhchDSEBITCg5TX0Fj'
    'Y01pa2VDbGVhchDTEBIXChJDX1NldE5vdGljZU1lc3NhZ2UQ3BASFwoSU19TZXROb3RpY2VNZX'
    'NzYWdlEN0QEhcKEkNfU2V0QWRtaW5pc3RyYXRvchDoEBIXChJTX1NldEFkbWluaXN0cmF0b3IQ'
    '6RASDwoKQ19TZXRCbGFjaxDyEBIPCgpTX1NldEJsYWNrEPMQEhIKDUNfQ2hhdE1lc3NhZ2UQhB'
    'ESEgoNU19DaGF0TWVzc2FnZRCFERIOCglDX0JhbkNoYXQQlBESDgoJU19CYW5DaGF0EJUREhkK'
    'FFNfTGl2ZVN0YXJ0QnJvYWRjYXN0EJgREhgKE1NfTGl2ZVN0b3BCcm9hZGNhc3QQmRESFAoPU1'
    '9Kb2luQnJvYWRjYXN0EKIREhUKEFNfTGVhdmVCcm9hZGNhc3QQoxESFgoRU19VcE1pa2VCcm9h'
    'ZGNhc3QQrBESGAoTU19Eb3duTWlrZUJyb2FkY2FzdBCtERIaChVTX0ludml0ZU1pa2VCcm9hZG'
    'Nhc3QQrhESGQoUU19DbG9zZU1pa2VCcm9hZGNhc3QQrxESFAoPU19PcGVuQnJvYWRjYXN0ELAR'
    'EhsKFlNfQXBwbHlVcE1pa2VCcm9hZGNhc3QQsRESHAoXU19SZWZ1c2VVcE1pa2VCcm9hZGNhc3'
    'QQshESFwoSU19CYW5NaWtlQnJvYWRjYXN0ELMREhcKElNfQWNjTWlrZUJyb2FkY2FzdBC2ERIW'
    'ChFTX05vdGljZUJyb2FkY2FzdBDAERIVChBTX0JsYWNrQnJvYWRjYXN0EMoREhsKFlNfQ2hhdE'
    '1lc3NhZ2VCcm9hZGNhc3QQ3hESFwoSU19CYW5DaGF0QnJvYWRjYXN0EN8REhwKF1NfTWlrZVNw'
    'ZWFraW5nQnJvYWRjYXN0EOAREh0KGFNfQWRtaW5pc3RyYXRvckJyb2FkY2FzdBDoERIiCh1TX0'
    'xpdmVTdG9wU2V0dGxlbWVudEJyb2FkY2FzdBDpERIYChNTX0xpdmVMaWtlQnJvYWRjYXN0EOoR'
    'EhoKFVNfQmFja2dyb3VuZEJyb2FkY2FzdBDrERIgChtTX1dvcmxkQ2hhdE1lc3NhZ2VCcm9hZG'
    'Nhc3QQ7BESFQoQQ19HaXZlR2lmdEJ5Um9vbRCcGBIVChBTX0dpdmVHaWZ0QnlSb29tEJ0YEhIK'
    'DVNfVXBkYXRlTGV2ZWwQnhgSFwoSU19VcGRhdGVDaGFybUxldmVsEJ8YEg8KClNfR2lmdFBsYX'
    'kQoBgSFQoQU19GbG9hdGluZ1NjcmVlbhChGBIYChNDX0dpdmVHaWZ0QnlEeW5hbWljEKIYEhgK'
    'E1NfR2l2ZUdpZnRCeUR5bmFtaWMQoxgSEwoOQ19HaXZlR2lmdEJ5SW0QpRgSEwoOU19HaXZlR2'
    'lmdEJ5SW0QphgSEwoOU19Nb3JlR2lmdFBsYXkQpxgSHQoYU19Nb3JlR2lmdEZsb2F0aW5nU2Ny'
    'ZWVuEKgYEg8KClNfQmxpbmRCb3gQqRgSGQoUQ19HaXZlR2lmdEJ5T25lQ2xpY2sQqhgSGQoUU1'
    '9HaXZlR2lmdEJ5T25lQ2xpY2sQqxgSEQoMU19MdWNrU2NyZWVuEKwYEhAKC1NfQWxsU2NyZWVu'
    'EK0YEh0KGENfU2F2ZVVzZXJDdXJyZW50RHJlc3NVcBCEIBIdChhTX1NhdmVVc2VyQ3VycmVudE'
    'RyZXNzVXAQhSASFAoPU19VcGRhdGVEcmVzc1VwEIYgEioKJUNfVXNlUHJvZHVjdEFuZFNhdmVV'
    'c2VyQ3VycmVudERyZXNzVXAQhyASKgolU19Vc2VQcm9kdWN0QW5kU2F2ZVVzZXJDdXJyZW50RH'
    'Jlc3NVcBCIIBIYChNTX1VwZGF0ZURlc2lnbmF0aW9uEIkgEhgKE0NfQ2hhbmdlRGVzaWduYXRp'
    'b24QiiASGAoTU19DaGFuZ2VEZXNpZ25hdGlvbhCLIBIXChJDX1F1ZXJ5RGVzaWduYXRpb24QjC'
    'ASFwoSU19RdWVyeURlc2lnbmF0aW9uEI0gEhMKDlNfQmxpbmRCb3hJdGVtEI4gEhgKE1NfQnVs'
    'bGV0aW5Ccm9hZGNhc3QQiCcSDAoHQ19Sb2JvdBCFNBIMCgdTX1JvYm90EIY0EgsKBkNfVGVzdB'
    'CKNBILCgZTX1Rlc3QQizQSDAoHQ19EZWJ1ZxCMNBIMCgdTX0RlYnVnEI00Eg4KCUNfT3B0VGVz'
    'dBCONBIOCglTX09wdFRlc3QQjzQSDQoIQ19WZXJpZnkQkE4SCwoGQ19FeGl0EJFOEg4KCUdfVU'
    'ZIZWFydBCSThIPCgpDX1VGUmVMaW5rEJNOEg8KCkZfR2lmdFNob3cQ+FUSEwoOQ19Db250cm9s'
    'QXBwVUkQ+VUSEwoORl9Db250cm9sQXBwVUkQ+lUSEQoMQ19Hb0F3YXlSb29tEOBdEhEKDFNfR2'
    '9Bd2F5Um9vbRDhXRIWChFDX0luRnJlZU1pa2VzQXJlYRDiXRIWChFTX0luRnJlZU1pa2VzQXJl'
    'YRDjXRIXChJDX091dEZyZWVNaWtlc0FyZWEQ5l0SFwoSU19PdXRGcmVlTWlrZXNBcmVhEOddEh'
    'IKDUNfUGxhemFUb1Jvb20Q5F0SEgoNU19QbGF6YVRvUm9vbRDlXRISCg1DX1B1c2hQcmVsb2Fk'
    'EPRdEhIKDVNfUHVzaFByZWxvYWQQ9V0SEwoOU19DYW1lcmFTd2l0Y2gQ/l0SEAoKQ19QS0ludm'
    'l0ZRChnAESEAoKU19QS0ludml0ZRCinAESEAoKQ19QS0FjY2VwdBCjnAESFgoQU19QS0ludml0'
    'ZVJlc3VsdBCknAESEgoMQ19QS1Jvb21MaXN0EKWcARISCgxTX1BLUm9vbUxpc3QQppwBEhUKD0'
    'NfUEtTY2VuZUxvYWRlZBCqnAESEgoMU19QS0dhbWVJbmZvEKucARITCg1TX1BLVXNlckVudGVy'
    'EKycARIVCg9DX1BLQmF0dGxlUmVhZHkQv5wBEhMKDVNfUEtTeW5jUm9sZXMQwJwBEg4KCENfUE'
    'tNb3ZlEMKcARIOCghDX1BLU3RvcBDDnAESGAoSU19QS1N5bmNSb2xlQXR0c0xGEMScARIYChJT'
    'X1BLU3luY1JvbGVBdHRzSEYQxZwBEhQKDlNfUEtTY2VuZVRveGljEMacARITCg1TX1BLU2Nlbm'
    'VHaWZ0EMecARITCg1TX1BLQmF0dGxlRW5kENKcARISCgxDX1BLQ29udGludWUQ05wBEhIKDFNf'
    'UEtDb250aW51ZRDUnAESDAoGQ19Nb3ZlEOmOBhIMCgZTX01vdmUQ6o4GEg4KCFNfRGlhbG9nEN'
    'HoDA==');

