///
//  Generated code. Do not modify.
//  source: Message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'Common.pb.dart' as $0;

import 'ErrorCode.pbenum.dart' as $1;
import 'Message.pbenum.dart';
import 'Common.pbenum.dart' as $0;

export 'Message.pbenum.dart';

class S_SysTime extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_SysTime', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time')
    ..hasRequiredFields = false
  ;

  S_SysTime._() : super();
  factory S_SysTime({
    $fixnum.Int64? time,
  }) {
    final _result = create();
    if (time != null) {
      _result.time = time;
    }
    return _result;
  }
  factory S_SysTime.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_SysTime.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_SysTime clone() => S_SysTime()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_SysTime copyWith(void Function(S_SysTime) updates) => super.copyWith((message) => updates(message as S_SysTime)) as S_SysTime; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_SysTime create() => S_SysTime._();
  S_SysTime createEmptyInstance() => create();
  static $pb.PbList<S_SysTime> createRepeated() => $pb.PbList<S_SysTime>();
  @$core.pragma('dart2js:noInline')
  static S_SysTime getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_SysTime>(create);
  static S_SysTime? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get time => $_getI64(0);
  @$pb.TagNumber(1)
  set time($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearTime() => clearField(1);
}

class S_Err extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_Err', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..e<$1.ErrorCode>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: $1.ErrorCode.Ok, valueOf: $1.ErrorCode.valueOf, enumValues: $1.ErrorCode.values)
    ..hasRequiredFields = false
  ;

  S_Err._() : super();
  factory S_Err({
    $1.ErrorCode? code,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    return _result;
  }
  factory S_Err.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_Err.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_Err clone() => S_Err()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_Err copyWith(void Function(S_Err) updates) => super.copyWith((message) => updates(message as S_Err)) as S_Err; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_Err create() => S_Err._();
  S_Err createEmptyInstance() => create();
  static $pb.PbList<S_Err> createRepeated() => $pb.PbList<S_Err>();
  @$core.pragma('dart2js:noInline')
  static S_Err getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_Err>(create);
  static S_Err? _defaultInstance;

  @$pb.TagNumber(1)
  $1.ErrorCode get code => $_getN(0);
  @$pb.TagNumber(1)
  set code($1.ErrorCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);
}

class S_Tips extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_Tips', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..e<S_Tips_Code>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: S_Tips_Code.MESSAGE, valueOf: S_Tips_Code.valueOf, enumValues: S_Tips_Code.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msg')
    ..hasRequiredFields = false
  ;

  S_Tips._() : super();
  factory S_Tips({
    S_Tips_Code? code,
    $core.String? msg,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory S_Tips.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_Tips.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_Tips clone() => S_Tips()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_Tips copyWith(void Function(S_Tips) updates) => super.copyWith((message) => updates(message as S_Tips)) as S_Tips; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_Tips create() => S_Tips._();
  S_Tips createEmptyInstance() => create();
  static $pb.PbList<S_Tips> createRepeated() => $pb.PbList<S_Tips>();
  @$core.pragma('dart2js:noInline')
  static S_Tips getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_Tips>(create);
  static S_Tips? _defaultInstance;

  @$pb.TagNumber(1)
  S_Tips_Code get code => $_getN(0);
  @$pb.TagNumber(1)
  set code(S_Tips_Code v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);
}

class S_GM extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_GM', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..e<S_GM_Code>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: S_GM_Code.KICK, valueOf: S_GM_Code.valueOf, enumValues: S_GM_Code.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content')
    ..hasRequiredFields = false
  ;

  S_GM._() : super();
  factory S_GM({
    $fixnum.Int64? id,
    S_GM_Code? code,
    $core.String? content,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (code != null) {
      _result.code = code;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory S_GM.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_GM.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_GM clone() => S_GM()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_GM copyWith(void Function(S_GM) updates) => super.copyWith((message) => updates(message as S_GM)) as S_GM; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_GM create() => S_GM._();
  S_GM createEmptyInstance() => create();
  static $pb.PbList<S_GM> createRepeated() => $pb.PbList<S_GM>();
  @$core.pragma('dart2js:noInline')
  static S_GM getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_GM>(create);
  static S_GM? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  S_GM_Code get code => $_getN(1);
  @$pb.TagNumber(2)
  set code(S_GM_Code v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => clearField(3);
}

class C_Role extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_Role', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'session')
    ..hasRequiredFields = false
  ;

  C_Role._() : super();
  factory C_Role({
    $core.String? session,
  }) {
    final _result = create();
    if (session != null) {
      _result.session = session;
    }
    return _result;
  }
  factory C_Role.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_Role.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_Role clone() => C_Role()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_Role copyWith(void Function(C_Role) updates) => super.copyWith((message) => updates(message as C_Role)) as C_Role; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_Role create() => C_Role._();
  C_Role createEmptyInstance() => create();
  static $pb.PbList<C_Role> createRepeated() => $pb.PbList<C_Role>();
  @$core.pragma('dart2js:noInline')
  static C_Role getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_Role>(create);
  static C_Role? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get session => $_getSZ(0);
  @$pb.TagNumber(1)
  set session($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => clearField(1);
}

class S_Role extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_Role', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOM<$0.RoleInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'role', subBuilder: $0.RoleInfo.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scene', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'room', $pb.PbFieldType.O3)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'session')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time')
    ..hasRequiredFields = false
  ;

  S_Role._() : super();
  factory S_Role({
    $0.RoleInfo? role,
    $core.int? scene,
    $core.int? room,
    $core.String? session,
    $fixnum.Int64? time,
  }) {
    final _result = create();
    if (role != null) {
      _result.role = role;
    }
    if (scene != null) {
      _result.scene = scene;
    }
    if (room != null) {
      _result.room = room;
    }
    if (session != null) {
      _result.session = session;
    }
    if (time != null) {
      _result.time = time;
    }
    return _result;
  }
  factory S_Role.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_Role.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_Role clone() => S_Role()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_Role copyWith(void Function(S_Role) updates) => super.copyWith((message) => updates(message as S_Role)) as S_Role; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_Role create() => S_Role._();
  S_Role createEmptyInstance() => create();
  static $pb.PbList<S_Role> createRepeated() => $pb.PbList<S_Role>();
  @$core.pragma('dart2js:noInline')
  static S_Role getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_Role>(create);
  static S_Role? _defaultInstance;

  @$pb.TagNumber(1)
  $0.RoleInfo get role => $_getN(0);
  @$pb.TagNumber(1)
  set role($0.RoleInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRole() => $_has(0);
  @$pb.TagNumber(1)
  void clearRole() => clearField(1);
  @$pb.TagNumber(1)
  $0.RoleInfo ensureRole() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get scene => $_getIZ(1);
  @$pb.TagNumber(2)
  set scene($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasScene() => $_has(1);
  @$pb.TagNumber(2)
  void clearScene() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get room => $_getIZ(2);
  @$pb.TagNumber(3)
  set room($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoom() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoom() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get session => $_getSZ(3);
  @$pb.TagNumber(4)
  set session($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSession() => $_has(3);
  @$pb.TagNumber(4)
  void clearSession() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get time => $_getI64(4);
  @$pb.TagNumber(5)
  set time($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearTime() => clearField(5);
}

class C_CreateRole extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_CreateRole', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'typeId', $pb.PbFieldType.O3, protoName: 'typeId')
    ..hasRequiredFields = false
  ;

  C_CreateRole._() : super();
  factory C_CreateRole({
    $core.String? name,
    $core.int? typeId,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (typeId != null) {
      _result.typeId = typeId;
    }
    return _result;
  }
  factory C_CreateRole.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_CreateRole.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_CreateRole clone() => C_CreateRole()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_CreateRole copyWith(void Function(C_CreateRole) updates) => super.copyWith((message) => updates(message as C_CreateRole)) as C_CreateRole; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_CreateRole create() => C_CreateRole._();
  C_CreateRole createEmptyInstance() => create();
  static $pb.PbList<C_CreateRole> createRepeated() => $pb.PbList<C_CreateRole>();
  @$core.pragma('dart2js:noInline')
  static C_CreateRole getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_CreateRole>(create);
  static C_CreateRole? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get typeId => $_getIZ(1);
  @$pb.TagNumber(2)
  set typeId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTypeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTypeId() => clearField(2);
}

class S_CreateRole extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_CreateRole', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..e<$1.ErrorCode>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: $1.ErrorCode.Ok, valueOf: $1.ErrorCode.valueOf, enumValues: $1.ErrorCode.values)
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId', protoName: 'roleId')
    ..hasRequiredFields = false
  ;

  S_CreateRole._() : super();
  factory S_CreateRole({
    $1.ErrorCode? code,
    $fixnum.Int64? roleId,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (roleId != null) {
      _result.roleId = roleId;
    }
    return _result;
  }
  factory S_CreateRole.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_CreateRole.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_CreateRole clone() => S_CreateRole()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_CreateRole copyWith(void Function(S_CreateRole) updates) => super.copyWith((message) => updates(message as S_CreateRole)) as S_CreateRole; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_CreateRole create() => S_CreateRole._();
  S_CreateRole createEmptyInstance() => create();
  static $pb.PbList<S_CreateRole> createRepeated() => $pb.PbList<S_CreateRole>();
  @$core.pragma('dart2js:noInline')
  static S_CreateRole getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_CreateRole>(create);
  static S_CreateRole? _defaultInstance;

  @$pb.TagNumber(1)
  $1.ErrorCode get code => $_getN(0);
  @$pb.TagNumber(1)
  set code($1.ErrorCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get roleId => $_getI64(1);
  @$pb.TagNumber(2)
  set roleId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoleId() => clearField(2);
}

class G_RemoveRole extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'G_RemoveRole', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId', protoName: 'roleId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  G_RemoveRole._() : super();
  factory G_RemoveRole({
    $fixnum.Int64? roleId,
    $core.int? state,
  }) {
    final _result = create();
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (state != null) {
      _result.state = state;
    }
    return _result;
  }
  factory G_RemoveRole.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory G_RemoveRole.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  G_RemoveRole clone() => G_RemoveRole()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  G_RemoveRole copyWith(void Function(G_RemoveRole) updates) => super.copyWith((message) => updates(message as G_RemoveRole)) as G_RemoveRole; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static G_RemoveRole create() => G_RemoveRole._();
  G_RemoveRole createEmptyInstance() => create();
  static $pb.PbList<G_RemoveRole> createRepeated() => $pb.PbList<G_RemoveRole>();
  @$core.pragma('dart2js:noInline')
  static G_RemoveRole getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<G_RemoveRole>(create);
  static G_RemoveRole? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roleId => $_getI64(0);
  @$pb.TagNumber(1)
  set roleId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoleId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get state => $_getIZ(1);
  @$pb.TagNumber(2)
  set state($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);
}

class C_ReLink extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_ReLink', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId', protoName: 'roleId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..hasRequiredFields = false
  ;

  C_ReLink._() : super();
  factory C_ReLink({
    $fixnum.Int64? roleId,
    $fixnum.Int64? time,
    $core.String? token,
  }) {
    final _result = create();
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (time != null) {
      _result.time = time;
    }
    if (token != null) {
      _result.token = token;
    }
    return _result;
  }
  factory C_ReLink.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_ReLink.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_ReLink clone() => C_ReLink()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_ReLink copyWith(void Function(C_ReLink) updates) => super.copyWith((message) => updates(message as C_ReLink)) as C_ReLink; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_ReLink create() => C_ReLink._();
  C_ReLink createEmptyInstance() => create();
  static $pb.PbList<C_ReLink> createRepeated() => $pb.PbList<C_ReLink>();
  @$core.pragma('dart2js:noInline')
  static C_ReLink getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_ReLink>(create);
  static C_ReLink? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roleId => $_getI64(0);
  @$pb.TagNumber(1)
  set roleId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoleId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get time => $_getI64(1);
  @$pb.TagNumber(2)
  set time($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get token => $_getSZ(2);
  @$pb.TagNumber(3)
  set token($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearToken() => clearField(3);
}

class G_SwitchScene extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'G_SwitchScene', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scene', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'room', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  G_SwitchScene._() : super();
  factory G_SwitchScene({
    $core.int? scene,
    $core.int? room,
  }) {
    final _result = create();
    if (scene != null) {
      _result.scene = scene;
    }
    if (room != null) {
      _result.room = room;
    }
    return _result;
  }
  factory G_SwitchScene.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory G_SwitchScene.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  G_SwitchScene clone() => G_SwitchScene()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  G_SwitchScene copyWith(void Function(G_SwitchScene) updates) => super.copyWith((message) => updates(message as G_SwitchScene)) as G_SwitchScene; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static G_SwitchScene create() => G_SwitchScene._();
  G_SwitchScene createEmptyInstance() => create();
  static $pb.PbList<G_SwitchScene> createRepeated() => $pb.PbList<G_SwitchScene>();
  @$core.pragma('dart2js:noInline')
  static G_SwitchScene getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<G_SwitchScene>(create);
  static G_SwitchScene? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get scene => $_getIZ(0);
  @$pb.TagNumber(1)
  set scene($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasScene() => $_has(0);
  @$pb.TagNumber(1)
  void clearScene() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get room => $_getIZ(1);
  @$pb.TagNumber(2)
  set room($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoom() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoom() => clearField(2);
}

class S_SyncRound extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_SyncRound', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..pc<$0.RoleSceneInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roles', $pb.PbFieldType.PM, subBuilder: $0.RoleSceneInfo.create)
    ..hasRequiredFields = false
  ;

  S_SyncRound._() : super();
  factory S_SyncRound({
    $core.Iterable<$0.RoleSceneInfo>? roles,
  }) {
    final _result = create();
    if (roles != null) {
      _result.roles.addAll(roles);
    }
    return _result;
  }
  factory S_SyncRound.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_SyncRound.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_SyncRound clone() => S_SyncRound()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_SyncRound copyWith(void Function(S_SyncRound) updates) => super.copyWith((message) => updates(message as S_SyncRound)) as S_SyncRound; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_SyncRound create() => S_SyncRound._();
  S_SyncRound createEmptyInstance() => create();
  static $pb.PbList<S_SyncRound> createRepeated() => $pb.PbList<S_SyncRound>();
  @$core.pragma('dart2js:noInline')
  static S_SyncRound getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_SyncRound>(create);
  static S_SyncRound? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.RoleSceneInfo> get roles => $_getList(0);
}

class S_SyncAttr extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_SyncAttr', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOM<$0.AttrVO>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attr', subBuilder: $0.AttrVO.create)
    ..hasRequiredFields = false
  ;

  S_SyncAttr._() : super();
  factory S_SyncAttr({
    $core.int? id,
    $0.AttrVO? attr,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (attr != null) {
      _result.attr = attr;
    }
    return _result;
  }
  factory S_SyncAttr.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_SyncAttr.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_SyncAttr clone() => S_SyncAttr()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_SyncAttr copyWith(void Function(S_SyncAttr) updates) => super.copyWith((message) => updates(message as S_SyncAttr)) as S_SyncAttr; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_SyncAttr create() => S_SyncAttr._();
  S_SyncAttr createEmptyInstance() => create();
  static $pb.PbList<S_SyncAttr> createRepeated() => $pb.PbList<S_SyncAttr>();
  @$core.pragma('dart2js:noInline')
  static S_SyncAttr getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_SyncAttr>(create);
  static S_SyncAttr? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $0.AttrVO get attr => $_getN(1);
  @$pb.TagNumber(2)
  set attr($0.AttrVO v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAttr() => $_has(1);
  @$pb.TagNumber(2)
  void clearAttr() => clearField(2);
  @$pb.TagNumber(2)
  $0.AttrVO ensureAttr() => $_ensure(1);
}

class S_SyncAttrs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_SyncAttrs', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOM<$0.AttrInfo>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attrs', subBuilder: $0.AttrInfo.create)
    ..hasRequiredFields = false
  ;

  S_SyncAttrs._() : super();
  factory S_SyncAttrs({
    $core.int? id,
    $0.AttrInfo? attrs,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (attrs != null) {
      _result.attrs = attrs;
    }
    return _result;
  }
  factory S_SyncAttrs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_SyncAttrs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_SyncAttrs clone() => S_SyncAttrs()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_SyncAttrs copyWith(void Function(S_SyncAttrs) updates) => super.copyWith((message) => updates(message as S_SyncAttrs)) as S_SyncAttrs; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_SyncAttrs create() => S_SyncAttrs._();
  S_SyncAttrs createEmptyInstance() => create();
  static $pb.PbList<S_SyncAttrs> createRepeated() => $pb.PbList<S_SyncAttrs>();
  @$core.pragma('dart2js:noInline')
  static S_SyncAttrs getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_SyncAttrs>(create);
  static S_SyncAttrs? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $0.AttrInfo get attrs => $_getN(1);
  @$pb.TagNumber(2)
  set attrs($0.AttrInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAttrs() => $_has(1);
  @$pb.TagNumber(2)
  void clearAttrs() => clearField(2);
  @$pb.TagNumber(2)
  $0.AttrInfo ensureAttrs() => $_ensure(1);
}

class S_SyncMultiAttr extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_SyncMultiAttr', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..p<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.K3)
    ..pc<$0.AttrVO>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attr', $pb.PbFieldType.PM, subBuilder: $0.AttrVO.create)
    ..hasRequiredFields = false
  ;

  S_SyncMultiAttr._() : super();
  factory S_SyncMultiAttr({
    $core.Iterable<$core.int>? id,
    $core.Iterable<$0.AttrVO>? attr,
  }) {
    final _result = create();
    if (id != null) {
      _result.id.addAll(id);
    }
    if (attr != null) {
      _result.attr.addAll(attr);
    }
    return _result;
  }
  factory S_SyncMultiAttr.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_SyncMultiAttr.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_SyncMultiAttr clone() => S_SyncMultiAttr()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_SyncMultiAttr copyWith(void Function(S_SyncMultiAttr) updates) => super.copyWith((message) => updates(message as S_SyncMultiAttr)) as S_SyncMultiAttr; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_SyncMultiAttr create() => S_SyncMultiAttr._();
  S_SyncMultiAttr createEmptyInstance() => create();
  static $pb.PbList<S_SyncMultiAttr> createRepeated() => $pb.PbList<S_SyncMultiAttr>();
  @$core.pragma('dart2js:noInline')
  static S_SyncMultiAttr getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_SyncMultiAttr>(create);
  static S_SyncMultiAttr? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$0.AttrVO> get attr => $_getList(1);
}

class S_SyncMultiAttrs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_SyncMultiAttrs', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..p<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.K3)
    ..pc<$0.AttrInfo>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attrs', $pb.PbFieldType.PM, subBuilder: $0.AttrInfo.create)
    ..hasRequiredFields = false
  ;

  S_SyncMultiAttrs._() : super();
  factory S_SyncMultiAttrs({
    $core.Iterable<$core.int>? id,
    $core.Iterable<$0.AttrInfo>? attrs,
  }) {
    final _result = create();
    if (id != null) {
      _result.id.addAll(id);
    }
    if (attrs != null) {
      _result.attrs.addAll(attrs);
    }
    return _result;
  }
  factory S_SyncMultiAttrs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_SyncMultiAttrs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_SyncMultiAttrs clone() => S_SyncMultiAttrs()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_SyncMultiAttrs copyWith(void Function(S_SyncMultiAttrs) updates) => super.copyWith((message) => updates(message as S_SyncMultiAttrs)) as S_SyncMultiAttrs; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_SyncMultiAttrs create() => S_SyncMultiAttrs._();
  S_SyncMultiAttrs createEmptyInstance() => create();
  static $pb.PbList<S_SyncMultiAttrs> createRepeated() => $pb.PbList<S_SyncMultiAttrs>();
  @$core.pragma('dart2js:noInline')
  static S_SyncMultiAttrs getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_SyncMultiAttrs>(create);
  static S_SyncMultiAttrs? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$0.AttrInfo> get attrs => $_getList(1);
}

class C_RoleDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_RoleDetail', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  C_RoleDetail._() : super();
  factory C_RoleDetail({
    $fixnum.Int64? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory C_RoleDetail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_RoleDetail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_RoleDetail clone() => C_RoleDetail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_RoleDetail copyWith(void Function(C_RoleDetail) updates) => super.copyWith((message) => updates(message as C_RoleDetail)) as C_RoleDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_RoleDetail create() => C_RoleDetail._();
  C_RoleDetail createEmptyInstance() => create();
  static $pb.PbList<C_RoleDetail> createRepeated() => $pb.PbList<C_RoleDetail>();
  @$core.pragma('dart2js:noInline')
  static C_RoleDetail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_RoleDetail>(create);
  static C_RoleDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class S_RoleDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_RoleDetail', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOM<$0.RoleDetailInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'info', subBuilder: $0.RoleDetailInfo.create)
    ..hasRequiredFields = false
  ;

  S_RoleDetail._() : super();
  factory S_RoleDetail({
    $0.RoleDetailInfo? info,
  }) {
    final _result = create();
    if (info != null) {
      _result.info = info;
    }
    return _result;
  }
  factory S_RoleDetail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_RoleDetail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_RoleDetail clone() => S_RoleDetail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_RoleDetail copyWith(void Function(S_RoleDetail) updates) => super.copyWith((message) => updates(message as S_RoleDetail)) as S_RoleDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_RoleDetail create() => S_RoleDetail._();
  S_RoleDetail createEmptyInstance() => create();
  static $pb.PbList<S_RoleDetail> createRepeated() => $pb.PbList<S_RoleDetail>();
  @$core.pragma('dart2js:noInline')
  static S_RoleDetail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_RoleDetail>(create);
  static S_RoleDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $0.RoleDetailInfo get info => $_getN(0);
  @$pb.TagNumber(1)
  set info($0.RoleDetailInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearInfo() => clearField(1);
  @$pb.TagNumber(1)
  $0.RoleDetailInfo ensureInfo() => $_ensure(0);
}

class S_SyncRole extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_SyncRole', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOM<$0.RoleInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'info', subBuilder: $0.RoleInfo.create)
    ..hasRequiredFields = false
  ;

  S_SyncRole._() : super();
  factory S_SyncRole({
    $0.RoleInfo? info,
  }) {
    final _result = create();
    if (info != null) {
      _result.info = info;
    }
    return _result;
  }
  factory S_SyncRole.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_SyncRole.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_SyncRole clone() => S_SyncRole()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_SyncRole copyWith(void Function(S_SyncRole) updates) => super.copyWith((message) => updates(message as S_SyncRole)) as S_SyncRole; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_SyncRole create() => S_SyncRole._();
  S_SyncRole createEmptyInstance() => create();
  static $pb.PbList<S_SyncRole> createRepeated() => $pb.PbList<S_SyncRole>();
  @$core.pragma('dart2js:noInline')
  static S_SyncRole getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_SyncRole>(create);
  static S_SyncRole? _defaultInstance;

  @$pb.TagNumber(1)
  $0.RoleInfo get info => $_getN(0);
  @$pb.TagNumber(1)
  set info($0.RoleInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearInfo() => clearField(1);
  @$pb.TagNumber(1)
  $0.RoleInfo ensureInfo() => $_ensure(0);
}

class C_ToZone extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_ToZone', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOM<$0.XYZR>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'xyzr', subBuilder: $0.XYZR.create)
    ..hasRequiredFields = false
  ;

  C_ToZone._() : super();
  factory C_ToZone({
    $0.XYZR? xyzr,
  }) {
    final _result = create();
    if (xyzr != null) {
      _result.xyzr = xyzr;
    }
    return _result;
  }
  factory C_ToZone.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_ToZone.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_ToZone clone() => C_ToZone()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_ToZone copyWith(void Function(C_ToZone) updates) => super.copyWith((message) => updates(message as C_ToZone)) as C_ToZone; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_ToZone create() => C_ToZone._();
  C_ToZone createEmptyInstance() => create();
  static $pb.PbList<C_ToZone> createRepeated() => $pb.PbList<C_ToZone>();
  @$core.pragma('dart2js:noInline')
  static C_ToZone getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_ToZone>(create);
  static C_ToZone? _defaultInstance;

  @$pb.TagNumber(1)
  $0.XYZR get xyzr => $_getN(0);
  @$pb.TagNumber(1)
  set xyzr($0.XYZR v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasXyzr() => $_has(0);
  @$pb.TagNumber(1)
  void clearXyzr() => clearField(1);
  @$pb.TagNumber(1)
  $0.XYZR ensureXyzr() => $_ensure(0);
}

class S_SyncZone extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_SyncZone', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOM<$0.XYZR>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'xyzr', subBuilder: $0.XYZR.create)
    ..hasRequiredFields = false
  ;

  S_SyncZone._() : super();
  factory S_SyncZone({
    $core.int? id,
    $0.XYZR? xyzr,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (xyzr != null) {
      _result.xyzr = xyzr;
    }
    return _result;
  }
  factory S_SyncZone.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_SyncZone.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_SyncZone clone() => S_SyncZone()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_SyncZone copyWith(void Function(S_SyncZone) updates) => super.copyWith((message) => updates(message as S_SyncZone)) as S_SyncZone; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_SyncZone create() => S_SyncZone._();
  S_SyncZone createEmptyInstance() => create();
  static $pb.PbList<S_SyncZone> createRepeated() => $pb.PbList<S_SyncZone>();
  @$core.pragma('dart2js:noInline')
  static S_SyncZone getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_SyncZone>(create);
  static S_SyncZone? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $0.XYZR get xyzr => $_getN(1);
  @$pb.TagNumber(2)
  set xyzr($0.XYZR v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasXyzr() => $_has(1);
  @$pb.TagNumber(2)
  void clearXyzr() => clearField(2);
  @$pb.TagNumber(2)
  $0.XYZR ensureXyzr() => $_ensure(1);
}

class S_EnforceZone extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_EnforceZone', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOM<$0.XYZR>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'xyzr', subBuilder: $0.XYZR.create)
    ..hasRequiredFields = false
  ;

  S_EnforceZone._() : super();
  factory S_EnforceZone({
    $core.int? id,
    $0.XYZR? xyzr,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (xyzr != null) {
      _result.xyzr = xyzr;
    }
    return _result;
  }
  factory S_EnforceZone.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_EnforceZone.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_EnforceZone clone() => S_EnforceZone()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_EnforceZone copyWith(void Function(S_EnforceZone) updates) => super.copyWith((message) => updates(message as S_EnforceZone)) as S_EnforceZone; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_EnforceZone create() => S_EnforceZone._();
  S_EnforceZone createEmptyInstance() => create();
  static $pb.PbList<S_EnforceZone> createRepeated() => $pb.PbList<S_EnforceZone>();
  @$core.pragma('dart2js:noInline')
  static S_EnforceZone getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_EnforceZone>(create);
  static S_EnforceZone? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $0.XYZR get xyzr => $_getN(1);
  @$pb.TagNumber(2)
  set xyzr($0.XYZR v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasXyzr() => $_has(1);
  @$pb.TagNumber(2)
  void clearXyzr() => clearField(2);
  @$pb.TagNumber(2)
  $0.XYZR ensureXyzr() => $_ensure(1);
}

class S_ConveyZone extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_ConveyZone', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOM<$0.XYZR>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'xyzr', subBuilder: $0.XYZR.create)
    ..hasRequiredFields = false
  ;

  S_ConveyZone._() : super();
  factory S_ConveyZone({
    $core.int? id,
    $0.XYZR? xyzr,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (xyzr != null) {
      _result.xyzr = xyzr;
    }
    return _result;
  }
  factory S_ConveyZone.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_ConveyZone.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_ConveyZone clone() => S_ConveyZone()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_ConveyZone copyWith(void Function(S_ConveyZone) updates) => super.copyWith((message) => updates(message as S_ConveyZone)) as S_ConveyZone; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_ConveyZone create() => S_ConveyZone._();
  S_ConveyZone createEmptyInstance() => create();
  static $pb.PbList<S_ConveyZone> createRepeated() => $pb.PbList<S_ConveyZone>();
  @$core.pragma('dart2js:noInline')
  static S_ConveyZone getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_ConveyZone>(create);
  static S_ConveyZone? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $0.XYZR get xyzr => $_getN(1);
  @$pb.TagNumber(2)
  set xyzr($0.XYZR v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasXyzr() => $_has(1);
  @$pb.TagNumber(2)
  void clearXyzr() => clearField(2);
  @$pb.TagNumber(2)
  $0.XYZR ensureXyzr() => $_ensure(1);
}

class S_AddRole extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_AddRole', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..pc<$0.RoleSceneInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roles', $pb.PbFieldType.PM, subBuilder: $0.RoleSceneInfo.create)
    ..hasRequiredFields = false
  ;

  S_AddRole._() : super();
  factory S_AddRole({
    $core.Iterable<$0.RoleSceneInfo>? roles,
  }) {
    final _result = create();
    if (roles != null) {
      _result.roles.addAll(roles);
    }
    return _result;
  }
  factory S_AddRole.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_AddRole.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_AddRole clone() => S_AddRole()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_AddRole copyWith(void Function(S_AddRole) updates) => super.copyWith((message) => updates(message as S_AddRole)) as S_AddRole; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_AddRole create() => S_AddRole._();
  S_AddRole createEmptyInstance() => create();
  static $pb.PbList<S_AddRole> createRepeated() => $pb.PbList<S_AddRole>();
  @$core.pragma('dart2js:noInline')
  static S_AddRole getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_AddRole>(create);
  static S_AddRole? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.RoleSceneInfo> get roles => $_getList(0);
}

class S_RemoveObj extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_RemoveObj', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  S_RemoveObj._() : super();
  factory S_RemoveObj({
    $core.int? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory S_RemoveObj.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_RemoveObj.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_RemoveObj clone() => S_RemoveObj()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_RemoveObj copyWith(void Function(S_RemoveObj) updates) => super.copyWith((message) => updates(message as S_RemoveObj)) as S_RemoveObj; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_RemoveObj create() => S_RemoveObj._();
  S_RemoveObj createEmptyInstance() => create();
  static $pb.PbList<S_RemoveObj> createRepeated() => $pb.PbList<S_RemoveObj>();
  @$core.pragma('dart2js:noInline')
  static S_RemoveObj getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_RemoveObj>(create);
  static S_RemoveObj? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class S_RemoveObjs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_RemoveObjs', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..p<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.K3)
    ..hasRequiredFields = false
  ;

  S_RemoveObjs._() : super();
  factory S_RemoveObjs({
    $core.Iterable<$core.int>? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id.addAll(id);
    }
    return _result;
  }
  factory S_RemoveObjs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_RemoveObjs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_RemoveObjs clone() => S_RemoveObjs()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_RemoveObjs copyWith(void Function(S_RemoveObjs) updates) => super.copyWith((message) => updates(message as S_RemoveObjs)) as S_RemoveObjs; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_RemoveObjs create() => S_RemoveObjs._();
  S_RemoveObjs createEmptyInstance() => create();
  static $pb.PbList<S_RemoveObjs> createRepeated() => $pb.PbList<S_RemoveObjs>();
  @$core.pragma('dart2js:noInline')
  static S_RemoveObjs getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_RemoveObjs>(create);
  static S_RemoveObjs? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getList(0);
}

class C_StopMove extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_StopMove', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOM<$0.XYZ>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'xyz', subBuilder: $0.XYZ.create)
    ..hasRequiredFields = false
  ;

  C_StopMove._() : super();
  factory C_StopMove({
    $0.XYZ? xyz,
  }) {
    final _result = create();
    if (xyz != null) {
      _result.xyz = xyz;
    }
    return _result;
  }
  factory C_StopMove.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_StopMove.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_StopMove clone() => C_StopMove()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_StopMove copyWith(void Function(C_StopMove) updates) => super.copyWith((message) => updates(message as C_StopMove)) as C_StopMove; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_StopMove create() => C_StopMove._();
  C_StopMove createEmptyInstance() => create();
  static $pb.PbList<C_StopMove> createRepeated() => $pb.PbList<C_StopMove>();
  @$core.pragma('dart2js:noInline')
  static C_StopMove getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_StopMove>(create);
  static C_StopMove? _defaultInstance;

  @$pb.TagNumber(1)
  $0.XYZ get xyz => $_getN(0);
  @$pb.TagNumber(1)
  set xyz($0.XYZ v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasXyz() => $_has(0);
  @$pb.TagNumber(1)
  void clearXyz() => clearField(1);
  @$pb.TagNumber(1)
  $0.XYZ ensureXyz() => $_ensure(0);
}

class C_State extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_State', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..e<$0.State>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: $0.State.None, valueOf: $0.State.valueOf, enumValues: $0.State.values)
    ..aOM<$0.XYZR>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'xyzr', subBuilder: $0.XYZR.create)
    ..hasRequiredFields = false
  ;

  C_State._() : super();
  factory C_State({
    $0.State? state,
    $0.XYZR? xyzr,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    if (xyzr != null) {
      _result.xyzr = xyzr;
    }
    return _result;
  }
  factory C_State.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_State.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_State clone() => C_State()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_State copyWith(void Function(C_State) updates) => super.copyWith((message) => updates(message as C_State)) as C_State; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_State create() => C_State._();
  C_State createEmptyInstance() => create();
  static $pb.PbList<C_State> createRepeated() => $pb.PbList<C_State>();
  @$core.pragma('dart2js:noInline')
  static C_State getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_State>(create);
  static C_State? _defaultInstance;

  @$pb.TagNumber(1)
  $0.State get state => $_getN(0);
  @$pb.TagNumber(1)
  set state($0.State v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);

  @$pb.TagNumber(2)
  $0.XYZR get xyzr => $_getN(1);
  @$pb.TagNumber(2)
  set xyzr($0.XYZR v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasXyzr() => $_has(1);
  @$pb.TagNumber(2)
  void clearXyzr() => clearField(2);
  @$pb.TagNumber(2)
  $0.XYZR ensureXyzr() => $_ensure(1);
}

class S_State extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_State', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..e<$0.State>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: $0.State.None, valueOf: $0.State.valueOf, enumValues: $0.State.values)
    ..aOM<$0.XYZR>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'xyzr', subBuilder: $0.XYZR.create)
    ..hasRequiredFields = false
  ;

  S_State._() : super();
  factory S_State({
    $core.int? id,
    $0.State? state,
    $0.XYZR? xyzr,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (state != null) {
      _result.state = state;
    }
    if (xyzr != null) {
      _result.xyzr = xyzr;
    }
    return _result;
  }
  factory S_State.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_State.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_State clone() => S_State()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_State copyWith(void Function(S_State) updates) => super.copyWith((message) => updates(message as S_State)) as S_State; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_State create() => S_State._();
  S_State createEmptyInstance() => create();
  static $pb.PbList<S_State> createRepeated() => $pb.PbList<S_State>();
  @$core.pragma('dart2js:noInline')
  static S_State getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_State>(create);
  static S_State? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $0.State get state => $_getN(1);
  @$pb.TagNumber(2)
  set state($0.State v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);

  @$pb.TagNumber(3)
  $0.XYZR get xyzr => $_getN(2);
  @$pb.TagNumber(3)
  set xyzr($0.XYZR v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasXyzr() => $_has(2);
  @$pb.TagNumber(3)
  void clearXyzr() => clearField(3);
  @$pb.TagNumber(3)
  $0.XYZR ensureXyzr() => $_ensure(2);
}

class C_Test extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_Test', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  C_Test._() : super();
  factory C_Test({
    $core.String? message,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory C_Test.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_Test.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_Test clone() => C_Test()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_Test copyWith(void Function(C_Test) updates) => super.copyWith((message) => updates(message as C_Test)) as C_Test; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_Test create() => C_Test._();
  C_Test createEmptyInstance() => create();
  static $pb.PbList<C_Test> createRepeated() => $pb.PbList<C_Test>();
  @$core.pragma('dart2js:noInline')
  static C_Test getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_Test>(create);
  static C_Test? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class S_Test_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_Test.Data', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msgId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'len', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  S_Test_Data._() : super();
  factory S_Test_Data({
    $core.int? msgId,
    $core.int? len,
    $core.String? message,
  }) {
    final _result = create();
    if (msgId != null) {
      _result.msgId = msgId;
    }
    if (len != null) {
      _result.len = len;
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory S_Test_Data.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_Test_Data.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_Test_Data clone() => S_Test_Data()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_Test_Data copyWith(void Function(S_Test_Data) updates) => super.copyWith((message) => updates(message as S_Test_Data)) as S_Test_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_Test_Data create() => S_Test_Data._();
  S_Test_Data createEmptyInstance() => create();
  static $pb.PbList<S_Test_Data> createRepeated() => $pb.PbList<S_Test_Data>();
  @$core.pragma('dart2js:noInline')
  static S_Test_Data getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_Test_Data>(create);
  static S_Test_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get msgId => $_getIZ(0);
  @$pb.TagNumber(1)
  set msgId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMsgId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsgId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get len => $_getIZ(1);
  @$pb.TagNumber(2)
  set len($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLen() => $_has(1);
  @$pb.TagNumber(2)
  void clearLen() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);
}

class S_Test extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_Test', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msg')
    ..aOM<S_Test_Data>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', subBuilder: S_Test_Data.create)
    ..hasRequiredFields = false
  ;

  S_Test._() : super();
  factory S_Test({
    $core.int? code,
    $core.String? msg,
    S_Test_Data? data,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory S_Test.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_Test.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_Test clone() => S_Test()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_Test copyWith(void Function(S_Test) updates) => super.copyWith((message) => updates(message as S_Test)) as S_Test; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_Test create() => S_Test._();
  S_Test createEmptyInstance() => create();
  static $pb.PbList<S_Test> createRepeated() => $pb.PbList<S_Test>();
  @$core.pragma('dart2js:noInline')
  static S_Test getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_Test>(create);
  static S_Test? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);

  @$pb.TagNumber(3)
  S_Test_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(S_Test_Data v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  S_Test_Data ensureData() => $_ensure(2);
}

class S_Debug extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_Debug', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  S_Debug._() : super();
  factory S_Debug({
    $core.int? status,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory S_Debug.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_Debug.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_Debug clone() => S_Debug()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_Debug copyWith(void Function(S_Debug) updates) => super.copyWith((message) => updates(message as S_Debug)) as S_Debug; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_Debug create() => S_Debug._();
  S_Debug createEmptyInstance() => create();
  static $pb.PbList<S_Debug> createRepeated() => $pb.PbList<S_Debug>();
  @$core.pragma('dart2js:noInline')
  static S_Debug getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_Debug>(create);
  static S_Debug? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

