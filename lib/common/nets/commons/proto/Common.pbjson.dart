///
//  Generated code. Do not modify.
//  source: Common.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use attrCodeDescriptor instead')
const AttrCode$json = const {
  '1': 'AttrCode',
  '2': const [
    const {'1': 'none', '2': 0},
    const {'1': 'lv', '2': 1},
    const {'1': 'charm_lv', '2': 2},
    const {'1': 'sex', '2': 3},
    const {'1': 'career', '2': 4},
    const {'1': 'speed', '2': 5},
    const {'1': 'scene', '2': 6},
    const {'1': 'room', '2': 7},
    const {'1': 'job', '2': 8},
    const {'1': 'avatar_url', '2': 9},
    const {'1': 'public_id', '2': 10},
    const {'1': 'description', '2': 11},
    const {'1': 'growth_value', '2': 12},
    const {'1': 'charm_growth_value', '2': 13},
    const {'1': 'real_name_type', '2': 14},
    const {'1': 'mike_id', '2': 16},
    const {'1': 'mike_no', '2': 17},
    const {'1': 'animate', '2': 15},
    const {'1': 'stage', '2': 18},
  ],
};

/// Descriptor for `AttrCode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List attrCodeDescriptor = $convert.base64Decode('CghBdHRyQ29kZRIICgRub25lEAASBgoCbHYQARIMCghjaGFybV9sdhACEgcKA3NleBADEgoKBmNhcmVlchAEEgkKBXNwZWVkEAUSCQoFc2NlbmUQBhIICgRyb29tEAcSBwoDam9iEAgSDgoKYXZhdGFyX3VybBAJEg0KCXB1YmxpY19pZBAKEg8KC2Rlc2NyaXB0aW9uEAsSEAoMZ3Jvd3RoX3ZhbHVlEAwSFgoSY2hhcm1fZ3Jvd3RoX3ZhbHVlEA0SEgoOcmVhbF9uYW1lX3R5cGUQDhILCgdtaWtlX2lkEBASCwoHbWlrZV9ubxAREgsKB2FuaW1hdGUQDxIJCgVzdGFnZRAS');
@$core.Deprecated('Use stateDescriptor instead')
const State$json = const {
  '1': 'State',
  '2': const [
    const {'1': 'None', '2': 0},
    const {'1': 'Mai', '2': 1},
    const {'1': 'Sit', '2': 2},
    const {'1': 'Swim', '2': 3},
  ],
};

/// Descriptor for `State`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List stateDescriptor = $convert.base64Decode('CgVTdGF0ZRIICgROb25lEAASBwoDTWFpEAESBwoDU2l0EAISCAoEU3dpbRAD');
@$core.Deprecated('Use pKGiftStateDescriptor instead')
const PKGiftState$json = const {
  '1': 'PKGiftState',
  '2': const [
    const {'1': 'Available', '2': 0},
    const {'1': 'Disappeared', '2': 1},
  ],
};

/// Descriptor for `PKGiftState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List pKGiftStateDescriptor = $convert.base64Decode('CgtQS0dpZnRTdGF0ZRINCglBdmFpbGFibGUQABIPCgtEaXNhcHBlYXJlZBAB');
@$core.Deprecated('Use attrVODescriptor instead')
const AttrVO$json = const {
  '1': 'AttrVO',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.com.savvy.proto.AttrCode', '10': 'code'},
    const {'1': 'val', '3': 2, '4': 1, '5': 3, '10': 'val'},
  ],
};

/// Descriptor for `AttrVO`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attrVODescriptor = $convert.base64Decode('CgZBdHRyVk8SLQoEY29kZRgBIAEoDjIZLmNvbS5zYXZ2eS5wcm90by5BdHRyQ29kZVIEY29kZRIQCgN2YWwYAiABKANSA3ZhbA==');
@$core.Deprecated('Use kV32Descriptor instead')
const KV32$json = const {
  '1': 'KV32',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 5, '10': 'key'},
    const {'1': 'val', '3': 2, '4': 1, '5': 5, '10': 'val'},
  ],
};

/// Descriptor for `KV32`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List kV32Descriptor = $convert.base64Decode('CgRLVjMyEhAKA2tleRgBIAEoBVIDa2V5EhAKA3ZhbBgCIAEoBVIDdmFs');
@$core.Deprecated('Use kV64Descriptor instead')
const KV64$json = const {
  '1': 'KV64',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 5, '10': 'key'},
    const {'1': 'val', '3': 2, '4': 1, '5': 3, '10': 'val'},
  ],
};

/// Descriptor for `KV64`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List kV64Descriptor = $convert.base64Decode('CgRLVjY0EhAKA2tleRgBIAEoBVIDa2V5EhAKA3ZhbBgCIAEoA1IDdmFs');
@$core.Deprecated('Use kVStrDescriptor instead')
const KVStr$json = const {
  '1': 'KVStr',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 5, '10': 'key'},
    const {'1': 'val', '3': 2, '4': 1, '5': 9, '10': 'val'},
  ],
};

/// Descriptor for `KVStr`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List kVStrDescriptor = $convert.base64Decode('CgVLVlN0chIQCgNrZXkYASABKAVSA2tleRIQCgN2YWwYAiABKAlSA3ZhbA==');
@$core.Deprecated('Use suitVODescriptor instead')
const SuitVO$json = const {
  '1': 'SuitVO',
  '2': const [
    const {'1': 'positionId', '3': 1, '4': 1, '5': 3, '10': 'positionId'},
    const {'1': 'goodsId', '3': 2, '4': 1, '5': 3, '10': 'goodsId'},
  ],
};

/// Descriptor for `SuitVO`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List suitVODescriptor = $convert.base64Decode('CgZTdWl0Vk8SHgoKcG9zaXRpb25JZBgBIAEoA1IKcG9zaXRpb25JZBIYCgdnb29kc0lkGAIgASgDUgdnb29kc0lk');
@$core.Deprecated('Use kVStateDescriptor instead')
const KVState$json = const {
  '1': 'KVState',
  '2': const [
    const {'1': 'roleId', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
    const {'1': 'state', '3': 2, '4': 1, '5': 9, '10': 'state'},
  ],
};

/// Descriptor for `KVState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List kVStateDescriptor = $convert.base64Decode('CgdLVlN0YXRlEhYKBnJvbGVJZBgBIAEoA1IGcm9sZUlkEhQKBXN0YXRlGAIgASgJUgVzdGF0ZQ==');
@$core.Deprecated('Use attrInfoDescriptor instead')
const AttrInfo$json = const {
  '1': 'AttrInfo',
  '2': const [
    const {'1': 'attrs', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.AttrVO', '10': 'attrs'},
  ],
};

/// Descriptor for `AttrInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attrInfoDescriptor = $convert.base64Decode('CghBdHRySW5mbxItCgVhdHRycxgBIAMoCzIXLmNvbS5zYXZ2eS5wcm90by5BdHRyVk9SBWF0dHJz');
@$core.Deprecated('Use suitInfoDescriptor instead')
const SuitInfo$json = const {
  '1': 'SuitInfo',
  '2': const [
    const {'1': 'suits', '3': 1, '4': 3, '5': 11, '6': '.com.savvy.proto.SuitVO', '10': 'suits'},
  ],
};

/// Descriptor for `SuitInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List suitInfoDescriptor = $convert.base64Decode('CghTdWl0SW5mbxItCgVzdWl0cxgBIAMoCzIXLmNvbS5zYXZ2eS5wcm90by5TdWl0Vk9SBXN1aXRz');
@$core.Deprecated('Use stateInfoDescriptor instead')
const StateInfo$json = const {
  '1': 'StateInfo',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'state', '3': 2, '4': 1, '5': 14, '6': '.com.savvy.proto.State', '10': 'state'},
    const {'1': 'xyz', '3': 3, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZ', '10': 'xyz'},
    const {'1': 'r', '3': 4, '4': 1, '5': 5, '10': 'r'},
  ],
};

/// Descriptor for `StateInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stateInfoDescriptor = $convert.base64Decode('CglTdGF0ZUluZm8SDgoCaWQYASABKANSAmlkEiwKBXN0YXRlGAIgASgOMhYuY29tLnNhdnZ5LnByb3RvLlN0YXRlUgVzdGF0ZRImCgN4eXoYAyABKAsyFC5jb20uc2F2dnkucHJvdG8uWFlaUgN4eXoSDAoBchgEIAEoBVIBcg==');
@$core.Deprecated('Use xYZDescriptor instead')
const XYZ$json = const {
  '1': 'XYZ',
  '2': const [
    const {'1': 'x', '3': 1, '4': 1, '5': 5, '10': 'x'},
    const {'1': 'y', '3': 2, '4': 1, '5': 5, '10': 'y'},
    const {'1': 'z', '3': 3, '4': 1, '5': 5, '10': 'z'},
  ],
};

/// Descriptor for `XYZ`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List xYZDescriptor = $convert.base64Decode('CgNYWVoSDAoBeBgBIAEoBVIBeBIMCgF5GAIgASgFUgF5EgwKAXoYAyABKAVSAXo=');
@$core.Deprecated('Use roleInfoDescriptor instead')
const RoleInfo$json = const {
  '1': 'RoleInfo',
  '2': const [
    const {'1': 'roleId', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'mark', '3': 3, '4': 1, '5': 5, '10': 'mark'},
    const {'1': 'attrInfo', '3': 4, '4': 1, '5': 11, '6': '.com.savvy.proto.AttrInfo', '10': 'attrInfo'},
    const {'1': 'suitInfo', '3': 5, '4': 1, '5': 11, '6': '.com.savvy.proto.SuitInfo', '10': 'suitInfo'},
    const {'1': 'state', '3': 6, '4': 1, '5': 14, '6': '.com.savvy.proto.State', '10': 'state'},
  ],
};

/// Descriptor for `RoleInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roleInfoDescriptor = $convert.base64Decode('CghSb2xlSW5mbxIWCgZyb2xlSWQYASABKANSBnJvbGVJZBISCgRuYW1lGAIgASgJUgRuYW1lEhIKBG1hcmsYAyABKAVSBG1hcmsSNQoIYXR0ckluZm8YBCABKAsyGS5jb20uc2F2dnkucHJvdG8uQXR0ckluZm9SCGF0dHJJbmZvEjUKCHN1aXRJbmZvGAUgASgLMhkuY29tLnNhdnZ5LnByb3RvLlN1aXRJbmZvUghzdWl0SW5mbxIsCgVzdGF0ZRgGIAEoDjIWLmNvbS5zYXZ2eS5wcm90by5TdGF0ZVIFc3RhdGU=');
@$core.Deprecated('Use roleDetailInfoDescriptor instead')
const RoleDetailInfo$json = const {
  '1': 'RoleDetailInfo',
  '2': const [
    const {'1': 'roleId', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'attrInfo', '3': 3, '4': 1, '5': 11, '6': '.com.savvy.proto.AttrInfo', '10': 'attrInfo'},
    const {'1': 'suitInfo', '3': 4, '4': 1, '5': 11, '6': '.com.savvy.proto.SuitInfo', '10': 'suitInfo'},
    const {'1': 'state', '3': 5, '4': 1, '5': 14, '6': '.com.savvy.proto.State', '10': 'state'},
  ],
};

/// Descriptor for `RoleDetailInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roleDetailInfoDescriptor = $convert.base64Decode('Cg5Sb2xlRGV0YWlsSW5mbxIWCgZyb2xlSWQYASABKANSBnJvbGVJZBISCgRuYW1lGAIgASgJUgRuYW1lEjUKCGF0dHJJbmZvGAMgASgLMhkuY29tLnNhdnZ5LnByb3RvLkF0dHJJbmZvUghhdHRySW5mbxI1CghzdWl0SW5mbxgEIAEoCzIZLmNvbS5zYXZ2eS5wcm90by5TdWl0SW5mb1IIc3VpdEluZm8SLAoFc3RhdGUYBSABKA4yFi5jb20uc2F2dnkucHJvdG8uU3RhdGVSBXN0YXRl');
@$core.Deprecated('Use roleSceneInfoDescriptor instead')
const RoleSceneInfo$json = const {
  '1': 'RoleSceneInfo',
  '2': const [
    const {'1': 'roleId', '3': 1, '4': 1, '5': 3, '10': 'roleId'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'attrInfo', '3': 3, '4': 1, '5': 11, '6': '.com.savvy.proto.AttrInfo', '10': 'attrInfo'},
    const {'1': 'suitInfo', '3': 4, '4': 1, '5': 11, '6': '.com.savvy.proto.SuitInfo', '10': 'suitInfo'},
    const {'1': 'stateInfo', '3': 5, '4': 1, '5': 11, '6': '.com.savvy.proto.StateInfo', '10': 'stateInfo'},
    const {'1': 'seatGuid', '3': 6, '4': 1, '5': 9, '10': 'seatGuid'},
    const {'1': 'roomId', '3': 7, '4': 1, '5': 3, '10': 'roomId'},
    const {'1': 'uid', '3': 8, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `RoleSceneInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roleSceneInfoDescriptor = $convert.base64Decode('Cg1Sb2xlU2NlbmVJbmZvEhYKBnJvbGVJZBgBIAEoA1IGcm9sZUlkEhIKBG5hbWUYAiABKAlSBG5hbWUSNQoIYXR0ckluZm8YAyABKAsyGS5jb20uc2F2dnkucHJvdG8uQXR0ckluZm9SCGF0dHJJbmZvEjUKCHN1aXRJbmZvGAQgASgLMhkuY29tLnNhdnZ5LnByb3RvLlN1aXRJbmZvUghzdWl0SW5mbxI4CglzdGF0ZUluZm8YBSABKAsyGi5jb20uc2F2dnkucHJvdG8uU3RhdGVJbmZvUglzdGF0ZUluZm8SGgoIc2VhdEd1aWQYBiABKAlSCHNlYXRHdWlkEhYKBnJvb21JZBgHIAEoA1IGcm9vbUlkEhAKA3VpZBgIIAEoCVIDdWlk');
@$core.Deprecated('Use roleDataDescriptor instead')
const RoleData$json = const {
  '1': 'RoleData',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'attrInfo', '3': 2, '4': 1, '5': 11, '6': '.com.savvy.proto.AttrInfo', '10': 'attrInfo'},
    const {'1': 'suitInfo', '3': 3, '4': 1, '5': 11, '6': '.com.savvy.proto.SuitInfo', '10': 'suitInfo'},
    const {'1': 'stateInfo', '3': 4, '4': 1, '5': 11, '6': '.com.savvy.proto.StateInfo', '10': 'stateInfo'},
  ],
};

/// Descriptor for `RoleData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roleDataDescriptor = $convert.base64Decode('CghSb2xlRGF0YRIOCgJpZBgBIAEoA1ICaWQSNQoIYXR0ckluZm8YAiABKAsyGS5jb20uc2F2dnkucHJvdG8uQXR0ckluZm9SCGF0dHJJbmZvEjUKCHN1aXRJbmZvGAMgASgLMhkuY29tLnNhdnZ5LnByb3RvLlN1aXRJbmZvUghzdWl0SW5mbxI4CglzdGF0ZUluZm8YBCABKAsyGi5jb20uc2F2dnkucHJvdG8uU3RhdGVJbmZvUglzdGF0ZUluZm8=');
@$core.Deprecated('Use userInfoDescriptor instead')
const UserInfo$json = const {
  '1': 'UserInfo',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    const {'1': 'username', '3': 3, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'avatar_url', '3': 4, '4': 1, '5': 9, '10': 'avatarUrl'},
    const {'1': 'type', '3': 5, '4': 1, '5': 5, '10': 'type'},
    const {'1': 'admin_type', '3': 6, '4': 1, '5': 5, '10': 'adminType'},
    const {'1': 'level', '3': 7, '4': 1, '5': 9, '10': 'level'},
  ],
};

/// Descriptor for `UserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInfoDescriptor = $convert.base64Decode('CghVc2VySW5mbxIQCgN1aWQYASABKAlSA3VpZBIXCgdyb2xlX2lkGAIgASgDUgZyb2xlSWQSGgoIdXNlcm5hbWUYAyABKAlSCHVzZXJuYW1lEh0KCmF2YXRhcl91cmwYBCABKAlSCWF2YXRhclVybBISCgR0eXBlGAUgASgFUgR0eXBlEh0KCmFkbWluX3R5cGUYBiABKAVSCWFkbWluVHlwZRIUCgVsZXZlbBgHIAEoCVIFbGV2ZWw=');
@$core.Deprecated('Use mikeInfoDescriptor instead')
const MikeInfo$json = const {
  '1': 'MikeInfo',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    const {'1': 'mike_id', '3': 2, '4': 1, '5': 3, '10': 'mikeId'},
    const {'1': 'mike_no', '3': 3, '4': 1, '5': 9, '10': 'mikeNo'},
    const {'1': 'uid', '3': 4, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'role_id', '3': 6, '4': 1, '5': 3, '10': 'roleId'},
    const {'1': 'number', '3': 7, '4': 1, '5': 3, '10': 'number'},
  ],
};

/// Descriptor for `MikeInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mikeInfoDescriptor = $convert.base64Decode('CghNaWtlSW5mbxIXCgdyb29tX2lkGAEgASgDUgZyb29tSWQSFwoHbWlrZV9pZBgCIAEoA1IGbWlrZUlkEhcKB21pa2Vfbm8YAyABKAlSBm1pa2VObxIQCgN1aWQYBCABKAlSA3VpZBIXCgdyb2xlX2lkGAYgASgDUgZyb2xlSWQSFgoGbnVtYmVyGAcgASgDUgZudW1iZXI=');
@$core.Deprecated('Use roomUserInfoDescriptor instead')
const RoomUserInfo$json = const {
  '1': 'RoomUserInfo',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'role_id', '3': 2, '4': 1, '5': 3, '10': 'roleId'},
    const {'1': 'room_id', '3': 3, '4': 1, '5': 3, '10': 'roomId'},
    const {'1': 'username', '3': 4, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'avatar_url', '3': 5, '4': 1, '5': 9, '10': 'avatarUrl'},
    const {'1': 'type', '3': 6, '4': 1, '5': 5, '10': 'type'},
    const {'1': 'admin_type', '3': 7, '4': 1, '5': 5, '10': 'adminType'},
    const {'1': 'level', '3': 8, '4': 1, '5': 9, '10': 'level'},
  ],
};

/// Descriptor for `RoomUserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomUserInfoDescriptor = $convert.base64Decode('CgxSb29tVXNlckluZm8SEAoDdWlkGAEgASgJUgN1aWQSFwoHcm9sZV9pZBgCIAEoA1IGcm9sZUlkEhcKB3Jvb21faWQYAyABKANSBnJvb21JZBIaCgh1c2VybmFtZRgEIAEoCVIIdXNlcm5hbWUSHQoKYXZhdGFyX3VybBgFIAEoCVIJYXZhdGFyVXJsEhIKBHR5cGUYBiABKAVSBHR5cGUSHQoKYWRtaW5fdHlwZRgHIAEoBVIJYWRtaW5UeXBlEhQKBWxldmVsGAggASgJUgVsZXZlbA==');
@$core.Deprecated('Use pKGuildInfoDescriptor instead')
const PKGuildInfo$json = const {
  '1': 'PKGuildInfo',
  '2': const [
    const {'1': 'guildId', '3': 1, '4': 1, '5': 3, '10': 'guildId'},
    const {'1': 'guildName', '3': 2, '4': 1, '5': 9, '10': 'guildName'},
  ],
};

/// Descriptor for `PKGuildInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pKGuildInfoDescriptor = $convert.base64Decode('CgtQS0d1aWxkSW5mbxIYCgdndWlsZElkGAEgASgDUgdndWlsZElkEhwKCWd1aWxkTmFtZRgCIAEoCVIJZ3VpbGROYW1l');
@$core.Deprecated('Use pKUserInfoDescriptor instead')
const PKUserInfo$json = const {
  '1': 'PKUserInfo',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 3, '10': 'userId'},
    const {'1': 'gender', '3': 2, '4': 1, '5': 3, '10': 'gender'},
    const {'1': 'userName', '3': 3, '4': 1, '5': 9, '10': 'userName'},
    const {'1': 'guildId', '3': 4, '4': 1, '5': 3, '10': 'guildId'},
    const {'1': 'isManager', '3': 5, '4': 1, '5': 8, '10': 'isManager'},
    const {'1': 'avatarUrl', '3': 6, '4': 1, '5': 9, '10': 'avatarUrl'},
    const {'1': 'mikeId', '3': 7, '4': 1, '5': 5, '10': 'mikeId'},
    const {'1': 'clothingIds', '3': 8, '4': 3, '5': 3, '10': 'clothingIds'},
    const {'1': 'pkRoomId', '3': 9, '4': 1, '5': 3, '10': 'pkRoomId'},
    const {'1': 'BattleStatus', '3': 10, '4': 1, '5': 5, '10': 'BattleStatus'},
  ],
};

/// Descriptor for `PKUserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pKUserInfoDescriptor = $convert.base64Decode('CgpQS1VzZXJJbmZvEhYKBnVzZXJJZBgBIAEoA1IGdXNlcklkEhYKBmdlbmRlchgCIAEoA1IGZ2VuZGVyEhoKCHVzZXJOYW1lGAMgASgJUgh1c2VyTmFtZRIYCgdndWlsZElkGAQgASgDUgdndWlsZElkEhwKCWlzTWFuYWdlchgFIAEoCFIJaXNNYW5hZ2VyEhwKCWF2YXRhclVybBgGIAEoCVIJYXZhdGFyVXJsEhYKBm1pa2VJZBgHIAEoBVIGbWlrZUlkEiAKC2Nsb3RoaW5nSWRzGAggAygDUgtjbG90aGluZ0lkcxIaCghwa1Jvb21JZBgJIAEoA1IIcGtSb29tSWQSIgoMQmF0dGxlU3RhdHVzGAogASgFUgxCYXR0bGVTdGF0dXM=');
@$core.Deprecated('Use pKRoleBattleInfoLFDescriptor instead')
const PKRoleBattleInfoLF$json = const {
  '1': 'PKRoleBattleInfoLF',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 3, '10': 'userId'},
    const {'1': 'currentBlood', '3': 2, '4': 1, '5': 5, '10': 'currentBlood'},
    const {'1': 'totalBlood', '3': 3, '4': 1, '5': 5, '10': 'totalBlood'},
    const {'1': 'shield', '3': 4, '4': 1, '5': 5, '10': 'shield'},
    const {'1': 'attack', '3': 5, '4': 1, '5': 5, '10': 'attack'},
    const {'1': 'speed', '3': 6, '4': 1, '5': 5, '10': 'speed'},
    const {'1': 'swordCount', '3': 7, '4': 1, '5': 5, '10': 'swordCount'},
  ],
};

/// Descriptor for `PKRoleBattleInfoLF`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pKRoleBattleInfoLFDescriptor = $convert.base64Decode('ChJQS1JvbGVCYXR0bGVJbmZvTEYSFgoGdXNlcklkGAEgASgDUgZ1c2VySWQSIgoMY3VycmVudEJsb29kGAIgASgFUgxjdXJyZW50Qmxvb2QSHgoKdG90YWxCbG9vZBgDIAEoBVIKdG90YWxCbG9vZBIWCgZzaGllbGQYBCABKAVSBnNoaWVsZBIWCgZhdHRhY2sYBSABKAVSBmF0dGFjaxIUCgVzcGVlZBgGIAEoBVIFc3BlZWQSHgoKc3dvcmRDb3VudBgHIAEoBVIKc3dvcmRDb3VudA==');
@$core.Deprecated('Use pKRoleBattleInfoHFDescriptor instead')
const PKRoleBattleInfoHF$json = const {
  '1': 'PKRoleBattleInfoHF',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 3, '10': 'userId'},
    const {'1': 'position', '3': 2, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZ', '10': 'position'},
    const {'1': 'rotation', '3': 3, '4': 1, '5': 3, '10': 'rotation'},
  ],
};

/// Descriptor for `PKRoleBattleInfoHF`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pKRoleBattleInfoHFDescriptor = $convert.base64Decode('ChJQS1JvbGVCYXR0bGVJbmZvSEYSFgoGdXNlcklkGAEgASgDUgZ1c2VySWQSMAoIcG9zaXRpb24YAiABKAsyFC5jb20uc2F2dnkucHJvdG8uWFlaUghwb3NpdGlvbhIaCghyb3RhdGlvbhgDIAEoA1IIcm90YXRpb24=');
@$core.Deprecated('Use pKRoleSummaryDescriptor instead')
const PKRoleSummary$json = const {
  '1': 'PKRoleSummary',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 3, '10': 'userId'},
    const {'1': 'totalDamage', '3': 2, '4': 1, '5': 5, '10': 'totalDamage'},
    const {'1': 'survivedTime', '3': 3, '4': 1, '5': 3, '10': 'survivedTime'},
    const {'1': 'attackedCount', '3': 4, '4': 1, '5': 5, '10': 'attackedCount'},
    const {'1': 'outBlood', '3': 5, '4': 1, '5': 5, '10': 'outBlood'},
  ],
};

/// Descriptor for `PKRoleSummary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pKRoleSummaryDescriptor = $convert.base64Decode('Cg1QS1JvbGVTdW1tYXJ5EhYKBnVzZXJJZBgBIAEoA1IGdXNlcklkEiAKC3RvdGFsRGFtYWdlGAIgASgFUgt0b3RhbERhbWFnZRIiCgxzdXJ2aXZlZFRpbWUYAyABKANSDHN1cnZpdmVkVGltZRIkCg1hdHRhY2tlZENvdW50GAQgASgFUg1hdHRhY2tlZENvdW50EhoKCG91dEJsb29kGAUgASgFUghvdXRCbG9vZA==');
@$core.Deprecated('Use pKPresenterInfoDescriptor instead')
const PKPresenterInfo$json = const {
  '1': 'PKPresenterInfo',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 3, '10': 'userId'},
    const {'1': 'userName', '3': 2, '4': 1, '5': 9, '10': 'userName'},
    const {'1': 'avatarUrl', '3': 3, '4': 1, '5': 9, '10': 'avatarUrl'},
    const {'1': 'guildId', '3': 4, '4': 1, '5': 3, '10': 'guildId'},
    const {'1': 'contribution', '3': 5, '4': 1, '5': 5, '10': 'contribution'},
  ],
};

/// Descriptor for `PKPresenterInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pKPresenterInfoDescriptor = $convert.base64Decode('Cg9QS1ByZXNlbnRlckluZm8SFgoGdXNlcklkGAEgASgDUgZ1c2VySWQSGgoIdXNlck5hbWUYAiABKAlSCHVzZXJOYW1lEhwKCWF2YXRhclVybBgDIAEoCVIJYXZhdGFyVXJsEhgKB2d1aWxkSWQYBCABKANSB2d1aWxkSWQSIgoMY29udHJpYnV0aW9uGAUgASgFUgxjb250cmlidXRpb24=');
@$core.Deprecated('Use pKGiftDescriptor instead')
const PKGift$json = const {
  '1': 'PKGift',
  '2': const [
    const {'1': 'giftId', '3': 1, '4': 1, '5': 3, '10': 'giftId'},
    const {'1': 'position', '3': 2, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZ', '10': 'position'},
    const {'1': 'state', '3': 3, '4': 1, '5': 14, '6': '.com.savvy.proto.PKGiftState', '10': 'state'},
    const {'1': 'modelId', '3': 4, '4': 1, '5': 9, '10': 'modelId'},
    const {'1': 'pickUserId', '3': 6, '4': 1, '5': 3, '10': 'pickUserId'},
    const {'1': 'id', '3': 7, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `PKGift`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pKGiftDescriptor = $convert.base64Decode('CgZQS0dpZnQSFgoGZ2lmdElkGAEgASgDUgZnaWZ0SWQSMAoIcG9zaXRpb24YAiABKAsyFC5jb20uc2F2dnkucHJvdG8uWFlaUghwb3NpdGlvbhIyCgVzdGF0ZRgDIAEoDjIcLmNvbS5zYXZ2eS5wcm90by5QS0dpZnRTdGF0ZVIFc3RhdGUSGAoHbW9kZWxJZBgEIAEoCVIHbW9kZWxJZBIeCgpwaWNrVXNlcklkGAYgASgDUgpwaWNrVXNlcklkEg4KAmlkGAcgASgDUgJpZA==');
@$core.Deprecated('Use pKSceneToxicDescriptor instead')
const PKSceneToxic$json = const {
  '1': 'PKSceneToxic',
  '2': const [
    const {'1': 'safeRadius', '3': 1, '4': 1, '5': 5, '10': 'safeRadius'},
    const {'1': 'takeEffectTime', '3': 2, '4': 1, '5': 3, '10': 'takeEffectTime'},
    const {'1': 'safePosition', '3': 3, '4': 1, '5': 11, '6': '.com.savvy.proto.XYZ', '10': 'safePosition'},
    const {'1': 'toxicFogSpeed', '3': 5, '4': 1, '5': 5, '10': 'toxicFogSpeed'},
    const {'1': 'nextSafeTakeEffectTime', '3': 6, '4': 1, '5': 3, '10': 'nextSafeTakeEffectTime'},
  ],
};

/// Descriptor for `PKSceneToxic`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pKSceneToxicDescriptor = $convert.base64Decode('CgxQS1NjZW5lVG94aWMSHgoKc2FmZVJhZGl1cxgBIAEoBVIKc2FmZVJhZGl1cxImCg50YWtlRWZmZWN0VGltZRgCIAEoA1IOdGFrZUVmZmVjdFRpbWUSOAoMc2FmZVBvc2l0aW9uGAMgASgLMhQuY29tLnNhdnZ5LnByb3RvLlhZWlIMc2FmZVBvc2l0aW9uEiQKDXRveGljRm9nU3BlZWQYBSABKAVSDXRveGljRm9nU3BlZWQSNgoWbmV4dFNhZmVUYWtlRWZmZWN0VGltZRgGIAEoA1IWbmV4dFNhZmVUYWtlRWZmZWN0VGltZQ==');
@$core.Deprecated('Use pkRoomInfoDescriptor instead')
const PkRoomInfo$json = const {
  '1': 'PkRoomInfo',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 3, '10': 'roomId'},
    const {'1': 'room_name', '3': 2, '4': 1, '5': 9, '10': 'roomName'},
    const {'1': 'room_image', '3': 3, '4': 1, '5': 9, '10': 'roomImage'},
    const {'1': 'hot_value', '3': 4, '4': 1, '5': 5, '10': 'hotValue'},
    const {'1': 'is_invite', '3': 5, '4': 1, '5': 8, '10': 'isInvite'},
  ],
};

/// Descriptor for `PkRoomInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pkRoomInfoDescriptor = $convert.base64Decode('CgpQa1Jvb21JbmZvEhcKB3Jvb21faWQYASABKANSBnJvb21JZBIbCglyb29tX25hbWUYAiABKAlSCHJvb21OYW1lEh0KCnJvb21faW1hZ2UYAyABKAlSCXJvb21JbWFnZRIbCglob3RfdmFsdWUYBCABKAVSCGhvdFZhbHVlEhsKCWlzX2ludml0ZRgFIAEoCFIIaXNJbnZpdGU=');
@$core.Deprecated('Use pkRoleDefaultConfigurationDescriptor instead')
const PkRoleDefaultConfiguration$json = const {
  '1': 'PkRoleDefaultConfiguration',
  '2': const [
    const {'1': 'role_radius', '3': 1, '4': 1, '5': 5, '10': 'roleRadius'},
    const {'1': 'speed', '3': 2, '4': 1, '5': 5, '10': 'speed'},
    const {'1': 'weapon_length', '3': 3, '4': 1, '5': 5, '10': 'weaponLength'},
    const {'1': 'weapon_speed', '3': 4, '4': 1, '5': 5, '10': 'weaponSpeed'},
    const {'1': 'max_weapon_num', '3': 5, '4': 1, '5': 5, '10': 'maxWeaponNum'},
    const {'1': 'blood', '3': 6, '4': 1, '5': 5, '10': 'blood'},
    const {'1': 'TotalBlood', '3': 7, '4': 1, '5': 5, '10': 'TotalBlood'},
    const {'1': 'Shield', '3': 8, '4': 1, '5': 5, '10': 'Shield'},
    const {'1': 'Attack', '3': 9, '4': 1, '5': 5, '10': 'Attack'},
    const {'1': 'countdown', '3': 10, '4': 1, '5': 3, '10': 'countdown'},
    const {'1': 'sword_count', '3': 11, '4': 1, '5': 5, '10': 'swordCount'},
    const {'1': 'max_speed', '3': 12, '4': 1, '5': 5, '10': 'maxSpeed'},
  ],
};

/// Descriptor for `PkRoleDefaultConfiguration`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pkRoleDefaultConfigurationDescriptor = $convert.base64Decode('ChpQa1JvbGVEZWZhdWx0Q29uZmlndXJhdGlvbhIfCgtyb2xlX3JhZGl1cxgBIAEoBVIKcm9sZVJhZGl1cxIUCgVzcGVlZBgCIAEoBVIFc3BlZWQSIwoNd2VhcG9uX2xlbmd0aBgDIAEoBVIMd2VhcG9uTGVuZ3RoEiEKDHdlYXBvbl9zcGVlZBgEIAEoBVILd2VhcG9uU3BlZWQSJAoObWF4X3dlYXBvbl9udW0YBSABKAVSDG1heFdlYXBvbk51bRIUCgVibG9vZBgGIAEoBVIFYmxvb2QSHgoKVG90YWxCbG9vZBgHIAEoBVIKVG90YWxCbG9vZBIWCgZTaGllbGQYCCABKAVSBlNoaWVsZBIWCgZBdHRhY2sYCSABKAVSBkF0dGFjaxIcCgljb3VudGRvd24YCiABKANSCWNvdW50ZG93bhIfCgtzd29yZF9jb3VudBgLIAEoBVIKc3dvcmRDb3VudBIbCgltYXhfc3BlZWQYDCABKAVSCG1heFNwZWVk');
