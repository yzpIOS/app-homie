//
//  Generated code. Do not modify.
//  source: CMD.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
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
    {'1': 'C_RoleDetail', '2': 207},
    {'1': 'S_RoleDetail', '2': 208},
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
    {'1': 'S_AdministratorBroadcast', '2': 2280},
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
    {'1': 'C_SaveUserCurrentDressUp', '2': 4100},
    {'1': 'S_SaveUserCurrentDressUp', '2': 4101},
    {'1': 'S_UpdateDressUp', '2': 4102},
    {'1': 'C_UseProductAndSaveUserCurrentDressUp', '2': 4103},
    {'1': 'S_UseProductAndSaveUserCurrentDressUp', '2': 4104},
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
    'DNARIVChBTX1N5bmNNdWx0aUF0dHJzEM4BEhEKDENfUm9sZURldGFpbBDPARIRCgxTX1JvbGVE'
    'ZXRhaWwQ0AESDwoKU19TeW5jUm9sZRDRARINCghDX1RvWm9uZRDwARISCg1DX0VuZm9yY2Vab2'
    '5lEPEBEg8KClNfU3luY1pvbmUQ8gESEgoNU19FbmZvcmNlWm9uZRDzARIPCgpDX1N0b3BNb3Zl'
    'EPUBEg4KCUNfQW5pbWF0ZRD2ARIMCgdDX1N0YWdlEPcBEg4KCVNfQWRkUm9sZRD6ARIQCgtTX1'
    'JlbW92ZU9iahD7ARIRCgxTX1JlbW92ZU9ianMQ/AESDAoHQ19TdGF0ZRCEAhIMCgdTX1N0YXRl'
    'EIUCEhEKDENfVG9TZWF0SW5mbxCYAhITCg5TX1N5bmNTZWF0SW5mbxCZAhIPCgpDX0dvVG9Sb2'
    '9tEKwCEg8KClNfR29Ub1Jvb20QrQISGAoTQ19Sb29tRW50ZXJDb21wbGV0ZRDQDxITCg5TX1N5'
    'bmNSb29tSW5mbxDRDxISCg1DX0NyZWF0ZVNjZW5lELQQEhIKDVNfQ3JlYXRlU2NlbmUQtRASEQ'
    'oMQ19DbG9zZVNjZW5lELcQEhEKDFNfQ2xvc2VTY2VuZRC4EBIRCgxDX09ubGluZUxpc3QQvhAS'
    'EQoMU19PbmxpbmVMaXN0EL8QEhAKC0NfSm9pblNjZW5lEMAQEhAKC1NfSm9pblNjZW5lEMEQEg'
    '8KCkNfT3V0U2NlbmUQwhASDwoKU19PdXRTY2VuZRDDEBINCghDX0dvQmFjaxDEEBIPCgpDX01p'
    'a2VMaXN0EMgQEg8KClNfTWlrZUxpc3QQyRASDQoIQ19VcE1pa2UQyhASDQoIU19VcE1pa2UQyx'
    'ASDgoJQ19PdXRNaWtlEMwQEg4KCVNfT3V0TWlrZRDNEBIOCglDX0Jhbk1pa2UQzhASDgoJU19C'
    'YW5NaWtlEM8QEhMKDkNfQWNjTWlrZUNsZWFyENIQEhMKDlNfQWNjTWlrZUNsZWFyENMQEhcKEk'
    'NfU2V0Tm90aWNlTWVzc2FnZRDcEBIXChJTX1NldE5vdGljZU1lc3NhZ2UQ3RASFwoSQ19TZXRB'
    'ZG1pbmlzdHJhdG9yEOgQEhcKElNfU2V0QWRtaW5pc3RyYXRvchDpEBIPCgpDX1NldEJsYWNrEP'
    'IQEg8KClNfU2V0QmxhY2sQ8xASEgoNQ19DaGF0TWVzc2FnZRCEERISCg1TX0NoYXRNZXNzYWdl'
    'EIUREg4KCUNfQmFuQ2hhdBCUERIOCglTX0JhbkNoYXQQlRESGQoUU19MaXZlU3RhcnRCcm9hZG'
    'Nhc3QQmBESGAoTU19MaXZlU3RvcEJyb2FkY2FzdBCZERIUCg9TX0pvaW5Ccm9hZGNhc3QQohES'
    'FQoQU19MZWF2ZUJyb2FkY2FzdBCjERIWChFTX1VwTWlrZUJyb2FkY2FzdBCsERIYChNTX0Rvd2'
    '5NaWtlQnJvYWRjYXN0EK0REhoKFVNfSW52aXRlTWlrZUJyb2FkY2FzdBCuERIZChRTX0Nsb3Nl'
    'TWlrZUJyb2FkY2FzdBCvERIUCg9TX09wZW5Ccm9hZGNhc3QQsBESGwoWU19BcHBseVVwTWlrZU'
    'Jyb2FkY2FzdBCxERIcChdTX1JlZnVzZVVwTWlrZUJyb2FkY2FzdBCyERIXChJTX0Jhbk1pa2VC'
    'cm9hZGNhc3QQsxESFwoSU19BY2NNaWtlQnJvYWRjYXN0ELYREhYKEVNfTm90aWNlQnJvYWRjYX'
    'N0EMAREhUKEFNfQmxhY2tCcm9hZGNhc3QQyhESGwoWU19DaGF0TWVzc2FnZUJyb2FkY2FzdBDe'
    'ERIXChJTX0JhbkNoYXRCcm9hZGNhc3QQ3xESHQoYU19BZG1pbmlzdHJhdG9yQnJvYWRjYXN0EO'
    'gREhUKEENfR2l2ZUdpZnRCeVJvb20QnBgSFQoQU19HaXZlR2lmdEJ5Um9vbRCdGBISCg1TX1Vw'
    'ZGF0ZUxldmVsEJ4YEhcKElNfVXBkYXRlQ2hhcm1MZXZlbBCfGBIPCgpTX0dpZnRQbGF5EKAYEh'
    'UKEFNfRmxvYXRpbmdTY3JlZW4QoRgSGAoTQ19HaXZlR2lmdEJ5RHluYW1pYxCiGBIYChNTX0dp'
    'dmVHaWZ0QnlEeW5hbWljEKMYEhMKDkNfR2l2ZUdpZnRCeUltEKUYEhMKDlNfR2l2ZUdpZnRCeU'
    'ltEKYYEhMKDlNfTW9yZUdpZnRQbGF5EKcYEh0KGFNfTW9yZUdpZnRGbG9hdGluZ1NjcmVlbhCo'
    'GBIdChhDX1NhdmVVc2VyQ3VycmVudERyZXNzVXAQhCASHQoYU19TYXZlVXNlckN1cnJlbnREcm'
    'Vzc1VwEIUgEhQKD1NfVXBkYXRlRHJlc3NVcBCGIBIqCiVDX1VzZVByb2R1Y3RBbmRTYXZlVXNl'
    'ckN1cnJlbnREcmVzc1VwEIcgEioKJVNfVXNlUHJvZHVjdEFuZFNhdmVVc2VyQ3VycmVudERyZX'
    'NzVXAQiCASGAoTU19CdWxsZXRpbkJyb2FkY2FzdBCIJxIMCgdDX1JvYm90EIU0EgwKB1NfUm9i'
    'b3QQhjQSCwoGQ19UZXN0EIo0EgsKBlNfVGVzdBCLNBIMCgdDX0RlYnVnEIw0EgwKB1NfRGVidW'
    'cQjTQSDgoJQ19PcHRUZXN0EI40Eg4KCVNfT3B0VGVzdBCPNBINCghDX1ZlcmlmeRCQThILCgZD'
    'X0V4aXQQkU4SDgoJR19VRkhlYXJ0EJJOEg8KCkNfVUZSZUxpbmsQk04SDwoKRl9HaWZ0U2hvdx'
    'D4VRITCg5DX0NvbnRyb2xBcHBVSRD5VRITCg5GX0NvbnRyb2xBcHBVSRD6VRIRCgxDX0dvQXdh'
    'eVJvb20Q4F0SEQoMU19Hb0F3YXlSb29tEOFdEhYKEUNfSW5GcmVlTWlrZXNBcmVhEOJdEhYKEV'
    'NfSW5GcmVlTWlrZXNBcmVhEONdEhcKEkNfT3V0RnJlZU1pa2VzQXJlYRDmXRIXChJTX091dEZy'
    'ZWVNaWtlc0FyZWEQ510SEgoNQ19QbGF6YVRvUm9vbRDkXRISCg1TX1BsYXphVG9Sb29tEOVdEh'
    'IKDUNfUHVzaFByZWxvYWQQ9F0SEgoNU19QdXNoUHJlbG9hZBD1XRITCg5TX0NhbWVyYVN3aXRj'
    'aBD+XRIQCgpDX1BLSW52aXRlEKGcARIQCgpTX1BLSW52aXRlEKKcARIQCgpDX1BLQWNjZXB0EK'
    'OcARIWChBTX1BLSW52aXRlUmVzdWx0EKScARISCgxDX1BLUm9vbUxpc3QQpZwBEhIKDFNfUEtS'
    'b29tTGlzdBCmnAESFQoPQ19QS1NjZW5lTG9hZGVkEKqcARISCgxTX1BLR2FtZUluZm8Qq5wBEh'
    'MKDVNfUEtVc2VyRW50ZXIQrJwBEhUKD0NfUEtCYXR0bGVSZWFkeRC/nAESEwoNU19QS1N5bmNS'
    'b2xlcxDAnAESDgoIQ19QS01vdmUQwpwBEg4KCENfUEtTdG9wEMOcARIYChJTX1BLU3luY1JvbG'
    'VBdHRzTEYQxJwBEhgKElNfUEtTeW5jUm9sZUF0dHNIRhDFnAESFAoOU19QS1NjZW5lVG94aWMQ'
    'xpwBEhMKDVNfUEtTY2VuZUdpZnQQx5wBEhMKDVNfUEtCYXR0bGVFbmQQ0pwBEhIKDENfUEtDb2'
    '50aW51ZRDTnAESEgoMU19QS0NvbnRpbnVlENScAQ==');

