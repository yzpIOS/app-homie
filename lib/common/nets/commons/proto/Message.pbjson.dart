//
//  Generated code. Do not modify.
//  source: Message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use s_SysTimeDescriptor instead')
const S_SysTime$json = {
  '1': 'S_SysTime',
  '2': [
    {'1': 'time', '3': 1, '4': 1, '5': 3, '10': 'time'},
  ],
};

/// Descriptor for `S_SysTime`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SysTimeDescriptor = $convert.base64Decode(
    'CglTX1N5c1RpbWUSEgoEdGltZRgBIAEoA1IEdGltZQ==');

@$core.Deprecated('Use s_ErrDescriptor instead')
const S_Err$json = {
  '1': 'S_Err',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.com.savvy.proto.ErrorCode', '10': 'code'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `S_Err`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_ErrDescriptor = $convert.base64Decode(
    'CgVTX0VychIuCgRjb2RlGAEgASgOMhouY29tLnNhdnZ5LnByb3RvLkVycm9yQ29kZVIEY29kZR'
    'IYCgdtZXNzYWdlGAIgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use s_TipsDescriptor instead')
const S_Tips$json = {
  '1': 'S_Tips',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.com.savvy.proto.S_Tips.Code', '10': 'code'},
    {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
  ],
  '4': [S_Tips_Code$json],
};

@$core.Deprecated('Use s_TipsDescriptor instead')
const S_Tips_Code$json = {
  '1': 'Code',
  '2': [
    {'1': 'MESSAGE', '2': 0},
    {'1': 'ALERT', '2': 1},
    {'1': 'ROLL', '2': 2},
  ],
};

/// Descriptor for `S_Tips`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_TipsDescriptor = $convert.base64Decode(
    'CgZTX1RpcHMSMAoEY29kZRgBIAEoDjIcLmNvbS5zYXZ2eS5wcm90by5TX1RpcHMuQ29kZVIEY2'
    '9kZRIQCgNtc2cYAiABKAlSA21zZyIoCgRDb2RlEgsKB01FU1NBR0UQABIJCgVBTEVSVBABEggK'
    'BFJPTEwQAg==');

@$core.Deprecated('Use s_GMDescriptor instead')
const S_GM$json = {
  '1': 'S_GM',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'code', '3': 2, '4': 1, '5': 14, '6': '.com.savvy.proto.S_GM.Code', '10': 'code'},
    {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
  ],
  '4': [S_GM_Code$json],
};

@$core.Deprecated('Use s_GMDescriptor instead')
const S_GM_Code$json = {
  '1': 'Code',
  '2': [
    {'1': 'KICK', '2': 0},
    {'1': 'MUTE', '2': 1},
  ],
};

/// Descriptor for `S_GM`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_GMDescriptor = $convert.base64Decode(
    'CgRTX0dNEg4KAmlkGAEgASgDUgJpZBIuCgRjb2RlGAIgASgOMhouY29tLnNhdnZ5LnByb3RvLl'
    'NfR00uQ29kZVIEY29kZRIYCgdjb250ZW50GAMgASgJUgdjb250ZW50IhoKBENvZGUSCAoES0lD'
    'SxAAEggKBE1VVEUQAQ==');

@$core.Deprecated('Use c_RoleDescriptor instead')
const C_Role$json = {
  '1': 'C_Role',
  '2': [
    {'1': 'session', '3': 1, '4': 1, '5': 9, '10': 'session'},
  ],
};

/// Descriptor for `C_Role`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_RoleDescriptor = $convert.base64Decode(
    'CgZDX1JvbGUSGAoHc2Vzc2lvbhgBIAEoCVIHc2Vzc2lvbg==');

@$core.Deprecated('Use s_RoleDescriptor instead')
const S_Role$json = {
  '1': 'S_Role',
  '2': [
    {'1': 'role', '3': 1, '4': 1, '5': 11, '6': '.com.savvy.proto.RoleInfo', '10': 'role'},
    {'1': 'retryToken', '3': 2, '4': 1, '5': 9, '10': 'retryToken'},
    {'1': 'time', '3': 3, '4': 1, '5': 3, '10': 'time'},
    {'1': 'room_id', '3': 5, '4': 1, '5': 3, '10': 'roomId'},
  ],
};

/// Descriptor for `S_Role`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_RoleDescriptor = $convert.base64Decode(
    'CgZTX1JvbGUSLQoEcm9sZRgBIAEoCzIZLmNvbS5zYXZ2eS5wcm90by5Sb2xlSW5mb1IEcm9sZR'
    'IeCgpyZXRyeVRva2VuGAIgASgJUgpyZXRyeVRva2VuEhIKBHRpbWUYAyABKANSBHRpbWUSFwoH'
    'cm9vbV9pZBgFIAEoA1IGcm9vbUlk');

@$core.Deprecated('Use c_UploadURLDescriptor instead')
const C_UploadURL$json = {
  '1': 'C_UploadURL',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 5, '10': 'type'},
  ],
};

/// Descriptor for `C_UploadURL`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_UploadURLDescriptor = $convert.base64Decode(
    'CgtDX1VwbG9hZFVSTBISCgR0eXBlGAEgASgFUgR0eXBl');

@$core.Deprecated('Use s_UploadURLDescriptor instead')
const S_UploadURL$json = {
  '1': 'S_UploadURL',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'file_name', '3': 2, '4': 1, '5': 9, '10': 'fileName'},
  ],
};

/// Descriptor for `S_UploadURL`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_UploadURLDescriptor = $convert.base64Decode(
    'CgtTX1VwbG9hZFVSTBIQCgN1cmwYASABKAlSA3VybBIbCglmaWxlX25hbWUYAiABKAlSCGZpbG'
    'VOYW1l');

@$core.Deprecated('Use c_MediaIdDescriptor instead')
const C_MediaId$json = {
  '1': 'C_MediaId',
  '2': [
    {'1': 'file_name', '3': 1, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'type', '3': 2, '4': 1, '5': 5, '10': 'type'},
    {'1': 'extras', '3': 3, '4': 1, '5': 9, '10': 'extras'},
  ],
};

/// Descriptor for `C_MediaId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_MediaIdDescriptor = $convert.base64Decode(
    'CglDX01lZGlhSWQSGwoJZmlsZV9uYW1lGAEgASgJUghmaWxlTmFtZRISCgR0eXBlGAIgASgFUg'
    'R0eXBlEhYKBmV4dHJhcxgDIAEoCVIGZXh0cmFz');

@$core.Deprecated('Use s_MediaIdDescriptor instead')
const S_MediaId$json = {
  '1': 'S_MediaId',
  '2': [
    {'1': 'mediaId', '3': 1, '4': 1, '5': 3, '10': 'mediaId'},
  ],
};

/// Descriptor for `S_MediaId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_MediaIdDescriptor = $convert.base64Decode(
    'CglTX01lZGlhSWQSGAoHbWVkaWFJZBgBIAEoA1IHbWVkaWFJZA==');

@$core.Deprecated('Use c_CreateRoleDescriptor instead')
const C_CreateRole$json = {
  '1': 'C_CreateRole',
  '2': [
    {'1': 'roleId', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'typeId', '3': 3, '4': 1, '5': 5, '10': 'typeId'},
    {'1': 'mediaId', '3': 4, '4': 1, '5': 3, '10': 'mediaId'},
  ],
};

/// Descriptor for `C_CreateRole`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_CreateRoleDescriptor = $convert.base64Decode(
    'CgxDX0NyZWF0ZVJvbGUSFgoGcm9sZUlkGAEgASgDUgZyb2xlSWQSEgoEbmFtZRgCIAEoCVIEbm'
    'FtZRIWCgZ0eXBlSWQYAyABKAVSBnR5cGVJZBIYCgdtZWRpYUlkGAQgASgDUgdtZWRpYUlk');

@$core.Deprecated('Use s_CreateRoleDescriptor instead')
const S_CreateRole$json = {
  '1': 'S_CreateRole',
  '2': [
    {'1': 'roleId', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
  ],
};

/// Descriptor for `S_CreateRole`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_CreateRoleDescriptor = $convert.base64Decode(
    'CgxTX0NyZWF0ZVJvbGUSFgoGcm9sZUlkGAEgASgDUgZyb2xlSWQ=');

@$core.Deprecated('Use g_RemoveRoleDescriptor instead')
const G_RemoveRole$json = {
  '1': 'G_RemoveRole',
  '2': [
    {'1': 'roleId', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'state', '3': 2, '4': 1, '5': 5, '10': 'state'},
  ],
};

/// Descriptor for `G_RemoveRole`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List g_RemoveRoleDescriptor = $convert.base64Decode(
    'CgxHX1JlbW92ZVJvbGUSFgoGcm9sZUlkGAEgASgDUgZyb2xlSWQSFAoFc3RhdGUYAiABKAVSBX'
    'N0YXRl');

@$core.Deprecated('Use c_ReLinkDescriptor instead')
const C_ReLink$json = {
  '1': 'C_ReLink',
  '2': [
    {'1': 'roleId', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'time', '3': 2, '4': 1, '5': 3, '10': 'time'},
    {'1': 'token', '3': 3, '4': 1, '5': 9, '10': 'token'},
    {'1': 'room_id', '3': 4, '4': 1, '5': 3, '10': 'roomId'},
  ],
};

/// Descriptor for `C_ReLink`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_ReLinkDescriptor = $convert.base64Decode(
    'CghDX1JlTGluaxIWCgZyb2xlSWQYASABKANSBnJvbGVJZBISCgR0aW1lGAIgASgDUgR0aW1lEh'
    'QKBXRva2VuGAMgASgJUgV0b2tlbhIXCgdyb29tX2lkGAQgASgDUgZyb29tSWQ=');

@$core.Deprecated('Use c_RoomEnterCompleteDescriptor instead')
const C_RoomEnterComplete$json = {
  '1': 'C_RoomEnterComplete',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
  ],
};

/// Descriptor for `C_RoomEnterComplete`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_RoomEnterCompleteDescriptor = $convert.base64Decode(
    'ChNDX1Jvb21FbnRlckNvbXBsZXRlEhcKB3Jvb21faWQYASABKANSBnJvb21JZA==');

@$core.Deprecated('Use s_SyncRoomInfoDescriptor instead')
const S_SyncRoomInfo$json = {
  '1': 'S_SyncRoomInfo',
  '2': [
    {'1': 'online_list', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.UserInfo', '10': 'onlineList'},
    {'1': 'mikes', '3': 2, '4': 3, '5': 11, '6': '.com.savvy.proto.MikeInfo', '10': 'mikes'},
    {'1': 'collect_status', '3': 3, '4': 1, '5': 5, '10': 'collectStatus'},
    {'1': 'is_administrator', '3': 4, '4': 1, '5': 5, '10': 'isAdministrator'},
    {'1': 'is_anchor', '3': 5, '4': 1, '5': 5, '10': 'isAnchor'},
    {'1': 'luck_chat_channel', '3': 6, '4': 1, '5': 8, '10': 'luckChatChannel'},
    {'1': 'world_chat_channel', '3': 7, '4': 1, '5': 8, '10': 'worldChatChannel'},
  ],
};

/// Descriptor for `S_SyncRoomInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SyncRoomInfoDescriptor = $convert.base64Decode(
    'Cg5TX1N5bmNSb29tSW5mbxI6CgtvbmxpbmVfbGlzdBgBIAMoCzIZLmNvbS5zYXZ2eS5wcm90by'
    '5Vc2VySW5mb1IKb25saW5lTGlzdBIvCgVtaWtlcxgCIAMoCzIZLmNvbS5zYXZ2eS5wcm90by5N'
    'aWtlSW5mb1IFbWlrZXMSJQoOY29sbGVjdF9zdGF0dXMYAyABKAVSDWNvbGxlY3RTdGF0dXMSKQ'
    'oQaXNfYWRtaW5pc3RyYXRvchgEIAEoBVIPaXNBZG1pbmlzdHJhdG9yEhsKCWlzX2FuY2hvchgF'
    'IAEoBVIIaXNBbmNob3ISKgoRbHVja19jaGF0X2NoYW5uZWwYBiABKAhSD2x1Y2tDaGF0Q2hhbm'
    '5lbBIsChJ3b3JsZF9jaGF0X2NoYW5uZWwYByABKAhSEHdvcmxkQ2hhdENoYW5uZWw=');

@$core.Deprecated('Use s_LiveStartBroadcastDescriptor instead')
const S_LiveStartBroadcast$json = {
  '1': 'S_LiveStartBroadcast',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
  ],
};

/// Descriptor for `S_LiveStartBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_LiveStartBroadcastDescriptor = $convert.base64Decode(
    'ChRTX0xpdmVTdGFydEJyb2FkY2FzdBIXCgdyb29tX2lkGAEgASgDUgZyb29tSWQ=');

@$core.Deprecated('Use s_LiveStopBroadcastDescriptor instead')
const S_LiveStopBroadcast$json = {
  '1': 'S_LiveStopBroadcast',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
  ],
};

/// Descriptor for `S_LiveStopBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_LiveStopBroadcastDescriptor = $convert.base64Decode(
    'ChNTX0xpdmVTdG9wQnJvYWRjYXN0EhcKB3Jvb21faWQYASABKANSBnJvb21JZA==');

@$core.Deprecated('Use s_JoinBroadcastDescriptor instead')
const S_JoinBroadcast$json = {
  '1': 'S_JoinBroadcast',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'uid', '3': 3, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'total', '3': 4, '4': 1, '5': 5, '10': 'total'},
    {'1': 'pk_room_id', '3': 5, '4': 1, '5': 3, '10': 'pkRoomId'},
  ],
};

/// Descriptor for `S_JoinBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_JoinBroadcastDescriptor = $convert.base64Decode(
    'Cg9TX0pvaW5Ccm9hZGNhc3QSFwoHcm9vbV9pZBgBIAEoA1IGcm9vbUlkEhcKB3JvbGVfaWQYAi'
    'ABKANSBnJvbGVJZBIQCgN1aWQYAyABKAlSA3VpZBIUCgV0b3RhbBgEIAEoBVIFdG90YWwSHAoK'
    'cGtfcm9vbV9pZBgFIAEoA1IIcGtSb29tSWQ=');

@$core.Deprecated('Use s_LeaveBroadcastDescriptor instead')
const S_LeaveBroadcast$json = {
  '1': 'S_LeaveBroadcast',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'uid', '3': 3, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'total', '3': 4, '4': 1, '5': 5, '10': 'total'},
  ],
};

/// Descriptor for `S_LeaveBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_LeaveBroadcastDescriptor = $convert.base64Decode(
    'ChBTX0xlYXZlQnJvYWRjYXN0EhcKB3Jvb21faWQYASABKANSBnJvb21JZBIXCgdyb2xlX2lkGA'
    'IgASgDUgZyb2xlSWQSEAoDdWlkGAMgASgJUgN1aWQSFAoFdG90YWwYBCABKAVSBXRvdGFs');

@$core.Deprecated('Use s_UpMikeBroadcastDescriptor instead')
const S_UpMikeBroadcast$json = {
  '1': 'S_UpMikeBroadcast',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'uid', '3': 3, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'mike_no', '3': 4, '4': 1, '5': 9, '10': 'mikeNo'},
    {'1': 'old_mike_no', '3': 5, '4': 1, '5': 9, '10': 'oldMikeNo'},
    {'1': 'mike_id', '3': 6, '4': 1, '5': 3, '10': 'mikeId'},
    {'1': 'number', '3': 7, '4': 1, '5': 5, '10': 'number'},
    {'1': 'role_type', '3': 8, '4': 1, '5': 5, '10': 'roleType'},
    {'1': 'status', '3': 9, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `S_UpMikeBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_UpMikeBroadcastDescriptor = $convert.base64Decode(
    'ChFTX1VwTWlrZUJyb2FkY2FzdBIXCgdyb29tX2lkGAEgASgDUgZyb29tSWQSFwoHcm9sZV9pZB'
    'gCIAEoA1IGcm9sZUlkEhAKA3VpZBgDIAEoCVIDdWlkEhcKB21pa2Vfbm8YBCABKAlSBm1pa2VO'
    'bxIeCgtvbGRfbWlrZV9ubxgFIAEoCVIJb2xkTWlrZU5vEhcKB21pa2VfaWQYBiABKANSBm1pa2'
    'VJZBIWCgZudW1iZXIYByABKAVSBm51bWJlchIbCglyb2xlX3R5cGUYCCABKAVSCHJvbGVUeXBl'
    'EhYKBnN0YXR1cxgJIAEoBVIGc3RhdHVz');

@$core.Deprecated('Use s_DownMikeBroadcastDescriptor instead')
const S_DownMikeBroadcast$json = {
  '1': 'S_DownMikeBroadcast',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'uid', '3': 3, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'mike_no', '3': 4, '4': 1, '5': 9, '10': 'mikeNo'},
    {'1': 'mike_id', '3': 6, '4': 1, '5': 3, '10': 'mikeId'},
  ],
};

/// Descriptor for `S_DownMikeBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_DownMikeBroadcastDescriptor = $convert.base64Decode(
    'ChNTX0Rvd25NaWtlQnJvYWRjYXN0EhcKB3Jvb21faWQYASABKANSBnJvb21JZBIXCgdyb2xlX2'
    'lkGAIgASgDUgZyb2xlSWQSEAoDdWlkGAMgASgJUgN1aWQSFwoHbWlrZV9ubxgEIAEoCVIGbWlr'
    'ZU5vEhcKB21pa2VfaWQYBiABKANSBm1pa2VJZA==');

@$core.Deprecated('Use s_InviteMikeBroadcastDescriptor instead')
const S_InviteMikeBroadcast$json = {
  '1': 'S_InviteMikeBroadcast',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'uid', '3': 3, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'mike_no', '3': 4, '4': 1, '5': 9, '10': 'mikeNo'},
    {'1': 'mike_id', '3': 5, '4': 1, '5': 3, '10': 'mikeId'},
    {'1': 'old_mike_no', '3': 6, '4': 1, '5': 9, '10': 'oldMikeNo'},
  ],
};

/// Descriptor for `S_InviteMikeBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_InviteMikeBroadcastDescriptor = $convert.base64Decode(
    'ChVTX0ludml0ZU1pa2VCcm9hZGNhc3QSFwoHcm9vbV9pZBgBIAEoA1IGcm9vbUlkEhcKB3JvbG'
    'VfaWQYAiABKANSBnJvbGVJZBIQCgN1aWQYAyABKAlSA3VpZBIXCgdtaWtlX25vGAQgASgJUgZt'
    'aWtlTm8SFwoHbWlrZV9pZBgFIAEoA1IGbWlrZUlkEh4KC29sZF9taWtlX25vGAYgASgJUglvbG'
    'RNaWtlTm8=');

@$core.Deprecated('Use s_CloseMikeBroadcastDescriptor instead')
const S_CloseMikeBroadcast$json = {
  '1': 'S_CloseMikeBroadcast',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'uid', '3': 3, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'mike_no', '3': 4, '4': 1, '5': 9, '10': 'mikeNo'},
    {'1': 'mike_id', '3': 5, '4': 1, '5': 3, '10': 'mikeId'},
  ],
};

/// Descriptor for `S_CloseMikeBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_CloseMikeBroadcastDescriptor = $convert.base64Decode(
    'ChRTX0Nsb3NlTWlrZUJyb2FkY2FzdBIXCgdyb29tX2lkGAEgASgDUgZyb29tSWQSFwoHcm9sZV'
    '9pZBgCIAEoA1IGcm9sZUlkEhAKA3VpZBgDIAEoCVIDdWlkEhcKB21pa2Vfbm8YBCABKAlSBm1p'
    'a2VObxIXCgdtaWtlX2lkGAUgASgDUgZtaWtlSWQ=');

@$core.Deprecated('Use s_OpenBroadcastDescriptor instead')
const S_OpenBroadcast$json = {
  '1': 'S_OpenBroadcast',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'uid', '3': 3, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `S_OpenBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_OpenBroadcastDescriptor = $convert.base64Decode(
    'Cg9TX09wZW5Ccm9hZGNhc3QSFwoHcm9vbV9pZBgBIAEoA1IGcm9vbUlkEhcKB3JvbGVfaWQYAi'
    'ABKANSBnJvbGVJZBIQCgN1aWQYAyABKAlSA3VpZA==');

@$core.Deprecated('Use s_ApplyUpMikeBroadcastDescriptor instead')
const S_ApplyUpMikeBroadcast$json = {
  '1': 'S_ApplyUpMikeBroadcast',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'uid', '3': 3, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'mike_no', '3': 4, '4': 1, '5': 9, '10': 'mikeNo'},
  ],
};

/// Descriptor for `S_ApplyUpMikeBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_ApplyUpMikeBroadcastDescriptor = $convert.base64Decode(
    'ChZTX0FwcGx5VXBNaWtlQnJvYWRjYXN0EhcKB3Jvb21faWQYASABKANSBnJvb21JZBIXCgdyb2'
    'xlX2lkGAIgASgDUgZyb2xlSWQSEAoDdWlkGAMgASgJUgN1aWQSFwoHbWlrZV9ubxgEIAEoCVIG'
    'bWlrZU5v');

@$core.Deprecated('Use s_RefuseUpMikeBroadcastDescriptor instead')
const S_RefuseUpMikeBroadcast$json = {
  '1': 'S_RefuseUpMikeBroadcast',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'uid', '3': 3, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'state', '3': 4, '4': 1, '5': 5, '10': 'state'},
  ],
};

/// Descriptor for `S_RefuseUpMikeBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_RefuseUpMikeBroadcastDescriptor = $convert.base64Decode(
    'ChdTX1JlZnVzZVVwTWlrZUJyb2FkY2FzdBIXCgdyb29tX2lkGAEgASgDUgZyb29tSWQSFwoHcm'
    '9sZV9pZBgCIAEoA1IGcm9sZUlkEhAKA3VpZBgDIAEoCVIDdWlkEhQKBXN0YXRlGAQgASgFUgVz'
    'dGF0ZQ==');

@$core.Deprecated('Use s_AccMikeBroadcastDescriptor instead')
const S_AccMikeBroadcast$json = {
  '1': 'S_AccMikeBroadcast',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'mike_id', '3': 2, '4': 1, '5': 3, '10': 'mikeId'},
    {'1': 'mike_no', '3': 3, '4': 1, '5': 9, '10': 'mikeNo'},
    {'1': 'number', '3': 4, '4': 1, '5': 5, '10': 'number'},
    {'1': 'role_id', '3': 5, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'uid', '3': 6, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `S_AccMikeBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_AccMikeBroadcastDescriptor = $convert.base64Decode(
    'ChJTX0FjY01pa2VCcm9hZGNhc3QSFwoHcm9vbV9pZBgBIAEoA1IGcm9vbUlkEhcKB21pa2VfaW'
    'QYAiABKANSBm1pa2VJZBIXCgdtaWtlX25vGAMgASgJUgZtaWtlTm8SFgoGbnVtYmVyGAQgASgF'
    'UgZudW1iZXISFwoHcm9sZV9pZBgFIAEoA1IGcm9sZUlkEhAKA3VpZBgGIAEoCVIDdWlk');

@$core.Deprecated('Use s_BanMikeBroadcastDescriptor instead')
const S_BanMikeBroadcast$json = {
  '1': 'S_BanMikeBroadcast',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'uid', '3': 3, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'mike_no', '3': 4, '4': 1, '5': 9, '10': 'mikeNo'},
    {'1': 'mike_id', '3': 5, '4': 1, '5': 3, '10': 'mikeId'},
    {'1': 'status', '3': 6, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `S_BanMikeBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_BanMikeBroadcastDescriptor = $convert.base64Decode(
    'ChJTX0Jhbk1pa2VCcm9hZGNhc3QSFwoHcm9vbV9pZBgBIAEoA1IGcm9vbUlkEhcKB3JvbGVfaW'
    'QYAiABKANSBnJvbGVJZBIQCgN1aWQYAyABKAlSA3VpZBIXCgdtaWtlX25vGAQgASgJUgZtaWtl'
    'Tm8SFwoHbWlrZV9pZBgFIAEoA1IGbWlrZUlkEhYKBnN0YXR1cxgGIAEoBVIGc3RhdHVz');

@$core.Deprecated('Use s_NoticeBroadcastDescriptor instead')
const S_NoticeBroadcast$json = {
  '1': 'S_NoticeBroadcast',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `S_NoticeBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_NoticeBroadcastDescriptor = $convert.base64Decode(
    'ChFTX05vdGljZUJyb2FkY2FzdBIXCgdyb29tX2lkGAEgASgDUgZyb29tSWQSGAoHbWVzc2FnZR'
    'gCIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use s_BlackBroadcastDescriptor instead')
const S_BlackBroadcast$json = {
  '1': 'S_BlackBroadcast',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'uid', '3': 3, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'operator_role_id', '3': 4, '4': 1, '5': 3, '10': 'operatorRoleId'},
    {'1': 'status', '3': 5, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `S_BlackBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_BlackBroadcastDescriptor = $convert.base64Decode(
    'ChBTX0JsYWNrQnJvYWRjYXN0EhcKB3Jvb21faWQYASABKANSBnJvb21JZBIXCgdyb2xlX2lkGA'
    'IgASgDUgZyb2xlSWQSEAoDdWlkGAMgASgJUgN1aWQSKAoQb3BlcmF0b3Jfcm9sZV9pZBgEIAEo'
    'A1IOb3BlcmF0b3JSb2xlSWQSFgoGc3RhdHVzGAUgASgFUgZzdGF0dXM=');

@$core.Deprecated('Use s_AdministratorBroadcastDescriptor instead')
const S_AdministratorBroadcast$json = {
  '1': 'S_AdministratorBroadcast',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'status', '3': 3, '4': 1, '5': 5, '10': 'status'},
    {'1': 'uid', '3': 4, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `S_AdministratorBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_AdministratorBroadcastDescriptor = $convert.base64Decode(
    'ChhTX0FkbWluaXN0cmF0b3JCcm9hZGNhc3QSFwoHcm9vbV9pZBgBIAEoA1IGcm9vbUlkEhcKB3'
    'JvbGVfaWQYAiABKANSBnJvbGVJZBIWCgZzdGF0dXMYAyABKAVSBnN0YXR1cxIQCgN1aWQYBCAB'
    'KAlSA3VpZA==');

@$core.Deprecated('Use s_LiveStopSettlementBroadcastDescriptor instead')
const S_LiveStopSettlementBroadcast$json = {
  '1': 'S_LiveStopSettlementBroadcast',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'live_times', '3': 2, '4': 1, '5': 5, '10': 'liveTimes'},
    {'1': 'gift_income', '3': 3, '4': 1, '5': 5, '10': 'giftIncome'},
    {'1': 'online_total_num', '3': 4, '4': 1, '5': 5, '10': 'onlineTotalNum'},
    {'1': 'ds_num', '3': 5, '4': 1, '5': 5, '10': 'dsNum'},
    {'1': 'role_id', '3': 6, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'uid', '3': 7, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `S_LiveStopSettlementBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_LiveStopSettlementBroadcastDescriptor = $convert.base64Decode(
    'Ch1TX0xpdmVTdG9wU2V0dGxlbWVudEJyb2FkY2FzdBIXCgdyb29tX2lkGAEgASgDUgZyb29tSW'
    'QSHQoKbGl2ZV90aW1lcxgCIAEoBVIJbGl2ZVRpbWVzEh8KC2dpZnRfaW5jb21lGAMgASgFUgpn'
    'aWZ0SW5jb21lEigKEG9ubGluZV90b3RhbF9udW0YBCABKAVSDm9ubGluZVRvdGFsTnVtEhUKBm'
    'RzX251bRgFIAEoBVIFZHNOdW0SFwoHcm9sZV9pZBgGIAEoA1IGcm9sZUlkEhAKA3VpZBgHIAEo'
    'CVIDdWlk');

@$core.Deprecated('Use s_LiveLikeBroadcastDescriptor instead')
const S_LiveLikeBroadcast$json = {
  '1': 'S_LiveLikeBroadcast',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'count', '3': 2, '4': 1, '5': 5, '10': 'count'},
    {'1': 'total', '3': 3, '4': 1, '5': 3, '10': 'total'},
  ],
};

/// Descriptor for `S_LiveLikeBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_LiveLikeBroadcastDescriptor = $convert.base64Decode(
    'ChNTX0xpdmVMaWtlQnJvYWRjYXN0EhcKB3Jvb21faWQYASABKANSBnJvb21JZBIUCgVjb3VudB'
    'gCIAEoBVIFY291bnQSFAoFdG90YWwYAyABKANSBXRvdGFs');

@$core.Deprecated('Use s_ChatMessageBroadcastDescriptor instead')
const S_ChatMessageBroadcast$json = {
  '1': 'S_ChatMessageBroadcast',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    {'1': 'uid', '3': 4, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `S_ChatMessageBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_ChatMessageBroadcastDescriptor = $convert.base64Decode(
    'ChZTX0NoYXRNZXNzYWdlQnJvYWRjYXN0EhcKB3Jvb21faWQYASABKANSBnJvb21JZBIXCgdyb2'
    'xlX2lkGAIgASgDUgZyb2xlSWQSGAoHbWVzc2FnZRgDIAEoCVIHbWVzc2FnZRIQCgN1aWQYBCAB'
    'KAlSA3VpZA==');

@$core.Deprecated('Use s_WorldChatMessageBroadcastDescriptor instead')
const S_WorldChatMessageBroadcast$json = {
  '1': 'S_WorldChatMessageBroadcast',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.WorldChatMessageItem', '10': 'items'},
  ],
};

/// Descriptor for `S_WorldChatMessageBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_WorldChatMessageBroadcastDescriptor = $convert.base64Decode(
    'ChtTX1dvcmxkQ2hhdE1lc3NhZ2VCcm9hZGNhc3QSOwoFaXRlbXMYASADKAsyJS5jb20uc2F2dn'
    'kucHJvdG8uV29ybGRDaGF0TWVzc2FnZUl0ZW1SBWl0ZW1z');

@$core.Deprecated('Use s_BanChatBroadcastDescriptor instead')
const S_BanChatBroadcast$json = {
  '1': 'S_BanChatBroadcast',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'status', '3': 3, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `S_BanChatBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_BanChatBroadcastDescriptor = $convert.base64Decode(
    'ChJTX0JhbkNoYXRCcm9hZGNhc3QSFwoHcm9vbV9pZBgBIAEoA1IGcm9vbUlkEhcKB3JvbGVfaW'
    'QYAiABKANSBnJvbGVJZBIWCgZzdGF0dXMYAyABKAVSBnN0YXR1cw==');

@$core.Deprecated('Use s_MikeSpeakingBroadcastDescriptor instead')
const S_MikeSpeakingBroadcast$json = {
  '1': 'S_MikeSpeakingBroadcast',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'status', '3': 3, '4': 1, '5': 5, '10': 'status'},
    {'1': 'uid', '3': 4, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `S_MikeSpeakingBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_MikeSpeakingBroadcastDescriptor = $convert.base64Decode(
    'ChdTX01pa2VTcGVha2luZ0Jyb2FkY2FzdBIXCgdyb29tX2lkGAEgASgDUgZyb29tSWQSFwoHcm'
    '9sZV9pZBgCIAEoA1IGcm9sZUlkEhYKBnN0YXR1cxgDIAEoBVIGc3RhdHVzEhAKA3VpZBgEIAEo'
    'CVIDdWlk');

@$core.Deprecated('Use s_BackgroundBroadcastDescriptor instead')
const S_BackgroundBroadcast$json = {
  '1': 'S_BackgroundBroadcast',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'bg_image', '3': 2, '4': 1, '5': 9, '10': 'bgImage'},
  ],
};

/// Descriptor for `S_BackgroundBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_BackgroundBroadcastDescriptor = $convert.base64Decode(
    'ChVTX0JhY2tncm91bmRCcm9hZGNhc3QSFwoHcm9vbV9pZBgBIAEoA1IGcm9vbUlkEhkKCGJnX2'
    'ltYWdlGAIgASgJUgdiZ0ltYWdl');

@$core.Deprecated('Use c_CreateSceneDescriptor instead')
const C_CreateScene$json = {
  '1': 'C_CreateScene',
  '2': [
    {'1': 'scene_id', '3': 1, '4': 1, '5': 5, '10': 'sceneId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'image', '3': 3, '4': 1, '5': 9, '10': 'image'},
    {'1': 'room_password', '3': 4, '4': 1, '5': 9, '10': 'roomPassword'},
    {'1': 'private_status', '3': 5, '4': 1, '5': 5, '10': 'privateStatus'},
    {'1': 'notice_message', '3': 6, '4': 1, '5': 9, '10': 'noticeMessage'},
    {'1': 'max_num', '3': 7, '4': 1, '5': 5, '10': 'maxNum'},
    {'1': 'mike_status', '3': 8, '4': 1, '5': 5, '10': 'mikeStatus'},
  ],
};

/// Descriptor for `C_CreateScene`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_CreateSceneDescriptor = $convert.base64Decode(
    'Cg1DX0NyZWF0ZVNjZW5lEhkKCHNjZW5lX2lkGAEgASgFUgdzY2VuZUlkEhIKBG5hbWUYAiABKA'
    'lSBG5hbWUSFAoFaW1hZ2UYAyABKAlSBWltYWdlEiMKDXJvb21fcGFzc3dvcmQYBCABKAlSDHJv'
    'b21QYXNzd29yZBIlCg5wcml2YXRlX3N0YXR1cxgFIAEoBVINcHJpdmF0ZVN0YXR1cxIlCg5ub3'
    'RpY2VfbWVzc2FnZRgGIAEoCVINbm90aWNlTWVzc2FnZRIXCgdtYXhfbnVtGAcgASgFUgZtYXhO'
    'dW0SHwoLbWlrZV9zdGF0dXMYCCABKAVSCm1pa2VTdGF0dXM=');

@$core.Deprecated('Use s_CreateSceneDescriptor instead')
const S_CreateScene$json = {
  '1': 'S_CreateScene',
  '2': [
    {'1': 'scene_id', '3': 1, '4': 1, '5': 5, '10': 'sceneId'},
    {'1': 'room_id', '3': 2, '4': 1, '5': 3, '10': 'roomId'},
  ],
};

/// Descriptor for `S_CreateScene`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_CreateSceneDescriptor = $convert.base64Decode(
    'Cg1TX0NyZWF0ZVNjZW5lEhkKCHNjZW5lX2lkGAEgASgFUgdzY2VuZUlkEhcKB3Jvb21faWQYAi'
    'ABKANSBnJvb21JZA==');

@$core.Deprecated('Use s_CloseSceneDescriptor instead')
const S_CloseScene$json = {
  '1': 'S_CloseScene',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 11, '6': '.com.savvy.proto.S_Err', '10': 'code'},
  ],
};

/// Descriptor for `S_CloseScene`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_CloseSceneDescriptor = $convert.base64Decode(
    'CgxTX0Nsb3NlU2NlbmUSKgoEY29kZRgBIAEoCzIWLmNvbS5zYXZ2eS5wcm90by5TX0VyclIEY2'
    '9kZQ==');

@$core.Deprecated('Use c_OnlineListDescriptor instead')
const C_OnlineList$json = {
  '1': 'C_OnlineList',
  '2': [
    {'1': 'offset', '3': 1, '4': 1, '5': 3, '10': 'offset'},
    {'1': 'limit', '3': 2, '4': 1, '5': 3, '10': 'limit'},
    {'1': 'room_id_list', '3': 3, '4': 3, '5': 3, '10': 'roomIdList'},
  ],
};

/// Descriptor for `C_OnlineList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_OnlineListDescriptor = $convert.base64Decode(
    'CgxDX09ubGluZUxpc3QSFgoGb2Zmc2V0GAEgASgDUgZvZmZzZXQSFAoFbGltaXQYAiABKANSBW'
    'xpbWl0EiAKDHJvb21faWRfbGlzdBgDIAMoA1IKcm9vbUlkTGlzdA==');

@$core.Deprecated('Use s_OnlineListDescriptor instead')
const S_OnlineList$json = {
  '1': 'S_OnlineList',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.RoomUserInfo', '10': 'items'},
  ],
};

/// Descriptor for `S_OnlineList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_OnlineListDescriptor = $convert.base64Decode(
    'CgxTX09ubGluZUxpc3QSMwoFaXRlbXMYASADKAsyHS5jb20uc2F2dnkucHJvdG8uUm9vbVVzZX'
    'JJbmZvUgVpdGVtcw==');

@$core.Deprecated('Use c_JoinSceneDescriptor instead')
const C_JoinScene$json = {
  '1': 'C_JoinScene',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'room_password', '3': 2, '4': 1, '5': 9, '10': 'roomPassword'},
  ],
};

/// Descriptor for `C_JoinScene`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_JoinSceneDescriptor = $convert.base64Decode(
    'CgtDX0pvaW5TY2VuZRIXCgdyb29tX2lkGAEgASgDUgZyb29tSWQSIwoNcm9vbV9wYXNzd29yZB'
    'gCIAEoCVIMcm9vbVBhc3N3b3Jk');

@$core.Deprecated('Use s_JoinSceneDescriptor instead')
const S_JoinScene$json = {
  '1': 'S_JoinScene',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'code', '3': 2, '4': 1, '5': 14, '6': '.com.savvy.proto.ErrorCode', '10': 'code'},
    {'1': 'pk_room_id', '3': 3, '4': 1, '5': 3, '10': 'pkRoomId'},
  ],
};

/// Descriptor for `S_JoinScene`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_JoinSceneDescriptor = $convert.base64Decode(
    'CgtTX0pvaW5TY2VuZRIXCgdyb29tX2lkGAEgASgDUgZyb29tSWQSLgoEY29kZRgCIAEoDjIaLm'
    'NvbS5zYXZ2eS5wcm90by5FcnJvckNvZGVSBGNvZGUSHAoKcGtfcm9vbV9pZBgDIAEoA1IIcGtS'
    'b29tSWQ=');

@$core.Deprecated('Use c_MikeListDescriptor instead')
const C_MikeList$json = {
  '1': 'C_MikeList',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
  ],
};

/// Descriptor for `C_MikeList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_MikeListDescriptor = $convert.base64Decode(
    'CgpDX01pa2VMaXN0EhcKB3Jvb21faWQYASABKANSBnJvb21JZA==');

@$core.Deprecated('Use s_MikeListDescriptor instead')
const S_MikeList$json = {
  '1': 'S_MikeList',
  '2': [
    {'1': 'mikes', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.MikeInfo', '10': 'mikes'},
  ],
};

/// Descriptor for `S_MikeList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_MikeListDescriptor = $convert.base64Decode(
    'CgpTX01pa2VMaXN0Ei8KBW1pa2VzGAEgAygLMhkuY29tLnNhdnZ5LnByb3RvLk1pa2VJbmZvUg'
    'VtaWtlcw==');

@$core.Deprecated('Use c_UpMikeDescriptor instead')
const C_UpMike$json = {
  '1': 'C_UpMike',
  '2': [
    {'1': 'role_id', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'mike_no', '3': 2, '4': 1, '5': 9, '10': 'mikeNo'},
  ],
};

/// Descriptor for `C_UpMike`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_UpMikeDescriptor = $convert.base64Decode(
    'CghDX1VwTWlrZRIXCgdyb2xlX2lkGAEgASgDUgZyb2xlSWQSFwoHbWlrZV9ubxgCIAEoCVIGbW'
    'lrZU5v');

@$core.Deprecated('Use s_UpMikeDescriptor instead')
const S_UpMike$json = {
  '1': 'S_UpMike',
  '2': [
    {'1': 'mike_id', '3': 1, '4': 1, '5': 3, '10': 'mikeId'},
    {'1': 'status', '3': 2, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `S_UpMike`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_UpMikeDescriptor = $convert.base64Decode(
    'CghTX1VwTWlrZRIXCgdtaWtlX2lkGAEgASgDUgZtaWtlSWQSFgoGc3RhdHVzGAIgASgFUgZzdG'
    'F0dXM=');

@$core.Deprecated('Use c_OutMikeDescriptor instead')
const C_OutMike$json = {
  '1': 'C_OutMike',
  '2': [
    {'1': 'role_id', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'role_ids', '3': 2, '4': 3, '5': 3, '10': 'roleIds'},
  ],
};

/// Descriptor for `C_OutMike`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_OutMikeDescriptor = $convert.base64Decode(
    'CglDX091dE1pa2USFwoHcm9sZV9pZBgBIAEoA1IGcm9sZUlkEhkKCHJvbGVfaWRzGAIgAygDUg'
    'dyb2xlSWRz');

@$core.Deprecated('Use c_BanMikeDescriptor instead')
const C_BanMike$json = {
  '1': 'C_BanMike',
  '2': [
    {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'status', '3': 3, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `C_BanMike`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_BanMikeDescriptor = $convert.base64Decode(
    'CglDX0Jhbk1pa2USFwoHcm9sZV9pZBgCIAEoA1IGcm9sZUlkEhYKBnN0YXR1cxgDIAEoBVIGc3'
    'RhdHVz');

@$core.Deprecated('Use c_AccMikeClearDescriptor instead')
const C_AccMikeClear$json = {
  '1': 'C_AccMikeClear',
  '2': [
    {'1': 'role_id_list', '3': 3, '4': 3, '5': 3, '10': 'roleIdList'},
  ],
};

/// Descriptor for `C_AccMikeClear`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_AccMikeClearDescriptor = $convert.base64Decode(
    'Cg5DX0FjY01pa2VDbGVhchIgCgxyb2xlX2lkX2xpc3QYAyADKANSCnJvbGVJZExpc3Q=');

@$core.Deprecated('Use c_SetNoticeMessageDescriptor instead')
const C_SetNoticeMessage$json = {
  '1': 'C_SetNoticeMessage',
  '2': [
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `C_SetNoticeMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_SetNoticeMessageDescriptor = $convert.base64Decode(
    'ChJDX1NldE5vdGljZU1lc3NhZ2USGAoHbWVzc2FnZRgCIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use c_SetAdministratorDescriptor instead')
const C_SetAdministrator$json = {
  '1': 'C_SetAdministrator',
  '2': [
    {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'status', '3': 3, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `C_SetAdministrator`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_SetAdministratorDescriptor = $convert.base64Decode(
    'ChJDX1NldEFkbWluaXN0cmF0b3ISFwoHcm9sZV9pZBgCIAEoA1IGcm9sZUlkEhAKA3VpZBgBIA'
    'EoCVIDdWlkEhYKBnN0YXR1cxgDIAEoBVIGc3RhdHVz');

@$core.Deprecated('Use c_SetBlackDescriptor instead')
const C_SetBlack$json = {
  '1': 'C_SetBlack',
  '2': [
    {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'status', '3': 3, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `C_SetBlack`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_SetBlackDescriptor = $convert.base64Decode(
    'CgpDX1NldEJsYWNrEhcKB3JvbGVfaWQYAiABKANSBnJvbGVJZBIQCgN1aWQYASABKAlSA3VpZB'
    'IWCgZzdGF0dXMYAyABKAVSBnN0YXR1cw==');

@$core.Deprecated('Use c_ChatMessageDescriptor instead')
const C_ChatMessage$json = {
  '1': 'C_ChatMessage',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    {'1': 'type', '3': 2, '4': 1, '5': 5, '10': 'type'},
  ],
};

/// Descriptor for `C_ChatMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_ChatMessageDescriptor = $convert.base64Decode(
    'Cg1DX0NoYXRNZXNzYWdlEhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2USEgoEdHlwZRgCIAEoBV'
    'IEdHlwZQ==');

@$core.Deprecated('Use c_BanChatDescriptor instead')
const C_BanChat$json = {
  '1': 'C_BanChat',
  '2': [
    {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'status', '3': 3, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `C_BanChat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_BanChatDescriptor = $convert.base64Decode(
    'CglDX0JhbkNoYXQSFwoHcm9sZV9pZBgCIAEoA1IGcm9sZUlkEhYKBnN0YXR1cxgDIAEoBVIGc3'
    'RhdHVz');

@$core.Deprecated('Use g_SwitchSceneDescriptor instead')
const G_SwitchScene$json = {
  '1': 'G_SwitchScene',
  '2': [
    {'1': 'scene', '3': 1, '4': 1, '5': 3, '10': 'scene'},
    {'1': 'room', '3': 2, '4': 1, '5': 3, '10': 'room'},
  ],
};

/// Descriptor for `G_SwitchScene`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List g_SwitchSceneDescriptor = $convert.base64Decode(
    'Cg1HX1N3aXRjaFNjZW5lEhQKBXNjZW5lGAEgASgDUgVzY2VuZRISCgRyb29tGAIgASgDUgRyb2'
    '9t');

@$core.Deprecated('Use s_SyncRoundDescriptor instead')
const S_SyncRound$json = {
  '1': 'S_SyncRound',
  '2': [
    {'1': 'roles', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.RoleSceneInfo', '10': 'roles'},
  ],
};

/// Descriptor for `S_SyncRound`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SyncRoundDescriptor = $convert.base64Decode(
    'CgtTX1N5bmNSb3VuZBI0CgVyb2xlcxgBIAMoCzIeLmNvbS5zYXZ2eS5wcm90by5Sb2xlU2Nlbm'
    'VJbmZvUgVyb2xlcw==');

@$core.Deprecated('Use s_SyncAttrDescriptor instead')
const S_SyncAttr$json = {
  '1': 'S_SyncAttr',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'attr', '3': 2, '4': 1, '5': 11, '6': '.com.savvy.proto.AttrVO', '10': 'attr'},
  ],
};

/// Descriptor for `S_SyncAttr`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SyncAttrDescriptor = $convert.base64Decode(
    'CgpTX1N5bmNBdHRyEg4KAmlkGAEgASgDUgJpZBIrCgRhdHRyGAIgASgLMhcuY29tLnNhdnZ5Ln'
    'Byb3RvLkF0dHJWT1IEYXR0cg==');

@$core.Deprecated('Use s_SyncAttrsDescriptor instead')
const S_SyncAttrs$json = {
  '1': 'S_SyncAttrs',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'attrs', '3': 2, '4': 1, '5': 11, '6': '.com.savvy.proto.AttrInfo', '10': 'attrs'},
  ],
};

/// Descriptor for `S_SyncAttrs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SyncAttrsDescriptor = $convert.base64Decode(
    'CgtTX1N5bmNBdHRycxIOCgJpZBgBIAEoA1ICaWQSLwoFYXR0cnMYAiABKAsyGS5jb20uc2F2dn'
    'kucHJvdG8uQXR0ckluZm9SBWF0dHJz');

@$core.Deprecated('Use s_SyncMultiAttrDescriptor instead')
const S_SyncMultiAttr$json = {
  '1': 'S_SyncMultiAttr',
  '2': [
    {'1': 'id', '3': 1, '4': 3, '5': 3, '10': 'id'},
    {'1': 'attr', '3': 2, '4': 3, '5': 11, '6': '.com.savvy.proto.AttrVO', '10': 'attr'},
  ],
};

/// Descriptor for `S_SyncMultiAttr`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SyncMultiAttrDescriptor = $convert.base64Decode(
    'Cg9TX1N5bmNNdWx0aUF0dHISDgoCaWQYASADKANSAmlkEisKBGF0dHIYAiADKAsyFy5jb20uc2'
    'F2dnkucHJvdG8uQXR0clZPUgRhdHRy');

@$core.Deprecated('Use s_SyncMultiAttrsDescriptor instead')
const S_SyncMultiAttrs$json = {
  '1': 'S_SyncMultiAttrs',
  '2': [
    {'1': 'id', '3': 1, '4': 3, '5': 3, '10': 'id'},
    {'1': 'attrs', '3': 2, '4': 3, '5': 11, '6': '.com.savvy.proto.AttrInfo', '10': 'attrs'},
  ],
};

/// Descriptor for `S_SyncMultiAttrs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SyncMultiAttrsDescriptor = $convert.base64Decode(
    'ChBTX1N5bmNNdWx0aUF0dHJzEg4KAmlkGAEgAygDUgJpZBIvCgVhdHRycxgCIAMoCzIZLmNvbS'
    '5zYXZ2eS5wcm90by5BdHRySW5mb1IFYXR0cnM=');

@$core.Deprecated('Use s_SyncRoleDescriptor instead')
const S_SyncRole$json = {
  '1': 'S_SyncRole',
  '2': [
    {'1': 'info', '3': 1, '4': 1, '5': 11, '6': '.com.savvy.proto.RoleInfo', '10': 'info'},
  ],
};

/// Descriptor for `S_SyncRole`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SyncRoleDescriptor = $convert.base64Decode(
    'CgpTX1N5bmNSb2xlEi0KBGluZm8YASABKAsyGS5jb20uc2F2dnkucHJvdG8uUm9sZUluZm9SBG'
    'luZm8=');

@$core.Deprecated('Use c_ToZoneDescriptor instead')
const C_ToZone$json = {
  '1': 'C_ToZone',
  '2': [
    {'1': 'xyz', '3': 1, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZ', '10': 'xyz'},
    {'1': 'r', '3': 2, '4': 1, '5': 5, '10': 'r'},
  ],
};

/// Descriptor for `C_ToZone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_ToZoneDescriptor = $convert.base64Decode(
    'CghDX1RvWm9uZRImCgN4eXoYASABKAsyFC5jb20uc2F2dnkucHJvdG8uWFlaUgN4eXoSDAoBch'
    'gCIAEoBVIBcg==');

@$core.Deprecated('Use s_SyncZoneDescriptor instead')
const S_SyncZone$json = {
  '1': 'S_SyncZone',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'xyz', '3': 2, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZ', '10': 'xyz'},
    {'1': 'r', '3': 3, '4': 1, '5': 5, '10': 'r'},
  ],
};

/// Descriptor for `S_SyncZone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SyncZoneDescriptor = $convert.base64Decode(
    'CgpTX1N5bmNab25lEg4KAmlkGAEgASgDUgJpZBImCgN4eXoYAiABKAsyFC5jb20uc2F2dnkucH'
    'JvdG8uWFlaUgN4eXoSDAoBchgDIAEoBVIBcg==');

@$core.Deprecated('Use c_EnforceZoneDescriptor instead')
const C_EnforceZone$json = {
  '1': 'C_EnforceZone',
  '2': [
    {'1': 'xyz', '3': 1, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZ', '10': 'xyz'},
    {'1': 'r', '3': 2, '4': 1, '5': 5, '10': 'r'},
    {'1': 'state', '3': 3, '4': 1, '5': 14, '6': '.com.savvy.proto.State', '10': 'state'},
  ],
};

/// Descriptor for `C_EnforceZone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_EnforceZoneDescriptor = $convert.base64Decode(
    'Cg1DX0VuZm9yY2Vab25lEiYKA3h5ehgBIAEoCzIULmNvbS5zYXZ2eS5wcm90by5YWVpSA3h5eh'
    'IMCgFyGAIgASgFUgFyEiwKBXN0YXRlGAMgASgOMhYuY29tLnNhdnZ5LnByb3RvLlN0YXRlUgVz'
    'dGF0ZQ==');

@$core.Deprecated('Use s_EnforceZoneDescriptor instead')
const S_EnforceZone$json = {
  '1': 'S_EnforceZone',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'xyz', '3': 2, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZ', '10': 'xyz'},
    {'1': 'r', '3': 3, '4': 1, '5': 5, '10': 'r'},
    {'1': 'state', '3': 4, '4': 1, '5': 14, '6': '.com.savvy.proto.State', '10': 'state'},
  ],
};

/// Descriptor for `S_EnforceZone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_EnforceZoneDescriptor = $convert.base64Decode(
    'Cg1TX0VuZm9yY2Vab25lEg4KAmlkGAEgASgDUgJpZBImCgN4eXoYAiABKAsyFC5jb20uc2F2dn'
    'kucHJvdG8uWFlaUgN4eXoSDAoBchgDIAEoBVIBchIsCgVzdGF0ZRgEIAEoDjIWLmNvbS5zYXZ2'
    'eS5wcm90by5TdGF0ZVIFc3RhdGU=');

@$core.Deprecated('Use c_StopMoveDescriptor instead')
const C_StopMove$json = {
  '1': 'C_StopMove',
  '2': [
    {'1': 'xyz', '3': 1, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZ', '10': 'xyz'},
    {'1': 'r', '3': 3, '4': 1, '5': 5, '10': 'r'},
  ],
};

/// Descriptor for `C_StopMove`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_StopMoveDescriptor = $convert.base64Decode(
    'CgpDX1N0b3BNb3ZlEiYKA3h5ehgBIAEoCzIULmNvbS5zYXZ2eS5wcm90by5YWVpSA3h5ehIMCg'
    'FyGAMgASgFUgFy');

@$core.Deprecated('Use c_AnimateDescriptor instead')
const C_Animate$json = {
  '1': 'C_Animate',
  '2': [
    {'1': 'val', '3': 1, '4': 1, '5': 3, '10': 'val'},
  ],
};

/// Descriptor for `C_Animate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_AnimateDescriptor = $convert.base64Decode(
    'CglDX0FuaW1hdGUSEAoDdmFsGAEgASgDUgN2YWw=');

@$core.Deprecated('Use c_StageDescriptor instead')
const C_Stage$json = {
  '1': 'C_Stage',
  '2': [
    {'1': 'val', '3': 1, '4': 1, '5': 3, '10': 'val'},
  ],
};

/// Descriptor for `C_Stage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_StageDescriptor = $convert.base64Decode(
    'CgdDX1N0YWdlEhAKA3ZhbBgBIAEoA1IDdmFs');

@$core.Deprecated('Use s_AddRoleDescriptor instead')
const S_AddRole$json = {
  '1': 'S_AddRole',
  '2': [
    {'1': 'roles', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.RoleSceneInfo', '10': 'roles'},
  ],
};

/// Descriptor for `S_AddRole`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_AddRoleDescriptor = $convert.base64Decode(
    'CglTX0FkZFJvbGUSNAoFcm9sZXMYASADKAsyHi5jb20uc2F2dnkucHJvdG8uUm9sZVNjZW5lSW'
    '5mb1IFcm9sZXM=');

@$core.Deprecated('Use s_RemoveObjDescriptor instead')
const S_RemoveObj$json = {
  '1': 'S_RemoveObj',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `S_RemoveObj`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_RemoveObjDescriptor = $convert.base64Decode(
    'CgtTX1JlbW92ZU9iahIOCgJpZBgBIAEoA1ICaWQ=');

@$core.Deprecated('Use s_RemoveObjsDescriptor instead')
const S_RemoveObjs$json = {
  '1': 'S_RemoveObjs',
  '2': [
    {'1': 'id', '3': 1, '4': 3, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `S_RemoveObjs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_RemoveObjsDescriptor = $convert.base64Decode(
    'CgxTX1JlbW92ZU9ianMSDgoCaWQYASADKANSAmlk');

@$core.Deprecated('Use c_StateDescriptor instead')
const C_State$json = {
  '1': 'C_State',
  '2': [
    {'1': 'state', '3': 1, '4': 1, '5': 14, '6': '.com.savvy.proto.State', '10': 'state'},
  ],
};

/// Descriptor for `C_State`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_StateDescriptor = $convert.base64Decode(
    'CgdDX1N0YXRlEiwKBXN0YXRlGAEgASgOMhYuY29tLnNhdnZ5LnByb3RvLlN0YXRlUgVzdGF0ZQ'
    '==');

@$core.Deprecated('Use s_StateDescriptor instead')
const S_State$json = {
  '1': 'S_State',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'state', '3': 2, '4': 1, '5': 14, '6': '.com.savvy.proto.State', '10': 'state'},
  ],
};

/// Descriptor for `S_State`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_StateDescriptor = $convert.base64Decode(
    'CgdTX1N0YXRlEg4KAmlkGAEgASgDUgJpZBIsCgVzdGF0ZRgCIAEoDjIWLmNvbS5zYXZ2eS5wcm'
    '90by5TdGF0ZVIFc3RhdGU=');

@$core.Deprecated('Use c_ToSeatInfoDescriptor instead')
const C_ToSeatInfo$json = {
  '1': 'C_ToSeatInfo',
  '2': [
    {'1': 'guid', '3': 1, '4': 1, '5': 9, '10': 'guid'},
    {'1': 'xyz', '3': 2, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZ', '10': 'xyz'},
  ],
};

/// Descriptor for `C_ToSeatInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_ToSeatInfoDescriptor = $convert.base64Decode(
    'CgxDX1RvU2VhdEluZm8SEgoEZ3VpZBgBIAEoCVIEZ3VpZBImCgN4eXoYAiABKAsyFC5jb20uc2'
    'F2dnkucHJvdG8uWFlaUgN4eXo=');

@$core.Deprecated('Use s_SyncSeatInfoDescriptor instead')
const S_SyncSeatInfo$json = {
  '1': 'S_SyncSeatInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'guid', '3': 2, '4': 1, '5': 9, '10': 'guid'},
  ],
};

/// Descriptor for `S_SyncSeatInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SyncSeatInfoDescriptor = $convert.base64Decode(
    'Cg5TX1N5bmNTZWF0SW5mbxIOCgJpZBgBIAEoA1ICaWQSEgoEZ3VpZBgCIAEoCVIEZ3VpZA==');

@$core.Deprecated('Use c_GoToRoomDescriptor instead')
const C_GoToRoom$json = {
  '1': 'C_GoToRoom',
  '2': [
    {'1': 'buildingId', '3': 1, '4': 1, '5': 3, '10': 'buildingId'},
  ],
};

/// Descriptor for `C_GoToRoom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_GoToRoomDescriptor = $convert.base64Decode(
    'CgpDX0dvVG9Sb29tEh4KCmJ1aWxkaW5nSWQYASABKANSCmJ1aWxkaW5nSWQ=');

@$core.Deprecated('Use s_GoToRoomDescriptor instead')
const S_GoToRoom$json = {
  '1': 'S_GoToRoom',
  '2': [
    {'1': 'available', '3': 1, '4': 1, '5': 8, '10': 'available'},
    {'1': 'banner', '3': 2, '4': 1, '5': 9, '10': 'banner'},
    {'1': 'buildingId', '3': 3, '4': 1, '5': 3, '10': 'buildingId'},
    {'1': 'room_id', '3': 4, '4': 1, '5': 3, '10': 'roomId'},
  ],
};

/// Descriptor for `S_GoToRoom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_GoToRoomDescriptor = $convert.base64Decode(
    'CgpTX0dvVG9Sb29tEhwKCWF2YWlsYWJsZRgBIAEoCFIJYXZhaWxhYmxlEhYKBmJhbm5lchgCIA'
    'EoCVIGYmFubmVyEh4KCmJ1aWxkaW5nSWQYAyABKANSCmJ1aWxkaW5nSWQSFwoHcm9vbV9pZBgE'
    'IAEoA1IGcm9vbUlk');

@$core.Deprecated('Use c_GoAwayRoomDescriptor instead')
const C_GoAwayRoom$json = {
  '1': 'C_GoAwayRoom',
  '2': [
    {'1': 'buildingId', '3': 1, '4': 1, '5': 3, '10': 'buildingId'},
  ],
};

/// Descriptor for `C_GoAwayRoom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_GoAwayRoomDescriptor = $convert.base64Decode(
    'CgxDX0dvQXdheVJvb20SHgoKYnVpbGRpbmdJZBgBIAEoA1IKYnVpbGRpbmdJZA==');

@$core.Deprecated('Use s_GoAwayRoomDescriptor instead')
const S_GoAwayRoom$json = {
  '1': 'S_GoAwayRoom',
  '2': [
    {'1': 'buildingId', '3': 1, '4': 1, '5': 3, '10': 'buildingId'},
  ],
};

/// Descriptor for `S_GoAwayRoom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_GoAwayRoomDescriptor = $convert.base64Decode(
    'CgxTX0dvQXdheVJvb20SHgoKYnVpbGRpbmdJZBgBIAEoA1IKYnVpbGRpbmdJZA==');

@$core.Deprecated('Use c_InFreeMikesAreaDescriptor instead')
const C_InFreeMikesArea$json = {
  '1': 'C_InFreeMikesArea',
  '2': [
    {'1': 'roomid', '3': 1, '4': 1, '5': 3, '10': 'roomid'},
  ],
};

/// Descriptor for `C_InFreeMikesArea`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_InFreeMikesAreaDescriptor = $convert.base64Decode(
    'ChFDX0luRnJlZU1pa2VzQXJlYRIWCgZyb29taWQYASABKANSBnJvb21pZA==');

@$core.Deprecated('Use s_InFreeMikesAreaDescriptor instead')
const S_InFreeMikesArea$json = {
  '1': 'S_InFreeMikesArea',
  '2': [
    {'1': 'roomid', '3': 2, '4': 1, '5': 3, '10': 'roomid'},
  ],
};

/// Descriptor for `S_InFreeMikesArea`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_InFreeMikesAreaDescriptor = $convert.base64Decode(
    'ChFTX0luRnJlZU1pa2VzQXJlYRIWCgZyb29taWQYAiABKANSBnJvb21pZA==');

@$core.Deprecated('Use c_OutFreeMikesAreaDescriptor instead')
const C_OutFreeMikesArea$json = {
  '1': 'C_OutFreeMikesArea',
  '2': [
    {'1': 'roomid', '3': 1, '4': 1, '5': 3, '10': 'roomid'},
  ],
};

/// Descriptor for `C_OutFreeMikesArea`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_OutFreeMikesAreaDescriptor = $convert.base64Decode(
    'ChJDX091dEZyZWVNaWtlc0FyZWESFgoGcm9vbWlkGAEgASgDUgZyb29taWQ=');

@$core.Deprecated('Use s_OutFreeMikesAreaDescriptor instead')
const S_OutFreeMikesArea$json = {
  '1': 'S_OutFreeMikesArea',
  '2': [
    {'1': 'roomid', '3': 1, '4': 1, '5': 3, '10': 'roomid'},
  ],
};

/// Descriptor for `S_OutFreeMikesArea`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_OutFreeMikesAreaDescriptor = $convert.base64Decode(
    'ChJTX091dEZyZWVNaWtlc0FyZWESFgoGcm9vbWlkGAEgASgDUgZyb29taWQ=');

@$core.Deprecated('Use c_PlazaToRoomDescriptor instead')
const C_PlazaToRoom$json = {
  '1': 'C_PlazaToRoom',
  '2': [
    {'1': 'roomid', '3': 1, '4': 1, '5': 3, '10': 'roomid'},
  ],
};

/// Descriptor for `C_PlazaToRoom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_PlazaToRoomDescriptor = $convert.base64Decode(
    'Cg1DX1BsYXphVG9Sb29tEhYKBnJvb21pZBgBIAEoA1IGcm9vbWlk');

@$core.Deprecated('Use s_PlazaToRoomDescriptor instead')
const S_PlazaToRoom$json = {
  '1': 'S_PlazaToRoom',
  '2': [
    {'1': 'roomid', '3': 1, '4': 1, '5': 3, '10': 'roomid'},
  ],
};

/// Descriptor for `S_PlazaToRoom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_PlazaToRoomDescriptor = $convert.base64Decode(
    'Cg1TX1BsYXphVG9Sb29tEhYKBnJvb21pZBgBIAEoA1IGcm9vbWlk');

@$core.Deprecated('Use c_RobotDescriptor instead')
const C_Robot$json = {
  '1': 'C_Robot',
  '2': [
    {'1': 'count', '3': 1, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `C_Robot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_RobotDescriptor = $convert.base64Decode(
    'CgdDX1JvYm90EhQKBWNvdW50GAEgASgFUgVjb3VudA==');

@$core.Deprecated('Use s_RobotDescriptor instead')
const S_Robot$json = {
  '1': 'S_Robot',
  '2': [
    {'1': 'roles', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.RoleSceneInfo', '10': 'roles'},
  ],
};

/// Descriptor for `S_Robot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_RobotDescriptor = $convert.base64Decode(
    'CgdTX1JvYm90EjQKBXJvbGVzGAEgAygLMh4uY29tLnNhdnZ5LnByb3RvLlJvbGVTY2VuZUluZm'
    '9SBXJvbGVz');

@$core.Deprecated('Use c_TestDescriptor instead')
const C_Test$json = {
  '1': 'C_Test',
  '2': [
    {'1': 'usr_name', '3': 1, '4': 1, '5': 9, '10': 'usrName'},
    {'1': 'sceneId', '3': 2, '4': 1, '5': 3, '10': 'sceneId'},
    {'1': 'roomId', '3': 3, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'roomPwd', '3': 4, '4': 1, '5': 9, '10': 'roomPwd'},
    {'1': 'uniqueId', '3': 5, '4': 1, '5': 9, '10': 'uniqueId'},
    {'1': 'opt', '3': 6, '4': 1, '5': 5, '10': 'opt'},
    {'1': 'extra', '3': 7, '4': 1, '5': 9, '10': 'extra'},
  ],
};

/// Descriptor for `C_Test`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_TestDescriptor = $convert.base64Decode(
    'CgZDX1Rlc3QSGQoIdXNyX25hbWUYASABKAlSB3Vzck5hbWUSGAoHc2NlbmVJZBgCIAEoA1IHc2'
    'NlbmVJZBIWCgZyb29tSWQYAyABKANSBnJvb21JZBIYCgdyb29tUHdkGAQgASgJUgdyb29tUHdk'
    'EhoKCHVuaXF1ZUlkGAUgASgJUgh1bmlxdWVJZBIQCgNvcHQYBiABKAVSA29wdBIUCgVleHRyYR'
    'gHIAEoCVIFZXh0cmE=');

@$core.Deprecated('Use s_TestDescriptor instead')
const S_Test$json = {
  '1': 'S_Test',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.com.savvy.proto.ErrorCode', '10': 'code'},
    {'1': 'sceneId', '3': 2, '4': 1, '5': 3, '10': 'sceneId'},
    {'1': 'roomId', '3': 3, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'roomPwd', '3': 4, '4': 1, '5': 9, '10': 'roomPwd'},
    {'1': 'opt', '3': 5, '4': 1, '5': 5, '10': 'opt'},
    {'1': 'extra', '3': 6, '4': 1, '5': 9, '10': 'extra'},
    {'1': 'roleId', '3': 7, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'userId', '3': 8, '4': 1, '5': 3, '10': 'userId'},
  ],
};

/// Descriptor for `S_Test`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_TestDescriptor = $convert.base64Decode(
    'CgZTX1Rlc3QSLgoEY29kZRgBIAEoDjIaLmNvbS5zYXZ2eS5wcm90by5FcnJvckNvZGVSBGNvZG'
    'USGAoHc2NlbmVJZBgCIAEoA1IHc2NlbmVJZBIWCgZyb29tSWQYAyABKANSBnJvb21JZBIYCgdy'
    'b29tUHdkGAQgASgJUgdyb29tUHdkEhAKA29wdBgFIAEoBVIDb3B0EhQKBWV4dHJhGAYgASgJUg'
    'VleHRyYRIWCgZyb2xlSWQYByABKANSBnJvbGVJZBIWCgZ1c2VySWQYCCABKANSBnVzZXJJZA==');

@$core.Deprecated('Use s_DebugDescriptor instead')
const S_Debug$json = {
  '1': 'S_Debug',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `S_Debug`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_DebugDescriptor = $convert.base64Decode(
    'CgdTX0RlYnVnEhYKBnN0YXR1cxgBIAEoBVIGc3RhdHVz');

@$core.Deprecated('Use c_OptTestDescriptor instead')
const C_OptTest$json = {
  '1': 'C_OptTest',
  '2': [
    {'1': 'optCode', '3': 1, '4': 1, '5': 5, '10': 'optCode'},
    {'1': 'broadcast', '3': 2, '4': 1, '5': 5, '10': 'broadcast'},
    {'1': 'id', '3': 3, '4': 1, '5': 3, '10': 'id'},
    {'1': 'extra', '3': 4, '4': 1, '5': 9, '10': 'extra'},
  ],
};

/// Descriptor for `C_OptTest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_OptTestDescriptor = $convert.base64Decode(
    'CglDX09wdFRlc3QSGAoHb3B0Q29kZRgBIAEoBVIHb3B0Q29kZRIcCglicm9hZGNhc3QYAiABKA'
    'VSCWJyb2FkY2FzdBIOCgJpZBgDIAEoA1ICaWQSFAoFZXh0cmEYBCABKAlSBWV4dHJh');

@$core.Deprecated('Use s_OptTestDescriptor instead')
const S_OptTest$json = {
  '1': 'S_OptTest',
  '2': [
    {'1': 'optCode', '3': 1, '4': 1, '5': 5, '10': 'optCode'},
    {'1': 'id', '3': 2, '4': 1, '5': 3, '10': 'id'},
    {'1': 'extra', '3': 3, '4': 1, '5': 9, '10': 'extra'},
  ],
};

/// Descriptor for `S_OptTest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_OptTestDescriptor = $convert.base64Decode(
    'CglTX09wdFRlc3QSGAoHb3B0Q29kZRgBIAEoBVIHb3B0Q29kZRIOCgJpZBgCIAEoA1ICaWQSFA'
    'oFZXh0cmEYAyABKAlSBWV4dHJh');

@$core.Deprecated('Use c_VerifyDescriptor instead')
const C_Verify$json = {
  '1': 'C_Verify',
  '2': [
    {'1': 'uniqueId', '3': 1, '4': 1, '5': 9, '10': 'uniqueId'},
  ],
};

/// Descriptor for `C_Verify`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_VerifyDescriptor = $convert.base64Decode(
    'CghDX1ZlcmlmeRIaCgh1bmlxdWVJZBgBIAEoCVIIdW5pcXVlSWQ=');

@$core.Deprecated('Use g_UFHeartDescriptor instead')
const G_UFHeart$json = {
  '1': 'G_UFHeart',
};

/// Descriptor for `G_UFHeart`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List g_UFHeartDescriptor = $convert.base64Decode(
    'CglHX1VGSGVhcnQ=');

@$core.Deprecated('Use c_UFReLinkDescriptor instead')
const C_UFReLink$json = {
  '1': 'C_UFReLink',
  '2': [
    {'1': 'roleId', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'time', '3': 2, '4': 1, '5': 3, '10': 'time'},
    {'1': 'token', '3': 3, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `C_UFReLink`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_UFReLinkDescriptor = $convert.base64Decode(
    'CgpDX1VGUmVMaW5rEhYKBnJvbGVJZBgBIAEoA1IGcm9sZUlkEhIKBHRpbWUYAiABKANSBHRpbW'
    'USFAoFdG9rZW4YAyABKAlSBXRva2Vu');

@$core.Deprecated('Use f_GiftShowDescriptor instead')
const F_GiftShow$json = {
  '1': 'F_GiftShow',
  '2': [
    {'1': 'giftId', '3': 1, '4': 1, '5': 5, '10': 'giftId'},
  ],
};

/// Descriptor for `F_GiftShow`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List f_GiftShowDescriptor = $convert.base64Decode(
    'CgpGX0dpZnRTaG93EhYKBmdpZnRJZBgBIAEoBVIGZ2lmdElk');

@$core.Deprecated('Use c_ControlAppUIDescriptor instead')
const C_ControlAppUI$json = {
  '1': 'C_ControlAppUI',
  '2': [
    {'1': 'parts', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.AppUIStatus', '10': 'parts'},
  ],
};

/// Descriptor for `C_ControlAppUI`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_ControlAppUIDescriptor = $convert.base64Decode(
    'Cg5DX0NvbnRyb2xBcHBVSRIyCgVwYXJ0cxgBIAMoCzIcLmNvbS5zYXZ2eS5wcm90by5BcHBVSV'
    'N0YXR1c1IFcGFydHM=');

@$core.Deprecated('Use f_ControlAppUIDescriptor instead')
const F_ControlAppUI$json = {
  '1': 'F_ControlAppUI',
  '2': [
    {'1': 'parts', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.UnityUIStatus', '10': 'parts'},
  ],
};

/// Descriptor for `F_ControlAppUI`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List f_ControlAppUIDescriptor = $convert.base64Decode(
    'Cg5GX0NvbnRyb2xBcHBVSRI0CgVwYXJ0cxgBIAMoCzIeLmNvbS5zYXZ2eS5wcm90by5Vbml0eV'
    'VJU3RhdHVzUgVwYXJ0cw==');

@$core.Deprecated('Use c_GiveGiftByRoomDescriptor instead')
const C_GiveGiftByRoom$json = {
  '1': 'C_GiveGiftByRoom',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'gift_id', '3': 2, '4': 1, '5': 3, '10': 'giftId'},
    {'1': 'count', '3': 3, '4': 1, '5': 5, '10': 'count'},
    {'1': 'accept_uid_list', '3': 4, '4': 3, '5': 9, '10': 'acceptUidList'},
    {'1': 'accept_role_id_list', '3': 5, '4': 3, '5': 3, '10': 'acceptRoleIdList'},
    {'1': 'is_backpack', '3': 6, '4': 1, '5': 8, '10': 'isBackpack'},
  ],
};

/// Descriptor for `C_GiveGiftByRoom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_GiveGiftByRoomDescriptor = $convert.base64Decode(
    'ChBDX0dpdmVHaWZ0QnlSb29tEhcKB3Jvb21faWQYASABKANSBnJvb21JZBIXCgdnaWZ0X2lkGA'
    'IgASgDUgZnaWZ0SWQSFAoFY291bnQYAyABKAVSBWNvdW50EiYKD2FjY2VwdF91aWRfbGlzdBgE'
    'IAMoCVINYWNjZXB0VWlkTGlzdBItChNhY2NlcHRfcm9sZV9pZF9saXN0GAUgAygDUhBhY2NlcH'
    'RSb2xlSWRMaXN0Eh8KC2lzX2JhY2twYWNrGAYgASgIUgppc0JhY2twYWNr');

@$core.Deprecated('Use s_GiveGiftByRoomDescriptor instead')
const S_GiveGiftByRoom$json = {
  '1': 'S_GiveGiftByRoom',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.com.savvy.proto.ErrorCode', '10': 'code'},
  ],
};

/// Descriptor for `S_GiveGiftByRoom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_GiveGiftByRoomDescriptor = $convert.base64Decode(
    'ChBTX0dpdmVHaWZ0QnlSb29tEi4KBGNvZGUYASABKA4yGi5jb20uc2F2dnkucHJvdG8uRXJyb3'
    'JDb2RlUgRjb2Rl');

@$core.Deprecated('Use c_GiveGiftByDynamicDescriptor instead')
const C_GiveGiftByDynamic$json = {
  '1': 'C_GiveGiftByDynamic',
  '2': [
    {'1': 'dynamic_id', '3': 1, '4': 1, '5': 3, '10': 'dynamicId'},
    {'1': 'gift_id', '3': 2, '4': 1, '5': 3, '10': 'giftId'},
    {'1': 'count', '3': 3, '4': 1, '5': 5, '10': 'count'},
    {'1': 'is_backpack', '3': 6, '4': 1, '5': 8, '10': 'isBackpack'},
  ],
};

/// Descriptor for `C_GiveGiftByDynamic`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_GiveGiftByDynamicDescriptor = $convert.base64Decode(
    'ChNDX0dpdmVHaWZ0QnlEeW5hbWljEh0KCmR5bmFtaWNfaWQYASABKANSCWR5bmFtaWNJZBIXCg'
    'dnaWZ0X2lkGAIgASgDUgZnaWZ0SWQSFAoFY291bnQYAyABKAVSBWNvdW50Eh8KC2lzX2JhY2tw'
    'YWNrGAYgASgIUgppc0JhY2twYWNr');

@$core.Deprecated('Use s_GiveGiftByDynamicDescriptor instead')
const S_GiveGiftByDynamic$json = {
  '1': 'S_GiveGiftByDynamic',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.com.savvy.proto.ErrorCode', '10': 'code'},
  ],
};

/// Descriptor for `S_GiveGiftByDynamic`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_GiveGiftByDynamicDescriptor = $convert.base64Decode(
    'ChNTX0dpdmVHaWZ0QnlEeW5hbWljEi4KBGNvZGUYASABKA4yGi5jb20uc2F2dnkucHJvdG8uRX'
    'Jyb3JDb2RlUgRjb2Rl');

@$core.Deprecated('Use s_GiveGiftByImDescriptor instead')
const S_GiveGiftByIm$json = {
  '1': 'S_GiveGiftByIm',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.com.savvy.proto.ErrorCode', '10': 'code'},
  ],
};

/// Descriptor for `S_GiveGiftByIm`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_GiveGiftByImDescriptor = $convert.base64Decode(
    'Cg5TX0dpdmVHaWZ0QnlJbRIuCgRjb2RlGAEgASgOMhouY29tLnNhdnZ5LnByb3RvLkVycm9yQ2'
    '9kZVIEY29kZQ==');

@$core.Deprecated('Use c_GiveGiftByImDescriptor instead')
const C_GiveGiftByIm$json = {
  '1': 'C_GiveGiftByIm',
  '2': [
    {'1': 'gift_id', '3': 1, '4': 1, '5': 3, '10': 'giftId'},
    {'1': 'accept_uid', '3': 2, '4': 1, '5': 9, '10': 'acceptUid'},
    {'1': 'count', '3': 3, '4': 1, '5': 5, '10': 'count'},
    {'1': 'accept_role_id', '3': 4, '4': 1, '5': 3, '10': 'acceptRoleId'},
    {'1': 'is_backpack', '3': 6, '4': 1, '5': 8, '10': 'isBackpack'},
  ],
};

/// Descriptor for `C_GiveGiftByIm`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_GiveGiftByImDescriptor = $convert.base64Decode(
    'Cg5DX0dpdmVHaWZ0QnlJbRIXCgdnaWZ0X2lkGAEgASgDUgZnaWZ0SWQSHQoKYWNjZXB0X3VpZB'
    'gCIAEoCVIJYWNjZXB0VWlkEhQKBWNvdW50GAMgASgFUgVjb3VudBIkCg5hY2NlcHRfcm9sZV9p'
    'ZBgEIAEoA1IMYWNjZXB0Um9sZUlkEh8KC2lzX2JhY2twYWNrGAYgASgIUgppc0JhY2twYWNr');

@$core.Deprecated('Use s_UpdateLevelDescriptor instead')
const S_UpdateLevel$json = {
  '1': 'S_UpdateLevel',
  '2': [
    {'1': 'role_id', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'level', '3': 2, '4': 1, '5': 3, '10': 'level'},
    {'1': 'uid', '3': 3, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `S_UpdateLevel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_UpdateLevelDescriptor = $convert.base64Decode(
    'Cg1TX1VwZGF0ZUxldmVsEhcKB3JvbGVfaWQYASABKANSBnJvbGVJZBIUCgVsZXZlbBgCIAEoA1'
    'IFbGV2ZWwSEAoDdWlkGAMgASgJUgN1aWQ=');

@$core.Deprecated('Use updateCharmLevelItemDescriptor instead')
const UpdateCharmLevelItem$json = {
  '1': 'UpdateCharmLevelItem',
  '2': [
    {'1': 'role_id', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'charm_level', '3': 2, '4': 1, '5': 3, '10': 'charmLevel'},
    {'1': 'uid', '3': 3, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `UpdateCharmLevelItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateCharmLevelItemDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVDaGFybUxldmVsSXRlbRIXCgdyb2xlX2lkGAEgASgDUgZyb2xlSWQSHwoLY2hhcm'
    '1fbGV2ZWwYAiABKANSCmNoYXJtTGV2ZWwSEAoDdWlkGAMgASgJUgN1aWQ=');

@$core.Deprecated('Use s_UpdateCharmLevelDescriptor instead')
const S_UpdateCharmLevel$json = {
  '1': 'S_UpdateCharmLevel',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.UpdateCharmLevelItem', '10': 'items'},
  ],
};

/// Descriptor for `S_UpdateCharmLevel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_UpdateCharmLevelDescriptor = $convert.base64Decode(
    'ChJTX1VwZGF0ZUNoYXJtTGV2ZWwSOwoFaXRlbXMYASADKAsyJS5jb20uc2F2dnkucHJvdG8uVX'
    'BkYXRlQ2hhcm1MZXZlbEl0ZW1SBWl0ZW1z');

@$core.Deprecated('Use s_GiftPlayDescriptor instead')
const S_GiftPlay$json = {
  '1': 'S_GiftPlay',
  '2': [
    {'1': 'gift_id', '3': 1, '4': 1, '5': 3, '10': 'giftId'},
    {'1': 'send_effect_url', '3': 2, '4': 1, '5': 9, '10': 'sendEffectUrl'},
    {'1': 'cover', '3': 3, '4': 1, '5': 9, '10': 'cover'},
    {'1': 'price', '3': 4, '4': 1, '5': 3, '10': 'price'},
    {'1': 'currency', '3': 5, '4': 1, '5': 5, '10': 'currency'},
    {'1': 'type', '3': 6, '4': 1, '5': 5, '10': 'type'},
    {'1': 'created_at', '3': 8, '4': 1, '5': 3, '10': 'createdAt'},
    {'1': 'updated_at', '3': 9, '4': 1, '5': 3, '10': 'updatedAt'},
    {'1': 'name', '3': 10, '4': 1, '5': 9, '10': 'name'},
    {'1': 'role_id', '3': 11, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'send_id', '3': 12, '4': 1, '5': 9, '10': 'sendId'},
    {'1': 'accept_uid_list', '3': 13, '4': 3, '5': 9, '10': 'acceptUidList'},
    {'1': 'accept_role_id_list', '3': 14, '4': 3, '5': 3, '10': 'acceptRoleIdList'},
    {'1': 'count', '3': 15, '4': 1, '5': 5, '10': 'count'},
    {'1': 'room_id', '3': 16, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'portrait_screen_show', '3': 17, '4': 1, '5': 8, '10': 'portraitScreenShow'},
    {'1': 'landscape_screen_show', '3': 18, '4': 1, '5': 8, '10': 'landscapeScreenShow'},
  ],
};

/// Descriptor for `S_GiftPlay`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_GiftPlayDescriptor = $convert.base64Decode(
    'CgpTX0dpZnRQbGF5EhcKB2dpZnRfaWQYASABKANSBmdpZnRJZBImCg9zZW5kX2VmZmVjdF91cm'
    'wYAiABKAlSDXNlbmRFZmZlY3RVcmwSFAoFY292ZXIYAyABKAlSBWNvdmVyEhQKBXByaWNlGAQg'
    'ASgDUgVwcmljZRIaCghjdXJyZW5jeRgFIAEoBVIIY3VycmVuY3kSEgoEdHlwZRgGIAEoBVIEdH'
    'lwZRIdCgpjcmVhdGVkX2F0GAggASgDUgljcmVhdGVkQXQSHQoKdXBkYXRlZF9hdBgJIAEoA1IJ'
    'dXBkYXRlZEF0EhIKBG5hbWUYCiABKAlSBG5hbWUSFwoHcm9sZV9pZBgLIAEoA1IGcm9sZUlkEh'
    'cKB3NlbmRfaWQYDCABKAlSBnNlbmRJZBImCg9hY2NlcHRfdWlkX2xpc3QYDSADKAlSDWFjY2Vw'
    'dFVpZExpc3QSLQoTYWNjZXB0X3JvbGVfaWRfbGlzdBgOIAMoA1IQYWNjZXB0Um9sZUlkTGlzdB'
    'IUCgVjb3VudBgPIAEoBVIFY291bnQSFwoHcm9vbV9pZBgQIAEoA1IGcm9vbUlkEjAKFHBvcnRy'
    'YWl0X3NjcmVlbl9zaG93GBEgASgIUhJwb3J0cmFpdFNjcmVlblNob3cSMgoVbGFuZHNjYXBlX3'
    'NjcmVlbl9zaG93GBIgASgIUhNsYW5kc2NhcGVTY3JlZW5TaG93');

@$core.Deprecated('Use s_MoreGiftPlayDescriptor instead')
const S_MoreGiftPlay$json = {
  '1': 'S_MoreGiftPlay',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.S_GiftPlay', '10': 'items'},
    {'1': 'blind_box_name', '3': 2, '4': 1, '5': 9, '10': 'blindBoxName'},
    {'1': 'blind_box_cover', '3': 3, '4': 1, '5': 9, '10': 'blindBoxCover'},
    {'1': 'blind_box_count', '3': 5, '4': 1, '5': 5, '10': 'blindBoxCount'},
    {'1': 'type', '3': 6, '4': 1, '5': 5, '10': 'type'},
  ],
};

/// Descriptor for `S_MoreGiftPlay`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_MoreGiftPlayDescriptor = $convert.base64Decode(
    'Cg5TX01vcmVHaWZ0UGxheRIxCgVpdGVtcxgBIAMoCzIbLmNvbS5zYXZ2eS5wcm90by5TX0dpZn'
    'RQbGF5UgVpdGVtcxIkCg5ibGluZF9ib3hfbmFtZRgCIAEoCVIMYmxpbmRCb3hOYW1lEiYKD2Js'
    'aW5kX2JveF9jb3ZlchgDIAEoCVINYmxpbmRCb3hDb3ZlchImCg9ibGluZF9ib3hfY291bnQYBS'
    'ABKAVSDWJsaW5kQm94Q291bnQSEgoEdHlwZRgGIAEoBVIEdHlwZQ==');

@$core.Deprecated('Use s_FloatingScreenDescriptor instead')
const S_FloatingScreen$json = {
  '1': 'S_FloatingScreen',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'room_name', '3': 2, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'gift_name', '3': 3, '4': 1, '5': 9, '10': 'giftName'},
    {'1': 'role_id', '3': 4, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'send_id', '3': 5, '4': 1, '5': 9, '10': 'sendId'},
    {'1': 'accept_uid_list', '3': 6, '4': 3, '5': 9, '10': 'acceptUidList'},
    {'1': 'accept_role_id_list', '3': 7, '4': 3, '5': 3, '10': 'acceptRoleIdList'},
    {'1': 'cover', '3': 8, '4': 1, '5': 9, '10': 'cover'},
    {'1': 'price', '3': 9, '4': 1, '5': 3, '10': 'price'},
    {'1': 'currency', '3': 10, '4': 1, '5': 5, '10': 'currency'},
    {'1': 'type', '3': 11, '4': 1, '5': 5, '10': 'type'},
    {'1': 'count', '3': 12, '4': 1, '5': 5, '10': 'count'},
    {'1': 'banner_style_url', '3': 13, '4': 1, '5': 9, '10': 'bannerStyleUrl'},
    {'1': 'guide_entry_room', '3': 14, '4': 1, '5': 8, '10': 'guideEntryRoom'},
    {'1': 'banner_type', '3': 15, '4': 1, '5': 5, '10': 'bannerType'},
  ],
};

/// Descriptor for `S_FloatingScreen`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_FloatingScreenDescriptor = $convert.base64Decode(
    'ChBTX0Zsb2F0aW5nU2NyZWVuEhcKB3Jvb21faWQYASABKANSBnJvb21JZBIbCglyb29tX25hbW'
    'UYAiABKAlSCHJvb21OYW1lEhsKCWdpZnRfbmFtZRgDIAEoCVIIZ2lmdE5hbWUSFwoHcm9sZV9p'
    'ZBgEIAEoA1IGcm9sZUlkEhcKB3NlbmRfaWQYBSABKAlSBnNlbmRJZBImCg9hY2NlcHRfdWlkX2'
    'xpc3QYBiADKAlSDWFjY2VwdFVpZExpc3QSLQoTYWNjZXB0X3JvbGVfaWRfbGlzdBgHIAMoA1IQ'
    'YWNjZXB0Um9sZUlkTGlzdBIUCgVjb3ZlchgIIAEoCVIFY292ZXISFAoFcHJpY2UYCSABKANSBX'
    'ByaWNlEhoKCGN1cnJlbmN5GAogASgFUghjdXJyZW5jeRISCgR0eXBlGAsgASgFUgR0eXBlEhQK'
    'BWNvdW50GAwgASgFUgVjb3VudBIoChBiYW5uZXJfc3R5bGVfdXJsGA0gASgJUg5iYW5uZXJTdH'
    'lsZVVybBIoChBndWlkZV9lbnRyeV9yb29tGA4gASgIUg5ndWlkZUVudHJ5Um9vbRIfCgtiYW5u'
    'ZXJfdHlwZRgPIAEoBVIKYmFubmVyVHlwZQ==');

@$core.Deprecated('Use s_MoreGiftFloatingScreenDescriptor instead')
const S_MoreGiftFloatingScreen$json = {
  '1': 'S_MoreGiftFloatingScreen',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.S_FloatingScreen', '10': 'items'},
    {'1': 'blind_box_name', '3': 2, '4': 1, '5': 9, '10': 'blindBoxName'},
    {'1': 'blind_box_cover', '3': 3, '4': 1, '5': 9, '10': 'blindBoxCover'},
    {'1': 'type', '3': 4, '4': 1, '5': 5, '10': 'type'},
  ],
};

/// Descriptor for `S_MoreGiftFloatingScreen`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_MoreGiftFloatingScreenDescriptor = $convert.base64Decode(
    'ChhTX01vcmVHaWZ0RmxvYXRpbmdTY3JlZW4SNwoFaXRlbXMYASADKAsyIS5jb20uc2F2dnkucH'
    'JvdG8uU19GbG9hdGluZ1NjcmVlblIFaXRlbXMSJAoOYmxpbmRfYm94X25hbWUYAiABKAlSDGJs'
    'aW5kQm94TmFtZRImCg9ibGluZF9ib3hfY292ZXIYAyABKAlSDWJsaW5kQm94Q292ZXISEgoEdH'
    'lwZRgEIAEoBVIEdHlwZQ==');

@$core.Deprecated('Use s_PushPreloadDescriptor instead')
const S_PushPreload$json = {
  '1': 'S_PushPreload',
  '2': [
    {'1': 'clothIds', '3': 1, '4': 3, '5': 5, '10': 'clothIds'},
  ],
};

/// Descriptor for `S_PushPreload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_PushPreloadDescriptor = $convert.base64Decode(
    'Cg1TX1B1c2hQcmVsb2FkEhoKCGNsb3RoSWRzGAEgAygFUghjbG90aElkcw==');

@$core.Deprecated('Use c_UpdateRoleDescriptor instead')
const C_UpdateRole$json = {
  '1': 'C_UpdateRole',
  '2': [
    {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'data_birth', '3': 3, '4': 1, '5': 3, '10': 'dataBirth'},
    {'1': 'media_id', '3': 4, '4': 1, '5': 3, '10': 'mediaId'},
    {'1': 'invite_uid', '3': 5, '4': 1, '5': 9, '10': 'inviteUid'},
  ],
};

/// Descriptor for `C_UpdateRole`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_UpdateRoleDescriptor = $convert.base64Decode(
    'CgxDX1VwZGF0ZVJvbGUSGgoIdXNlcm5hbWUYASABKAlSCHVzZXJuYW1lEiAKC2Rlc2NyaXB0aW'
    '9uGAIgASgJUgtkZXNjcmlwdGlvbhIdCgpkYXRhX2JpcnRoGAMgASgDUglkYXRhQmlydGgSGQoI'
    'bWVkaWFfaWQYBCABKANSB21lZGlhSWQSHQoKaW52aXRlX3VpZBgFIAEoCVIJaW52aXRlVWlk');

@$core.Deprecated('Use s_UpdateRoleDescriptor instead')
const S_UpdateRole$json = {
  '1': 'S_UpdateRole',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.com.savvy.proto.ErrorCode', '10': 'code'},
  ],
};

/// Descriptor for `S_UpdateRole`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_UpdateRoleDescriptor = $convert.base64Decode(
    'CgxTX1VwZGF0ZVJvbGUSLgoEY29kZRgBIAEoDjIaLmNvbS5zYXZ2eS5wcm90by5FcnJvckNvZG'
    'VSBGNvZGU=');

@$core.Deprecated('Use s_UpdateRoleBroadcastDescriptor instead')
const S_UpdateRoleBroadcast$json = {
  '1': 'S_UpdateRoleBroadcast',
  '2': [
    {'1': 'role_id', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'data_birth', '3': 4, '4': 1, '5': 3, '10': 'dataBirth'},
    {'1': 'avatar_url', '3': 8, '4': 1, '5': 9, '10': 'avatarUrl'},
    {'1': 'avatar_extra', '3': 9, '4': 1, '5': 9, '10': 'avatarExtra'},
    {'1': 'uid', '3': 10, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `S_UpdateRoleBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_UpdateRoleBroadcastDescriptor = $convert.base64Decode(
    'ChVTX1VwZGF0ZVJvbGVCcm9hZGNhc3QSFwoHcm9sZV9pZBgBIAEoA1IGcm9sZUlkEhoKCHVzZX'
    'JuYW1lGAIgASgJUgh1c2VybmFtZRIgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24S'
    'HQoKZGF0YV9iaXJ0aBgEIAEoA1IJZGF0YUJpcnRoEh0KCmF2YXRhcl91cmwYCCABKAlSCWF2YX'
    'RhclVybBIhCgxhdmF0YXJfZXh0cmEYCSABKAlSC2F2YXRhckV4dHJhEhAKA3VpZBgKIAEoCVID'
    'dWlk');

@$core.Deprecated('Use c_RoleOnlineDescriptor instead')
const C_RoleOnline$json = {
  '1': 'C_RoleOnline',
  '2': [
    {'1': 'role_id_list', '3': 1, '4': 3, '5': 3, '10': 'roleIdList'},
  ],
};

/// Descriptor for `C_RoleOnline`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_RoleOnlineDescriptor = $convert.base64Decode(
    'CgxDX1JvbGVPbmxpbmUSIAoMcm9sZV9pZF9saXN0GAEgAygDUgpyb2xlSWRMaXN0');

@$core.Deprecated('Use s_RoleOnlineDescriptor instead')
const S_RoleOnline$json = {
  '1': 'S_RoleOnline',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.RoleOnline', '10': 'items'},
  ],
};

/// Descriptor for `S_RoleOnline`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_RoleOnlineDescriptor = $convert.base64Decode(
    'CgxTX1JvbGVPbmxpbmUSMQoFaXRlbXMYASADKAsyGy5jb20uc2F2dnkucHJvdG8uUm9sZU9ubG'
    'luZVIFaXRlbXM=');

@$core.Deprecated('Use c_SaveUserCurrentDressUpDescriptor instead')
const C_SaveUserCurrentDressUp$json = {
  '1': 'C_SaveUserCurrentDressUp',
  '2': [
    {'1': 'product_id_list', '3': 1, '4': 3, '5': 3, '10': 'productIdList'},
  ],
};

/// Descriptor for `C_SaveUserCurrentDressUp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_SaveUserCurrentDressUpDescriptor = $convert.base64Decode(
    'ChhDX1NhdmVVc2VyQ3VycmVudERyZXNzVXASJgoPcHJvZHVjdF9pZF9saXN0GAEgAygDUg1wcm'
    '9kdWN0SWRMaXN0');

@$core.Deprecated('Use c_GoBackDescriptor instead')
const C_GoBack$json = {
  '1': 'C_GoBack',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
  ],
};

/// Descriptor for `C_GoBack`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_GoBackDescriptor = $convert.base64Decode(
    'CghDX0dvQmFjaxIXCgdyb29tX2lkGAEgASgDUgZyb29tSWQ=');

@$core.Deprecated('Use labelItemDescriptor instead')
const LabelItem$json = {
  '1': 'LabelItem',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'icon', '3': 2, '4': 1, '5': 9, '10': 'icon'},
  ],
};

/// Descriptor for `LabelItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List labelItemDescriptor = $convert.base64Decode(
    'CglMYWJlbEl0ZW0SEgoEbmFtZRgBIAEoCVIEbmFtZRISCgRpY29uGAIgASgJUgRpY29u');

@$core.Deprecated('Use productItemDescriptor instead')
const ProductItem$json = {
  '1': 'ProductItem',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'product_no', '3': 2, '4': 1, '5': 3, '10': 'productNo'},
    {'1': 'category_id', '3': 3, '4': 1, '5': 3, '10': 'categoryId'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    {'1': 'image', '3': 5, '4': 1, '5': 9, '10': 'image'},
    {'1': 'price', '3': 6, '4': 1, '5': 3, '10': 'price'},
    {'1': 'currency', '3': 7, '4': 1, '5': 5, '10': 'currency'},
    {'1': 'status', '3': 8, '4': 1, '5': 5, '10': 'status'},
    {'1': 'created_at', '3': 9, '4': 1, '5': 3, '10': 'createdAt'},
    {'1': 'updated_at', '3': 10, '4': 1, '5': 3, '10': 'updatedAt'},
    {'1': 'sell_at', '3': 11, '4': 1, '5': 3, '10': 'sellAt'},
    {'1': 'gender', '3': 12, '4': 1, '5': 5, '10': 'gender'},
    {'1': 'extra', '3': 13, '4': 1, '5': 9, '10': 'extra'},
    {'1': 'product_position_id_list', '3': 14, '4': 3, '5': 3, '10': 'productPositionIdList'},
    {'1': 'model_id', '3': 15, '4': 1, '5': 9, '10': 'modelId'},
    {'1': 'init_dress_up', '3': 16, '4': 1, '5': 8, '10': 'initDressUp'},
    {'1': 'label_list', '3': 17, '4': 3, '5': 11, '6': '.com.savvy.proto.LabelItem', '10': 'labelList'},
    {'1': 'state_name', '3': 18, '4': 1, '5': 9, '10': 'stateName'},
  ],
};

/// Descriptor for `ProductItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List productItemDescriptor = $convert.base64Decode(
    'CgtQcm9kdWN0SXRlbRIOCgJpZBgBIAEoA1ICaWQSHQoKcHJvZHVjdF9ubxgCIAEoA1IJcHJvZH'
    'VjdE5vEh8KC2NhdGVnb3J5X2lkGAMgASgDUgpjYXRlZ29yeUlkEhIKBG5hbWUYBCABKAlSBG5h'
    'bWUSFAoFaW1hZ2UYBSABKAlSBWltYWdlEhQKBXByaWNlGAYgASgDUgVwcmljZRIaCghjdXJyZW'
    '5jeRgHIAEoBVIIY3VycmVuY3kSFgoGc3RhdHVzGAggASgFUgZzdGF0dXMSHQoKY3JlYXRlZF9h'
    'dBgJIAEoA1IJY3JlYXRlZEF0Eh0KCnVwZGF0ZWRfYXQYCiABKANSCXVwZGF0ZWRBdBIXCgdzZW'
    'xsX2F0GAsgASgDUgZzZWxsQXQSFgoGZ2VuZGVyGAwgASgFUgZnZW5kZXISFAoFZXh0cmEYDSAB'
    'KAlSBWV4dHJhEjcKGHByb2R1Y3RfcG9zaXRpb25faWRfbGlzdBgOIAMoA1IVcHJvZHVjdFBvc2'
    'l0aW9uSWRMaXN0EhkKCG1vZGVsX2lkGA8gASgJUgdtb2RlbElkEiIKDWluaXRfZHJlc3NfdXAY'
    'ECABKAhSC2luaXREcmVzc1VwEjkKCmxhYmVsX2xpc3QYESADKAsyGi5jb20uc2F2dnkucHJvdG'
    '8uTGFiZWxJdGVtUglsYWJlbExpc3QSHQoKc3RhdGVfbmFtZRgSIAEoCVIJc3RhdGVOYW1l');

@$core.Deprecated('Use s_SaveUserCurrentDressUpDescriptor instead')
const S_SaveUserCurrentDressUp$json = {
  '1': 'S_SaveUserCurrentDressUp',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.ProductItem', '10': 'items'},
  ],
};

/// Descriptor for `S_SaveUserCurrentDressUp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SaveUserCurrentDressUpDescriptor = $convert.base64Decode(
    'ChhTX1NhdmVVc2VyQ3VycmVudERyZXNzVXASMgoFaXRlbXMYASADKAsyHC5jb20uc2F2dnkucH'
    'JvdG8uUHJvZHVjdEl0ZW1SBWl0ZW1z');

@$core.Deprecated('Use s_UpdateDressUpDescriptor instead')
const S_UpdateDressUp$json = {
  '1': 'S_UpdateDressUp',
  '2': [
    {'1': 'role_id', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'product_id_list', '3': 2, '4': 3, '5': 3, '10': 'productIdList'},
    {'1': 'uid', '3': 3, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `S_UpdateDressUp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_UpdateDressUpDescriptor = $convert.base64Decode(
    'Cg9TX1VwZGF0ZURyZXNzVXASFwoHcm9sZV9pZBgBIAEoA1IGcm9sZUlkEiYKD3Byb2R1Y3RfaW'
    'RfbGlzdBgCIAMoA1INcHJvZHVjdElkTGlzdBIQCgN1aWQYAyABKAlSA3VpZA==');

@$core.Deprecated('Use c_UseProductAndSaveUserCurrentDressUpDescriptor instead')
const C_UseProductAndSaveUserCurrentDressUp$json = {
  '1': 'C_UseProductAndSaveUserCurrentDressUp',
  '2': [
    {'1': 'use_product_id_list', '3': 1, '4': 3, '5': 3, '10': 'useProductIdList'},
    {'1': 'save_dress_up_product_id_list', '3': 2, '4': 3, '5': 3, '10': 'saveDressUpProductIdList'},
  ],
};

/// Descriptor for `C_UseProductAndSaveUserCurrentDressUp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_UseProductAndSaveUserCurrentDressUpDescriptor = $convert.base64Decode(
    'CiVDX1VzZVByb2R1Y3RBbmRTYXZlVXNlckN1cnJlbnREcmVzc1VwEi0KE3VzZV9wcm9kdWN0X2'
    'lkX2xpc3QYASADKANSEHVzZVByb2R1Y3RJZExpc3QSPwodc2F2ZV9kcmVzc191cF9wcm9kdWN0'
    'X2lkX2xpc3QYAiADKANSGHNhdmVEcmVzc1VwUHJvZHVjdElkTGlzdA==');

@$core.Deprecated('Use backpackProductItemDescriptor instead')
const BackpackProductItem$json = {
  '1': 'BackpackProductItem',
  '2': [
    {'1': 'product_id', '3': 1, '4': 1, '5': 3, '10': 'productId'},
    {'1': 'category_id', '3': 2, '4': 1, '5': 3, '10': 'categoryId'},
    {'1': 'price', '3': 3, '4': 1, '5': 3, '10': 'price'},
    {'1': 'currency', '3': 4, '4': 1, '5': 5, '10': 'currency'},
    {'1': 'effective_time', '3': 5, '4': 1, '5': 3, '10': 'effectiveTime'},
    {'1': 'group_id', '3': 6, '4': 1, '5': 3, '10': 'groupId'},
    {'1': 'count', '3': 7, '4': 1, '5': 5, '10': 'count'},
    {'1': 'name', '3': 8, '4': 1, '5': 9, '10': 'name'},
    {'1': 'image', '3': 9, '4': 1, '5': 9, '10': 'image'},
    {'1': 'gender', '3': 10, '4': 1, '5': 5, '10': 'gender'},
    {'1': 'label_list', '3': 11, '4': 3, '5': 11, '6': '.com.savvy.proto.LabelItem', '10': 'labelList'},
  ],
};

/// Descriptor for `BackpackProductItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List backpackProductItemDescriptor = $convert.base64Decode(
    'ChNCYWNrcGFja1Byb2R1Y3RJdGVtEh0KCnByb2R1Y3RfaWQYASABKANSCXByb2R1Y3RJZBIfCg'
    'tjYXRlZ29yeV9pZBgCIAEoA1IKY2F0ZWdvcnlJZBIUCgVwcmljZRgDIAEoA1IFcHJpY2USGgoI'
    'Y3VycmVuY3kYBCABKAVSCGN1cnJlbmN5EiUKDmVmZmVjdGl2ZV90aW1lGAUgASgDUg1lZmZlY3'
    'RpdmVUaW1lEhkKCGdyb3VwX2lkGAYgASgDUgdncm91cElkEhQKBWNvdW50GAcgASgFUgVjb3Vu'
    'dBISCgRuYW1lGAggASgJUgRuYW1lEhQKBWltYWdlGAkgASgJUgVpbWFnZRIWCgZnZW5kZXIYCi'
    'ABKAVSBmdlbmRlchI5CgpsYWJlbF9saXN0GAsgAygLMhouY29tLnNhdnZ5LnByb3RvLkxhYmVs'
    'SXRlbVIJbGFiZWxMaXN0');

@$core.Deprecated('Use s_UseProductAndSaveUserCurrentDressUpDescriptor instead')
const S_UseProductAndSaveUserCurrentDressUp$json = {
  '1': 'S_UseProductAndSaveUserCurrentDressUp',
  '2': [
    {'1': 'user_dress_up_product_list', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.ProductItem', '10': 'userDressUpProductList'},
    {'1': 'use_product_list', '3': 2, '4': 3, '5': 11, '6': '.com.savvy.proto.BackpackProductItem', '10': 'useProductList'},
  ],
};

/// Descriptor for `S_UseProductAndSaveUserCurrentDressUp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_UseProductAndSaveUserCurrentDressUpDescriptor = $convert.base64Decode(
    'CiVTX1VzZVByb2R1Y3RBbmRTYXZlVXNlckN1cnJlbnREcmVzc1VwElgKGnVzZXJfZHJlc3NfdX'
    'BfcHJvZHVjdF9saXN0GAEgAygLMhwuY29tLnNhdnZ5LnByb3RvLlByb2R1Y3RJdGVtUhZ1c2Vy'
    'RHJlc3NVcFByb2R1Y3RMaXN0Ek4KEHVzZV9wcm9kdWN0X2xpc3QYAiADKAsyJC5jb20uc2F2dn'
    'kucHJvdG8uQmFja3BhY2tQcm9kdWN0SXRlbVIOdXNlUHJvZHVjdExpc3Q=');

@$core.Deprecated('Use s_BulletinBroadcastDescriptor instead')
const S_BulletinBroadcast$json = {
  '1': 'S_BulletinBroadcast',
  '2': [
    {'1': 'bulletin_id', '3': 1, '4': 1, '5': 3, '10': 'bulletinId'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `S_BulletinBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_BulletinBroadcastDescriptor = $convert.base64Decode(
    'ChNTX0J1bGxldGluQnJvYWRjYXN0Eh8KC2J1bGxldGluX2lkGAEgASgDUgpidWxsZXRpbklkEh'
    'gKB21lc3NhZ2UYAiABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use s_CameraSwitchDescriptor instead')
const S_CameraSwitch$json = {
  '1': 'S_CameraSwitch',
  '2': [
    {'1': 'position', '3': 1, '4': 1, '5': 5, '10': 'position'},
  ],
};

/// Descriptor for `S_CameraSwitch`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_CameraSwitchDescriptor = $convert.base64Decode(
    'Cg5TX0NhbWVyYVN3aXRjaBIaCghwb3NpdGlvbhgBIAEoBVIIcG9zaXRpb24=');

@$core.Deprecated('Use c_PKInviteDescriptor instead')
const C_PKInvite$json = {
  '1': 'C_PKInvite',
  '2': [
    {'1': 'selfGuildId', '3': 1, '4': 1, '5': 3, '10': 'selfGuildId'},
    {'1': 'invitedGuildId', '3': 2, '4': 1, '5': 3, '10': 'invitedGuildId'},
  ],
};

/// Descriptor for `C_PKInvite`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_PKInviteDescriptor = $convert.base64Decode(
    'CgpDX1BLSW52aXRlEiAKC3NlbGZHdWlsZElkGAEgASgDUgtzZWxmR3VpbGRJZBImCg5pbnZpdG'
    'VkR3VpbGRJZBgCIAEoA1IOaW52aXRlZEd1aWxkSWQ=');

@$core.Deprecated('Use s_PKInviteDescriptor instead')
const S_PKInvite$json = {
  '1': 'S_PKInvite',
  '2': [
    {'1': 'invitingGuildId', '3': 1, '4': 1, '5': 3, '10': 'invitingGuildId'},
    {'1': 'invitingGuildName', '3': 2, '4': 1, '5': 9, '10': 'invitingGuildName'},
  ],
};

/// Descriptor for `S_PKInvite`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_PKInviteDescriptor = $convert.base64Decode(
    'CgpTX1BLSW52aXRlEigKD2ludml0aW5nR3VpbGRJZBgBIAEoA1IPaW52aXRpbmdHdWlsZElkEi'
    'wKEWludml0aW5nR3VpbGROYW1lGAIgASgJUhFpbnZpdGluZ0d1aWxkTmFtZQ==');

@$core.Deprecated('Use c_PKAcceptDescriptor instead')
const C_PKAccept$json = {
  '1': 'C_PKAccept',
  '2': [
    {'1': 'accept', '3': 1, '4': 1, '5': 8, '10': 'accept'},
    {'1': 'invitingGuildId', '3': 2, '4': 1, '5': 3, '10': 'invitingGuildId'},
  ],
};

/// Descriptor for `C_PKAccept`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_PKAcceptDescriptor = $convert.base64Decode(
    'CgpDX1BLQWNjZXB0EhYKBmFjY2VwdBgBIAEoCFIGYWNjZXB0EigKD2ludml0aW5nR3VpbGRJZB'
    'gCIAEoA1IPaW52aXRpbmdHdWlsZElk');

@$core.Deprecated('Use s_PKInviteResultDescriptor instead')
const S_PKInviteResult$json = {
  '1': 'S_PKInviteResult',
  '2': [
    {'1': 'isSuccess', '3': 1, '4': 1, '5': 8, '10': 'isSuccess'},
    {'1': 'pkRoomId', '3': 2, '4': 1, '5': 3, '10': 'pkRoomId'},
  ],
};

/// Descriptor for `S_PKInviteResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_PKInviteResultDescriptor = $convert.base64Decode(
    'ChBTX1BLSW52aXRlUmVzdWx0EhwKCWlzU3VjY2VzcxgBIAEoCFIJaXNTdWNjZXNzEhoKCHBrUm'
    '9vbUlkGAIgASgDUghwa1Jvb21JZA==');

@$core.Deprecated('Use pKCreateRoleInfoDescriptor instead')
const PKCreateRoleInfo$json = {
  '1': 'PKCreateRoleInfo',
  '2': [
    {'1': 'userInfo', '3': 1, '4': 1, '5': 11, '6': '.com.savvy.proto.PKUserInfo', '10': 'userInfo'},
    {'1': 'roleInfoLf', '3': 2, '4': 1, '5': 11, '6': '.com.savvy.proto.PKRoleBattleInfoLF', '10': 'roleInfoLf'},
    {'1': 'roleInfoHf', '3': 3, '4': 1, '5': 11, '6': '.com.savvy.proto.PKRoleBattleInfoHF', '10': 'roleInfoHf'},
  ],
};

/// Descriptor for `PKCreateRoleInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pKCreateRoleInfoDescriptor = $convert.base64Decode(
    'ChBQS0NyZWF0ZVJvbGVJbmZvEjcKCHVzZXJJbmZvGAEgASgLMhsuY29tLnNhdnZ5LnByb3RvLl'
    'BLVXNlckluZm9SCHVzZXJJbmZvEkMKCnJvbGVJbmZvTGYYAiABKAsyIy5jb20uc2F2dnkucHJv'
    'dG8uUEtSb2xlQmF0dGxlSW5mb0xGUgpyb2xlSW5mb0xmEkMKCnJvbGVJbmZvSGYYAyABKAsyIy'
    '5jb20uc2F2dnkucHJvdG8uUEtSb2xlQmF0dGxlSW5mb0hGUgpyb2xlSW5mb0hm');

@$core.Deprecated('Use c_PKSceneLoadedDescriptor instead')
const C_PKSceneLoaded$json = {
  '1': 'C_PKSceneLoaded',
  '2': [
    {'1': 'pkRoomId', '3': 1, '4': 1, '5': 3, '10': 'pkRoomId'},
  ],
};

/// Descriptor for `C_PKSceneLoaded`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_PKSceneLoadedDescriptor = $convert.base64Decode(
    'Cg9DX1BLU2NlbmVMb2FkZWQSGgoIcGtSb29tSWQYASABKANSCHBrUm9vbUlk');

@$core.Deprecated('Use s_PKGameInfoDescriptor instead')
const S_PKGameInfo$json = {
  '1': 'S_PKGameInfo',
  '2': [
    {'1': 'inviterGuild', '3': 1, '4': 1, '5': 11, '6': '.com.savvy.proto.PKGuildInfo', '10': 'inviterGuild'},
    {'1': 'acceptGuild', '3': 2, '4': 1, '5': 11, '6': '.com.savvy.proto.PKGuildInfo', '10': 'acceptGuild'},
    {'1': 'weapon_show_total', '3': 3, '4': 1, '5': 5, '10': 'weaponShowTotal'},
    {'1': 'weapon_width', '3': 4, '4': 1, '5': 5, '10': 'weaponWidth'},
    {'1': 'weapon_length', '3': 5, '4': 1, '5': 5, '10': 'weaponLength'},
    {'1': 'weapon_speed', '3': 6, '4': 1, '5': 5, '10': 'weaponSpeed'},
    {'1': 'gameRoles', '3': 7, '4': 3, '5': 11, '6': '.com.savvy.proto.PKCreateRoleInfo', '10': 'gameRoles'},
    {'1': 'battleStartTime', '3': 8, '4': 1, '5': 3, '10': 'battleStartTime'},
    {'1': 'sceneRadius', '3': 9, '4': 1, '5': 5, '10': 'sceneRadius'},
    {'1': 'sceneToxicList', '3': 10, '4': 3, '5': 11, '6': '.com.savvy.proto.PKSceneToxic', '10': 'sceneToxicList'},
    {'1': 'gifts', '3': 11, '4': 3, '5': 11, '6': '.com.savvy.proto.PKGift', '10': 'gifts'},
    {'1': 'battleStatus', '3': 12, '4': 1, '5': 5, '10': 'battleStatus'},
  ],
};

/// Descriptor for `S_PKGameInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_PKGameInfoDescriptor = $convert.base64Decode(
    'CgxTX1BLR2FtZUluZm8SQAoMaW52aXRlckd1aWxkGAEgASgLMhwuY29tLnNhdnZ5LnByb3RvLl'
    'BLR3VpbGRJbmZvUgxpbnZpdGVyR3VpbGQSPgoLYWNjZXB0R3VpbGQYAiABKAsyHC5jb20uc2F2'
    'dnkucHJvdG8uUEtHdWlsZEluZm9SC2FjY2VwdEd1aWxkEioKEXdlYXBvbl9zaG93X3RvdGFsGA'
    'MgASgFUg93ZWFwb25TaG93VG90YWwSIQoMd2VhcG9uX3dpZHRoGAQgASgFUgt3ZWFwb25XaWR0'
    'aBIjCg13ZWFwb25fbGVuZ3RoGAUgASgFUgx3ZWFwb25MZW5ndGgSIQoMd2VhcG9uX3NwZWVkGA'
    'YgASgFUgt3ZWFwb25TcGVlZBI/CglnYW1lUm9sZXMYByADKAsyIS5jb20uc2F2dnkucHJvdG8u'
    'UEtDcmVhdGVSb2xlSW5mb1IJZ2FtZVJvbGVzEigKD2JhdHRsZVN0YXJ0VGltZRgIIAEoA1IPYm'
    'F0dGxlU3RhcnRUaW1lEiAKC3NjZW5lUmFkaXVzGAkgASgFUgtzY2VuZVJhZGl1cxJFCg5zY2Vu'
    'ZVRveGljTGlzdBgKIAMoCzIdLmNvbS5zYXZ2eS5wcm90by5QS1NjZW5lVG94aWNSDnNjZW5lVG'
    '94aWNMaXN0Ei0KBWdpZnRzGAsgAygLMhcuY29tLnNhdnZ5LnByb3RvLlBLR2lmdFIFZ2lmdHMS'
    'IgoMYmF0dGxlU3RhdHVzGAwgASgFUgxiYXR0bGVTdGF0dXM=');

@$core.Deprecated('Use s_PKSyncRolesDescriptor instead')
const S_PKSyncRoles$json = {
  '1': 'S_PKSyncRoles',
  '2': [
    {'1': 'roleIds', '3': 1, '4': 3, '5': 3, '10': 'roleIds'},
  ],
};

/// Descriptor for `S_PKSyncRoles`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_PKSyncRolesDescriptor = $convert.base64Decode(
    'Cg1TX1BLU3luY1JvbGVzEhgKB3JvbGVJZHMYASADKANSB3JvbGVJZHM=');

@$core.Deprecated('Use s_PKUserEnterDescriptor instead')
const S_PKUserEnter$json = {
  '1': 'S_PKUserEnter',
  '2': [
    {'1': 'userInfo', '3': 1, '4': 1, '5': 11, '6': '.com.savvy.proto.PKUserInfo', '10': 'userInfo'},
    {'1': 'battle_start_time', '3': 2, '4': 1, '5': 3, '10': 'battleStartTime'},
  ],
};

/// Descriptor for `S_PKUserEnter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_PKUserEnterDescriptor = $convert.base64Decode(
    'Cg1TX1BLVXNlckVudGVyEjcKCHVzZXJJbmZvGAEgASgLMhsuY29tLnNhdnZ5LnByb3RvLlBLVX'
    'NlckluZm9SCHVzZXJJbmZvEioKEWJhdHRsZV9zdGFydF90aW1lGAIgASgDUg9iYXR0bGVTdGFy'
    'dFRpbWU=');

@$core.Deprecated('Use c_PKBattleReadyDescriptor instead')
const C_PKBattleReady$json = {
  '1': 'C_PKBattleReady',
  '2': [
    {'1': 'pkRoomId', '3': 1, '4': 1, '5': 3, '10': 'pkRoomId'},
  ],
};

/// Descriptor for `C_PKBattleReady`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_PKBattleReadyDescriptor = $convert.base64Decode(
    'Cg9DX1BLQmF0dGxlUmVhZHkSGgoIcGtSb29tSWQYASABKANSCHBrUm9vbUlk');

@$core.Deprecated('Use c_PKMoveDescriptor instead')
const C_PKMove$json = {
  '1': 'C_PKMove',
  '2': [
    {'1': 'rotation', '3': 1, '4': 1, '5': 5, '10': 'rotation'},
  ],
};

/// Descriptor for `C_PKMove`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_PKMoveDescriptor = $convert.base64Decode(
    'CghDX1BLTW92ZRIaCghyb3RhdGlvbhgBIAEoBVIIcm90YXRpb24=');

@$core.Deprecated('Use s_PKSyncRoleAttsLFDescriptor instead')
const S_PKSyncRoleAttsLF$json = {
  '1': 'S_PKSyncRoleAttsLF',
  '2': [
    {'1': 'roleInfos', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.PKRoleBattleInfoLF', '10': 'roleInfos'},
  ],
};

/// Descriptor for `S_PKSyncRoleAttsLF`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_PKSyncRoleAttsLFDescriptor = $convert.base64Decode(
    'ChJTX1BLU3luY1JvbGVBdHRzTEYSQQoJcm9sZUluZm9zGAEgAygLMiMuY29tLnNhdnZ5LnByb3'
    'RvLlBLUm9sZUJhdHRsZUluZm9MRlIJcm9sZUluZm9z');

@$core.Deprecated('Use s_PKSyncRoleAttsHFDescriptor instead')
const S_PKSyncRoleAttsHF$json = {
  '1': 'S_PKSyncRoleAttsHF',
  '2': [
    {'1': 'roleInfos', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.PKRoleBattleInfoHF', '10': 'roleInfos'},
  ],
};

/// Descriptor for `S_PKSyncRoleAttsHF`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_PKSyncRoleAttsHFDescriptor = $convert.base64Decode(
    'ChJTX1BLU3luY1JvbGVBdHRzSEYSQQoJcm9sZUluZm9zGAEgAygLMiMuY29tLnNhdnZ5LnByb3'
    'RvLlBLUm9sZUJhdHRsZUluZm9IRlIJcm9sZUluZm9z');

@$core.Deprecated('Use s_PKSceneToxicDescriptor instead')
const S_PKSceneToxic$json = {
  '1': 'S_PKSceneToxic',
  '2': [
    {'1': 'sceneToxics', '3': 1, '4': 1, '5': 11, '6': '.com.savvy.proto.PKSceneToxic', '10': 'sceneToxics'},
  ],
};

/// Descriptor for `S_PKSceneToxic`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_PKSceneToxicDescriptor = $convert.base64Decode(
    'Cg5TX1BLU2NlbmVUb3hpYxI/CgtzY2VuZVRveGljcxgBIAEoCzIdLmNvbS5zYXZ2eS5wcm90by'
    '5QS1NjZW5lVG94aWNSC3NjZW5lVG94aWNz');

@$core.Deprecated('Use s_PKSceneGiftDescriptor instead')
const S_PKSceneGift$json = {
  '1': 'S_PKSceneGift',
  '2': [
    {'1': 'gifts', '3': 4, '4': 3, '5': 11, '6': '.com.savvy.proto.PKGift', '10': 'gifts'},
  ],
};

/// Descriptor for `S_PKSceneGift`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_PKSceneGiftDescriptor = $convert.base64Decode(
    'Cg1TX1BLU2NlbmVHaWZ0Ei0KBWdpZnRzGAQgAygLMhcuY29tLnNhdnZ5LnByb3RvLlBLR2lmdF'
    'IFZ2lmdHM=');

@$core.Deprecated('Use s_PKBattleEndDescriptor instead')
const S_PKBattleEnd$json = {
  '1': 'S_PKBattleEnd',
  '2': [
    {'1': 'winGuildId', '3': 1, '4': 1, '5': 3, '10': 'winGuildId'},
    {'1': 'roleInfos', '3': 2, '4': 3, '5': 11, '6': '.com.savvy.proto.PKRoleSummary', '10': 'roleInfos'},
    {'1': 'presenterInfo', '3': 3, '4': 3, '5': 11, '6': '.com.savvy.proto.PKPresenterInfo', '10': 'presenterInfo'},
  ],
};

/// Descriptor for `S_PKBattleEnd`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_PKBattleEndDescriptor = $convert.base64Decode(
    'Cg1TX1BLQmF0dGxlRW5kEh4KCndpbkd1aWxkSWQYASABKANSCndpbkd1aWxkSWQSPAoJcm9sZU'
    'luZm9zGAIgAygLMh4uY29tLnNhdnZ5LnByb3RvLlBLUm9sZVN1bW1hcnlSCXJvbGVJbmZvcxJG'
    'Cg1wcmVzZW50ZXJJbmZvGAMgAygLMiAuY29tLnNhdnZ5LnByb3RvLlBLUHJlc2VudGVySW5mb1'
    'INcHJlc2VudGVySW5mbw==');

@$core.Deprecated('Use c_PKContinueDescriptor instead')
const C_PKContinue$json = {
  '1': 'C_PKContinue',
  '2': [
    {'1': 'isContinue', '3': 1, '4': 1, '5': 5, '10': 'isContinue'},
    {'1': 'pkRoomId', '3': 2, '4': 1, '5': 3, '10': 'pkRoomId'},
  ],
};

/// Descriptor for `C_PKContinue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_PKContinueDescriptor = $convert.base64Decode(
    'CgxDX1BLQ29udGludWUSHgoKaXNDb250aW51ZRgBIAEoBVIKaXNDb250aW51ZRIaCghwa1Jvb2'
    '1JZBgCIAEoA1IIcGtSb29tSWQ=');

@$core.Deprecated('Use s_PKContinueDescriptor instead')
const S_PKContinue$json = {
  '1': 'S_PKContinue',
  '2': [
    {'1': 'isContinue', '3': 1, '4': 1, '5': 5, '10': 'isContinue'},
  ],
};

/// Descriptor for `S_PKContinue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_PKContinueDescriptor = $convert.base64Decode(
    'CgxTX1BLQ29udGludWUSHgoKaXNDb250aW51ZRgBIAEoBVIKaXNDb250aW51ZQ==');

@$core.Deprecated('Use c_PKRoomListDescriptor instead')
const C_PKRoomList$json = {
  '1': 'C_PKRoomList',
  '2': [
    {'1': 'offset', '3': 1, '4': 1, '5': 3, '10': 'offset'},
    {'1': 'limit', '3': 2, '4': 1, '5': 3, '10': 'limit'},
  ],
};

/// Descriptor for `C_PKRoomList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_PKRoomListDescriptor = $convert.base64Decode(
    'CgxDX1BLUm9vbUxpc3QSFgoGb2Zmc2V0GAEgASgDUgZvZmZzZXQSFAoFbGltaXQYAiABKANSBW'
    'xpbWl0');

@$core.Deprecated('Use s_PKRoomListDescriptor instead')
const S_PKRoomList$json = {
  '1': 'S_PKRoomList',
  '2': [
    {'1': 'room_list', '3': 2, '4': 3, '5': 11, '6': '.com.savvy.proto.PkRoomInfo', '10': 'roomList'},
  ],
};

/// Descriptor for `S_PKRoomList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_PKRoomListDescriptor = $convert.base64Decode(
    'CgxTX1BLUm9vbUxpc3QSOAoJcm9vbV9saXN0GAIgAygLMhsuY29tLnNhdnZ5LnByb3RvLlBrUm'
    '9vbUluZm9SCHJvb21MaXN0');

@$core.Deprecated('Use c_MoveDescriptor instead')
const C_Move$json = {
  '1': 'C_Move',
  '2': [
    {'1': 'xyz', '3': 1, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZ', '10': 'xyz'},
    {'1': 'r', '3': 2, '4': 1, '5': 5, '10': 'r'},
    {'1': 'state', '3': 3, '4': 1, '5': 14, '6': '.com.savvy.proto.State', '10': 'state'},
  ],
};

/// Descriptor for `C_Move`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_MoveDescriptor = $convert.base64Decode(
    'CgZDX01vdmUSJgoDeHl6GAEgASgLMhQuY29tLnNhdnZ5LnByb3RvLlhZWlIDeHl6EgwKAXIYAi'
    'ABKAVSAXISLAoFc3RhdGUYAyABKA4yFi5jb20uc2F2dnkucHJvdG8uU3RhdGVSBXN0YXRl');

@$core.Deprecated('Use s_MoveDescriptor instead')
const S_Move$json = {
  '1': 'S_Move',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 3, '10': 'ids'},
    {'1': 'list', '3': 2, '4': 3, '5': 11, '6': '.com.savvy.proto.C_Move', '10': 'list'},
  ],
};

/// Descriptor for `S_Move`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_MoveDescriptor = $convert.base64Decode(
    'CgZTX01vdmUSEAoDaWRzGAEgAygDUgNpZHMSKwoEbGlzdBgCIAMoCzIXLmNvbS5zYXZ2eS5wcm'
    '90by5DX01vdmVSBGxpc3Q=');

@$core.Deprecated('Use s_DialogDescriptor instead')
const S_Dialog$json = {
  '1': 'S_Dialog',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 3, '10': 'ids'},
    {'1': 'contents', '3': 2, '4': 3, '5': 9, '10': 'contents'},
  ],
};

/// Descriptor for `S_Dialog`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_DialogDescriptor = $convert.base64Decode(
    'CghTX0RpYWxvZxIQCgNpZHMYASADKANSA2lkcxIaCghjb250ZW50cxgCIAMoCVIIY29udGVudH'
    'M=');

@$core.Deprecated('Use s_UpdateDesignationDescriptor instead')
const S_UpdateDesignation$json = {
  '1': 'S_UpdateDesignation',
  '2': [
    {'1': 'role_id', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'designation_model_id', '3': 2, '4': 1, '5': 9, '10': 'designationModelId'},
    {'1': 'uid', '3': 3, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `S_UpdateDesignation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_UpdateDesignationDescriptor = $convert.base64Decode(
    'ChNTX1VwZGF0ZURlc2lnbmF0aW9uEhcKB3JvbGVfaWQYASABKANSBnJvbGVJZBIwChRkZXNpZ2'
    '5hdGlvbl9tb2RlbF9pZBgCIAEoCVISZGVzaWduYXRpb25Nb2RlbElkEhAKA3VpZBgDIAEoCVID'
    'dWlk');

@$core.Deprecated('Use c_ChangeDesignationDescriptor instead')
const C_ChangeDesignation$json = {
  '1': 'C_ChangeDesignation',
  '2': [
    {'1': 'designation_id', '3': 1, '4': 1, '5': 3, '10': 'designationId'},
    {'1': 'room_id', '3': 2, '4': 1, '5': 3, '10': 'roomId'},
  ],
};

/// Descriptor for `C_ChangeDesignation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_ChangeDesignationDescriptor = $convert.base64Decode(
    'ChNDX0NoYW5nZURlc2lnbmF0aW9uEiUKDmRlc2lnbmF0aW9uX2lkGAEgASgDUg1kZXNpZ25hdG'
    'lvbklkEhcKB3Jvb21faWQYAiABKANSBnJvb21JZA==');

@$core.Deprecated('Use s_ChangeDesignationDescriptor instead')
const S_ChangeDesignation$json = {
  '1': 'S_ChangeDesignation',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.com.savvy.proto.ErrorCode', '10': 'code'},
  ],
};

/// Descriptor for `S_ChangeDesignation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_ChangeDesignationDescriptor = $convert.base64Decode(
    'ChNTX0NoYW5nZURlc2lnbmF0aW9uEi4KBGNvZGUYASABKA4yGi5jb20uc2F2dnkucHJvdG8uRX'
    'Jyb3JDb2RlUgRjb2Rl');

@$core.Deprecated('Use c_QueryDesignationDescriptor instead')
const C_QueryDesignation$json = {
  '1': 'C_QueryDesignation',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 5, '10': 'type'},
  ],
};

/// Descriptor for `C_QueryDesignation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_QueryDesignationDescriptor = $convert.base64Decode(
    'ChJDX1F1ZXJ5RGVzaWduYXRpb24SEgoEdHlwZRgBIAEoBVIEdHlwZQ==');

@$core.Deprecated('Use queryDesignationItemDescriptor instead')
const QueryDesignationItem$json = {
  '1': 'QueryDesignationItem',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'image', '3': 3, '4': 1, '5': 9, '10': 'image'},
    {'1': 'is_dress_up', '3': 4, '4': 1, '5': 8, '10': 'isDressUp'},
    {'1': 'is_already_own', '3': 5, '4': 1, '5': 8, '10': 'isAlreadyOwn'},
  ],
};

/// Descriptor for `QueryDesignationItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDesignationItemDescriptor = $convert.base64Decode(
    'ChRRdWVyeURlc2lnbmF0aW9uSXRlbRIOCgJpZBgBIAEoA1ICaWQSEgoEbmFtZRgCIAEoCVIEbm'
    'FtZRIUCgVpbWFnZRgDIAEoCVIFaW1hZ2USHgoLaXNfZHJlc3NfdXAYBCABKAhSCWlzRHJlc3NV'
    'cBIkCg5pc19hbHJlYWR5X293bhgFIAEoCFIMaXNBbHJlYWR5T3du');

@$core.Deprecated('Use s_QueryDesignationDescriptor instead')
const S_QueryDesignation$json = {
  '1': 'S_QueryDesignation',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.QueryDesignationItem', '10': 'items'},
  ],
};

/// Descriptor for `S_QueryDesignation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_QueryDesignationDescriptor = $convert.base64Decode(
    'ChJTX1F1ZXJ5RGVzaWduYXRpb24SOwoFaXRlbXMYASADKAsyJS5jb20uc2F2dnkucHJvdG8uUX'
    'VlcnlEZXNpZ25hdGlvbkl0ZW1SBWl0ZW1z');

@$core.Deprecated('Use s_BlindBoxItemDescriptor instead')
const S_BlindBoxItem$json = {
  '1': 'S_BlindBoxItem',
  '2': [
    {'1': 'gift_id', '3': 1, '4': 1, '5': 3, '10': 'giftId'},
    {'1': 'cover', '3': 2, '4': 1, '5': 9, '10': 'cover'},
    {'1': 'price', '3': 3, '4': 1, '5': 3, '10': 'price'},
    {'1': 'currency', '3': 4, '4': 1, '5': 5, '10': 'currency'},
    {'1': 'type', '3': 5, '4': 1, '5': 5, '10': 'type'},
    {'1': 'name', '3': 6, '4': 1, '5': 9, '10': 'name'},
    {'1': 'count', '3': 7, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `S_BlindBoxItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_BlindBoxItemDescriptor = $convert.base64Decode(
    'Cg5TX0JsaW5kQm94SXRlbRIXCgdnaWZ0X2lkGAEgASgDUgZnaWZ0SWQSFAoFY292ZXIYAiABKA'
    'lSBWNvdmVyEhQKBXByaWNlGAMgASgDUgVwcmljZRIaCghjdXJyZW5jeRgEIAEoBVIIY3VycmVu'
    'Y3kSEgoEdHlwZRgFIAEoBVIEdHlwZRISCgRuYW1lGAYgASgJUgRuYW1lEhQKBWNvdW50GAcgAS'
    'gFUgVjb3VudA==');

@$core.Deprecated('Use s_BlindBoxDescriptor instead')
const S_BlindBox$json = {
  '1': 'S_BlindBox',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.S_BlindBoxItem', '10': 'items'},
    {'1': 'blind_box_name', '3': 2, '4': 1, '5': 9, '10': 'blindBoxName'},
    {'1': 'blind_box_cover', '3': 3, '4': 1, '5': 9, '10': 'blindBoxCover'},
    {'1': 'blind_box_count', '3': 5, '4': 1, '5': 5, '10': 'blindBoxCount'},
    {'1': 'blind_box_id', '3': 6, '4': 1, '5': 3, '10': 'blindBoxId'},
    {'1': 'blind_box_type', '3': 7, '4': 1, '5': 5, '10': 'blindBoxType'},
  ],
};

/// Descriptor for `S_BlindBox`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_BlindBoxDescriptor = $convert.base64Decode(
    'CgpTX0JsaW5kQm94EjUKBWl0ZW1zGAEgAygLMh8uY29tLnNhdnZ5LnByb3RvLlNfQmxpbmRCb3'
    'hJdGVtUgVpdGVtcxIkCg5ibGluZF9ib3hfbmFtZRgCIAEoCVIMYmxpbmRCb3hOYW1lEiYKD2Js'
    'aW5kX2JveF9jb3ZlchgDIAEoCVINYmxpbmRCb3hDb3ZlchImCg9ibGluZF9ib3hfY291bnQYBS'
    'ABKAVSDWJsaW5kQm94Q291bnQSIAoMYmxpbmRfYm94X2lkGAYgASgDUgpibGluZEJveElkEiQK'
    'DmJsaW5kX2JveF90eXBlGAcgASgFUgxibGluZEJveFR5cGU=');

@$core.Deprecated('Use c_GiveGiftByOneClickDescriptor instead')
const C_GiveGiftByOneClick$json = {
  '1': 'C_GiveGiftByOneClick',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'accept_uid', '3': 4, '4': 1, '5': 9, '10': 'acceptUid'},
    {'1': 'accept_role_id', '3': 5, '4': 1, '5': 3, '10': 'acceptRoleId'},
  ],
};

/// Descriptor for `C_GiveGiftByOneClick`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_GiveGiftByOneClickDescriptor = $convert.base64Decode(
    'ChRDX0dpdmVHaWZ0QnlPbmVDbGljaxIXCgdyb29tX2lkGAEgASgDUgZyb29tSWQSHQoKYWNjZX'
    'B0X3VpZBgEIAEoCVIJYWNjZXB0VWlkEiQKDmFjY2VwdF9yb2xlX2lkGAUgASgDUgxhY2NlcHRS'
    'b2xlSWQ=');

@$core.Deprecated('Use s_GiveGiftByOneClickDescriptor instead')
const S_GiveGiftByOneClick$json = {
  '1': 'S_GiveGiftByOneClick',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.com.savvy.proto.ErrorCode', '10': 'code'},
  ],
};

/// Descriptor for `S_GiveGiftByOneClick`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_GiveGiftByOneClickDescriptor = $convert.base64Decode(
    'ChRTX0dpdmVHaWZ0QnlPbmVDbGljaxIuCgRjb2RlGAEgASgOMhouY29tLnNhdnZ5LnByb3RvLk'
    'Vycm9yQ29kZVIEY29kZQ==');

@$core.Deprecated('Use luckScreenItemDescriptor instead')
const LuckScreenItem$json = {
  '1': 'LuckScreenItem',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'game_name', '3': 3, '4': 1, '5': 9, '10': 'gameName'},
    {'1': 'price', '3': 4, '4': 1, '5': 5, '10': 'price'},
    {'1': 'gift_name', '3': 5, '4': 1, '5': 9, '10': 'giftName'},
    {'1': 'count', '3': 6, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `LuckScreenItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List luckScreenItemDescriptor = $convert.base64Decode(
    'Cg5MdWNrU2NyZWVuSXRlbRIQCgN1aWQYASABKAlSA3VpZBIbCglnYW1lX25hbWUYAyABKAlSCG'
    'dhbWVOYW1lEhQKBXByaWNlGAQgASgFUgVwcmljZRIbCglnaWZ0X25hbWUYBSABKAlSCGdpZnRO'
    'YW1lEhQKBWNvdW50GAYgASgFUgVjb3VudA==');

@$core.Deprecated('Use s_LuckScreenDescriptor instead')
const S_LuckScreen$json = {
  '1': 'S_LuckScreen',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.LuckScreenItem', '10': 'items'},
  ],
};

/// Descriptor for `S_LuckScreen`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_LuckScreenDescriptor = $convert.base64Decode(
    'CgxTX0x1Y2tTY3JlZW4SNQoFaXRlbXMYASADKAsyHy5jb20uc2F2dnkucHJvdG8uTHVja1Njcm'
    'Vlbkl0ZW1SBWl0ZW1z');

@$core.Deprecated('Use allScreenItemDescriptor instead')
const AllScreenItem$json = {
  '1': 'AllScreenItem',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'room_name', '3': 2, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'user_name', '3': 3, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'gift_name', '3': 4, '4': 1, '5': 9, '10': 'giftName'},
    {'1': 'room_id', '3': 5, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'role_id', '3': 6, '4': 1, '5': 3, '10': 'roleId'},
  ],
};

/// Descriptor for `AllScreenItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List allScreenItemDescriptor = $convert.base64Decode(
    'Cg1BbGxTY3JlZW5JdGVtEhAKA3VpZBgBIAEoCVIDdWlkEhsKCXJvb21fbmFtZRgCIAEoCVIIcm'
    '9vbU5hbWUSGwoJdXNlcl9uYW1lGAMgASgJUgh1c2VyTmFtZRIbCglnaWZ0X25hbWUYBCABKAlS'
    'CGdpZnROYW1lEhcKB3Jvb21faWQYBSABKANSBnJvb21JZBIXCgdyb2xlX2lkGAYgASgDUgZyb2'
    'xlSWQ=');

@$core.Deprecated('Use s_AllScreenDescriptor instead')
const S_AllScreen$json = {
  '1': 'S_AllScreen',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.AllScreenItem', '10': 'items'},
  ],
};

/// Descriptor for `S_AllScreen`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_AllScreenDescriptor = $convert.base64Decode(
    'CgtTX0FsbFNjcmVlbhI0CgVpdGVtcxgBIAMoCzIeLmNvbS5zYXZ2eS5wcm90by5BbGxTY3JlZW'
    '5JdGVtUgVpdGVtcw==');

