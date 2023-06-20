///
//  Generated code. Do not modify.
//  source: Message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use s_SysTimeDescriptor instead')
const S_SysTime$json = const {
  '1': 'S_SysTime',
  '2': const [
    const {'1': 'time', '3': 1, '4': 1, '5': 3, '10': 'time'},
  ],
};

/// Descriptor for `S_SysTime`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SysTimeDescriptor = $convert.base64Decode('CglTX1N5c1RpbWUSEgoEdGltZRgBIAEoA1IEdGltZQ==');
@$core.Deprecated('Use s_ErrDescriptor instead')
const S_Err$json = const {
  '1': 'S_Err',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.com.savvy.proto.ErrorCode', '10': 'code'},
  ],
};

/// Descriptor for `S_Err`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_ErrDescriptor = $convert.base64Decode('CgVTX0VychIuCgRjb2RlGAEgASgOMhouY29tLnNhdnZ5LnByb3RvLkVycm9yQ29kZVIEY29kZQ==');
@$core.Deprecated('Use s_TipsDescriptor instead')
const S_Tips$json = const {
  '1': 'S_Tips',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.com.savvy.proto.S_Tips.Code', '10': 'code'},
    const {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
  ],
  '4': const [S_Tips_Code$json],
};

@$core.Deprecated('Use s_TipsDescriptor instead')
const S_Tips_Code$json = const {
  '1': 'Code',
  '2': const [
    const {'1': 'MESSAGE', '2': 0},
    const {'1': 'ALERT', '2': 1},
    const {'1': 'ROLL', '2': 2},
  ],
};

/// Descriptor for `S_Tips`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_TipsDescriptor = $convert.base64Decode('CgZTX1RpcHMSMAoEY29kZRgBIAEoDjIcLmNvbS5zYXZ2eS5wcm90by5TX1RpcHMuQ29kZVIEY29kZRIQCgNtc2cYAiABKAlSA21zZyIoCgRDb2RlEgsKB01FU1NBR0UQABIJCgVBTEVSVBABEggKBFJPTEwQAg==');
@$core.Deprecated('Use s_GMDescriptor instead')
const S_GM$json = const {
  '1': 'S_GM',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'code', '3': 2, '4': 1, '5': 14, '6': '.com.savvy.proto.S_GM.Code', '10': 'code'},
    const {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
  ],
  '4': const [S_GM_Code$json],
};

@$core.Deprecated('Use s_GMDescriptor instead')
const S_GM_Code$json = const {
  '1': 'Code',
  '2': const [
    const {'1': 'KICK', '2': 0},
    const {'1': 'MUTE', '2': 1},
  ],
};

/// Descriptor for `S_GM`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_GMDescriptor = $convert.base64Decode('CgRTX0dNEg4KAmlkGAEgASgDUgJpZBIuCgRjb2RlGAIgASgOMhouY29tLnNhdnZ5LnByb3RvLlNfR00uQ29kZVIEY29kZRIYCgdjb250ZW50GAMgASgJUgdjb250ZW50IhoKBENvZGUSCAoES0lDSxAAEggKBE1VVEUQAQ==');
@$core.Deprecated('Use c_RoleDescriptor instead')
const C_Role$json = const {
  '1': 'C_Role',
  '2': const [
    const {'1': 'session', '3': 1, '4': 1, '5': 9, '10': 'session'},
  ],
};

/// Descriptor for `C_Role`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_RoleDescriptor = $convert.base64Decode('CgZDX1JvbGUSGAoHc2Vzc2lvbhgBIAEoCVIHc2Vzc2lvbg==');
@$core.Deprecated('Use s_RoleDescriptor instead')
const S_Role$json = const {
  '1': 'S_Role',
  '2': const [
    const {'1': 'role', '3': 1, '4': 1, '5': 11, '6': '.com.savvy.proto.RoleInfo', '10': 'role'},
    const {'1': 'retryToken', '3': 2, '4': 1, '5': 9, '10': 'retryToken'},
    const {'1': 'time', '3': 3, '4': 1, '5': 3, '10': 'time'},
  ],
};

/// Descriptor for `S_Role`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_RoleDescriptor = $convert.base64Decode('CgZTX1JvbGUSLQoEcm9sZRgBIAEoCzIZLmNvbS5zYXZ2eS5wcm90by5Sb2xlSW5mb1IEcm9sZRIeCgpyZXRyeVRva2VuGAIgASgJUgpyZXRyeVRva2VuEhIKBHRpbWUYAyABKANSBHRpbWU=');
@$core.Deprecated('Use c_UploadURLDescriptor instead')
const C_UploadURL$json = const {
  '1': 'C_UploadURL',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 5, '10': 'type'},
  ],
};

/// Descriptor for `C_UploadURL`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_UploadURLDescriptor = $convert.base64Decode('CgtDX1VwbG9hZFVSTBISCgR0eXBlGAEgASgFUgR0eXBl');
@$core.Deprecated('Use s_UploadURLDescriptor instead')
const S_UploadURL$json = const {
  '1': 'S_UploadURL',
  '2': const [
    const {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    const {'1': 'file_name', '3': 2, '4': 1, '5': 9, '10': 'fileName'},
  ],
};

/// Descriptor for `S_UploadURL`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_UploadURLDescriptor = $convert.base64Decode('CgtTX1VwbG9hZFVSTBIQCgN1cmwYASABKAlSA3VybBIbCglmaWxlX25hbWUYAiABKAlSCGZpbGVOYW1l');
@$core.Deprecated('Use c_MediaIdDescriptor instead')
const C_MediaId$json = const {
  '1': 'C_MediaId',
  '2': const [
    const {'1': 'file_name', '3': 1, '4': 1, '5': 9, '10': 'fileName'},
    const {'1': 'type', '3': 2, '4': 1, '5': 5, '10': 'type'},
    const {'1': 'extras', '3': 3, '4': 1, '5': 9, '10': 'extras'},
  ],
};

/// Descriptor for `C_MediaId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_MediaIdDescriptor = $convert.base64Decode('CglDX01lZGlhSWQSGwoJZmlsZV9uYW1lGAEgASgJUghmaWxlTmFtZRISCgR0eXBlGAIgASgFUgR0eXBlEhYKBmV4dHJhcxgDIAEoCVIGZXh0cmFz');
@$core.Deprecated('Use s_MediaIdDescriptor instead')
const S_MediaId$json = const {
  '1': 'S_MediaId',
  '2': const [
    const {'1': 'mediaId', '3': 1, '4': 1, '5': 3, '10': 'mediaId'},
  ],
};

/// Descriptor for `S_MediaId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_MediaIdDescriptor = $convert.base64Decode('CglTX01lZGlhSWQSGAoHbWVkaWFJZBgBIAEoA1IHbWVkaWFJZA==');
@$core.Deprecated('Use c_CreateRoleDescriptor instead')
const C_CreateRole$json = const {
  '1': 'C_CreateRole',
  '2': const [
    const {'1': 'roleId', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'typeId', '3': 3, '4': 1, '5': 5, '10': 'typeId'},
    const {'1': 'mediaId', '3': 4, '4': 1, '5': 3, '10': 'mediaId'},
  ],
};

/// Descriptor for `C_CreateRole`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_CreateRoleDescriptor = $convert.base64Decode('CgxDX0NyZWF0ZVJvbGUSFgoGcm9sZUlkGAEgASgDUgZyb2xlSWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIWCgZ0eXBlSWQYAyABKAVSBnR5cGVJZBIYCgdtZWRpYUlkGAQgASgDUgdtZWRpYUlk');
@$core.Deprecated('Use s_CreateRoleDescriptor instead')
const S_CreateRole$json = const {
  '1': 'S_CreateRole',
  '2': const [
    const {'1': 'roleId', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
  ],
};

/// Descriptor for `S_CreateRole`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_CreateRoleDescriptor = $convert.base64Decode('CgxTX0NyZWF0ZVJvbGUSFgoGcm9sZUlkGAEgASgDUgZyb2xlSWQ=');
@$core.Deprecated('Use g_RemoveRoleDescriptor instead')
const G_RemoveRole$json = const {
  '1': 'G_RemoveRole',
  '2': const [
    const {'1': 'roleId', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
    const {'1': 'state', '3': 2, '4': 1, '5': 5, '10': 'state'},
  ],
};

/// Descriptor for `G_RemoveRole`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List g_RemoveRoleDescriptor = $convert.base64Decode('CgxHX1JlbW92ZVJvbGUSFgoGcm9sZUlkGAEgASgDUgZyb2xlSWQSFAoFc3RhdGUYAiABKAVSBXN0YXRl');
@$core.Deprecated('Use c_ReLinkDescriptor instead')
const C_ReLink$json = const {
  '1': 'C_ReLink',
  '2': const [
    const {'1': 'roleId', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
    const {'1': 'time', '3': 2, '4': 1, '5': 3, '10': 'time'},
    const {'1': 'token', '3': 3, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `C_ReLink`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_ReLinkDescriptor = $convert.base64Decode('CghDX1JlTGluaxIWCgZyb2xlSWQYASABKANSBnJvbGVJZBISCgR0aW1lGAIgASgDUgR0aW1lEhQKBXRva2VuGAMgASgJUgV0b2tlbg==');
@$core.Deprecated('Use s_LiveBroadcastDescriptor instead')
const S_LiveBroadcast$json = const {
  '1': 'S_LiveBroadcast',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    const {'1': 'status', '3': 2, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `S_LiveBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_LiveBroadcastDescriptor = $convert.base64Decode('Cg9TX0xpdmVCcm9hZGNhc3QSFwoHcm9vbV9pZBgBIAEoA1IGcm9vbUlkEhYKBnN0YXR1cxgCIAEoBVIGc3RhdHVz');
@$core.Deprecated('Use s_OnlineBroadcastDescriptor instead')
const S_OnlineBroadcast$json = const {
  '1': 'S_OnlineBroadcast',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    const {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    const {'1': 'status', '3': 3, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `S_OnlineBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_OnlineBroadcastDescriptor = $convert.base64Decode('ChFTX09ubGluZUJyb2FkY2FzdBIXCgdyb29tX2lkGAEgASgDUgZyb29tSWQSFwoHcm9sZV9pZBgCIAEoA1IGcm9sZUlkEhYKBnN0YXR1cxgDIAEoBVIGc3RhdHVz');
@$core.Deprecated('Use s_MikeBroadcastDescriptor instead')
const S_MikeBroadcast$json = const {
  '1': 'S_MikeBroadcast',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    const {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    const {'1': 'status', '3': 3, '4': 1, '5': 5, '10': 'status'},
    const {'1': 'mike_no', '3': 4, '4': 1, '5': 9, '10': 'mikeNo'},
  ],
};

/// Descriptor for `S_MikeBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_MikeBroadcastDescriptor = $convert.base64Decode('Cg9TX01pa2VCcm9hZGNhc3QSFwoHcm9vbV9pZBgBIAEoA1IGcm9vbUlkEhcKB3JvbGVfaWQYAiABKANSBnJvbGVJZBIWCgZzdGF0dXMYAyABKAVSBnN0YXR1cxIXCgdtaWtlX25vGAQgASgJUgZtaWtlTm8=');
@$core.Deprecated('Use s_AccMikeBroadcastDescriptor instead')
const S_AccMikeBroadcast$json = const {
  '1': 'S_AccMikeBroadcast',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    const {'1': 'mike_id', '3': 2, '4': 1, '5': 3, '10': 'mikeId'},
    const {'1': 'number', '3': 3, '4': 1, '5': 5, '10': 'number'},
  ],
};

/// Descriptor for `S_AccMikeBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_AccMikeBroadcastDescriptor = $convert.base64Decode('ChJTX0FjY01pa2VCcm9hZGNhc3QSFwoHcm9vbV9pZBgBIAEoA1IGcm9vbUlkEhcKB21pa2VfaWQYAiABKANSBm1pa2VJZBIWCgZudW1iZXIYAyABKAVSBm51bWJlcg==');
@$core.Deprecated('Use s_NoticeBroadcastDescriptor instead')
const S_NoticeBroadcast$json = const {
  '1': 'S_NoticeBroadcast',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `S_NoticeBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_NoticeBroadcastDescriptor = $convert.base64Decode('ChFTX05vdGljZUJyb2FkY2FzdBIXCgdyb29tX2lkGAEgASgDUgZyb29tSWQSGAoHbWVzc2FnZRgCIAEoCVIHbWVzc2FnZQ==');
@$core.Deprecated('Use s_BlackBroadcastDescriptor instead')
const S_BlackBroadcast$json = const {
  '1': 'S_BlackBroadcast',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    const {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    const {'1': 'status', '3': 3, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `S_BlackBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_BlackBroadcastDescriptor = $convert.base64Decode('ChBTX0JsYWNrQnJvYWRjYXN0EhcKB3Jvb21faWQYASABKANSBnJvb21JZBIXCgdyb2xlX2lkGAIgASgDUgZyb2xlSWQSFgoGc3RhdHVzGAMgASgFUgZzdGF0dXM=');
@$core.Deprecated('Use s_ChatMessageBroadcastDescriptor instead')
const S_ChatMessageBroadcast$json = const {
  '1': 'S_ChatMessageBroadcast',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `S_ChatMessageBroadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_ChatMessageBroadcastDescriptor = $convert.base64Decode('ChZTX0NoYXRNZXNzYWdlQnJvYWRjYXN0EhcKB3Jvb21faWQYASABKANSBnJvb21JZBIYCgdtZXNzYWdlGAIgASgJUgdtZXNzYWdl');
@$core.Deprecated('Use c_CreateSceneDescriptor instead')
const C_CreateScene$json = const {
  '1': 'C_CreateScene',
  '2': const [
    const {'1': 'scene_id', '3': 1, '4': 1, '5': 5, '10': 'sceneId'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'image', '3': 3, '4': 1, '5': 9, '10': 'image'},
    const {'1': 'room_password', '3': 4, '4': 1, '5': 9, '10': 'roomPassword'},
    const {'1': 'private_status', '3': 5, '4': 1, '5': 5, '10': 'privateStatus'},
    const {'1': 'notice_message', '3': 6, '4': 1, '5': 9, '10': 'noticeMessage'},
    const {'1': 'max_num', '3': 7, '4': 1, '5': 5, '10': 'maxNum'},
    const {'1': 'mike_status', '3': 8, '4': 1, '5': 5, '10': 'mikeStatus'},
  ],
};

/// Descriptor for `C_CreateScene`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_CreateSceneDescriptor = $convert.base64Decode('Cg1DX0NyZWF0ZVNjZW5lEhkKCHNjZW5lX2lkGAEgASgFUgdzY2VuZUlkEhIKBG5hbWUYAiABKAlSBG5hbWUSFAoFaW1hZ2UYAyABKAlSBWltYWdlEiMKDXJvb21fcGFzc3dvcmQYBCABKAlSDHJvb21QYXNzd29yZBIlCg5wcml2YXRlX3N0YXR1cxgFIAEoBVINcHJpdmF0ZVN0YXR1cxIlCg5ub3RpY2VfbWVzc2FnZRgGIAEoCVINbm90aWNlTWVzc2FnZRIXCgdtYXhfbnVtGAcgASgFUgZtYXhOdW0SHwoLbWlrZV9zdGF0dXMYCCABKAVSCm1pa2VTdGF0dXM=');
@$core.Deprecated('Use s_CreateSceneDescriptor instead')
const S_CreateScene$json = const {
  '1': 'S_CreateScene',
  '2': const [
    const {'1': 'scene_id', '3': 1, '4': 1, '5': 5, '10': 'sceneId'},
    const {'1': 'room_id', '3': 2, '4': 1, '5': 3, '10': 'roomId'},
  ],
};

/// Descriptor for `S_CreateScene`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_CreateSceneDescriptor = $convert.base64Decode('Cg1TX0NyZWF0ZVNjZW5lEhkKCHNjZW5lX2lkGAEgASgFUgdzY2VuZUlkEhcKB3Jvb21faWQYAiABKANSBnJvb21JZA==');
@$core.Deprecated('Use c_JoinSceneDescriptor instead')
const C_JoinScene$json = const {
  '1': 'C_JoinScene',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    const {'1': 'room_password', '3': 2, '4': 1, '5': 9, '10': 'roomPassword'},
  ],
};

/// Descriptor for `C_JoinScene`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_JoinSceneDescriptor = $convert.base64Decode('CgtDX0pvaW5TY2VuZRIXCgdyb29tX2lkGAEgASgDUgZyb29tSWQSIwoNcm9vbV9wYXNzd29yZBgCIAEoCVIMcm9vbVBhc3N3b3Jk');
@$core.Deprecated('Use s_JoinSceneDescriptor instead')
const S_JoinScene$json = const {
  '1': 'S_JoinScene',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    const {'1': 'scene_id', '3': 2, '4': 1, '5': 3, '10': 'sceneId'},
  ],
};

/// Descriptor for `S_JoinScene`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_JoinSceneDescriptor = $convert.base64Decode('CgtTX0pvaW5TY2VuZRIXCgdyb29tX2lkGAEgASgDUgZyb29tSWQSGQoIc2NlbmVfaWQYAiABKANSB3NjZW5lSWQ=');
@$core.Deprecated('Use c_UpMikeDescriptor instead')
const C_UpMike$json = const {
  '1': 'C_UpMike',
  '2': const [
    const {'1': 'role_id', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
    const {'1': 'make_no', '3': 2, '4': 1, '5': 9, '10': 'makeNo'},
  ],
};

/// Descriptor for `C_UpMike`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_UpMikeDescriptor = $convert.base64Decode('CghDX1VwTWlrZRIXCgdyb2xlX2lkGAEgASgDUgZyb2xlSWQSFwoHbWFrZV9ubxgCIAEoCVIGbWFrZU5v');
@$core.Deprecated('Use s_UpMikeDescriptor instead')
const S_UpMike$json = const {
  '1': 'S_UpMike',
  '2': const [
    const {'1': 'mike_id', '3': 1, '4': 1, '5': 3, '10': 'mikeId'},
  ],
};

/// Descriptor for `S_UpMike`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_UpMikeDescriptor = $convert.base64Decode('CghTX1VwTWlrZRIXCgdtaWtlX2lkGAEgASgDUgZtaWtlSWQ=');
@$core.Deprecated('Use c_BanMikeDescriptor instead')
const C_BanMike$json = const {
  '1': 'C_BanMike',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    const {'1': 'scene_id', '3': 2, '4': 1, '5': 3, '10': 'sceneId'},
    const {'1': 'status', '3': 3, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `C_BanMike`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_BanMikeDescriptor = $convert.base64Decode('CglDX0Jhbk1pa2USFwoHcm9vbV9pZBgBIAEoA1IGcm9vbUlkEhkKCHNjZW5lX2lkGAIgASgDUgdzY2VuZUlkEhYKBnN0YXR1cxgDIAEoBVIGc3RhdHVz');
@$core.Deprecated('Use c_AccMikeClearDescriptor instead')
const C_AccMikeClear$json = const {
  '1': 'C_AccMikeClear',
  '2': const [
    const {'1': 'make_id', '3': 1, '4': 1, '5': 3, '10': 'makeId'},
  ],
};

/// Descriptor for `C_AccMikeClear`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_AccMikeClearDescriptor = $convert.base64Decode('Cg5DX0FjY01pa2VDbGVhchIXCgdtYWtlX2lkGAEgASgDUgZtYWtlSWQ=');
@$core.Deprecated('Use c_SetNoticeMessageDescriptor instead')
const C_SetNoticeMessage$json = const {
  '1': 'C_SetNoticeMessage',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `C_SetNoticeMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_SetNoticeMessageDescriptor = $convert.base64Decode('ChJDX1NldE5vdGljZU1lc3NhZ2USFwoHcm9vbV9pZBgBIAEoA1IGcm9vbUlkEhgKB21lc3NhZ2UYAiABKAlSB21lc3NhZ2U=');
@$core.Deprecated('Use c_SetAdministratorDescriptor instead')
const C_SetAdministrator$json = const {
  '1': 'C_SetAdministrator',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    const {'1': 'scene_id', '3': 2, '4': 1, '5': 3, '10': 'sceneId'},
    const {'1': 'status', '3': 3, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `C_SetAdministrator`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_SetAdministratorDescriptor = $convert.base64Decode('ChJDX1NldEFkbWluaXN0cmF0b3ISFwoHcm9vbV9pZBgBIAEoA1IGcm9vbUlkEhkKCHNjZW5lX2lkGAIgASgDUgdzY2VuZUlkEhYKBnN0YXR1cxgDIAEoBVIGc3RhdHVz');
@$core.Deprecated('Use c_SetBlackDescriptor instead')
const C_SetBlack$json = const {
  '1': 'C_SetBlack',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    const {'1': 'scene_id', '3': 2, '4': 1, '5': 3, '10': 'sceneId'},
    const {'1': 'status', '3': 3, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `C_SetBlack`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_SetBlackDescriptor = $convert.base64Decode('CgpDX1NldEJsYWNrEhcKB3Jvb21faWQYASABKANSBnJvb21JZBIZCghzY2VuZV9pZBgCIAEoA1IHc2NlbmVJZBIWCgZzdGF0dXMYAyABKAVSBnN0YXR1cw==');
@$core.Deprecated('Use c_ChatMessageDescriptor instead')
const C_ChatMessage$json = const {
  '1': 'C_ChatMessage',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `C_ChatMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_ChatMessageDescriptor = $convert.base64Decode('Cg1DX0NoYXRNZXNzYWdlEhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2U=');
@$core.Deprecated('Use g_SwitchSceneDescriptor instead')
const G_SwitchScene$json = const {
  '1': 'G_SwitchScene',
  '2': const [
    const {'1': 'scene', '3': 1, '4': 1, '5': 3, '10': 'scene'},
    const {'1': 'room', '3': 2, '4': 1, '5': 3, '10': 'room'},
  ],
};

/// Descriptor for `G_SwitchScene`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List g_SwitchSceneDescriptor = $convert.base64Decode('Cg1HX1N3aXRjaFNjZW5lEhQKBXNjZW5lGAEgASgDUgVzY2VuZRISCgRyb29tGAIgASgDUgRyb29t');
@$core.Deprecated('Use s_SyncRoundDescriptor instead')
const S_SyncRound$json = const {
  '1': 'S_SyncRound',
  '2': const [
    const {'1': 'roles', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.RoleSceneInfo', '10': 'roles'},
  ],
};

/// Descriptor for `S_SyncRound`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SyncRoundDescriptor = $convert.base64Decode('CgtTX1N5bmNSb3VuZBI0CgVyb2xlcxgBIAMoCzIeLmNvbS5zYXZ2eS5wcm90by5Sb2xlU2NlbmVJbmZvUgVyb2xlcw==');
@$core.Deprecated('Use s_SyncAttrDescriptor instead')
const S_SyncAttr$json = const {
  '1': 'S_SyncAttr',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'attr', '3': 2, '4': 1, '5': 11, '6': '.com.savvy.proto.AttrVO', '10': 'attr'},
  ],
};

/// Descriptor for `S_SyncAttr`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SyncAttrDescriptor = $convert.base64Decode('CgpTX1N5bmNBdHRyEg4KAmlkGAEgASgDUgJpZBIrCgRhdHRyGAIgASgLMhcuY29tLnNhdnZ5LnByb3RvLkF0dHJWT1IEYXR0cg==');
@$core.Deprecated('Use s_SyncAttrsDescriptor instead')
const S_SyncAttrs$json = const {
  '1': 'S_SyncAttrs',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'attrs', '3': 2, '4': 1, '5': 11, '6': '.com.savvy.proto.AttrInfo', '10': 'attrs'},
  ],
};

/// Descriptor for `S_SyncAttrs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SyncAttrsDescriptor = $convert.base64Decode('CgtTX1N5bmNBdHRycxIOCgJpZBgBIAEoA1ICaWQSLwoFYXR0cnMYAiABKAsyGS5jb20uc2F2dnkucHJvdG8uQXR0ckluZm9SBWF0dHJz');
@$core.Deprecated('Use s_SyncMultiAttrDescriptor instead')
const S_SyncMultiAttr$json = const {
  '1': 'S_SyncMultiAttr',
  '2': const [
    const {'1': 'id', '3': 1, '4': 3, '5': 3, '10': 'id'},
    const {'1': 'attr', '3': 2, '4': 3, '5': 11, '6': '.com.savvy.proto.AttrVO', '10': 'attr'},
  ],
};

/// Descriptor for `S_SyncMultiAttr`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SyncMultiAttrDescriptor = $convert.base64Decode('Cg9TX1N5bmNNdWx0aUF0dHISDgoCaWQYASADKANSAmlkEisKBGF0dHIYAiADKAsyFy5jb20uc2F2dnkucHJvdG8uQXR0clZPUgRhdHRy');
@$core.Deprecated('Use s_SyncMultiAttrsDescriptor instead')
const S_SyncMultiAttrs$json = const {
  '1': 'S_SyncMultiAttrs',
  '2': const [
    const {'1': 'id', '3': 1, '4': 3, '5': 3, '10': 'id'},
    const {'1': 'attrs', '3': 2, '4': 3, '5': 11, '6': '.com.savvy.proto.AttrInfo', '10': 'attrs'},
  ],
};

/// Descriptor for `S_SyncMultiAttrs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SyncMultiAttrsDescriptor = $convert.base64Decode('ChBTX1N5bmNNdWx0aUF0dHJzEg4KAmlkGAEgAygDUgJpZBIvCgVhdHRycxgCIAMoCzIZLmNvbS5zYXZ2eS5wcm90by5BdHRySW5mb1IFYXR0cnM=');
@$core.Deprecated('Use c_RoleDetailDescriptor instead')
const C_RoleDetail$json = const {
  '1': 'C_RoleDetail',
  '2': const [
    const {'1': 'role_id', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
  ],
};

/// Descriptor for `C_RoleDetail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_RoleDetailDescriptor = $convert.base64Decode('CgxDX1JvbGVEZXRhaWwSFwoHcm9sZV9pZBgBIAEoA1IGcm9sZUlk');
@$core.Deprecated('Use s_RoleDetailDescriptor instead')
const S_RoleDetail$json = const {
  '1': 'S_RoleDetail',
  '2': const [
    const {'1': 'info', '3': 1, '4': 1, '5': 11, '6': '.com.savvy.proto.RoleDetailInfo', '10': 'info'},
  ],
};

/// Descriptor for `S_RoleDetail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_RoleDetailDescriptor = $convert.base64Decode('CgxTX1JvbGVEZXRhaWwSMwoEaW5mbxgBIAEoCzIfLmNvbS5zYXZ2eS5wcm90by5Sb2xlRGV0YWlsSW5mb1IEaW5mbw==');
@$core.Deprecated('Use s_SyncRoleDescriptor instead')
const S_SyncRole$json = const {
  '1': 'S_SyncRole',
  '2': const [
    const {'1': 'info', '3': 1, '4': 1, '5': 11, '6': '.com.savvy.proto.RoleInfo', '10': 'info'},
  ],
};

/// Descriptor for `S_SyncRole`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SyncRoleDescriptor = $convert.base64Decode('CgpTX1N5bmNSb2xlEi0KBGluZm8YASABKAsyGS5jb20uc2F2dnkucHJvdG8uUm9sZUluZm9SBGluZm8=');
@$core.Deprecated('Use c_ToZoneDescriptor instead')
const C_ToZone$json = const {
  '1': 'C_ToZone',
  '2': const [
    const {'1': 'xyz', '3': 1, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZ', '10': 'xyz'},
    const {'1': 'r', '3': 2, '4': 1, '5': 5, '10': 'r'},
  ],
};

/// Descriptor for `C_ToZone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_ToZoneDescriptor = $convert.base64Decode('CghDX1RvWm9uZRImCgN4eXoYASABKAsyFC5jb20uc2F2dnkucHJvdG8uWFlaUgN4eXoSDAoBchgCIAEoBVIBcg==');
@$core.Deprecated('Use s_SyncZoneDescriptor instead')
const S_SyncZone$json = const {
  '1': 'S_SyncZone',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'xyz', '3': 2, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZ', '10': 'xyz'},
    const {'1': 'r', '3': 3, '4': 1, '5': 5, '10': 'r'},
  ],
};

/// Descriptor for `S_SyncZone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SyncZoneDescriptor = $convert.base64Decode('CgpTX1N5bmNab25lEg4KAmlkGAEgASgDUgJpZBImCgN4eXoYAiABKAsyFC5jb20uc2F2dnkucHJvdG8uWFlaUgN4eXoSDAoBchgDIAEoBVIBcg==');
@$core.Deprecated('Use c_EnforceZoneDescriptor instead')
const C_EnforceZone$json = const {
  '1': 'C_EnforceZone',
  '2': const [
    const {'1': 'xyz', '3': 1, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZ', '10': 'xyz'},
    const {'1': 'r', '3': 2, '4': 1, '5': 5, '10': 'r'},
  ],
};

/// Descriptor for `C_EnforceZone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_EnforceZoneDescriptor = $convert.base64Decode('Cg1DX0VuZm9yY2Vab25lEiYKA3h5ehgBIAEoCzIULmNvbS5zYXZ2eS5wcm90by5YWVpSA3h5ehIMCgFyGAIgASgFUgFy');
@$core.Deprecated('Use s_EnforceZoneDescriptor instead')
const S_EnforceZone$json = const {
  '1': 'S_EnforceZone',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'xyz', '3': 2, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZ', '10': 'xyz'},
    const {'1': 'r', '3': 3, '4': 1, '5': 5, '10': 'r'},
    const {'1': 'state', '3': 4, '4': 1, '5': 14, '6': '.com.savvy.proto.State', '10': 'state'},
  ],
};

/// Descriptor for `S_EnforceZone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_EnforceZoneDescriptor = $convert.base64Decode('Cg1TX0VuZm9yY2Vab25lEg4KAmlkGAEgASgDUgJpZBImCgN4eXoYAiABKAsyFC5jb20uc2F2dnkucHJvdG8uWFlaUgN4eXoSDAoBchgDIAEoBVIBchIsCgVzdGF0ZRgEIAEoDjIWLmNvbS5zYXZ2eS5wcm90by5TdGF0ZVIFc3RhdGU=');
@$core.Deprecated('Use s_AddRoleDescriptor instead')
const S_AddRole$json = const {
  '1': 'S_AddRole',
  '2': const [
    const {'1': 'roles', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.RoleSceneInfo', '10': 'roles'},
  ],
};

/// Descriptor for `S_AddRole`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_AddRoleDescriptor = $convert.base64Decode('CglTX0FkZFJvbGUSNAoFcm9sZXMYASADKAsyHi5jb20uc2F2dnkucHJvdG8uUm9sZVNjZW5lSW5mb1IFcm9sZXM=');
@$core.Deprecated('Use s_RemoveObjDescriptor instead')
const S_RemoveObj$json = const {
  '1': 'S_RemoveObj',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `S_RemoveObj`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_RemoveObjDescriptor = $convert.base64Decode('CgtTX1JlbW92ZU9iahIOCgJpZBgBIAEoA1ICaWQ=');
@$core.Deprecated('Use s_RemoveObjsDescriptor instead')
const S_RemoveObjs$json = const {
  '1': 'S_RemoveObjs',
  '2': const [
    const {'1': 'id', '3': 1, '4': 3, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `S_RemoveObjs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_RemoveObjsDescriptor = $convert.base64Decode('CgxTX1JlbW92ZU9ianMSDgoCaWQYASADKANSAmlk');
@$core.Deprecated('Use c_StopMoveDescriptor instead')
const C_StopMove$json = const {
  '1': 'C_StopMove',
  '2': const [
    const {'1': 'xyz', '3': 1, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZ', '10': 'xyz'},
  ],
};

/// Descriptor for `C_StopMove`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_StopMoveDescriptor = $convert.base64Decode('CgpDX1N0b3BNb3ZlEiYKA3h5ehgBIAEoCzIULmNvbS5zYXZ2eS5wcm90by5YWVpSA3h5eg==');
@$core.Deprecated('Use c_StateDescriptor instead')
const C_State$json = const {
  '1': 'C_State',
  '2': const [
    const {'1': 'state', '3': 1, '4': 1, '5': 14, '6': '.com.savvy.proto.State', '10': 'state'},
    const {'1': 'xyz', '3': 2, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZ', '10': 'xyz'},
    const {'1': 'r', '3': 3, '4': 1, '5': 5, '10': 'r'},
  ],
};

/// Descriptor for `C_State`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_StateDescriptor = $convert.base64Decode('CgdDX1N0YXRlEiwKBXN0YXRlGAEgASgOMhYuY29tLnNhdnZ5LnByb3RvLlN0YXRlUgVzdGF0ZRImCgN4eXoYAiABKAsyFC5jb20uc2F2dnkucHJvdG8uWFlaUgN4eXoSDAoBchgDIAEoBVIBcg==');
@$core.Deprecated('Use s_StateDescriptor instead')
const S_State$json = const {
  '1': 'S_State',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'state', '3': 2, '4': 1, '5': 14, '6': '.com.savvy.proto.State', '10': 'state'},
    const {'1': 'xyz', '3': 3, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZ', '10': 'xyz'},
    const {'1': 'r', '3': 4, '4': 1, '5': 5, '10': 'r'},
  ],
};

/// Descriptor for `S_State`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_StateDescriptor = $convert.base64Decode('CgdTX1N0YXRlEg4KAmlkGAEgASgDUgJpZBIsCgVzdGF0ZRgCIAEoDjIWLmNvbS5zYXZ2eS5wcm90by5TdGF0ZVIFc3RhdGUSJgoDeHl6GAMgASgLMhQuY29tLnNhdnZ5LnByb3RvLlhZWlIDeHl6EgwKAXIYBCABKAVSAXI=');
@$core.Deprecated('Use c_ToSeatInfoDescriptor instead')
const C_ToSeatInfo$json = const {
  '1': 'C_ToSeatInfo',
  '2': const [
    const {'1': 'info', '3': 1, '4': 1, '5': 11, '6': '.com.savvy.proto.SeatInfo', '10': 'info'},
  ],
};

/// Descriptor for `C_ToSeatInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_ToSeatInfoDescriptor = $convert.base64Decode('CgxDX1RvU2VhdEluZm8SLQoEaW5mbxgBIAEoCzIZLmNvbS5zYXZ2eS5wcm90by5TZWF0SW5mb1IEaW5mbw==');
@$core.Deprecated('Use s_SyncSeatInfoDescriptor instead')
const S_SyncSeatInfo$json = const {
  '1': 'S_SyncSeatInfo',
  '2': const [
    const {'1': 'info', '3': 1, '4': 1, '5': 11, '6': '.com.savvy.proto.SeatInfo', '10': 'info'},
  ],
};

/// Descriptor for `S_SyncSeatInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SyncSeatInfoDescriptor = $convert.base64Decode('Cg5TX1N5bmNTZWF0SW5mbxItCgRpbmZvGAEgASgLMhkuY29tLnNhdnZ5LnByb3RvLlNlYXRJbmZvUgRpbmZv');
@$core.Deprecated('Use c_TestDescriptor instead')
const C_Test$json = const {
  '1': 'C_Test',
  '2': const [
    const {'1': 'usr_name', '3': 1, '4': 1, '5': 9, '10': 'usrName'},
    const {'1': 'sceneId', '3': 2, '4': 1, '5': 3, '10': 'sceneId'},
    const {'1': 'roomId', '3': 3, '4': 1, '5': 3, '10': 'roomId'},
    const {'1': 'roomPwd', '3': 4, '4': 1, '5': 9, '10': 'roomPwd'},
    const {'1': 'uniqueId', '3': 5, '4': 1, '5': 9, '10': 'uniqueId'},
    const {'1': 'opt', '3': 6, '4': 1, '5': 5, '10': 'opt'},
    const {'1': 'extra', '3': 7, '4': 1, '5': 9, '10': 'extra'},
  ],
};

/// Descriptor for `C_Test`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_TestDescriptor = $convert.base64Decode('CgZDX1Rlc3QSGQoIdXNyX25hbWUYASABKAlSB3Vzck5hbWUSGAoHc2NlbmVJZBgCIAEoA1IHc2NlbmVJZBIWCgZyb29tSWQYAyABKANSBnJvb21JZBIYCgdyb29tUHdkGAQgASgJUgdyb29tUHdkEhoKCHVuaXF1ZUlkGAUgASgJUgh1bmlxdWVJZBIQCgNvcHQYBiABKAVSA29wdBIUCgVleHRyYRgHIAEoCVIFZXh0cmE=');
@$core.Deprecated('Use s_TestDescriptor instead')
const S_Test$json = const {
  '1': 'S_Test',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.com.savvy.proto.ErrorCode', '10': 'code'},
    const {'1': 'sceneId', '3': 2, '4': 1, '5': 3, '10': 'sceneId'},
    const {'1': 'roomId', '3': 3, '4': 1, '5': 3, '10': 'roomId'},
    const {'1': 'roomPwd', '3': 4, '4': 1, '5': 9, '10': 'roomPwd'},
    const {'1': 'opt', '3': 5, '4': 1, '5': 5, '10': 'opt'},
    const {'1': 'extra', '3': 6, '4': 1, '5': 9, '10': 'extra'},
  ],
};

/// Descriptor for `S_Test`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_TestDescriptor = $convert.base64Decode('CgZTX1Rlc3QSLgoEY29kZRgBIAEoDjIaLmNvbS5zYXZ2eS5wcm90by5FcnJvckNvZGVSBGNvZGUSGAoHc2NlbmVJZBgCIAEoA1IHc2NlbmVJZBIWCgZyb29tSWQYAyABKANSBnJvb21JZBIYCgdyb29tUHdkGAQgASgJUgdyb29tUHdkEhAKA29wdBgFIAEoBVIDb3B0EhQKBWV4dHJhGAYgASgJUgVleHRyYQ==');
@$core.Deprecated('Use s_DebugDescriptor instead')
const S_Debug$json = const {
  '1': 'S_Debug',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `S_Debug`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_DebugDescriptor = $convert.base64Decode('CgdTX0RlYnVnEhYKBnN0YXR1cxgBIAEoBVIGc3RhdHVz');
@$core.Deprecated('Use c_VerifyDescriptor instead')
const C_Verify$json = const {
  '1': 'C_Verify',
  '2': const [
    const {'1': 'uniqueId', '3': 1, '4': 1, '5': 5, '10': 'uniqueId'},
  ],
};

/// Descriptor for `C_Verify`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_VerifyDescriptor = $convert.base64Decode('CghDX1ZlcmlmeRIaCgh1bmlxdWVJZBgBIAEoBVIIdW5pcXVlSWQ=');
@$core.Deprecated('Use g_UFHeartDescriptor instead')
const G_UFHeart$json = const {
  '1': 'G_UFHeart',
};

/// Descriptor for `G_UFHeart`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List g_UFHeartDescriptor = $convert.base64Decode('CglHX1VGSGVhcnQ=');
@$core.Deprecated('Use f_GiftShowDescriptor instead')
const F_GiftShow$json = const {
  '1': 'F_GiftShow',
  '2': const [
    const {'1': 'giftId', '3': 1, '4': 1, '5': 5, '10': 'giftId'},
  ],
};

/// Descriptor for `F_GiftShow`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List f_GiftShowDescriptor = $convert.base64Decode('CgpGX0dpZnRTaG93EhYKBmdpZnRJZBgBIAEoBVIGZ2lmdElk');
