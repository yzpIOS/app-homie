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
    {'1': 'C_SaveUserCurrentDressUp', '2': 4100},
    {'1': 'S_SaveUserCurrentDressUp', '2': 4101},
    {'1': 'S_UpdateDressUp', '2': 4102},
    {'1': 'C_UseProductAndSaveUserCurrentDressUp', '2': 4103},
    {'1': 'S_UseProductAndSaveUserCurrentDressUp', '2': 4104},
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
    {'1': 'C_PKInvite', '2': 13000},
    {'1': 'S_PKInvite', '2': 13001},
    {'1': 'C_PKAccept', '2': 13002},
    {'1': 'S_PKInviteResult', '2': 13004},
    {'1': 'C_PKSceneLoaded', '2': 13010},
    {'1': 'S_PKGameInfo', '2': 13011},
    {'1': 'S_PKUserEnter', '2': 13012},
    {'1': 'C_PKBattleReady', '2': 13031},
    {'1': 'S_PKSyncRoles', '2': 13032},
    {'1': 'C_PKMove', '2': 13034},
    {'1': 'C_PKStop', '2': 13035},
    {'1': 'S_PKSyncRoleAttributes', '2': 13036},
    {'1': 'S_PKSyncSceneAttributes', '2': 13037},
    {'1': 'S_PKBattleEnd', '2': 13038},
    {'1': 'C_PKContinue', '2': 13050},
    {'1': 'S_PKContinue', '2': 13051},
    {'1': 'C_PickBuffGift', '2': 13052},
    {'1': 'S_PickBuffGift', '2': 13053},
  ],
};

/// Descriptor for `CMD`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cMDDescriptor = $convert.base64Decode(
    'CgNDTUQSCAoETk9ORRAAEgsKB0dfSGVhcnQQARINCglDX0dldFRpbWUQAhINCglTX1N5c1RpbW'
    'UQAxIJCgVTX0VychAEEgoKBlNfVGlwcxAFEggKBFNfR00QBhISCg1TU19Vc2VyVmVyaWZ5EOgH'
    'EgoKBkNfUm9sZRBnEgoKBlNfUm9sZRBoEg8KC0NfVXBsb2FkVVJMEG8SDwoLU19VcGxvYWRVUk'
    'wQcBINCglDX01lZGlhSWQQcRINCglTX01lZGlhSWQQchIQCgxDX0NyZWF0ZVJvbGUQeRIQCgxT'
    'X0NyZWF0ZVJvbGUQehIQCgxHX1JlbW92ZVJvbGUQexIQCgxDX1VwZGF0ZVJvbGUQfBIQCgxTX1'
    'VwZGF0ZVJvbGUQfRIZChVTX1VwZGF0ZVJvbGVCcm9hZGNhc3QQfhINCghDX1JlTGluaxCDARIP'
    'CgpDX0V4aXRHYW1lEIQBEhIKDUdfU3dpdGNoU2NlbmUQyAESFAoPQ19FbnRlckNvbXBsZXRlEM'
    'kBEhAKC1NfU3luY1JvdW5kEMoBEg8KClNfU3luY0F0dHIQywESEAoLU19TeW5jQXR0cnMQzAES'
    'FAoPU19TeW5jTXVsdGlBdHRyEM0BEhUKEFNfU3luY011bHRpQXR0cnMQzgESEQoMQ19Sb2xlRG'
    'V0YWlsEM8BEhEKDFNfUm9sZURldGFpbBDQARIPCgpTX1N5bmNSb2xlENEBEg0KCENfVG9ab25l'
    'EPABEhIKDUNfRW5mb3JjZVpvbmUQ8QESDwoKU19TeW5jWm9uZRDyARISCg1TX0VuZm9yY2Vab2'
    '5lEPMBEg8KCkNfU3RvcE1vdmUQ9QESDgoJQ19BbmltYXRlEPYBEgwKB0NfU3RhZ2UQ9wESDgoJ'
    'U19BZGRSb2xlEPoBEhAKC1NfUmVtb3ZlT2JqEPsBEhEKDFNfUmVtb3ZlT2JqcxD8ARIMCgdDX1'
    'N0YXRlEIQCEgwKB1NfU3RhdGUQhQISEQoMQ19Ub1NlYXRJbmZvEJgCEhMKDlNfU3luY1NlYXRJ'
    'bmZvEJkCEg8KCkNfR29Ub1Jvb20QrAISDwoKU19Hb1RvUm9vbRCtAhIYChNDX1Jvb21FbnRlck'
    'NvbXBsZXRlENAPEhMKDlNfU3luY1Jvb21JbmZvENEPEhIKDUNfQ3JlYXRlU2NlbmUQtBASEgoN'
    'U19DcmVhdGVTY2VuZRC1EBIRCgxDX0Nsb3NlU2NlbmUQtxASEQoMU19DbG9zZVNjZW5lELgQEh'
    'AKC0NfSm9pblNjZW5lEMAQEhAKC1NfSm9pblNjZW5lEMEQEg8KCkNfT3V0U2NlbmUQwhASDwoK'
    'U19PdXRTY2VuZRDDEBINCghDX0dvQmFjaxDEEBIPCgpDX01pa2VMaXN0EMgQEg8KClNfTWlrZU'
    'xpc3QQyRASDQoIQ19VcE1pa2UQyhASDQoIU19VcE1pa2UQyxASDgoJQ19PdXRNaWtlEMwQEg4K'
    'CVNfT3V0TWlrZRDNEBIOCglDX0Jhbk1pa2UQzhASDgoJU19CYW5NaWtlEM8QEhMKDkNfQWNjTW'
    'lrZUNsZWFyENIQEhMKDlNfQWNjTWlrZUNsZWFyENMQEhcKEkNfU2V0Tm90aWNlTWVzc2FnZRDc'
    'EBIXChJTX1NldE5vdGljZU1lc3NhZ2UQ3RASFwoSQ19TZXRBZG1pbmlzdHJhdG9yEOgQEhcKEl'
    'NfU2V0QWRtaW5pc3RyYXRvchDpEBIPCgpDX1NldEJsYWNrEPIQEg8KClNfU2V0QmxhY2sQ8xAS'
    'EgoNQ19DaGF0TWVzc2FnZRCEERISCg1TX0NoYXRNZXNzYWdlEIUREg4KCUNfQmFuQ2hhdBCUER'
    'IOCglTX0JhbkNoYXQQlRESGQoUU19MaXZlU3RhcnRCcm9hZGNhc3QQmBESGAoTU19MaXZlU3Rv'
    'cEJyb2FkY2FzdBCZERIUCg9TX0pvaW5Ccm9hZGNhc3QQohESFQoQU19MZWF2ZUJyb2FkY2FzdB'
    'CjERIWChFTX1VwTWlrZUJyb2FkY2FzdBCsERIYChNTX0Rvd25NaWtlQnJvYWRjYXN0EK0REhoK'
    'FVNfSW52aXRlTWlrZUJyb2FkY2FzdBCuERIZChRTX0Nsb3NlTWlrZUJyb2FkY2FzdBCvERIUCg'
    '9TX09wZW5Ccm9hZGNhc3QQsBESGwoWU19BcHBseVVwTWlrZUJyb2FkY2FzdBCxERIcChdTX1Jl'
    'ZnVzZVVwTWlrZUJyb2FkY2FzdBCyERIXChJTX0Jhbk1pa2VCcm9hZGNhc3QQsxESFwoSU19BY2'
    'NNaWtlQnJvYWRjYXN0ELYREhYKEVNfTm90aWNlQnJvYWRjYXN0EMAREhUKEFNfQmxhY2tCcm9h'
    'ZGNhc3QQyhESGwoWU19DaGF0TWVzc2FnZUJyb2FkY2FzdBDeERIXChJTX0JhbkNoYXRCcm9hZG'
    'Nhc3QQ3xESHQoYU19BZG1pbmlzdHJhdG9yQnJvYWRjYXN0EOgREhUKEENfR2l2ZUdpZnRCeVJv'
    'b20QnBgSFQoQU19HaXZlR2lmdEJ5Um9vbRCdGBISCg1TX1VwZGF0ZUxldmVsEJ4YEhcKElNfVX'
    'BkYXRlQ2hhcm1MZXZlbBCfGBIPCgpTX0dpZnRQbGF5EKAYEhUKEFNfRmxvYXRpbmdTY3JlZW4Q'
    'oRgSGAoTQ19HaXZlR2lmdEJ5RHluYW1pYxCiGBIYChNTX0dpdmVHaWZ0QnlEeW5hbWljEKMYEh'
    'MKDkNfR2l2ZUdpZnRCeUltEKUYEhMKDlNfR2l2ZUdpZnRCeUltEKYYEh0KGENfU2F2ZVVzZXJD'
    'dXJyZW50RHJlc3NVcBCEIBIdChhTX1NhdmVVc2VyQ3VycmVudERyZXNzVXAQhSASFAoPU19VcG'
    'RhdGVEcmVzc1VwEIYgEioKJUNfVXNlUHJvZHVjdEFuZFNhdmVVc2VyQ3VycmVudERyZXNzVXAQ'
    'hyASKgolU19Vc2VQcm9kdWN0QW5kU2F2ZVVzZXJDdXJyZW50RHJlc3NVcBCIIBIMCgdDX1JvYm'
    '90EIU0EgwKB1NfUm9ib3QQhjQSCwoGQ19UZXN0EIo0EgsKBlNfVGVzdBCLNBIMCgdDX0RlYnVn'
    'EIw0EgwKB1NfRGVidWcQjTQSDgoJQ19PcHRUZXN0EI40Eg4KCVNfT3B0VGVzdBCPNBINCghDX1'
    'ZlcmlmeRCQThILCgZDX0V4aXQQkU4SDgoJR19VRkhlYXJ0EJJOEg8KCkNfVUZSZUxpbmsQk04S'
    'DwoKRl9HaWZ0U2hvdxD4VRIRCgxDX0dvQXdheVJvb20Q4F0SEQoMU19Hb0F3YXlSb29tEOFdEh'
    'YKEUNfSW5GcmVlTWlrZXNBcmVhEOJdEhYKEVNfSW5GcmVlTWlrZXNBcmVhEONdEhcKEkNfT3V0'
    'RnJlZU1pa2VzQXJlYRDmXRIXChJTX091dEZyZWVNaWtlc0FyZWEQ510SEgoNQ19QbGF6YVRvUm'
    '9vbRDkXRISCg1TX1BsYXphVG9Sb29tEOVdEhIKDUNfUHVzaFByZWxvYWQQ9F0SEgoNU19QdXNo'
    'UHJlbG9hZBD1XRITCg5TX0NhbWVyYVN3aXRjaBD+XRIPCgpDX1BLSW52aXRlEMhlEg8KClNfUE'
    'tJbnZpdGUQyWUSDwoKQ19QS0FjY2VwdBDKZRIVChBTX1BLSW52aXRlUmVzdWx0EMxlEhQKD0Nf'
    'UEtTY2VuZUxvYWRlZBDSZRIRCgxTX1BLR2FtZUluZm8Q02USEgoNU19QS1VzZXJFbnRlchDUZR'
    'IUCg9DX1BLQmF0dGxlUmVhZHkQ52USEgoNU19QS1N5bmNSb2xlcxDoZRINCghDX1BLTW92ZRDq'
    'ZRINCghDX1BLU3RvcBDrZRIbChZTX1BLU3luY1JvbGVBdHRyaWJ1dGVzEOxlEhwKF1NfUEtTeW'
    '5jU2NlbmVBdHRyaWJ1dGVzEO1lEhIKDVNfUEtCYXR0bGVFbmQQ7mUSEQoMQ19QS0NvbnRpbnVl'
    'EPplEhEKDFNfUEtDb250aW51ZRD7ZRITCg5DX1BpY2tCdWZmR2lmdBD8ZRITCg5TX1BpY2tCdW'
    'ZmR2lmdBD9ZQ==');

