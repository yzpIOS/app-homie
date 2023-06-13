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
    const {'1': 'scene', '3': 2, '4': 1, '5': 5, '10': 'scene'},
    const {'1': 'room', '3': 3, '4': 1, '5': 5, '10': 'room'},
    const {'1': 'session', '3': 4, '4': 1, '5': 9, '10': 'session'},
    const {'1': 'time', '3': 5, '4': 1, '5': 3, '10': 'time'},
  ],
};

/// Descriptor for `S_Role`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_RoleDescriptor = $convert.base64Decode('CgZTX1JvbGUSLQoEcm9sZRgBIAEoCzIZLmNvbS5zYXZ2eS5wcm90by5Sb2xlSW5mb1IEcm9sZRIUCgVzY2VuZRgCIAEoBVIFc2NlbmUSEgoEcm9vbRgDIAEoBVIEcm9vbRIYCgdzZXNzaW9uGAQgASgJUgdzZXNzaW9uEhIKBHRpbWUYBSABKANSBHRpbWU=');
@$core.Deprecated('Use c_CreateRoleDescriptor instead')
const C_CreateRole$json = const {
  '1': 'C_CreateRole',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'typeId', '3': 2, '4': 1, '5': 5, '10': 'typeId'},
  ],
};

/// Descriptor for `C_CreateRole`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_CreateRoleDescriptor = $convert.base64Decode('CgxDX0NyZWF0ZVJvbGUSEgoEbmFtZRgBIAEoCVIEbmFtZRIWCgZ0eXBlSWQYAiABKAVSBnR5cGVJZA==');
@$core.Deprecated('Use s_CreateRoleDescriptor instead')
const S_CreateRole$json = const {
  '1': 'S_CreateRole',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.com.savvy.proto.ErrorCode', '10': 'code'},
    const {'1': 'roleId', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
  ],
};

/// Descriptor for `S_CreateRole`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_CreateRoleDescriptor = $convert.base64Decode('CgxTX0NyZWF0ZVJvbGUSLgoEY29kZRgBIAEoDjIaLmNvbS5zYXZ2eS5wcm90by5FcnJvckNvZGVSBGNvZGUSFgoGcm9sZUlkGAIgASgDUgZyb2xlSWQ=');
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
@$core.Deprecated('Use g_SwitchSceneDescriptor instead')
const G_SwitchScene$json = const {
  '1': 'G_SwitchScene',
  '2': const [
    const {'1': 'scene', '3': 1, '4': 1, '5': 5, '10': 'scene'},
    const {'1': 'room', '3': 2, '4': 1, '5': 5, '10': 'room'},
  ],
};

/// Descriptor for `G_SwitchScene`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List g_SwitchSceneDescriptor = $convert.base64Decode('Cg1HX1N3aXRjaFNjZW5lEhQKBXNjZW5lGAEgASgFUgVzY2VuZRISCgRyb29tGAIgASgFUgRyb29t');
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
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'attr', '3': 2, '4': 1, '5': 11, '6': '.com.savvy.proto.AttrVO', '10': 'attr'},
  ],
};

/// Descriptor for `S_SyncAttr`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SyncAttrDescriptor = $convert.base64Decode('CgpTX1N5bmNBdHRyEg4KAmlkGAEgASgFUgJpZBIrCgRhdHRyGAIgASgLMhcuY29tLnNhdnZ5LnByb3RvLkF0dHJWT1IEYXR0cg==');
@$core.Deprecated('Use s_SyncAttrsDescriptor instead')
const S_SyncAttrs$json = const {
  '1': 'S_SyncAttrs',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'attrs', '3': 2, '4': 1, '5': 11, '6': '.com.savvy.proto.AttrInfo', '10': 'attrs'},
  ],
};

/// Descriptor for `S_SyncAttrs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SyncAttrsDescriptor = $convert.base64Decode('CgtTX1N5bmNBdHRycxIOCgJpZBgBIAEoBVICaWQSLwoFYXR0cnMYAiABKAsyGS5jb20uc2F2dnkucHJvdG8uQXR0ckluZm9SBWF0dHJz');
@$core.Deprecated('Use s_SyncMultiAttrDescriptor instead')
const S_SyncMultiAttr$json = const {
  '1': 'S_SyncMultiAttr',
  '2': const [
    const {'1': 'id', '3': 1, '4': 3, '5': 5, '10': 'id'},
    const {'1': 'attr', '3': 2, '4': 3, '5': 11, '6': '.com.savvy.proto.AttrVO', '10': 'attr'},
  ],
};

/// Descriptor for `S_SyncMultiAttr`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SyncMultiAttrDescriptor = $convert.base64Decode('Cg9TX1N5bmNNdWx0aUF0dHISDgoCaWQYASADKAVSAmlkEisKBGF0dHIYAiADKAsyFy5jb20uc2F2dnkucHJvdG8uQXR0clZPUgRhdHRy');
@$core.Deprecated('Use s_SyncMultiAttrsDescriptor instead')
const S_SyncMultiAttrs$json = const {
  '1': 'S_SyncMultiAttrs',
  '2': const [
    const {'1': 'id', '3': 1, '4': 3, '5': 5, '10': 'id'},
    const {'1': 'attrs', '3': 2, '4': 3, '5': 11, '6': '.com.savvy.proto.AttrInfo', '10': 'attrs'},
  ],
};

/// Descriptor for `S_SyncMultiAttrs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SyncMultiAttrsDescriptor = $convert.base64Decode('ChBTX1N5bmNNdWx0aUF0dHJzEg4KAmlkGAEgAygFUgJpZBIvCgVhdHRycxgCIAMoCzIZLmNvbS5zYXZ2eS5wcm90by5BdHRySW5mb1IFYXR0cnM=');
@$core.Deprecated('Use c_RoleDetailDescriptor instead')
const C_RoleDetail$json = const {
  '1': 'C_RoleDetail',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `C_RoleDetail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_RoleDetailDescriptor = $convert.base64Decode('CgxDX1JvbGVEZXRhaWwSDgoCaWQYASABKANSAmlk');
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
    const {'1': 'xyzr', '3': 1, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZR', '10': 'xyzr'},
  ],
};

/// Descriptor for `C_ToZone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_ToZoneDescriptor = $convert.base64Decode('CghDX1RvWm9uZRIpCgR4eXpyGAEgASgLMhUuY29tLnNhdnZ5LnByb3RvLlhZWlJSBHh5enI=');
@$core.Deprecated('Use s_SyncZoneDescriptor instead')
const S_SyncZone$json = const {
  '1': 'S_SyncZone',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'xyzr', '3': 2, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZR', '10': 'xyzr'},
  ],
};

/// Descriptor for `S_SyncZone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_SyncZoneDescriptor = $convert.base64Decode('CgpTX1N5bmNab25lEg4KAmlkGAEgASgFUgJpZBIpCgR4eXpyGAIgASgLMhUuY29tLnNhdnZ5LnByb3RvLlhZWlJSBHh5enI=');
@$core.Deprecated('Use s_EnforceZoneDescriptor instead')
const S_EnforceZone$json = const {
  '1': 'S_EnforceZone',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'xyzr', '3': 2, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZR', '10': 'xyzr'},
  ],
};

/// Descriptor for `S_EnforceZone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_EnforceZoneDescriptor = $convert.base64Decode('Cg1TX0VuZm9yY2Vab25lEg4KAmlkGAEgASgFUgJpZBIpCgR4eXpyGAIgASgLMhUuY29tLnNhdnZ5LnByb3RvLlhZWlJSBHh5enI=');
@$core.Deprecated('Use s_ConveyZoneDescriptor instead')
const S_ConveyZone$json = const {
  '1': 'S_ConveyZone',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'xyzr', '3': 2, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZR', '10': 'xyzr'},
  ],
};

/// Descriptor for `S_ConveyZone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_ConveyZoneDescriptor = $convert.base64Decode('CgxTX0NvbnZleVpvbmUSDgoCaWQYASABKAVSAmlkEikKBHh5enIYAiABKAsyFS5jb20uc2F2dnkucHJvdG8uWFlaUlIEeHl6cg==');
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
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `S_RemoveObj`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_RemoveObjDescriptor = $convert.base64Decode('CgtTX1JlbW92ZU9iahIOCgJpZBgBIAEoBVICaWQ=');
@$core.Deprecated('Use s_RemoveObjsDescriptor instead')
const S_RemoveObjs$json = const {
  '1': 'S_RemoveObjs',
  '2': const [
    const {'1': 'id', '3': 1, '4': 3, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `S_RemoveObjs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_RemoveObjsDescriptor = $convert.base64Decode('CgxTX1JlbW92ZU9ianMSDgoCaWQYASADKAVSAmlk');
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
    const {'1': 'xyzr', '3': 2, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZR', '10': 'xyzr'},
  ],
};

/// Descriptor for `C_State`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_StateDescriptor = $convert.base64Decode('CgdDX1N0YXRlEiwKBXN0YXRlGAEgASgOMhYuY29tLnNhdnZ5LnByb3RvLlN0YXRlUgVzdGF0ZRIpCgR4eXpyGAIgASgLMhUuY29tLnNhdnZ5LnByb3RvLlhZWlJSBHh5enI=');
@$core.Deprecated('Use s_StateDescriptor instead')
const S_State$json = const {
  '1': 'S_State',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'state', '3': 2, '4': 1, '5': 14, '6': '.com.savvy.proto.State', '10': 'state'},
    const {'1': 'xyzr', '3': 3, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZR', '10': 'xyzr'},
  ],
};

/// Descriptor for `S_State`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_StateDescriptor = $convert.base64Decode('CgdTX1N0YXRlEg4KAmlkGAEgASgFUgJpZBIsCgVzdGF0ZRgCIAEoDjIWLmNvbS5zYXZ2eS5wcm90by5TdGF0ZVIFc3RhdGUSKQoEeHl6chgDIAEoCzIVLmNvbS5zYXZ2eS5wcm90by5YWVpSUgR4eXpy');
@$core.Deprecated('Use c_TestDescriptor instead')
const C_Test$json = const {
  '1': 'C_Test',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `C_Test`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List c_TestDescriptor = $convert.base64Decode('CgZDX1Rlc3QSGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');
@$core.Deprecated('Use s_TestDescriptor instead')
const S_Test$json = const {
  '1': 'S_Test',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 5, '10': 'code'},
    const {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
    const {'1': 'data', '3': 3, '4': 1, '5': 11, '6': '.com.savvy.proto.S_Test.Data', '10': 'data'},
  ],
  '3': const [S_Test_Data$json],
};

@$core.Deprecated('Use s_TestDescriptor instead')
const S_Test_Data$json = const {
  '1': 'Data',
  '2': const [
    const {'1': 'msg_id', '3': 1, '4': 1, '5': 5, '10': 'msgId'},
    const {'1': 'len', '3': 2, '4': 1, '5': 5, '10': 'len'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `S_Test`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_TestDescriptor = $convert.base64Decode('CgZTX1Rlc3QSEgoEY29kZRgBIAEoBVIEY29kZRIQCgNtc2cYAiABKAlSA21zZxIwCgRkYXRhGAMgASgLMhwuY29tLnNhdnZ5LnByb3RvLlNfVGVzdC5EYXRhUgRkYXRhGkkKBERhdGESFQoGbXNnX2lkGAEgASgFUgVtc2dJZBIQCgNsZW4YAiABKAVSA2xlbhIYCgdtZXNzYWdlGAMgASgJUgdtZXNzYWdl');
@$core.Deprecated('Use s_DebugDescriptor instead')
const S_Debug$json = const {
  '1': 'S_Debug',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `S_Debug`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List s_DebugDescriptor = $convert.base64Decode('CgdTX0RlYnVnEhYKBnN0YXR1cxgBIAEoBVIGc3RhdHVz');
