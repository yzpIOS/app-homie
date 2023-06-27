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
    const {'1': 'animate', '2': 15},
    const {'1': 'mike_id', '2': 16},
    const {'1': 'mike_no', '2': 17},
  ],
};

/// Descriptor for `AttrCode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List attrCodeDescriptor = $convert.base64Decode('CghBdHRyQ29kZRIICgRub25lEAASBgoCbHYQARIMCghjaGFybV9sdhACEgcKA3NleBADEgoKBmNhcmVlchAEEgkKBXNwZWVkEAUSCQoFc2NlbmUQBhIICgRyb29tEAcSBwoDam9iEAgSDgoKYXZhdGFyX3VybBAJEg0KCXB1YmxpY19pZBAKEg8KC2Rlc2NyaXB0aW9uEAsSEAoMZ3Jvd3RoX3ZhbHVlEAwSFgoSY2hhcm1fZ3Jvd3RoX3ZhbHVlEA0SEgoOcmVhbF9uYW1lX3R5cGUQDhILCgdhbmltYXRlEA8SCwoHbWlrZV9pZBAQEgsKB21pa2Vfbm8QEQ==');
@$core.Deprecated('Use stateDescriptor instead')
const State$json = const {
  '1': 'State',
  '2': const [
    const {'1': 'None', '2': 0},
    const {'1': 'Mai', '2': 1},
  ],
};

/// Descriptor for `State`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List stateDescriptor = $convert.base64Decode('CgVTdGF0ZRIICgROb25lEAASBwoDTWFpEAE=');
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
  ],
};

/// Descriptor for `RoleSceneInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roleSceneInfoDescriptor = $convert.base64Decode('Cg1Sb2xlU2NlbmVJbmZvEhYKBnJvbGVJZBgBIAEoA1IGcm9sZUlkEhIKBG5hbWUYAiABKAlSBG5hbWUSNQoIYXR0ckluZm8YAyABKAsyGS5jb20uc2F2dnkucHJvdG8uQXR0ckluZm9SCGF0dHJJbmZvEjUKCHN1aXRJbmZvGAQgASgLMhkuY29tLnNhdnZ5LnByb3RvLlN1aXRJbmZvUghzdWl0SW5mbxI4CglzdGF0ZUluZm8YBSABKAsyGi5jb20uc2F2dnkucHJvdG8uU3RhdGVJbmZvUglzdGF0ZUluZm8SGgoIc2VhdEd1aWQYBiABKAlSCHNlYXRHdWlkEhYKBnJvb21JZBgHIAEoA1IGcm9vbUlk');
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
