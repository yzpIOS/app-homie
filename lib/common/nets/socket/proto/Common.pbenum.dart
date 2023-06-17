///
//  Generated code. Do not modify.
//  source: proto/Common.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class AttrCode extends $pb.ProtobufEnum {
  static const AttrCode bid = AttrCode._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'bid');
  static const AttrCode lv = AttrCode._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'lv');
  static const AttrCode charm_lv = AttrCode._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'charm_lv');
  static const AttrCode sex = AttrCode._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'sex');
  static const AttrCode career = AttrCode._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'career');
  static const AttrCode speed = AttrCode._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'speed');
  static const AttrCode scene = AttrCode._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'scene');
  static const AttrCode room = AttrCode._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'room');
  static const AttrCode job = AttrCode._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'job');

  static const $core.List<AttrCode> values = <AttrCode> [
    bid,
    lv,
    charm_lv,
    sex,
    career,
    speed,
    scene,
    room,
    job,
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

