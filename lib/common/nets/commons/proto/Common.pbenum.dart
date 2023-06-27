///
//  Generated code. Do not modify.
//  source: Common.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class AttrCode extends $pb.ProtobufEnum {
  static const AttrCode none = AttrCode._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'none');
  static const AttrCode lv = AttrCode._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'lv');
  static const AttrCode charm_lv = AttrCode._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'charm_lv');
  static const AttrCode sex = AttrCode._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'sex');
  static const AttrCode career = AttrCode._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'career');
  static const AttrCode speed = AttrCode._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'speed');
  static const AttrCode scene = AttrCode._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'scene');
  static const AttrCode room = AttrCode._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'room');
  static const AttrCode job = AttrCode._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'job');
  static const AttrCode avatar_url = AttrCode._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'avatar_url');
  static const AttrCode public_id = AttrCode._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'public_id');
  static const AttrCode description = AttrCode._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'description');
  static const AttrCode growth_value = AttrCode._(12, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'growth_value');
  static const AttrCode charm_growth_value = AttrCode._(13, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'charm_growth_value');
  static const AttrCode real_name_type = AttrCode._(14, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'real_name_type');
  static const AttrCode animate = AttrCode._(15, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'animate');
  static const AttrCode mike_id = AttrCode._(16, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mike_id');
  static const AttrCode mike_no = AttrCode._(17, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mike_no');

  static const $core.List<AttrCode> values = <AttrCode> [
    none,
    lv,
    charm_lv,
    sex,
    career,
    speed,
    scene,
    room,
    job,
    avatar_url,
    public_id,
    description,
    growth_value,
    charm_growth_value,
    real_name_type,
    animate,
    mike_id,
    mike_no,
  ];

  static final $core.Map<$core.int, AttrCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AttrCode? valueOf($core.int value) => _byValue[value];

  const AttrCode._($core.int v, $core.String n) : super(v, n);
}

class State extends $pb.ProtobufEnum {
  static const State None = State._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'None');
  static const State Mai = State._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Mai');

  static const $core.List<State> values = <State> [
    None,
    Mai,
  ];

  static final $core.Map<$core.int, State> _byValue = $pb.ProtobufEnum.initByValue(values);
  static State? valueOf($core.int value) => _byValue[value];

  const State._($core.int v, $core.String n) : super(v, n);
}

