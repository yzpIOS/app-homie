//
//  Generated code. Do not modify.
//  source: Common.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AttrCode extends $pb.ProtobufEnum {
  static const AttrCode none = AttrCode._(0, _omitEnumNames ? '' : 'none');
  static const AttrCode lv = AttrCode._(1, _omitEnumNames ? '' : 'lv');
  static const AttrCode charm_lv = AttrCode._(2, _omitEnumNames ? '' : 'charm_lv');
  static const AttrCode sex = AttrCode._(3, _omitEnumNames ? '' : 'sex');
  static const AttrCode career = AttrCode._(4, _omitEnumNames ? '' : 'career');
  static const AttrCode speed = AttrCode._(5, _omitEnumNames ? '' : 'speed');
  static const AttrCode scene = AttrCode._(6, _omitEnumNames ? '' : 'scene');
  static const AttrCode room = AttrCode._(7, _omitEnumNames ? '' : 'room');
  static const AttrCode job = AttrCode._(8, _omitEnumNames ? '' : 'job');
  static const AttrCode avatar_url = AttrCode._(9, _omitEnumNames ? '' : 'avatar_url');
  static const AttrCode public_id = AttrCode._(10, _omitEnumNames ? '' : 'public_id');
  static const AttrCode description = AttrCode._(11, _omitEnumNames ? '' : 'description');
  static const AttrCode growth_value = AttrCode._(12, _omitEnumNames ? '' : 'growth_value');
  static const AttrCode charm_growth_value = AttrCode._(13, _omitEnumNames ? '' : 'charm_growth_value');
  static const AttrCode real_name_type = AttrCode._(14, _omitEnumNames ? '' : 'real_name_type');
  static const AttrCode mike_id = AttrCode._(16, _omitEnumNames ? '' : 'mike_id');
  static const AttrCode mike_no = AttrCode._(17, _omitEnumNames ? '' : 'mike_no');
  static const AttrCode animate = AttrCode._(15, _omitEnumNames ? '' : 'animate');
  static const AttrCode stage = AttrCode._(18, _omitEnumNames ? '' : 'stage');

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
    mike_id,
    mike_no,
    animate,
    stage,
  ];

  static final $core.Map<$core.int, AttrCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AttrCode? valueOf($core.int value) => _byValue[value];

  const AttrCode._($core.int v, $core.String n) : super(v, n);
}

class State extends $pb.ProtobufEnum {
  static const State None = State._(0, _omitEnumNames ? '' : 'None');
  static const State Mai = State._(1, _omitEnumNames ? '' : 'Mai');
  static const State Sit = State._(2, _omitEnumNames ? '' : 'Sit');
  static const State Swim = State._(3, _omitEnumNames ? '' : 'Swim');

  static const $core.List<State> values = <State> [
    None,
    Mai,
    Sit,
    Swim,
  ];

  static final $core.Map<$core.int, State> _byValue = $pb.ProtobufEnum.initByValue(values);
  static State? valueOf($core.int value) => _byValue[value];

  const State._($core.int v, $core.String n) : super(v, n);
}

class PKGiftState extends $pb.ProtobufEnum {
  static const PKGiftState Available = PKGiftState._(0, _omitEnumNames ? '' : 'Available');
  static const PKGiftState Disappeared = PKGiftState._(1, _omitEnumNames ? '' : 'Disappeared');

  static const $core.List<PKGiftState> values = <PKGiftState> [
    Available,
    Disappeared,
  ];

  static final $core.Map<$core.int, PKGiftState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PKGiftState? valueOf($core.int value) => _byValue[value];

  const PKGiftState._($core.int v, $core.String n) : super(v, n);
}

class RoleOnlineState extends $pb.ProtobufEnum {
  static const RoleOnlineState RoleOnlineStateNil = RoleOnlineState._(0, _omitEnumNames ? '' : 'RoleOnlineStateNil');
  static const RoleOnlineState RoleOnlineStateOn = RoleOnlineState._(1, _omitEnumNames ? '' : 'RoleOnlineStateOn');
  static const RoleOnlineState RoleOnlineStateStealth = RoleOnlineState._(2, _omitEnumNames ? '' : 'RoleOnlineStateStealth');
  static const RoleOnlineState RoleOnlineStateOff = RoleOnlineState._(3, _omitEnumNames ? '' : 'RoleOnlineStateOff');

  static const $core.List<RoleOnlineState> values = <RoleOnlineState> [
    RoleOnlineStateNil,
    RoleOnlineStateOn,
    RoleOnlineStateStealth,
    RoleOnlineStateOff,
  ];

  static final $core.Map<$core.int, RoleOnlineState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RoleOnlineState? valueOf($core.int value) => _byValue[value];

  const RoleOnlineState._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
