///
//  Generated code. Do not modify.
//  source: Message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class S_Tips_Code extends $pb.ProtobufEnum {
  static const S_Tips_Code MESSAGE = S_Tips_Code._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MESSAGE');
  static const S_Tips_Code ALERT = S_Tips_Code._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ALERT');
  static const S_Tips_Code ROLL = S_Tips_Code._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ROLL');

  static const $core.List<S_Tips_Code> values = <S_Tips_Code> [
    MESSAGE,
    ALERT,
    ROLL,
  ];

  static final $core.Map<$core.int, S_Tips_Code> _byValue = $pb.ProtobufEnum.initByValue(values);
  static S_Tips_Code? valueOf($core.int value) => _byValue[value];

  const S_Tips_Code._($core.int v, $core.String n) : super(v, n);
}

class S_GM_Code extends $pb.ProtobufEnum {
  static const S_GM_Code KICK = S_GM_Code._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'KICK');
  static const S_GM_Code MUTE = S_GM_Code._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MUTE');

  static const $core.List<S_GM_Code> values = <S_GM_Code> [
    KICK,
    MUTE,
  ];

  static final $core.Map<$core.int, S_GM_Code> _byValue = $pb.ProtobufEnum.initByValue(values);
  static S_GM_Code? valueOf($core.int value) => _byValue[value];

  const S_GM_Code._($core.int v, $core.String n) : super(v, n);
}

