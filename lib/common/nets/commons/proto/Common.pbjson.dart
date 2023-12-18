//
//  Generated code. Do not modify.
//  source: Common.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use attrCodeDescriptor instead')
const AttrCode$json = {
  '1': 'AttrCode',
  '2': [
    {'1': 'none', '2': 0},
    {'1': 'lv', '2': 1},
    {'1': 'charm_lv', '2': 2},
    {'1': 'sex', '2': 3},
    {'1': 'career', '2': 4},
    {'1': 'speed', '2': 5},
    {'1': 'scene', '2': 6},
    {'1': 'room', '2': 7},
    {'1': 'job', '2': 8},
    {'1': 'avatar_url', '2': 9},
    {'1': 'public_id', '2': 10},
    {'1': 'description', '2': 11},
    {'1': 'growth_value', '2': 12},
    {'1': 'charm_growth_value', '2': 13},
    {'1': 'real_name_type', '2': 14},
    {'1': 'animate', '2': 15},
    {'1': 'mike_id', '2': 16},
    {'1': 'mike_no', '2': 17},
    {'1': 'stage', '2': 18},
  ],
};

/// Descriptor for `AttrCode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List attrCodeDescriptor = $convert.base64Decode(
    'CghBdHRyQ29kZRIICgRub25lEAASBgoCbHYQARIMCghjaGFybV9sdhACEgcKA3NleBADEgoKBm'
    'NhcmVlchAEEgkKBXNwZWVkEAUSCQoFc2NlbmUQBhIICgRyb29tEAcSBwoDam9iEAgSDgoKYXZh'
    'dGFyX3VybBAJEg0KCXB1YmxpY19pZBAKEg8KC2Rlc2NyaXB0aW9uEAsSEAoMZ3Jvd3RoX3ZhbH'
    'VlEAwSFgoSY2hhcm1fZ3Jvd3RoX3ZhbHVlEA0SEgoOcmVhbF9uYW1lX3R5cGUQDhILCgdhbmlt'
    'YXRlEA8SCwoHbWlrZV9pZBAQEgsKB21pa2Vfbm8QERIJCgVzdGFnZRAS');

@$core.Deprecated('Use stateDescriptor instead')
const State$json = {
  '1': 'State',
  '2': [
    {'1': 'None', '2': 0},
    {'1': 'Mai', '2': 1},
    {'1': 'Sit', '2': 2},
    {'1': 'Swim', '2': 3},
  ],
};

/// Descriptor for `State`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List stateDescriptor = $convert.base64Decode(
    'CgVTdGF0ZRIICgROb25lEAASBwoDTWFpEAESBwoDU2l0EAISCAoEU3dpbRAD');

@$core.Deprecated('Use pKGiftStateDescriptor instead')
const PKGiftState$json = {
  '1': 'PKGiftState',
  '2': [
    {'1': 'Available', '2': 0},
    {'1': 'Disappeared', '2': 1},
  ],
};

/// Descriptor for `PKGiftState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List pKGiftStateDescriptor = $convert.base64Decode(
    'CgtQS0dpZnRTdGF0ZRINCglBdmFpbGFibGUQABIPCgtEaXNhcHBlYXJlZBAB');

@$core.Deprecated('Use roleOnlineStateDescriptor instead')
const RoleOnlineState$json = {
  '1': 'RoleOnlineState',
  '2': [
    {'1': 'RoleOnlineStateNil', '2': 0},
    {'1': 'RoleOnlineStateOn', '2': 1},
    {'1': 'RoleOnlineStateStealth', '2': 2},
    {'1': 'RoleOnlineStateOff', '2': 3},
  ],
};

/// Descriptor for `RoleOnlineState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List roleOnlineStateDescriptor = $convert.base64Decode(
    'Cg9Sb2xlT25saW5lU3RhdGUSFgoSUm9sZU9ubGluZVN0YXRlTmlsEAASFQoRUm9sZU9ubGluZV'
    'N0YXRlT24QARIaChZSb2xlT25saW5lU3RhdGVTdGVhbHRoEAISFgoSUm9sZU9ubGluZVN0YXRl'
    'T2ZmEAM=');

@$core.Deprecated('Use attrVODescriptor instead')
const AttrVO$json = {
  '1': 'AttrVO',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.com.savvy.proto.AttrCode', '10': 'code'},
    {'1': 'val', '3': 2, '4': 1, '5': 3, '10': 'val'},
  ],
};

/// Descriptor for `AttrVO`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attrVODescriptor = $convert.base64Decode(
    'CgZBdHRyVk8SLQoEY29kZRgBIAEoDjIZLmNvbS5zYXZ2eS5wcm90by5BdHRyQ29kZVIEY29kZR'
    'IQCgN2YWwYAiABKANSA3ZhbA==');

@$core.Deprecated('Use kV32Descriptor instead')
const KV32$json = {
  '1': 'KV32',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 5, '10': 'key'},
    {'1': 'val', '3': 2, '4': 1, '5': 5, '10': 'val'},
  ],
};

/// Descriptor for `KV32`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List kV32Descriptor = $convert.base64Decode(
    'CgRLVjMyEhAKA2tleRgBIAEoBVIDa2V5EhAKA3ZhbBgCIAEoBVIDdmFs');

@$core.Deprecated('Use kV64Descriptor instead')
const KV64$json = {
  '1': 'KV64',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 5, '10': 'key'},
    {'1': 'val', '3': 2, '4': 1, '5': 3, '10': 'val'},
  ],
};

/// Descriptor for `KV64`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List kV64Descriptor = $convert.base64Decode(
    'CgRLVjY0EhAKA2tleRgBIAEoBVIDa2V5EhAKA3ZhbBgCIAEoA1IDdmFs');

@$core.Deprecated('Use kVStrDescriptor instead')
const KVStr$json = {
  '1': 'KVStr',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 5, '10': 'key'},
    {'1': 'val', '3': 2, '4': 1, '5': 9, '10': 'val'},
  ],
};

/// Descriptor for `KVStr`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List kVStrDescriptor = $convert.base64Decode(
    'CgVLVlN0chIQCgNrZXkYASABKAVSA2tleRIQCgN2YWwYAiABKAlSA3ZhbA==');

@$core.Deprecated('Use suitVODescriptor instead')
const SuitVO$json = {
  '1': 'SuitVO',
  '2': [
    {'1': 'positionId', '3': 1, '4': 1, '5': 3, '10': 'positionId'},
    {'1': 'goodsId', '3': 2, '4': 1, '5': 3, '10': 'goodsId'},
  ],
};

/// Descriptor for `SuitVO`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List suitVODescriptor = $convert.base64Decode(
    'CgZTdWl0Vk8SHgoKcG9zaXRpb25JZBgBIAEoA1IKcG9zaXRpb25JZBIYCgdnb29kc0lkGAIgAS'
    'gDUgdnb29kc0lk');

@$core.Deprecated('Use attrInfoDescriptor instead')
const AttrInfo$json = {
  '1': 'AttrInfo',
  '2': [
    {'1': 'attrs', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.AttrVO', '10': 'attrs'},
  ],
};

/// Descriptor for `AttrInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attrInfoDescriptor = $convert.base64Decode(
    'CghBdHRySW5mbxItCgVhdHRycxgBIAMoCzIXLmNvbS5zYXZ2eS5wcm90by5BdHRyVk9SBWF0dH'
    'Jz');

@$core.Deprecated('Use suitInfoDescriptor instead')
const SuitInfo$json = {
  '1': 'SuitInfo',
  '2': [
    {'1': 'suits', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.SuitVO', '10': 'suits'},
  ],
};

/// Descriptor for `SuitInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List suitInfoDescriptor = $convert.base64Decode(
    'CghTdWl0SW5mbxItCgVzdWl0cxgBIAMoCzIXLmNvbS5zYXZ2eS5wcm90by5TdWl0Vk9SBXN1aX'
    'Rz');

@$core.Deprecated('Use stateInfoDescriptor instead')
const StateInfo$json = {
  '1': 'StateInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'state', '3': 2, '4': 1, '5': 14, '6': '.com.savvy.proto.State', '10': 'state'},
    {'1': 'xyz', '3': 3, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZ', '10': 'xyz'},
    {'1': 'r', '3': 4, '4': 1, '5': 5, '10': 'r'},
  ],
};

/// Descriptor for `StateInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stateInfoDescriptor = $convert.base64Decode(
    'CglTdGF0ZUluZm8SDgoCaWQYASABKANSAmlkEiwKBXN0YXRlGAIgASgOMhYuY29tLnNhdnZ5Ln'
    'Byb3RvLlN0YXRlUgVzdGF0ZRImCgN4eXoYAyABKAsyFC5jb20uc2F2dnkucHJvdG8uWFlaUgN4'
    'eXoSDAoBchgEIAEoBVIBcg==');

@$core.Deprecated('Use xYZDescriptor instead')
const XYZ$json = {
  '1': 'XYZ',
  '2': [
    {'1': 'x', '3': 1, '4': 1, '5': 5, '10': 'x'},
    {'1': 'y', '3': 2, '4': 1, '5': 5, '10': 'y'},
    {'1': 'z', '3': 3, '4': 1, '5': 5, '10': 'z'},
  ],
};

/// Descriptor for `XYZ`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List xYZDescriptor = $convert.base64Decode(
    'CgNYWVoSDAoBeBgBIAEoBVIBeBIMCgF5GAIgASgFUgF5EgwKAXoYAyABKAVSAXo=');

@$core.Deprecated('Use roleInfoDescriptor instead')
const RoleInfo$json = {
  '1': 'RoleInfo',
  '2': [
    {'1': 'roleId', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'mark', '3': 3, '4': 1, '5': 5, '10': 'mark'},
    {'1': 'attrInfo', '3': 4, '4': 1, '5': 11, '6': '.com.savvy.proto.AttrInfo', '10': 'attrInfo'},
    {'1': 'suitInfo', '3': 5, '4': 1, '5': 11, '6': '.com.savvy.proto.SuitInfo', '10': 'suitInfo'},
  ],
};

/// Descriptor for `RoleInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roleInfoDescriptor = $convert.base64Decode(
    'CghSb2xlSW5mbxIWCgZyb2xlSWQYASABKANSBnJvbGVJZBISCgRuYW1lGAIgASgJUgRuYW1lEh'
    'IKBG1hcmsYAyABKAVSBG1hcmsSNQoIYXR0ckluZm8YBCABKAsyGS5jb20uc2F2dnkucHJvdG8u'
    'QXR0ckluZm9SCGF0dHJJbmZvEjUKCHN1aXRJbmZvGAUgASgLMhkuY29tLnNhdnZ5LnByb3RvLl'
    'N1aXRJbmZvUghzdWl0SW5mbw==');

@$core.Deprecated('Use roleSceneInfoDescriptor instead')
const RoleSceneInfo$json = {
  '1': 'RoleSceneInfo',
  '2': [
    {'1': 'roleId', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'attrInfo', '3': 3, '4': 1, '5': 11, '6': '.com.savvy.proto.AttrInfo', '10': 'attrInfo'},
    {'1': 'suitInfo', '3': 4, '4': 1, '5': 11, '6': '.com.savvy.proto.SuitInfo', '10': 'suitInfo'},
    {'1': 'stateInfo', '3': 5, '4': 1, '5': 11, '6': '.com.savvy.proto.StateInfo', '10': 'stateInfo'},
    {'1': 'seatGuid', '3': 6, '4': 1, '5': 9, '10': 'seatGuid'},
    {'1': 'roomId', '3': 7, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'uid', '3': 8, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `RoleSceneInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roleSceneInfoDescriptor = $convert.base64Decode(
    'Cg1Sb2xlU2NlbmVJbmZvEhYKBnJvbGVJZBgBIAEoA1IGcm9sZUlkEhIKBG5hbWUYAiABKAlSBG'
    '5hbWUSNQoIYXR0ckluZm8YAyABKAsyGS5jb20uc2F2dnkucHJvdG8uQXR0ckluZm9SCGF0dHJJ'
    'bmZvEjUKCHN1aXRJbmZvGAQgASgLMhkuY29tLnNhdnZ5LnByb3RvLlN1aXRJbmZvUghzdWl0SW'
    '5mbxI4CglzdGF0ZUluZm8YBSABKAsyGi5jb20uc2F2dnkucHJvdG8uU3RhdGVJbmZvUglzdGF0'
    'ZUluZm8SGgoIc2VhdEd1aWQYBiABKAlSCHNlYXRHdWlkEhYKBnJvb21JZBgHIAEoA1IGcm9vbU'
    'lkEhAKA3VpZBgIIAEoCVIDdWlk');

@$core.Deprecated('Use userInfoDescriptor instead')
const UserInfo$json = {
  '1': 'UserInfo',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'username', '3': 3, '4': 1, '5': 9, '10': 'username'},
    {'1': 'avatar_url', '3': 4, '4': 1, '5': 9, '10': 'avatarUrl'},
    {'1': 'type', '3': 5, '4': 1, '5': 5, '10': 'type'},
    {'1': 'admin_type', '3': 6, '4': 1, '5': 5, '10': 'adminType'},
    {'1': 'level', '3': 7, '4': 1, '5': 9, '10': 'level'},
  ],
};

/// Descriptor for `UserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInfoDescriptor = $convert.base64Decode(
    'CghVc2VySW5mbxIQCgN1aWQYASABKAlSA3VpZBIXCgdyb2xlX2lkGAIgASgDUgZyb2xlSWQSGg'
    'oIdXNlcm5hbWUYAyABKAlSCHVzZXJuYW1lEh0KCmF2YXRhcl91cmwYBCABKAlSCWF2YXRhclVy'
    'bBISCgR0eXBlGAUgASgFUgR0eXBlEh0KCmFkbWluX3R5cGUYBiABKAVSCWFkbWluVHlwZRIUCg'
    'VsZXZlbBgHIAEoCVIFbGV2ZWw=');

@$core.Deprecated('Use mikeInfoDescriptor instead')
const MikeInfo$json = {
  '1': 'MikeInfo',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'mike_id', '3': 2, '4': 1, '5': 3, '10': 'mikeId'},
    {'1': 'mike_no', '3': 3, '4': 1, '5': 9, '10': 'mikeNo'},
    {'1': 'uid', '3': 4, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'role_id', '3': 6, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'number', '3': 7, '4': 1, '5': 3, '10': 'number'},
  ],
};

/// Descriptor for `MikeInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mikeInfoDescriptor = $convert.base64Decode(
    'CghNaWtlSW5mbxIXCgdyb29tX2lkGAEgASgDUgZyb29tSWQSFwoHbWlrZV9pZBgCIAEoA1IGbW'
    'lrZUlkEhcKB21pa2Vfbm8YAyABKAlSBm1pa2VObxIQCgN1aWQYBCABKAlSA3VpZBIXCgdyb2xl'
    'X2lkGAYgASgDUgZyb2xlSWQSFgoGbnVtYmVyGAcgASgDUgZudW1iZXI=');

@$core.Deprecated('Use roomUserInfoDescriptor instead')
const RoomUserInfo$json = {
  '1': 'RoomUserInfo',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'room_id', '3': 3, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'username', '3': 4, '4': 1, '5': 9, '10': 'username'},
    {'1': 'avatar_url', '3': 5, '4': 1, '5': 9, '10': 'avatarUrl'},
    {'1': 'type', '3': 6, '4': 1, '5': 5, '10': 'type'},
    {'1': 'admin_type', '3': 7, '4': 1, '5': 5, '10': 'adminType'},
    {'1': 'level', '3': 8, '4': 1, '5': 9, '10': 'level'},
  ],
};

/// Descriptor for `RoomUserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomUserInfoDescriptor = $convert.base64Decode(
    'CgxSb29tVXNlckluZm8SEAoDdWlkGAEgASgJUgN1aWQSFwoHcm9sZV9pZBgCIAEoA1IGcm9sZU'
    'lkEhcKB3Jvb21faWQYAyABKANSBnJvb21JZBIaCgh1c2VybmFtZRgEIAEoCVIIdXNlcm5hbWUS'
    'HQoKYXZhdGFyX3VybBgFIAEoCVIJYXZhdGFyVXJsEhIKBHR5cGUYBiABKAVSBHR5cGUSHQoKYW'
    'RtaW5fdHlwZRgHIAEoBVIJYWRtaW5UeXBlEhQKBWxldmVsGAggASgJUgVsZXZlbA==');

@$core.Deprecated('Use unityUIStatusDescriptor instead')
const UnityUIStatus$json = {
  '1': 'UnityUIStatus',
  '2': [
    {'1': 'part', '3': 1, '4': 1, '5': 5, '10': 'part'},
    {'1': 'close', '3': 2, '4': 1, '5': 5, '10': 'close'},
  ],
};

/// Descriptor for `UnityUIStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unityUIStatusDescriptor = $convert.base64Decode(
    'Cg1Vbml0eVVJU3RhdHVzEhIKBHBhcnQYASABKAVSBHBhcnQSFAoFY2xvc2UYAiABKAVSBWNsb3'
    'Nl');

@$core.Deprecated('Use appUIStatusDescriptor instead')
const AppUIStatus$json = {
  '1': 'AppUIStatus',
  '2': [
    {'1': 'part', '3': 1, '4': 1, '5': 5, '10': 'part'},
    {'1': 'close', '3': 2, '4': 1, '5': 5, '10': 'close'},
  ],
};

/// Descriptor for `AppUIStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List appUIStatusDescriptor = $convert.base64Decode(
    'CgtBcHBVSVN0YXR1cxISCgRwYXJ0GAEgASgFUgRwYXJ0EhQKBWNsb3NlGAIgASgFUgVjbG9zZQ'
    '==');

@$core.Deprecated('Use pKGuildInfoDescriptor instead')
const PKGuildInfo$json = {
  '1': 'PKGuildInfo',
  '2': [
    {'1': 'guildId', '3': 1, '4': 1, '5': 3, '10': 'guildId'},
    {'1': 'guildName', '3': 2, '4': 1, '5': 9, '10': 'guildName'},
  ],
};

/// Descriptor for `PKGuildInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pKGuildInfoDescriptor = $convert.base64Decode(
    'CgtQS0d1aWxkSW5mbxIYCgdndWlsZElkGAEgASgDUgdndWlsZElkEhwKCWd1aWxkTmFtZRgCIA'
    'EoCVIJZ3VpbGROYW1l');

@$core.Deprecated('Use pKUserInfoDescriptor instead')
const PKUserInfo$json = {
  '1': 'PKUserInfo',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 3, '10': 'userId'},
    {'1': 'gender', '3': 2, '4': 1, '5': 3, '10': 'gender'},
    {'1': 'userName', '3': 3, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'guildId', '3': 4, '4': 1, '5': 3, '10': 'guildId'},
    {'1': 'isManager', '3': 5, '4': 1, '5': 8, '10': 'isManager'},
    {'1': 'avatarUrl', '3': 6, '4': 1, '5': 9, '10': 'avatarUrl'},
    {'1': 'mikeId', '3': 7, '4': 1, '5': 5, '10': 'mikeId'},
    {'1': 'clothingIds', '3': 8, '4': 3, '5': 3, '10': 'clothingIds'},
    {'1': 'pkRoomId', '3': 9, '4': 1, '5': 3, '10': 'pkRoomId'},
    {'1': 'BattleStatus', '3': 10, '4': 1, '5': 5, '10': 'BattleStatus'},
  ],
};

/// Descriptor for `PKUserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pKUserInfoDescriptor = $convert.base64Decode(
    'CgpQS1VzZXJJbmZvEhYKBnVzZXJJZBgBIAEoA1IGdXNlcklkEhYKBmdlbmRlchgCIAEoA1IGZ2'
    'VuZGVyEhoKCHVzZXJOYW1lGAMgASgJUgh1c2VyTmFtZRIYCgdndWlsZElkGAQgASgDUgdndWls'
    'ZElkEhwKCWlzTWFuYWdlchgFIAEoCFIJaXNNYW5hZ2VyEhwKCWF2YXRhclVybBgGIAEoCVIJYX'
    'ZhdGFyVXJsEhYKBm1pa2VJZBgHIAEoBVIGbWlrZUlkEiAKC2Nsb3RoaW5nSWRzGAggAygDUgtj'
    'bG90aGluZ0lkcxIaCghwa1Jvb21JZBgJIAEoA1IIcGtSb29tSWQSIgoMQmF0dGxlU3RhdHVzGA'
    'ogASgFUgxCYXR0bGVTdGF0dXM=');

@$core.Deprecated('Use pKRoleBattleInfoLFDescriptor instead')
const PKRoleBattleInfoLF$json = {
  '1': 'PKRoleBattleInfoLF',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 3, '10': 'userId'},
    {'1': 'currentBlood', '3': 2, '4': 1, '5': 5, '10': 'currentBlood'},
    {'1': 'totalBlood', '3': 3, '4': 1, '5': 5, '10': 'totalBlood'},
    {'1': 'shield', '3': 4, '4': 1, '5': 5, '10': 'shield'},
    {'1': 'attack', '3': 5, '4': 1, '5': 5, '10': 'attack'},
    {'1': 'speed', '3': 6, '4': 1, '5': 5, '10': 'speed'},
    {'1': 'swordCount', '3': 7, '4': 1, '5': 5, '10': 'swordCount'},
  ],
};

/// Descriptor for `PKRoleBattleInfoLF`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pKRoleBattleInfoLFDescriptor = $convert.base64Decode(
    'ChJQS1JvbGVCYXR0bGVJbmZvTEYSFgoGdXNlcklkGAEgASgDUgZ1c2VySWQSIgoMY3VycmVudE'
    'Jsb29kGAIgASgFUgxjdXJyZW50Qmxvb2QSHgoKdG90YWxCbG9vZBgDIAEoBVIKdG90YWxCbG9v'
    'ZBIWCgZzaGllbGQYBCABKAVSBnNoaWVsZBIWCgZhdHRhY2sYBSABKAVSBmF0dGFjaxIUCgVzcG'
    'VlZBgGIAEoBVIFc3BlZWQSHgoKc3dvcmRDb3VudBgHIAEoBVIKc3dvcmRDb3VudA==');

@$core.Deprecated('Use pKRoleBattleInfoHFDescriptor instead')
const PKRoleBattleInfoHF$json = {
  '1': 'PKRoleBattleInfoHF',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 3, '10': 'userId'},
    {'1': 'position', '3': 2, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZ', '10': 'position'},
    {'1': 'rotation', '3': 3, '4': 1, '5': 3, '10': 'rotation'},
  ],
};

/// Descriptor for `PKRoleBattleInfoHF`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pKRoleBattleInfoHFDescriptor = $convert.base64Decode(
    'ChJQS1JvbGVCYXR0bGVJbmZvSEYSFgoGdXNlcklkGAEgASgDUgZ1c2VySWQSMAoIcG9zaXRpb2'
    '4YAiABKAsyFC5jb20uc2F2dnkucHJvdG8uWFlaUghwb3NpdGlvbhIaCghyb3RhdGlvbhgDIAEo'
    'A1IIcm90YXRpb24=');

@$core.Deprecated('Use pKRoleSummaryDescriptor instead')
const PKRoleSummary$json = {
  '1': 'PKRoleSummary',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 3, '10': 'userId'},
    {'1': 'totalDamage', '3': 2, '4': 1, '5': 5, '10': 'totalDamage'},
    {'1': 'survivedTime', '3': 3, '4': 1, '5': 3, '10': 'survivedTime'},
    {'1': 'attackedCount', '3': 4, '4': 1, '5': 5, '10': 'attackedCount'},
    {'1': 'outBlood', '3': 5, '4': 1, '5': 5, '10': 'outBlood'},
  ],
};

/// Descriptor for `PKRoleSummary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pKRoleSummaryDescriptor = $convert.base64Decode(
    'Cg1QS1JvbGVTdW1tYXJ5EhYKBnVzZXJJZBgBIAEoA1IGdXNlcklkEiAKC3RvdGFsRGFtYWdlGA'
    'IgASgFUgt0b3RhbERhbWFnZRIiCgxzdXJ2aXZlZFRpbWUYAyABKANSDHN1cnZpdmVkVGltZRIk'
    'Cg1hdHRhY2tlZENvdW50GAQgASgFUg1hdHRhY2tlZENvdW50EhoKCG91dEJsb29kGAUgASgFUg'
    'hvdXRCbG9vZA==');

@$core.Deprecated('Use pKPresenterInfoDescriptor instead')
const PKPresenterInfo$json = {
  '1': 'PKPresenterInfo',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 3, '10': 'userId'},
    {'1': 'userName', '3': 2, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'avatarUrl', '3': 3, '4': 1, '5': 9, '10': 'avatarUrl'},
    {'1': 'guildId', '3': 4, '4': 1, '5': 3, '10': 'guildId'},
    {'1': 'contribution', '3': 5, '4': 1, '5': 5, '10': 'contribution'},
  ],
};

/// Descriptor for `PKPresenterInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pKPresenterInfoDescriptor = $convert.base64Decode(
    'Cg9QS1ByZXNlbnRlckluZm8SFgoGdXNlcklkGAEgASgDUgZ1c2VySWQSGgoIdXNlck5hbWUYAi'
    'ABKAlSCHVzZXJOYW1lEhwKCWF2YXRhclVybBgDIAEoCVIJYXZhdGFyVXJsEhgKB2d1aWxkSWQY'
    'BCABKANSB2d1aWxkSWQSIgoMY29udHJpYnV0aW9uGAUgASgFUgxjb250cmlidXRpb24=');

@$core.Deprecated('Use pKGiftDescriptor instead')
const PKGift$json = {
  '1': 'PKGift',
  '2': [
    {'1': 'giftId', '3': 1, '4': 1, '5': 3, '10': 'giftId'},
    {'1': 'position', '3': 2, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZ', '10': 'position'},
    {'1': 'state', '3': 3, '4': 1, '5': 14, '6': '.com.savvy.proto.PKGiftState', '10': 'state'},
    {'1': 'modelId', '3': 4, '4': 1, '5': 9, '10': 'modelId'},
    {'1': 'pickUserId', '3': 6, '4': 1, '5': 3, '10': 'pickUserId'},
    {'1': 'id', '3': 7, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `PKGift`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pKGiftDescriptor = $convert.base64Decode(
    'CgZQS0dpZnQSFgoGZ2lmdElkGAEgASgDUgZnaWZ0SWQSMAoIcG9zaXRpb24YAiABKAsyFC5jb2'
    '0uc2F2dnkucHJvdG8uWFlaUghwb3NpdGlvbhIyCgVzdGF0ZRgDIAEoDjIcLmNvbS5zYXZ2eS5w'
    'cm90by5QS0dpZnRTdGF0ZVIFc3RhdGUSGAoHbW9kZWxJZBgEIAEoCVIHbW9kZWxJZBIeCgpwaW'
    'NrVXNlcklkGAYgASgDUgpwaWNrVXNlcklkEg4KAmlkGAcgASgDUgJpZA==');

@$core.Deprecated('Use pKSceneToxicDescriptor instead')
const PKSceneToxic$json = {
  '1': 'PKSceneToxic',
  '2': [
    {'1': 'safeRadius', '3': 1, '4': 1, '5': 5, '10': 'safeRadius'},
    {'1': 'takeEffectTime', '3': 2, '4': 1, '5': 3, '10': 'takeEffectTime'},
    {'1': 'safePosition', '3': 3, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZ', '10': 'safePosition'},
    {'1': 'toxicFogSpeed', '3': 5, '4': 1, '5': 5, '10': 'toxicFogSpeed'},
    {'1': 'nextSafeTakeEffectTime', '3': 6, '4': 1, '5': 3, '10': 'nextSafeTakeEffectTime'},
  ],
};

/// Descriptor for `PKSceneToxic`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pKSceneToxicDescriptor = $convert.base64Decode(
    'CgxQS1NjZW5lVG94aWMSHgoKc2FmZVJhZGl1cxgBIAEoBVIKc2FmZVJhZGl1cxImCg50YWtlRW'
    'ZmZWN0VGltZRgCIAEoA1IOdGFrZUVmZmVjdFRpbWUSOAoMc2FmZVBvc2l0aW9uGAMgASgLMhQu'
    'Y29tLnNhdnZ5LnByb3RvLlhZWlIMc2FmZVBvc2l0aW9uEiQKDXRveGljRm9nU3BlZWQYBSABKA'
    'VSDXRveGljRm9nU3BlZWQSNgoWbmV4dFNhZmVUYWtlRWZmZWN0VGltZRgGIAEoA1IWbmV4dFNh'
    'ZmVUYWtlRWZmZWN0VGltZQ==');

@$core.Deprecated('Use pkRoomInfoDescriptor instead')
const PkRoomInfo$json = {
  '1': 'PkRoomInfo',
  '2': [
    {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    {'1': 'room_name', '3': 2, '4': 1, '5': 9, '10': 'roomName'},
    {'1': 'room_image', '3': 3, '4': 1, '5': 9, '10': 'roomImage'},
    {'1': 'hot_value', '3': 4, '4': 1, '5': 5, '10': 'hotValue'},
    {'1': 'is_invite', '3': 5, '4': 1, '5': 8, '10': 'isInvite'},
  ],
};

/// Descriptor for `PkRoomInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pkRoomInfoDescriptor = $convert.base64Decode(
    'CgpQa1Jvb21JbmZvEhcKB3Jvb21faWQYASABKANSBnJvb21JZBIbCglyb29tX25hbWUYAiABKA'
    'lSCHJvb21OYW1lEh0KCnJvb21faW1hZ2UYAyABKAlSCXJvb21JbWFnZRIbCglob3RfdmFsdWUY'
    'BCABKAVSCGhvdFZhbHVlEhsKCWlzX2ludml0ZRgFIAEoCFIIaXNJbnZpdGU=');

@$core.Deprecated('Use pkRoleDefaultConfigurationDescriptor instead')
const PkRoleDefaultConfiguration$json = {
  '1': 'PkRoleDefaultConfiguration',
  '2': [
    {'1': 'role_radius', '3': 1, '4': 1, '5': 5, '10': 'roleRadius'},
    {'1': 'speed', '3': 2, '4': 1, '5': 5, '10': 'speed'},
    {'1': 'weapon_length', '3': 3, '4': 1, '5': 5, '10': 'weaponLength'},
    {'1': 'weapon_speed', '3': 4, '4': 1, '5': 5, '10': 'weaponSpeed'},
    {'1': 'max_weapon_num', '3': 5, '4': 1, '5': 5, '10': 'maxWeaponNum'},
    {'1': 'blood', '3': 6, '4': 1, '5': 5, '10': 'blood'},
    {'1': 'TotalBlood', '3': 7, '4': 1, '5': 5, '10': 'TotalBlood'},
    {'1': 'Shield', '3': 8, '4': 1, '5': 5, '10': 'Shield'},
    {'1': 'Attack', '3': 9, '4': 1, '5': 5, '10': 'Attack'},
    {'1': 'countdown', '3': 10, '4': 1, '5': 3, '10': 'countdown'},
    {'1': 'sword_count', '3': 11, '4': 1, '5': 5, '10': 'swordCount'},
    {'1': 'max_speed', '3': 12, '4': 1, '5': 5, '10': 'maxSpeed'},
  ],
};

/// Descriptor for `PkRoleDefaultConfiguration`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pkRoleDefaultConfigurationDescriptor = $convert.base64Decode(
    'ChpQa1JvbGVEZWZhdWx0Q29uZmlndXJhdGlvbhIfCgtyb2xlX3JhZGl1cxgBIAEoBVIKcm9sZV'
    'JhZGl1cxIUCgVzcGVlZBgCIAEoBVIFc3BlZWQSIwoNd2VhcG9uX2xlbmd0aBgDIAEoBVIMd2Vh'
    'cG9uTGVuZ3RoEiEKDHdlYXBvbl9zcGVlZBgEIAEoBVILd2VhcG9uU3BlZWQSJAoObWF4X3dlYX'
    'Bvbl9udW0YBSABKAVSDG1heFdlYXBvbk51bRIUCgVibG9vZBgGIAEoBVIFYmxvb2QSHgoKVG90'
    'YWxCbG9vZBgHIAEoBVIKVG90YWxCbG9vZBIWCgZTaGllbGQYCCABKAVSBlNoaWVsZBIWCgZBdH'
    'RhY2sYCSABKAVSBkF0dGFjaxIcCgljb3VudGRvd24YCiABKANSCWNvdW50ZG93bhIfCgtzd29y'
    'ZF9jb3VudBgLIAEoBVIKc3dvcmRDb3VudBIbCgltYXhfc3BlZWQYDCABKAVSCG1heFNwZWVk');

@$core.Deprecated('Use roleOnlineDescriptor instead')
const RoleOnline$json = {
  '1': 'RoleOnline',
  '2': [
    {'1': 'role_id', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'state', '3': 2, '4': 1, '5': 14, '6': '.com.savvy.proto.RoleOnlineState', '10': 'state'},
  ],
};

/// Descriptor for `RoleOnline`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roleOnlineDescriptor = $convert.base64Decode(
    'CgpSb2xlT25saW5lEhcKB3JvbGVfaWQYASABKANSBnJvbGVJZBI2CgVzdGF0ZRgCIAEoDjIgLm'
    'NvbS5zYXZ2eS5wcm90by5Sb2xlT25saW5lU3RhdGVSBXN0YXRl');

@$core.Deprecated('Use sSStrDescriptor instead')
const SSStr$json = {
  '1': 'SSStr',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'val', '3': 2, '4': 1, '5': 9, '10': 'val'},
  ],
};

/// Descriptor for `SSStr`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sSStrDescriptor = $convert.base64Decode(
    'CgVTU1N0chIQCgNrZXkYASABKAlSA2tleRIQCgN2YWwYAiABKAlSA3ZhbA==');

@$core.Deprecated('Use seatInfoDescriptor instead')
const SeatInfo$json = {
  '1': 'SeatInfo',
  '2': [
    {'1': 'roleId', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
    {'1': 'seatGuid', '3': 2, '4': 1, '5': 9, '10': 'seatGuid'},
  ],
};

/// Descriptor for `SeatInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List seatInfoDescriptor = $convert.base64Decode(
    'CghTZWF0SW5mbxIWCgZyb2xlSWQYASABKANSBnJvbGVJZBIaCghzZWF0R3VpZBgCIAEoCVIIc2'
    'VhdEd1aWQ=');

@$core.Deprecated('Use sceneSeatInfoDescriptor instead')
const SceneSeatInfo$json = {
  '1': 'SceneSeatInfo',
  '2': [
    {'1': 'list', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.SeatInfo', '10': 'list'},
  ],
};

/// Descriptor for `SceneSeatInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneSeatInfoDescriptor = $convert.base64Decode(
    'Cg1TY2VuZVNlYXRJbmZvEi0KBGxpc3QYASADKAsyGS5jb20uc2F2dnkucHJvdG8uU2VhdEluZm'
    '9SBGxpc3Q=');

