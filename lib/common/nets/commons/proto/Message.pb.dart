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
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'retryToken', protoName: 'retryToken')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time')
    ..hasRequiredFields = false
  ;

  S_Role._() : super();
  factory S_Role({
    $0.RoleInfo? role,
    $core.String? retryToken,
    $fixnum.Int64? time,
  }) {
    final _result = create();
    if (role != null) {
      _result.role = role;
    }
    if (retryToken != null) {
      _result.retryToken = retryToken;
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
  $core.String get retryToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set retryToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRetryToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearRetryToken() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get time => $_getI64(2);
  @$pb.TagNumber(3)
  set time($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearTime() => clearField(3);
}

class C_UploadURL extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_UploadURL', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  C_UploadURL._() : super();
  factory C_UploadURL({
    $core.int? type,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory C_UploadURL.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_UploadURL.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_UploadURL clone() => C_UploadURL()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_UploadURL copyWith(void Function(C_UploadURL) updates) => super.copyWith((message) => updates(message as C_UploadURL)) as C_UploadURL; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_UploadURL create() => C_UploadURL._();
  C_UploadURL createEmptyInstance() => create();
  static $pb.PbList<C_UploadURL> createRepeated() => $pb.PbList<C_UploadURL>();
  @$core.pragma('dart2js:noInline')
  static C_UploadURL getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_UploadURL>(create);
  static C_UploadURL? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);
}

class S_UploadURL extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_UploadURL', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'url')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fileName')
    ..hasRequiredFields = false
  ;

  S_UploadURL._() : super();
  factory S_UploadURL({
    $core.String? url,
    $core.String? fileName,
  }) {
    final _result = create();
    if (url != null) {
      _result.url = url;
    }
    if (fileName != null) {
      _result.fileName = fileName;
    }
    return _result;
  }
  factory S_UploadURL.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_UploadURL.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_UploadURL clone() => S_UploadURL()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_UploadURL copyWith(void Function(S_UploadURL) updates) => super.copyWith((message) => updates(message as S_UploadURL)) as S_UploadURL; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_UploadURL create() => S_UploadURL._();
  S_UploadURL createEmptyInstance() => create();
  static $pb.PbList<S_UploadURL> createRepeated() => $pb.PbList<S_UploadURL>();
  @$core.pragma('dart2js:noInline')
  static S_UploadURL getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_UploadURL>(create);
  static S_UploadURL? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fileName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fileName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFileName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileName() => clearField(2);
}

class C_MediaId extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_MediaId', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fileName')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extras')
    ..hasRequiredFields = false
  ;

  C_MediaId._() : super();
  factory C_MediaId({
    $core.String? fileName,
    $core.int? type,
    $core.String? extras,
  }) {
    final _result = create();
    if (fileName != null) {
      _result.fileName = fileName;
    }
    if (type != null) {
      _result.type = type;
    }
    if (extras != null) {
      _result.extras = extras;
    }
    return _result;
  }
  factory C_MediaId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_MediaId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_MediaId clone() => C_MediaId()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_MediaId copyWith(void Function(C_MediaId) updates) => super.copyWith((message) => updates(message as C_MediaId)) as C_MediaId; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_MediaId create() => C_MediaId._();
  C_MediaId createEmptyInstance() => create();
  static $pb.PbList<C_MediaId> createRepeated() => $pb.PbList<C_MediaId>();
  @$core.pragma('dart2js:noInline')
  static C_MediaId getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_MediaId>(create);
  static C_MediaId? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileName => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFileName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get type => $_getIZ(1);
  @$pb.TagNumber(2)
  set type($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get extras => $_getSZ(2);
  @$pb.TagNumber(3)
  set extras($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasExtras() => $_has(2);
  @$pb.TagNumber(3)
  void clearExtras() => clearField(3);
}

class S_MediaId extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_MediaId', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mediaId', protoName: 'mediaId')
    ..hasRequiredFields = false
  ;

  S_MediaId._() : super();
  factory S_MediaId({
    $fixnum.Int64? mediaId,
  }) {
    final _result = create();
    if (mediaId != null) {
      _result.mediaId = mediaId;
    }
    return _result;
  }
  factory S_MediaId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_MediaId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_MediaId clone() => S_MediaId()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_MediaId copyWith(void Function(S_MediaId) updates) => super.copyWith((message) => updates(message as S_MediaId)) as S_MediaId; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_MediaId create() => S_MediaId._();
  S_MediaId createEmptyInstance() => create();
  static $pb.PbList<S_MediaId> createRepeated() => $pb.PbList<S_MediaId>();
  @$core.pragma('dart2js:noInline')
  static S_MediaId getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_MediaId>(create);
  static S_MediaId? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get mediaId => $_getI64(0);
  @$pb.TagNumber(1)
  set mediaId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMediaId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMediaId() => clearField(1);
}

class C_CreateRole extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_CreateRole', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId', protoName: 'roleId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'typeId', $pb.PbFieldType.O3, protoName: 'typeId')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mediaId', protoName: 'mediaId')
    ..hasRequiredFields = false
  ;

  C_CreateRole._() : super();
  factory C_CreateRole({
    $fixnum.Int64? roleId,
    $core.String? name,
    $core.int? typeId,
    $fixnum.Int64? mediaId,
  }) {
    final _result = create();
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (typeId != null) {
      _result.typeId = typeId;
    }
    if (mediaId != null) {
      _result.mediaId = mediaId;
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
  $fixnum.Int64 get roleId => $_getI64(0);
  @$pb.TagNumber(1)
  set roleId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoleId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get typeId => $_getIZ(2);
  @$pb.TagNumber(3)
  set typeId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTypeId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTypeId() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get mediaId => $_getI64(3);
  @$pb.TagNumber(4)
  set mediaId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMediaId() => $_has(3);
  @$pb.TagNumber(4)
  void clearMediaId() => clearField(4);
}

class S_CreateRole extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_CreateRole', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId', protoName: 'roleId')
    ..hasRequiredFields = false
  ;

  S_CreateRole._() : super();
  factory S_CreateRole({
    $fixnum.Int64? roleId,
  }) {
    final _result = create();
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
  $fixnum.Int64 get roleId => $_getI64(0);
  @$pb.TagNumber(1)
  set roleId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoleId() => clearField(1);
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

class S_LiveStartBroadcast extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_LiveStartBroadcast', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..hasRequiredFields = false
  ;

  S_LiveStartBroadcast._() : super();
  factory S_LiveStartBroadcast({
    $fixnum.Int64? roomId,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    return _result;
  }
  factory S_LiveStartBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_LiveStartBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_LiveStartBroadcast clone() => S_LiveStartBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_LiveStartBroadcast copyWith(void Function(S_LiveStartBroadcast) updates) => super.copyWith((message) => updates(message as S_LiveStartBroadcast)) as S_LiveStartBroadcast; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_LiveStartBroadcast create() => S_LiveStartBroadcast._();
  S_LiveStartBroadcast createEmptyInstance() => create();
  static $pb.PbList<S_LiveStartBroadcast> createRepeated() => $pb.PbList<S_LiveStartBroadcast>();
  @$core.pragma('dart2js:noInline')
  static S_LiveStartBroadcast getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_LiveStartBroadcast>(create);
  static S_LiveStartBroadcast? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);
}

class S_LiveStopBroadcast extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_LiveStopBroadcast', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..hasRequiredFields = false
  ;

  S_LiveStopBroadcast._() : super();
  factory S_LiveStopBroadcast({
    $fixnum.Int64? roomId,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    return _result;
  }
  factory S_LiveStopBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_LiveStopBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_LiveStopBroadcast clone() => S_LiveStopBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_LiveStopBroadcast copyWith(void Function(S_LiveStopBroadcast) updates) => super.copyWith((message) => updates(message as S_LiveStopBroadcast)) as S_LiveStopBroadcast; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_LiveStopBroadcast create() => S_LiveStopBroadcast._();
  S_LiveStopBroadcast createEmptyInstance() => create();
  static $pb.PbList<S_LiveStopBroadcast> createRepeated() => $pb.PbList<S_LiveStopBroadcast>();
  @$core.pragma('dart2js:noInline')
  static S_LiveStopBroadcast getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_LiveStopBroadcast>(create);
  static S_LiveStopBroadcast? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);
}

class S_JoinBroadcast extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_JoinBroadcast', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'total', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  S_JoinBroadcast._() : super();
  factory S_JoinBroadcast({
    $fixnum.Int64? roomId,
    $fixnum.Int64? roleId,
    $core.String? uid,
    $core.int? total,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (total != null) {
      _result.total = total;
    }
    return _result;
  }
  factory S_JoinBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_JoinBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_JoinBroadcast clone() => S_JoinBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_JoinBroadcast copyWith(void Function(S_JoinBroadcast) updates) => super.copyWith((message) => updates(message as S_JoinBroadcast)) as S_JoinBroadcast; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_JoinBroadcast create() => S_JoinBroadcast._();
  S_JoinBroadcast createEmptyInstance() => create();
  static $pb.PbList<S_JoinBroadcast> createRepeated() => $pb.PbList<S_JoinBroadcast>();
  @$core.pragma('dart2js:noInline')
  static S_JoinBroadcast getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_JoinBroadcast>(create);
  static S_JoinBroadcast? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get roleId => $_getI64(1);
  @$pb.TagNumber(2)
  set roleId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoleId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get uid => $_getSZ(2);
  @$pb.TagNumber(3)
  set uid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get total => $_getIZ(3);
  @$pb.TagNumber(4)
  set total($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTotal() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotal() => clearField(4);
}

class S_LeaveBroadcast extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_LeaveBroadcast', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'total', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  S_LeaveBroadcast._() : super();
  factory S_LeaveBroadcast({
    $fixnum.Int64? roomId,
    $fixnum.Int64? roleId,
    $core.String? uid,
    $core.int? total,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (total != null) {
      _result.total = total;
    }
    return _result;
  }
  factory S_LeaveBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_LeaveBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_LeaveBroadcast clone() => S_LeaveBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_LeaveBroadcast copyWith(void Function(S_LeaveBroadcast) updates) => super.copyWith((message) => updates(message as S_LeaveBroadcast)) as S_LeaveBroadcast; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_LeaveBroadcast create() => S_LeaveBroadcast._();
  S_LeaveBroadcast createEmptyInstance() => create();
  static $pb.PbList<S_LeaveBroadcast> createRepeated() => $pb.PbList<S_LeaveBroadcast>();
  @$core.pragma('dart2js:noInline')
  static S_LeaveBroadcast getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_LeaveBroadcast>(create);
  static S_LeaveBroadcast? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get roleId => $_getI64(1);
  @$pb.TagNumber(2)
  set roleId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoleId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get uid => $_getSZ(2);
  @$pb.TagNumber(3)
  set uid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get total => $_getIZ(3);
  @$pb.TagNumber(4)
  set total($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTotal() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotal() => clearField(4);
}

class S_UpMikeBroadcast extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_UpMikeBroadcast', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mikeNo')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'oldMikeNo')
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mikeId')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'number', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  S_UpMikeBroadcast._() : super();
  factory S_UpMikeBroadcast({
    $fixnum.Int64? roomId,
    $fixnum.Int64? roleId,
    $core.String? uid,
    $core.String? mikeNo,
    $core.String? oldMikeNo,
    $fixnum.Int64? mikeId,
    $core.int? number,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (mikeNo != null) {
      _result.mikeNo = mikeNo;
    }
    if (oldMikeNo != null) {
      _result.oldMikeNo = oldMikeNo;
    }
    if (mikeId != null) {
      _result.mikeId = mikeId;
    }
    if (number != null) {
      _result.number = number;
    }
    return _result;
  }
  factory S_UpMikeBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_UpMikeBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_UpMikeBroadcast clone() => S_UpMikeBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_UpMikeBroadcast copyWith(void Function(S_UpMikeBroadcast) updates) => super.copyWith((message) => updates(message as S_UpMikeBroadcast)) as S_UpMikeBroadcast; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_UpMikeBroadcast create() => S_UpMikeBroadcast._();
  S_UpMikeBroadcast createEmptyInstance() => create();
  static $pb.PbList<S_UpMikeBroadcast> createRepeated() => $pb.PbList<S_UpMikeBroadcast>();
  @$core.pragma('dart2js:noInline')
  static S_UpMikeBroadcast getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_UpMikeBroadcast>(create);
  static S_UpMikeBroadcast? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get roleId => $_getI64(1);
  @$pb.TagNumber(2)
  set roleId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoleId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get uid => $_getSZ(2);
  @$pb.TagNumber(3)
  set uid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get mikeNo => $_getSZ(3);
  @$pb.TagNumber(4)
  set mikeNo($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMikeNo() => $_has(3);
  @$pb.TagNumber(4)
  void clearMikeNo() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get oldMikeNo => $_getSZ(4);
  @$pb.TagNumber(5)
  set oldMikeNo($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOldMikeNo() => $_has(4);
  @$pb.TagNumber(5)
  void clearOldMikeNo() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get mikeId => $_getI64(5);
  @$pb.TagNumber(6)
  set mikeId($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMikeId() => $_has(5);
  @$pb.TagNumber(6)
  void clearMikeId() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get number => $_getIZ(6);
  @$pb.TagNumber(7)
  set number($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasNumber() => $_has(6);
  @$pb.TagNumber(7)
  void clearNumber() => clearField(7);
}

class S_DownMikeBroadcast extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_DownMikeBroadcast', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mikeNo')
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mikeId')
    ..hasRequiredFields = false
  ;

  S_DownMikeBroadcast._() : super();
  factory S_DownMikeBroadcast({
    $fixnum.Int64? roomId,
    $fixnum.Int64? roleId,
    $core.String? uid,
    $core.String? mikeNo,
    $fixnum.Int64? mikeId,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (mikeNo != null) {
      _result.mikeNo = mikeNo;
    }
    if (mikeId != null) {
      _result.mikeId = mikeId;
    }
    return _result;
  }
  factory S_DownMikeBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_DownMikeBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_DownMikeBroadcast clone() => S_DownMikeBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_DownMikeBroadcast copyWith(void Function(S_DownMikeBroadcast) updates) => super.copyWith((message) => updates(message as S_DownMikeBroadcast)) as S_DownMikeBroadcast; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_DownMikeBroadcast create() => S_DownMikeBroadcast._();
  S_DownMikeBroadcast createEmptyInstance() => create();
  static $pb.PbList<S_DownMikeBroadcast> createRepeated() => $pb.PbList<S_DownMikeBroadcast>();
  @$core.pragma('dart2js:noInline')
  static S_DownMikeBroadcast getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_DownMikeBroadcast>(create);
  static S_DownMikeBroadcast? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get roleId => $_getI64(1);
  @$pb.TagNumber(2)
  set roleId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoleId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get uid => $_getSZ(2);
  @$pb.TagNumber(3)
  set uid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get mikeNo => $_getSZ(3);
  @$pb.TagNumber(4)
  set mikeNo($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMikeNo() => $_has(3);
  @$pb.TagNumber(4)
  void clearMikeNo() => clearField(4);

  @$pb.TagNumber(6)
  $fixnum.Int64 get mikeId => $_getI64(4);
  @$pb.TagNumber(6)
  set mikeId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasMikeId() => $_has(4);
  @$pb.TagNumber(6)
  void clearMikeId() => clearField(6);
}

class S_InviteMikeBroadcast extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_InviteMikeBroadcast', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mikeNo')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mikeId')
    ..hasRequiredFields = false
  ;

  S_InviteMikeBroadcast._() : super();
  factory S_InviteMikeBroadcast({
    $fixnum.Int64? roomId,
    $fixnum.Int64? roleId,
    $core.String? uid,
    $core.String? mikeNo,
    $fixnum.Int64? mikeId,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (mikeNo != null) {
      _result.mikeNo = mikeNo;
    }
    if (mikeId != null) {
      _result.mikeId = mikeId;
    }
    return _result;
  }
  factory S_InviteMikeBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_InviteMikeBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_InviteMikeBroadcast clone() => S_InviteMikeBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_InviteMikeBroadcast copyWith(void Function(S_InviteMikeBroadcast) updates) => super.copyWith((message) => updates(message as S_InviteMikeBroadcast)) as S_InviteMikeBroadcast; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_InviteMikeBroadcast create() => S_InviteMikeBroadcast._();
  S_InviteMikeBroadcast createEmptyInstance() => create();
  static $pb.PbList<S_InviteMikeBroadcast> createRepeated() => $pb.PbList<S_InviteMikeBroadcast>();
  @$core.pragma('dart2js:noInline')
  static S_InviteMikeBroadcast getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_InviteMikeBroadcast>(create);
  static S_InviteMikeBroadcast? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get roleId => $_getI64(1);
  @$pb.TagNumber(2)
  set roleId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoleId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get uid => $_getSZ(2);
  @$pb.TagNumber(3)
  set uid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get mikeNo => $_getSZ(3);
  @$pb.TagNumber(4)
  set mikeNo($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMikeNo() => $_has(3);
  @$pb.TagNumber(4)
  void clearMikeNo() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get mikeId => $_getI64(4);
  @$pb.TagNumber(5)
  set mikeId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMikeId() => $_has(4);
  @$pb.TagNumber(5)
  void clearMikeId() => clearField(5);
}

class S_CloseMikeBroadcast extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_CloseMikeBroadcast', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mikeNo')
    ..hasRequiredFields = false
  ;

  S_CloseMikeBroadcast._() : super();
  factory S_CloseMikeBroadcast({
    $fixnum.Int64? roomId,
    $fixnum.Int64? roleId,
    $core.String? uid,
    $core.String? mikeNo,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (mikeNo != null) {
      _result.mikeNo = mikeNo;
    }
    return _result;
  }
  factory S_CloseMikeBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_CloseMikeBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_CloseMikeBroadcast clone() => S_CloseMikeBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_CloseMikeBroadcast copyWith(void Function(S_CloseMikeBroadcast) updates) => super.copyWith((message) => updates(message as S_CloseMikeBroadcast)) as S_CloseMikeBroadcast; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_CloseMikeBroadcast create() => S_CloseMikeBroadcast._();
  S_CloseMikeBroadcast createEmptyInstance() => create();
  static $pb.PbList<S_CloseMikeBroadcast> createRepeated() => $pb.PbList<S_CloseMikeBroadcast>();
  @$core.pragma('dart2js:noInline')
  static S_CloseMikeBroadcast getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_CloseMikeBroadcast>(create);
  static S_CloseMikeBroadcast? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get roleId => $_getI64(1);
  @$pb.TagNumber(2)
  set roleId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoleId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get uid => $_getSZ(2);
  @$pb.TagNumber(3)
  set uid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get mikeNo => $_getSZ(3);
  @$pb.TagNumber(4)
  set mikeNo($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMikeNo() => $_has(3);
  @$pb.TagNumber(4)
  void clearMikeNo() => clearField(4);
}

class S_OpenBroadcast extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_OpenBroadcast', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..hasRequiredFields = false
  ;

  S_OpenBroadcast._() : super();
  factory S_OpenBroadcast({
    $fixnum.Int64? roomId,
    $fixnum.Int64? roleId,
    $core.String? uid,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory S_OpenBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_OpenBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_OpenBroadcast clone() => S_OpenBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_OpenBroadcast copyWith(void Function(S_OpenBroadcast) updates) => super.copyWith((message) => updates(message as S_OpenBroadcast)) as S_OpenBroadcast; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_OpenBroadcast create() => S_OpenBroadcast._();
  S_OpenBroadcast createEmptyInstance() => create();
  static $pb.PbList<S_OpenBroadcast> createRepeated() => $pb.PbList<S_OpenBroadcast>();
  @$core.pragma('dart2js:noInline')
  static S_OpenBroadcast getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_OpenBroadcast>(create);
  static S_OpenBroadcast? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get roleId => $_getI64(1);
  @$pb.TagNumber(2)
  set roleId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoleId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get uid => $_getSZ(2);
  @$pb.TagNumber(3)
  set uid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);
}

class S_ApplyUpMikeBroadcast extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_ApplyUpMikeBroadcast', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mikeNo')
    ..hasRequiredFields = false
  ;

  S_ApplyUpMikeBroadcast._() : super();
  factory S_ApplyUpMikeBroadcast({
    $fixnum.Int64? roomId,
    $fixnum.Int64? roleId,
    $core.String? uid,
    $core.String? mikeNo,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (mikeNo != null) {
      _result.mikeNo = mikeNo;
    }
    return _result;
  }
  factory S_ApplyUpMikeBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_ApplyUpMikeBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_ApplyUpMikeBroadcast clone() => S_ApplyUpMikeBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_ApplyUpMikeBroadcast copyWith(void Function(S_ApplyUpMikeBroadcast) updates) => super.copyWith((message) => updates(message as S_ApplyUpMikeBroadcast)) as S_ApplyUpMikeBroadcast; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_ApplyUpMikeBroadcast create() => S_ApplyUpMikeBroadcast._();
  S_ApplyUpMikeBroadcast createEmptyInstance() => create();
  static $pb.PbList<S_ApplyUpMikeBroadcast> createRepeated() => $pb.PbList<S_ApplyUpMikeBroadcast>();
  @$core.pragma('dart2js:noInline')
  static S_ApplyUpMikeBroadcast getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_ApplyUpMikeBroadcast>(create);
  static S_ApplyUpMikeBroadcast? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get roleId => $_getI64(1);
  @$pb.TagNumber(2)
  set roleId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoleId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get uid => $_getSZ(2);
  @$pb.TagNumber(3)
  set uid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get mikeNo => $_getSZ(3);
  @$pb.TagNumber(4)
  set mikeNo($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMikeNo() => $_has(3);
  @$pb.TagNumber(4)
  void clearMikeNo() => clearField(4);
}

class S_RefuseUpMikeBroadcast extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_RefuseUpMikeBroadcast', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mikeNo')
    ..hasRequiredFields = false
  ;

  S_RefuseUpMikeBroadcast._() : super();
  factory S_RefuseUpMikeBroadcast({
    $fixnum.Int64? roomId,
    $fixnum.Int64? roleId,
    $core.String? uid,
    $core.String? mikeNo,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (mikeNo != null) {
      _result.mikeNo = mikeNo;
    }
    return _result;
  }
  factory S_RefuseUpMikeBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_RefuseUpMikeBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_RefuseUpMikeBroadcast clone() => S_RefuseUpMikeBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_RefuseUpMikeBroadcast copyWith(void Function(S_RefuseUpMikeBroadcast) updates) => super.copyWith((message) => updates(message as S_RefuseUpMikeBroadcast)) as S_RefuseUpMikeBroadcast; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_RefuseUpMikeBroadcast create() => S_RefuseUpMikeBroadcast._();
  S_RefuseUpMikeBroadcast createEmptyInstance() => create();
  static $pb.PbList<S_RefuseUpMikeBroadcast> createRepeated() => $pb.PbList<S_RefuseUpMikeBroadcast>();
  @$core.pragma('dart2js:noInline')
  static S_RefuseUpMikeBroadcast getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_RefuseUpMikeBroadcast>(create);
  static S_RefuseUpMikeBroadcast? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get roleId => $_getI64(1);
  @$pb.TagNumber(2)
  set roleId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoleId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get uid => $_getSZ(2);
  @$pb.TagNumber(3)
  set uid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get mikeNo => $_getSZ(3);
  @$pb.TagNumber(4)
  set mikeNo($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMikeNo() => $_has(3);
  @$pb.TagNumber(4)
  void clearMikeNo() => clearField(4);
}

class S_AccMikeBroadcast extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_AccMikeBroadcast', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mikeId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mikeNo')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'number', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  S_AccMikeBroadcast._() : super();
  factory S_AccMikeBroadcast({
    $fixnum.Int64? roomId,
    $fixnum.Int64? mikeId,
    $core.String? mikeNo,
    $core.int? number,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (mikeId != null) {
      _result.mikeId = mikeId;
    }
    if (mikeNo != null) {
      _result.mikeNo = mikeNo;
    }
    if (number != null) {
      _result.number = number;
    }
    return _result;
  }
  factory S_AccMikeBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_AccMikeBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_AccMikeBroadcast clone() => S_AccMikeBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_AccMikeBroadcast copyWith(void Function(S_AccMikeBroadcast) updates) => super.copyWith((message) => updates(message as S_AccMikeBroadcast)) as S_AccMikeBroadcast; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_AccMikeBroadcast create() => S_AccMikeBroadcast._();
  S_AccMikeBroadcast createEmptyInstance() => create();
  static $pb.PbList<S_AccMikeBroadcast> createRepeated() => $pb.PbList<S_AccMikeBroadcast>();
  @$core.pragma('dart2js:noInline')
  static S_AccMikeBroadcast getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_AccMikeBroadcast>(create);
  static S_AccMikeBroadcast? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get mikeId => $_getI64(1);
  @$pb.TagNumber(2)
  set mikeId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMikeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMikeId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get mikeNo => $_getSZ(2);
  @$pb.TagNumber(3)
  set mikeNo($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMikeNo() => $_has(2);
  @$pb.TagNumber(3)
  void clearMikeNo() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get number => $_getIZ(3);
  @$pb.TagNumber(4)
  set number($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearNumber() => clearField(4);
}

class S_NoticeBroadcast extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_NoticeBroadcast', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  S_NoticeBroadcast._() : super();
  factory S_NoticeBroadcast({
    $fixnum.Int64? roomId,
    $core.String? message,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory S_NoticeBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_NoticeBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_NoticeBroadcast clone() => S_NoticeBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_NoticeBroadcast copyWith(void Function(S_NoticeBroadcast) updates) => super.copyWith((message) => updates(message as S_NoticeBroadcast)) as S_NoticeBroadcast; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_NoticeBroadcast create() => S_NoticeBroadcast._();
  S_NoticeBroadcast createEmptyInstance() => create();
  static $pb.PbList<S_NoticeBroadcast> createRepeated() => $pb.PbList<S_NoticeBroadcast>();
  @$core.pragma('dart2js:noInline')
  static S_NoticeBroadcast getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_NoticeBroadcast>(create);
  static S_NoticeBroadcast? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class S_BlackBroadcast extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_BlackBroadcast', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'operatorRoleId')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  S_BlackBroadcast._() : super();
  factory S_BlackBroadcast({
    $fixnum.Int64? roomId,
    $fixnum.Int64? roleId,
    $core.String? uid,
    $fixnum.Int64? operatorRoleId,
    $core.int? status,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (operatorRoleId != null) {
      _result.operatorRoleId = operatorRoleId;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory S_BlackBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_BlackBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_BlackBroadcast clone() => S_BlackBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_BlackBroadcast copyWith(void Function(S_BlackBroadcast) updates) => super.copyWith((message) => updates(message as S_BlackBroadcast)) as S_BlackBroadcast; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_BlackBroadcast create() => S_BlackBroadcast._();
  S_BlackBroadcast createEmptyInstance() => create();
  static $pb.PbList<S_BlackBroadcast> createRepeated() => $pb.PbList<S_BlackBroadcast>();
  @$core.pragma('dart2js:noInline')
  static S_BlackBroadcast getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_BlackBroadcast>(create);
  static S_BlackBroadcast? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get roleId => $_getI64(1);
  @$pb.TagNumber(2)
  set roleId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoleId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get uid => $_getSZ(2);
  @$pb.TagNumber(3)
  set uid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get operatorRoleId => $_getI64(3);
  @$pb.TagNumber(4)
  set operatorRoleId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOperatorRoleId() => $_has(3);
  @$pb.TagNumber(4)
  void clearOperatorRoleId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get status => $_getIZ(4);
  @$pb.TagNumber(5)
  set status($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);
}

class S_AdministratorBroadcast extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_AdministratorBroadcast', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..hasRequiredFields = false
  ;

  S_AdministratorBroadcast._() : super();
  factory S_AdministratorBroadcast({
    $fixnum.Int64? roomId,
    $fixnum.Int64? roleId,
    $core.int? status,
    $core.String? uid,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (status != null) {
      _result.status = status;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory S_AdministratorBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_AdministratorBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_AdministratorBroadcast clone() => S_AdministratorBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_AdministratorBroadcast copyWith(void Function(S_AdministratorBroadcast) updates) => super.copyWith((message) => updates(message as S_AdministratorBroadcast)) as S_AdministratorBroadcast; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_AdministratorBroadcast create() => S_AdministratorBroadcast._();
  S_AdministratorBroadcast createEmptyInstance() => create();
  static $pb.PbList<S_AdministratorBroadcast> createRepeated() => $pb.PbList<S_AdministratorBroadcast>();
  @$core.pragma('dart2js:noInline')
  static S_AdministratorBroadcast getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_AdministratorBroadcast>(create);
  static S_AdministratorBroadcast? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get roleId => $_getI64(1);
  @$pb.TagNumber(2)
  set roleId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoleId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get status => $_getIZ(2);
  @$pb.TagNumber(3)
  set status($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get uid => $_getSZ(3);
  @$pb.TagNumber(4)
  set uid($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearUid() => clearField(4);
}

class S_ChatMessageBroadcast extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_ChatMessageBroadcast', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..hasRequiredFields = false
  ;

  S_ChatMessageBroadcast._() : super();
  factory S_ChatMessageBroadcast({
    $fixnum.Int64? roomId,
    $fixnum.Int64? roleId,
    $core.String? message,
    $core.String? uid,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (message != null) {
      _result.message = message;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory S_ChatMessageBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_ChatMessageBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_ChatMessageBroadcast clone() => S_ChatMessageBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_ChatMessageBroadcast copyWith(void Function(S_ChatMessageBroadcast) updates) => super.copyWith((message) => updates(message as S_ChatMessageBroadcast)) as S_ChatMessageBroadcast; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_ChatMessageBroadcast create() => S_ChatMessageBroadcast._();
  S_ChatMessageBroadcast createEmptyInstance() => create();
  static $pb.PbList<S_ChatMessageBroadcast> createRepeated() => $pb.PbList<S_ChatMessageBroadcast>();
  @$core.pragma('dart2js:noInline')
  static S_ChatMessageBroadcast getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_ChatMessageBroadcast>(create);
  static S_ChatMessageBroadcast? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get roleId => $_getI64(1);
  @$pb.TagNumber(2)
  set roleId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoleId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get uid => $_getSZ(3);
  @$pb.TagNumber(4)
  set uid($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearUid() => clearField(4);
}

class C_CreateScene extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_CreateScene', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneId', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'image')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomPassword')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'privateStatus', $pb.PbFieldType.O3)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'noticeMessage')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxNum', $pb.PbFieldType.O3)
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mikeStatus', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  C_CreateScene._() : super();
  factory C_CreateScene({
    $core.int? sceneId,
    $core.String? name,
    $core.String? image,
    $core.String? roomPassword,
    $core.int? privateStatus,
    $core.String? noticeMessage,
    $core.int? maxNum,
    $core.int? mikeStatus,
  }) {
    final _result = create();
    if (sceneId != null) {
      _result.sceneId = sceneId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (image != null) {
      _result.image = image;
    }
    if (roomPassword != null) {
      _result.roomPassword = roomPassword;
    }
    if (privateStatus != null) {
      _result.privateStatus = privateStatus;
    }
    if (noticeMessage != null) {
      _result.noticeMessage = noticeMessage;
    }
    if (maxNum != null) {
      _result.maxNum = maxNum;
    }
    if (mikeStatus != null) {
      _result.mikeStatus = mikeStatus;
    }
    return _result;
  }
  factory C_CreateScene.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_CreateScene.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_CreateScene clone() => C_CreateScene()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_CreateScene copyWith(void Function(C_CreateScene) updates) => super.copyWith((message) => updates(message as C_CreateScene)) as C_CreateScene; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_CreateScene create() => C_CreateScene._();
  C_CreateScene createEmptyInstance() => create();
  static $pb.PbList<C_CreateScene> createRepeated() => $pb.PbList<C_CreateScene>();
  @$core.pragma('dart2js:noInline')
  static C_CreateScene getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_CreateScene>(create);
  static C_CreateScene? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get sceneId => $_getIZ(0);
  @$pb.TagNumber(1)
  set sceneId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSceneId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSceneId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get image => $_getSZ(2);
  @$pb.TagNumber(3)
  set image($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get roomPassword => $_getSZ(3);
  @$pb.TagNumber(4)
  set roomPassword($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRoomPassword() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomPassword() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get privateStatus => $_getIZ(4);
  @$pb.TagNumber(5)
  set privateStatus($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPrivateStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrivateStatus() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get noticeMessage => $_getSZ(5);
  @$pb.TagNumber(6)
  set noticeMessage($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNoticeMessage() => $_has(5);
  @$pb.TagNumber(6)
  void clearNoticeMessage() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get maxNum => $_getIZ(6);
  @$pb.TagNumber(7)
  set maxNum($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMaxNum() => $_has(6);
  @$pb.TagNumber(7)
  void clearMaxNum() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get mikeStatus => $_getIZ(7);
  @$pb.TagNumber(8)
  set mikeStatus($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasMikeStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearMikeStatus() => clearField(8);
}

class S_CreateScene extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_CreateScene', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneId', $pb.PbFieldType.O3)
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..hasRequiredFields = false
  ;

  S_CreateScene._() : super();
  factory S_CreateScene({
    $core.int? sceneId,
    $fixnum.Int64? roomId,
  }) {
    final _result = create();
    if (sceneId != null) {
      _result.sceneId = sceneId;
    }
    if (roomId != null) {
      _result.roomId = roomId;
    }
    return _result;
  }
  factory S_CreateScene.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_CreateScene.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_CreateScene clone() => S_CreateScene()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_CreateScene copyWith(void Function(S_CreateScene) updates) => super.copyWith((message) => updates(message as S_CreateScene)) as S_CreateScene; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_CreateScene create() => S_CreateScene._();
  S_CreateScene createEmptyInstance() => create();
  static $pb.PbList<S_CreateScene> createRepeated() => $pb.PbList<S_CreateScene>();
  @$core.pragma('dart2js:noInline')
  static S_CreateScene getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_CreateScene>(create);
  static S_CreateScene? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get sceneId => $_getIZ(0);
  @$pb.TagNumber(1)
  set sceneId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSceneId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSceneId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get roomId => $_getI64(1);
  @$pb.TagNumber(2)
  set roomId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => clearField(2);
}

class S_CloseScene extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_CloseScene', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOM<S_Err>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', subBuilder: S_Err.create)
    ..hasRequiredFields = false
  ;

  S_CloseScene._() : super();
  factory S_CloseScene({
    S_Err? code,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    return _result;
  }
  factory S_CloseScene.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_CloseScene.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_CloseScene clone() => S_CloseScene()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_CloseScene copyWith(void Function(S_CloseScene) updates) => super.copyWith((message) => updates(message as S_CloseScene)) as S_CloseScene; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_CloseScene create() => S_CloseScene._();
  S_CloseScene createEmptyInstance() => create();
  static $pb.PbList<S_CloseScene> createRepeated() => $pb.PbList<S_CloseScene>();
  @$core.pragma('dart2js:noInline')
  static S_CloseScene getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_CloseScene>(create);
  static S_CloseScene? _defaultInstance;

  @$pb.TagNumber(1)
  S_Err get code => $_getN(0);
  @$pb.TagNumber(1)
  set code(S_Err v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);
  @$pb.TagNumber(1)
  S_Err ensureCode() => $_ensure(0);
}

class C_JoinScene extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_JoinScene', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomPassword')
    ..hasRequiredFields = false
  ;

  C_JoinScene._() : super();
  factory C_JoinScene({
    $fixnum.Int64? roomId,
    $core.String? roomPassword,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (roomPassword != null) {
      _result.roomPassword = roomPassword;
    }
    return _result;
  }
  factory C_JoinScene.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_JoinScene.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_JoinScene clone() => C_JoinScene()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_JoinScene copyWith(void Function(C_JoinScene) updates) => super.copyWith((message) => updates(message as C_JoinScene)) as C_JoinScene; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_JoinScene create() => C_JoinScene._();
  C_JoinScene createEmptyInstance() => create();
  static $pb.PbList<C_JoinScene> createRepeated() => $pb.PbList<C_JoinScene>();
  @$core.pragma('dart2js:noInline')
  static C_JoinScene getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_JoinScene>(create);
  static C_JoinScene? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomPassword => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomPassword($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoomPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomPassword() => clearField(2);
}

class S_JoinScene extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_JoinScene', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..e<$1.ErrorCode>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: $1.ErrorCode.Ok, valueOf: $1.ErrorCode.valueOf, enumValues: $1.ErrorCode.values)
    ..hasRequiredFields = false
  ;

  S_JoinScene._() : super();
  factory S_JoinScene({
    $1.ErrorCode? code,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    return _result;
  }
  factory S_JoinScene.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_JoinScene.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_JoinScene clone() => S_JoinScene()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_JoinScene copyWith(void Function(S_JoinScene) updates) => super.copyWith((message) => updates(message as S_JoinScene)) as S_JoinScene; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_JoinScene create() => S_JoinScene._();
  S_JoinScene createEmptyInstance() => create();
  static $pb.PbList<S_JoinScene> createRepeated() => $pb.PbList<S_JoinScene>();
  @$core.pragma('dart2js:noInline')
  static S_JoinScene getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_JoinScene>(create);
  static S_JoinScene? _defaultInstance;

  @$pb.TagNumber(2)
  $1.ErrorCode get code => $_getN(0);
  @$pb.TagNumber(2)
  set code($1.ErrorCode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);
}

class C_MikeList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_MikeList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..hasRequiredFields = false
  ;

  C_MikeList._() : super();
  factory C_MikeList({
    $fixnum.Int64? roomId,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    return _result;
  }
  factory C_MikeList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_MikeList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_MikeList clone() => C_MikeList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_MikeList copyWith(void Function(C_MikeList) updates) => super.copyWith((message) => updates(message as C_MikeList)) as C_MikeList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_MikeList create() => C_MikeList._();
  C_MikeList createEmptyInstance() => create();
  static $pb.PbList<C_MikeList> createRepeated() => $pb.PbList<C_MikeList>();
  @$core.pragma('dart2js:noInline')
  static C_MikeList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_MikeList>(create);
  static C_MikeList? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);
}

class S_MikeList_Mike extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_MikeList.Mike', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mikeId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mikeNo')
    ..hasRequiredFields = false
  ;

  S_MikeList_Mike._() : super();
  factory S_MikeList_Mike({
    $fixnum.Int64? roleId,
    $fixnum.Int64? mikeId,
    $core.String? mikeNo,
  }) {
    final _result = create();
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (mikeId != null) {
      _result.mikeId = mikeId;
    }
    if (mikeNo != null) {
      _result.mikeNo = mikeNo;
    }
    return _result;
  }
  factory S_MikeList_Mike.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_MikeList_Mike.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_MikeList_Mike clone() => S_MikeList_Mike()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_MikeList_Mike copyWith(void Function(S_MikeList_Mike) updates) => super.copyWith((message) => updates(message as S_MikeList_Mike)) as S_MikeList_Mike; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_MikeList_Mike create() => S_MikeList_Mike._();
  S_MikeList_Mike createEmptyInstance() => create();
  static $pb.PbList<S_MikeList_Mike> createRepeated() => $pb.PbList<S_MikeList_Mike>();
  @$core.pragma('dart2js:noInline')
  static S_MikeList_Mike getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_MikeList_Mike>(create);
  static S_MikeList_Mike? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roleId => $_getI64(0);
  @$pb.TagNumber(1)
  set roleId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoleId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get mikeId => $_getI64(1);
  @$pb.TagNumber(2)
  set mikeId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMikeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMikeId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get mikeNo => $_getSZ(2);
  @$pb.TagNumber(3)
  set mikeNo($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMikeNo() => $_has(2);
  @$pb.TagNumber(3)
  void clearMikeNo() => clearField(3);
}

class S_MikeList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_MikeList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..pc<S_MikeList_Mike>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mikes', $pb.PbFieldType.PM, subBuilder: S_MikeList_Mike.create)
    ..hasRequiredFields = false
  ;

  S_MikeList._() : super();
  factory S_MikeList({
    $core.Iterable<S_MikeList_Mike>? mikes,
  }) {
    final _result = create();
    if (mikes != null) {
      _result.mikes.addAll(mikes);
    }
    return _result;
  }
  factory S_MikeList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_MikeList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_MikeList clone() => S_MikeList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_MikeList copyWith(void Function(S_MikeList) updates) => super.copyWith((message) => updates(message as S_MikeList)) as S_MikeList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_MikeList create() => S_MikeList._();
  S_MikeList createEmptyInstance() => create();
  static $pb.PbList<S_MikeList> createRepeated() => $pb.PbList<S_MikeList>();
  @$core.pragma('dart2js:noInline')
  static S_MikeList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_MikeList>(create);
  static S_MikeList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<S_MikeList_Mike> get mikes => $_getList(0);
}

class C_UpMike extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_UpMike', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mikeNo')
    ..hasRequiredFields = false
  ;

  C_UpMike._() : super();
  factory C_UpMike({
    $fixnum.Int64? roleId,
    $core.String? mikeNo,
  }) {
    final _result = create();
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (mikeNo != null) {
      _result.mikeNo = mikeNo;
    }
    return _result;
  }
  factory C_UpMike.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_UpMike.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_UpMike clone() => C_UpMike()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_UpMike copyWith(void Function(C_UpMike) updates) => super.copyWith((message) => updates(message as C_UpMike)) as C_UpMike; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_UpMike create() => C_UpMike._();
  C_UpMike createEmptyInstance() => create();
  static $pb.PbList<C_UpMike> createRepeated() => $pb.PbList<C_UpMike>();
  @$core.pragma('dart2js:noInline')
  static C_UpMike getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_UpMike>(create);
  static C_UpMike? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roleId => $_getI64(0);
  @$pb.TagNumber(1)
  set roleId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoleId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get mikeNo => $_getSZ(1);
  @$pb.TagNumber(2)
  set mikeNo($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMikeNo() => $_has(1);
  @$pb.TagNumber(2)
  void clearMikeNo() => clearField(2);
}

class S_UpMike extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_UpMike', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mikeId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  S_UpMike._() : super();
  factory S_UpMike({
    $fixnum.Int64? mikeId,
    $core.int? status,
  }) {
    final _result = create();
    if (mikeId != null) {
      _result.mikeId = mikeId;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory S_UpMike.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_UpMike.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_UpMike clone() => S_UpMike()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_UpMike copyWith(void Function(S_UpMike) updates) => super.copyWith((message) => updates(message as S_UpMike)) as S_UpMike; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_UpMike create() => S_UpMike._();
  S_UpMike createEmptyInstance() => create();
  static $pb.PbList<S_UpMike> createRepeated() => $pb.PbList<S_UpMike>();
  @$core.pragma('dart2js:noInline')
  static S_UpMike getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_UpMike>(create);
  static S_UpMike? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get mikeId => $_getI64(0);
  @$pb.TagNumber(1)
  set mikeId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMikeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMikeId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get status => $_getIZ(1);
  @$pb.TagNumber(2)
  set status($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);
}

class C_OutMike extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_OutMike', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId')
    ..hasRequiredFields = false
  ;

  C_OutMike._() : super();
  factory C_OutMike({
    $fixnum.Int64? roleId,
  }) {
    final _result = create();
    if (roleId != null) {
      _result.roleId = roleId;
    }
    return _result;
  }
  factory C_OutMike.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_OutMike.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_OutMike clone() => C_OutMike()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_OutMike copyWith(void Function(C_OutMike) updates) => super.copyWith((message) => updates(message as C_OutMike)) as C_OutMike; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_OutMike create() => C_OutMike._();
  C_OutMike createEmptyInstance() => create();
  static $pb.PbList<C_OutMike> createRepeated() => $pb.PbList<C_OutMike>();
  @$core.pragma('dart2js:noInline')
  static C_OutMike getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_OutMike>(create);
  static C_OutMike? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roleId => $_getI64(0);
  @$pb.TagNumber(1)
  set roleId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoleId() => clearField(1);
}

class C_BanMike extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_BanMike', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  C_BanMike._() : super();
  factory C_BanMike({
    $fixnum.Int64? sceneId,
    $core.int? status,
  }) {
    final _result = create();
    if (sceneId != null) {
      _result.sceneId = sceneId;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory C_BanMike.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_BanMike.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_BanMike clone() => C_BanMike()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_BanMike copyWith(void Function(C_BanMike) updates) => super.copyWith((message) => updates(message as C_BanMike)) as C_BanMike; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_BanMike create() => C_BanMike._();
  C_BanMike createEmptyInstance() => create();
  static $pb.PbList<C_BanMike> createRepeated() => $pb.PbList<C_BanMike>();
  @$core.pragma('dart2js:noInline')
  static C_BanMike getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_BanMike>(create);
  static C_BanMike? _defaultInstance;

  @$pb.TagNumber(2)
  $fixnum.Int64 get sceneId => $_getI64(0);
  @$pb.TagNumber(2)
  set sceneId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasSceneId() => $_has(0);
  @$pb.TagNumber(2)
  void clearSceneId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get status => $_getIZ(1);
  @$pb.TagNumber(3)
  set status($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);
}

class C_AccMikeClear extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_AccMikeClear', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mikeId')
    ..hasRequiredFields = false
  ;

  C_AccMikeClear._() : super();
  factory C_AccMikeClear({
    $fixnum.Int64? mikeId,
  }) {
    final _result = create();
    if (mikeId != null) {
      _result.mikeId = mikeId;
    }
    return _result;
  }
  factory C_AccMikeClear.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_AccMikeClear.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_AccMikeClear clone() => C_AccMikeClear()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_AccMikeClear copyWith(void Function(C_AccMikeClear) updates) => super.copyWith((message) => updates(message as C_AccMikeClear)) as C_AccMikeClear; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_AccMikeClear create() => C_AccMikeClear._();
  C_AccMikeClear createEmptyInstance() => create();
  static $pb.PbList<C_AccMikeClear> createRepeated() => $pb.PbList<C_AccMikeClear>();
  @$core.pragma('dart2js:noInline')
  static C_AccMikeClear getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_AccMikeClear>(create);
  static C_AccMikeClear? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get mikeId => $_getI64(0);
  @$pb.TagNumber(1)
  set mikeId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMikeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMikeId() => clearField(1);
}

class C_SetNoticeMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_SetNoticeMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  C_SetNoticeMessage._() : super();
  factory C_SetNoticeMessage({
    $core.String? message,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory C_SetNoticeMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_SetNoticeMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_SetNoticeMessage clone() => C_SetNoticeMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_SetNoticeMessage copyWith(void Function(C_SetNoticeMessage) updates) => super.copyWith((message) => updates(message as C_SetNoticeMessage)) as C_SetNoticeMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_SetNoticeMessage create() => C_SetNoticeMessage._();
  C_SetNoticeMessage createEmptyInstance() => create();
  static $pb.PbList<C_SetNoticeMessage> createRepeated() => $pb.PbList<C_SetNoticeMessage>();
  @$core.pragma('dart2js:noInline')
  static C_SetNoticeMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_SetNoticeMessage>(create);
  static C_SetNoticeMessage? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class C_SetAdministrator extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_SetAdministrator', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  C_SetAdministrator._() : super();
  factory C_SetAdministrator({
    $core.String? uid,
    $fixnum.Int64? roleId,
    $core.int? status,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory C_SetAdministrator.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_SetAdministrator.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_SetAdministrator clone() => C_SetAdministrator()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_SetAdministrator copyWith(void Function(C_SetAdministrator) updates) => super.copyWith((message) => updates(message as C_SetAdministrator)) as C_SetAdministrator; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_SetAdministrator create() => C_SetAdministrator._();
  C_SetAdministrator createEmptyInstance() => create();
  static $pb.PbList<C_SetAdministrator> createRepeated() => $pb.PbList<C_SetAdministrator>();
  @$core.pragma('dart2js:noInline')
  static C_SetAdministrator getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_SetAdministrator>(create);
  static C_SetAdministrator? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get roleId => $_getI64(1);
  @$pb.TagNumber(2)
  set roleId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoleId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get status => $_getIZ(2);
  @$pb.TagNumber(3)
  set status($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);
}

class C_SetBlack extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_SetBlack', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  C_SetBlack._() : super();
  factory C_SetBlack({
    $core.String? uid,
    $fixnum.Int64? roleId,
    $core.int? status,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory C_SetBlack.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_SetBlack.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_SetBlack clone() => C_SetBlack()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_SetBlack copyWith(void Function(C_SetBlack) updates) => super.copyWith((message) => updates(message as C_SetBlack)) as C_SetBlack; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_SetBlack create() => C_SetBlack._();
  C_SetBlack createEmptyInstance() => create();
  static $pb.PbList<C_SetBlack> createRepeated() => $pb.PbList<C_SetBlack>();
  @$core.pragma('dart2js:noInline')
  static C_SetBlack getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_SetBlack>(create);
  static C_SetBlack? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get roleId => $_getI64(1);
  @$pb.TagNumber(2)
  set roleId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoleId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get status => $_getIZ(2);
  @$pb.TagNumber(3)
  set status($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);
}

class C_ChatMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_ChatMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  C_ChatMessage._() : super();
  factory C_ChatMessage({
    $core.String? message,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory C_ChatMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_ChatMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_ChatMessage clone() => C_ChatMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_ChatMessage copyWith(void Function(C_ChatMessage) updates) => super.copyWith((message) => updates(message as C_ChatMessage)) as C_ChatMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_ChatMessage create() => C_ChatMessage._();
  C_ChatMessage createEmptyInstance() => create();
  static $pb.PbList<C_ChatMessage> createRepeated() => $pb.PbList<C_ChatMessage>();
  @$core.pragma('dart2js:noInline')
  static C_ChatMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_ChatMessage>(create);
  static C_ChatMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class G_SwitchScene extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'G_SwitchScene', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scene')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'room')
    ..hasRequiredFields = false
  ;

  G_SwitchScene._() : super();
  factory G_SwitchScene({
    $fixnum.Int64? scene,
    $fixnum.Int64? room,
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
  $fixnum.Int64 get scene => $_getI64(0);
  @$pb.TagNumber(1)
  set scene($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasScene() => $_has(0);
  @$pb.TagNumber(1)
  void clearScene() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get room => $_getI64(1);
  @$pb.TagNumber(2)
  set room($fixnum.Int64 v) { $_setInt64(1, v); }
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
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOM<$0.AttrVO>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attr', subBuilder: $0.AttrVO.create)
    ..hasRequiredFields = false
  ;

  S_SyncAttr._() : super();
  factory S_SyncAttr({
    $fixnum.Int64? id,
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
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
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
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOM<$0.AttrInfo>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attrs', subBuilder: $0.AttrInfo.create)
    ..hasRequiredFields = false
  ;

  S_SyncAttrs._() : super();
  factory S_SyncAttrs({
    $fixnum.Int64? id,
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
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
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
    ..p<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.K6)
    ..pc<$0.AttrVO>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attr', $pb.PbFieldType.PM, subBuilder: $0.AttrVO.create)
    ..hasRequiredFields = false
  ;

  S_SyncMultiAttr._() : super();
  factory S_SyncMultiAttr({
    $core.Iterable<$fixnum.Int64>? id,
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
  $core.List<$fixnum.Int64> get id => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$0.AttrVO> get attr => $_getList(1);
}

class S_SyncMultiAttrs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_SyncMultiAttrs', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.K6)
    ..pc<$0.AttrInfo>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attrs', $pb.PbFieldType.PM, subBuilder: $0.AttrInfo.create)
    ..hasRequiredFields = false
  ;

  S_SyncMultiAttrs._() : super();
  factory S_SyncMultiAttrs({
    $core.Iterable<$fixnum.Int64>? id,
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
  $core.List<$fixnum.Int64> get id => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$0.AttrInfo> get attrs => $_getList(1);
}

class C_RoleDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_RoleDetail', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId')
    ..hasRequiredFields = false
  ;

  C_RoleDetail._() : super();
  factory C_RoleDetail({
    $fixnum.Int64? roleId,
  }) {
    final _result = create();
    if (roleId != null) {
      _result.roleId = roleId;
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
  $fixnum.Int64 get roleId => $_getI64(0);
  @$pb.TagNumber(1)
  set roleId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoleId() => clearField(1);
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

class C_Move extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_Move', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'v')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 't', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  C_Move._() : super();
  factory C_Move({
    $fixnum.Int64? v,
    $core.int? t,
  }) {
    final _result = create();
    if (v != null) {
      _result.v = v;
    }
    if (t != null) {
      _result.t = t;
    }
    return _result;
  }
  factory C_Move.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_Move.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_Move clone() => C_Move()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_Move copyWith(void Function(C_Move) updates) => super.copyWith((message) => updates(message as C_Move)) as C_Move; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_Move create() => C_Move._();
  C_Move createEmptyInstance() => create();
  static $pb.PbList<C_Move> createRepeated() => $pb.PbList<C_Move>();
  @$core.pragma('dart2js:noInline')
  static C_Move getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_Move>(create);
  static C_Move? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get v => $_getI64(0);
  @$pb.TagNumber(1)
  set v($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasV() => $_has(0);
  @$pb.TagNumber(1)
  void clearV() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get t => $_getIZ(1);
  @$pb.TagNumber(2)
  set t($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasT() => $_has(1);
  @$pb.TagNumber(2)
  void clearT() => clearField(2);
}

class S_Move extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_Move', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'v')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 't', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  S_Move._() : super();
  factory S_Move({
    $fixnum.Int64? id,
    $fixnum.Int64? v,
    $core.int? t,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (v != null) {
      _result.v = v;
    }
    if (t != null) {
      _result.t = t;
    }
    return _result;
  }
  factory S_Move.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_Move.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_Move clone() => S_Move()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_Move copyWith(void Function(S_Move) updates) => super.copyWith((message) => updates(message as S_Move)) as S_Move; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_Move create() => S_Move._();
  S_Move createEmptyInstance() => create();
  static $pb.PbList<S_Move> createRepeated() => $pb.PbList<S_Move>();
  @$core.pragma('dart2js:noInline')
  static S_Move getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_Move>(create);
  static S_Move? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get v => $_getI64(1);
  @$pb.TagNumber(2)
  set v($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasV() => $_has(1);
  @$pb.TagNumber(2)
  void clearV() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get t => $_getIZ(2);
  @$pb.TagNumber(3)
  set t($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasT() => $_has(2);
  @$pb.TagNumber(3)
  void clearT() => clearField(3);
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
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'xyz')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  C_ToZone._() : super();
  factory C_ToZone({
    $fixnum.Int64? xyz,
    $core.int? r,
  }) {
    final _result = create();
    if (xyz != null) {
      _result.xyz = xyz;
    }
    if (r != null) {
      _result.r = r;
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
  $fixnum.Int64 get xyz => $_getI64(0);
  @$pb.TagNumber(1)
  set xyz($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasXyz() => $_has(0);
  @$pb.TagNumber(1)
  void clearXyz() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get r => $_getIZ(1);
  @$pb.TagNumber(2)
  set r($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasR() => $_has(1);
  @$pb.TagNumber(2)
  void clearR() => clearField(2);
}

class S_SyncZone extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_SyncZone', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'xyz')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  S_SyncZone._() : super();
  factory S_SyncZone({
    $fixnum.Int64? id,
    $fixnum.Int64? xyz,
    $core.int? r,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (xyz != null) {
      _result.xyz = xyz;
    }
    if (r != null) {
      _result.r = r;
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
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get xyz => $_getI64(1);
  @$pb.TagNumber(2)
  set xyz($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasXyz() => $_has(1);
  @$pb.TagNumber(2)
  void clearXyz() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get r => $_getIZ(2);
  @$pb.TagNumber(3)
  set r($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasR() => $_has(2);
  @$pb.TagNumber(3)
  void clearR() => clearField(3);
}

class C_EnforceZone extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_EnforceZone', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'xyz')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r', $pb.PbFieldType.O3)
    ..e<$0.State>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: $0.State.None, valueOf: $0.State.valueOf, enumValues: $0.State.values)
    ..hasRequiredFields = false
  ;

  C_EnforceZone._() : super();
  factory C_EnforceZone({
    $fixnum.Int64? xyz,
    $core.int? r,
    $0.State? state,
  }) {
    final _result = create();
    if (xyz != null) {
      _result.xyz = xyz;
    }
    if (r != null) {
      _result.r = r;
    }
    if (state != null) {
      _result.state = state;
    }
    return _result;
  }
  factory C_EnforceZone.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_EnforceZone.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_EnforceZone clone() => C_EnforceZone()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_EnforceZone copyWith(void Function(C_EnforceZone) updates) => super.copyWith((message) => updates(message as C_EnforceZone)) as C_EnforceZone; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_EnforceZone create() => C_EnforceZone._();
  C_EnforceZone createEmptyInstance() => create();
  static $pb.PbList<C_EnforceZone> createRepeated() => $pb.PbList<C_EnforceZone>();
  @$core.pragma('dart2js:noInline')
  static C_EnforceZone getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_EnforceZone>(create);
  static C_EnforceZone? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get xyz => $_getI64(0);
  @$pb.TagNumber(1)
  set xyz($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasXyz() => $_has(0);
  @$pb.TagNumber(1)
  void clearXyz() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get r => $_getIZ(1);
  @$pb.TagNumber(2)
  set r($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasR() => $_has(1);
  @$pb.TagNumber(2)
  void clearR() => clearField(2);

  @$pb.TagNumber(3)
  $0.State get state => $_getN(2);
  @$pb.TagNumber(3)
  set state($0.State v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasState() => $_has(2);
  @$pb.TagNumber(3)
  void clearState() => clearField(3);
}

class S_EnforceZone extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_EnforceZone', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'xyz')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r', $pb.PbFieldType.O3)
    ..e<$0.State>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: $0.State.None, valueOf: $0.State.valueOf, enumValues: $0.State.values)
    ..hasRequiredFields = false
  ;

  S_EnforceZone._() : super();
  factory S_EnforceZone({
    $fixnum.Int64? id,
    $fixnum.Int64? xyz,
    $core.int? r,
    $0.State? state,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (xyz != null) {
      _result.xyz = xyz;
    }
    if (r != null) {
      _result.r = r;
    }
    if (state != null) {
      _result.state = state;
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
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get xyz => $_getI64(1);
  @$pb.TagNumber(2)
  set xyz($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasXyz() => $_has(1);
  @$pb.TagNumber(2)
  void clearXyz() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get r => $_getIZ(2);
  @$pb.TagNumber(3)
  set r($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasR() => $_has(2);
  @$pb.TagNumber(3)
  void clearR() => clearField(3);

  @$pb.TagNumber(4)
  $0.State get state => $_getN(3);
  @$pb.TagNumber(4)
  set state($0.State v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasState() => $_has(3);
  @$pb.TagNumber(4)
  void clearState() => clearField(4);
}

class C_StopMove extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_StopMove', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'xyz')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  C_StopMove._() : super();
  factory C_StopMove({
    $fixnum.Int64? xyz,
    $core.int? r,
  }) {
    final _result = create();
    if (xyz != null) {
      _result.xyz = xyz;
    }
    if (r != null) {
      _result.r = r;
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
  $fixnum.Int64 get xyz => $_getI64(0);
  @$pb.TagNumber(1)
  set xyz($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasXyz() => $_has(0);
  @$pb.TagNumber(1)
  void clearXyz() => clearField(1);

  @$pb.TagNumber(3)
  $core.int get r => $_getIZ(1);
  @$pb.TagNumber(3)
  set r($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasR() => $_has(1);
  @$pb.TagNumber(3)
  void clearR() => clearField(3);
}

class C_Animate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_Animate', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOM<$0.AttrVO>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ani', subBuilder: $0.AttrVO.create)
    ..hasRequiredFields = false
  ;

  C_Animate._() : super();
  factory C_Animate({
    $0.AttrVO? ani,
  }) {
    final _result = create();
    if (ani != null) {
      _result.ani = ani;
    }
    return _result;
  }
  factory C_Animate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_Animate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_Animate clone() => C_Animate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_Animate copyWith(void Function(C_Animate) updates) => super.copyWith((message) => updates(message as C_Animate)) as C_Animate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_Animate create() => C_Animate._();
  C_Animate createEmptyInstance() => create();
  static $pb.PbList<C_Animate> createRepeated() => $pb.PbList<C_Animate>();
  @$core.pragma('dart2js:noInline')
  static C_Animate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_Animate>(create);
  static C_Animate? _defaultInstance;

  @$pb.TagNumber(1)
  $0.AttrVO get ani => $_getN(0);
  @$pb.TagNumber(1)
  set ani($0.AttrVO v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAni() => $_has(0);
  @$pb.TagNumber(1)
  void clearAni() => clearField(1);
  @$pb.TagNumber(1)
  $0.AttrVO ensureAni() => $_ensure(0);
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
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  S_RemoveObj._() : super();
  factory S_RemoveObj({
    $fixnum.Int64? id,
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
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class S_RemoveObjs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_RemoveObjs', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.K6)
    ..hasRequiredFields = false
  ;

  S_RemoveObjs._() : super();
  factory S_RemoveObjs({
    $core.Iterable<$fixnum.Int64>? id,
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
  $core.List<$fixnum.Int64> get id => $_getList(0);
}

class C_State extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_State', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..e<$0.State>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: $0.State.None, valueOf: $0.State.valueOf, enumValues: $0.State.values)
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'xyz')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  C_State._() : super();
  factory C_State({
    $0.State? state,
    $fixnum.Int64? xyz,
    $core.int? r,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    if (xyz != null) {
      _result.xyz = xyz;
    }
    if (r != null) {
      _result.r = r;
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
  $fixnum.Int64 get xyz => $_getI64(1);
  @$pb.TagNumber(2)
  set xyz($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasXyz() => $_has(1);
  @$pb.TagNumber(2)
  void clearXyz() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get r => $_getIZ(2);
  @$pb.TagNumber(3)
  set r($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasR() => $_has(2);
  @$pb.TagNumber(3)
  void clearR() => clearField(3);
}

class S_State extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_State', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..e<$0.State>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: $0.State.None, valueOf: $0.State.valueOf, enumValues: $0.State.values)
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'xyz')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  S_State._() : super();
  factory S_State({
    $fixnum.Int64? id,
    $0.State? state,
    $fixnum.Int64? xyz,
    $core.int? r,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (state != null) {
      _result.state = state;
    }
    if (xyz != null) {
      _result.xyz = xyz;
    }
    if (r != null) {
      _result.r = r;
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
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
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
  $fixnum.Int64 get xyz => $_getI64(2);
  @$pb.TagNumber(3)
  set xyz($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasXyz() => $_has(2);
  @$pb.TagNumber(3)
  void clearXyz() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get r => $_getIZ(3);
  @$pb.TagNumber(4)
  set r($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasR() => $_has(3);
  @$pb.TagNumber(4)
  void clearR() => clearField(4);
}

class C_ToSeatInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_ToSeatInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'guid')
    ..hasRequiredFields = false
  ;

  C_ToSeatInfo._() : super();
  factory C_ToSeatInfo({
    $core.String? guid,
  }) {
    final _result = create();
    if (guid != null) {
      _result.guid = guid;
    }
    return _result;
  }
  factory C_ToSeatInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_ToSeatInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_ToSeatInfo clone() => C_ToSeatInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_ToSeatInfo copyWith(void Function(C_ToSeatInfo) updates) => super.copyWith((message) => updates(message as C_ToSeatInfo)) as C_ToSeatInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_ToSeatInfo create() => C_ToSeatInfo._();
  C_ToSeatInfo createEmptyInstance() => create();
  static $pb.PbList<C_ToSeatInfo> createRepeated() => $pb.PbList<C_ToSeatInfo>();
  @$core.pragma('dart2js:noInline')
  static C_ToSeatInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_ToSeatInfo>(create);
  static C_ToSeatInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get guid => $_getSZ(0);
  @$pb.TagNumber(1)
  set guid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearGuid() => clearField(1);
}

class S_SyncSeatInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_SyncSeatInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'guid')
    ..hasRequiredFields = false
  ;

  S_SyncSeatInfo._() : super();
  factory S_SyncSeatInfo({
    $fixnum.Int64? id,
    $core.String? guid,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (guid != null) {
      _result.guid = guid;
    }
    return _result;
  }
  factory S_SyncSeatInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_SyncSeatInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_SyncSeatInfo clone() => S_SyncSeatInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_SyncSeatInfo copyWith(void Function(S_SyncSeatInfo) updates) => super.copyWith((message) => updates(message as S_SyncSeatInfo)) as S_SyncSeatInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_SyncSeatInfo create() => S_SyncSeatInfo._();
  S_SyncSeatInfo createEmptyInstance() => create();
  static $pb.PbList<S_SyncSeatInfo> createRepeated() => $pb.PbList<S_SyncSeatInfo>();
  @$core.pragma('dart2js:noInline')
  static S_SyncSeatInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_SyncSeatInfo>(create);
  static S_SyncSeatInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get guid => $_getSZ(1);
  @$pb.TagNumber(2)
  set guid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGuid() => $_has(1);
  @$pb.TagNumber(2)
  void clearGuid() => clearField(2);
}

class C_GoToRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_GoToRoom', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buildingId', protoName: 'buildingId')
    ..hasRequiredFields = false
  ;

  C_GoToRoom._() : super();
  factory C_GoToRoom({
    $fixnum.Int64? buildingId,
  }) {
    final _result = create();
    if (buildingId != null) {
      _result.buildingId = buildingId;
    }
    return _result;
  }
  factory C_GoToRoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_GoToRoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_GoToRoom clone() => C_GoToRoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_GoToRoom copyWith(void Function(C_GoToRoom) updates) => super.copyWith((message) => updates(message as C_GoToRoom)) as C_GoToRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_GoToRoom create() => C_GoToRoom._();
  C_GoToRoom createEmptyInstance() => create();
  static $pb.PbList<C_GoToRoom> createRepeated() => $pb.PbList<C_GoToRoom>();
  @$core.pragma('dart2js:noInline')
  static C_GoToRoom getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_GoToRoom>(create);
  static C_GoToRoom? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get buildingId => $_getI64(0);
  @$pb.TagNumber(1)
  set buildingId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBuildingId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBuildingId() => clearField(1);
}

class S_GoToRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_GoToRoom', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'available')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'banner')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buildingId', protoName: 'buildingId')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..hasRequiredFields = false
  ;

  S_GoToRoom._() : super();
  factory S_GoToRoom({
    $core.bool? available,
    $core.String? banner,
    $fixnum.Int64? buildingId,
    $fixnum.Int64? roomId,
  }) {
    final _result = create();
    if (available != null) {
      _result.available = available;
    }
    if (banner != null) {
      _result.banner = banner;
    }
    if (buildingId != null) {
      _result.buildingId = buildingId;
    }
    if (roomId != null) {
      _result.roomId = roomId;
    }
    return _result;
  }
  factory S_GoToRoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_GoToRoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_GoToRoom clone() => S_GoToRoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_GoToRoom copyWith(void Function(S_GoToRoom) updates) => super.copyWith((message) => updates(message as S_GoToRoom)) as S_GoToRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_GoToRoom create() => S_GoToRoom._();
  S_GoToRoom createEmptyInstance() => create();
  static $pb.PbList<S_GoToRoom> createRepeated() => $pb.PbList<S_GoToRoom>();
  @$core.pragma('dart2js:noInline')
  static S_GoToRoom getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_GoToRoom>(create);
  static S_GoToRoom? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get available => $_getBF(0);
  @$pb.TagNumber(1)
  set available($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAvailable() => $_has(0);
  @$pb.TagNumber(1)
  void clearAvailable() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get banner => $_getSZ(1);
  @$pb.TagNumber(2)
  set banner($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBanner() => $_has(1);
  @$pb.TagNumber(2)
  void clearBanner() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get buildingId => $_getI64(2);
  @$pb.TagNumber(3)
  set buildingId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBuildingId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBuildingId() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get roomId => $_getI64(3);
  @$pb.TagNumber(4)
  set roomId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRoomId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomId() => clearField(4);
}

class C_GoAwayRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_GoAwayRoom', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buildingId', protoName: 'buildingId')
    ..hasRequiredFields = false
  ;

  C_GoAwayRoom._() : super();
  factory C_GoAwayRoom({
    $fixnum.Int64? buildingId,
  }) {
    final _result = create();
    if (buildingId != null) {
      _result.buildingId = buildingId;
    }
    return _result;
  }
  factory C_GoAwayRoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_GoAwayRoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_GoAwayRoom clone() => C_GoAwayRoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_GoAwayRoom copyWith(void Function(C_GoAwayRoom) updates) => super.copyWith((message) => updates(message as C_GoAwayRoom)) as C_GoAwayRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_GoAwayRoom create() => C_GoAwayRoom._();
  C_GoAwayRoom createEmptyInstance() => create();
  static $pb.PbList<C_GoAwayRoom> createRepeated() => $pb.PbList<C_GoAwayRoom>();
  @$core.pragma('dart2js:noInline')
  static C_GoAwayRoom getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_GoAwayRoom>(create);
  static C_GoAwayRoom? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get buildingId => $_getI64(0);
  @$pb.TagNumber(1)
  set buildingId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBuildingId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBuildingId() => clearField(1);
}

class S_GoAwayRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_GoAwayRoom', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buildingId', protoName: 'buildingId')
    ..hasRequiredFields = false
  ;

  S_GoAwayRoom._() : super();
  factory S_GoAwayRoom({
    $fixnum.Int64? buildingId,
  }) {
    final _result = create();
    if (buildingId != null) {
      _result.buildingId = buildingId;
    }
    return _result;
  }
  factory S_GoAwayRoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_GoAwayRoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_GoAwayRoom clone() => S_GoAwayRoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_GoAwayRoom copyWith(void Function(S_GoAwayRoom) updates) => super.copyWith((message) => updates(message as S_GoAwayRoom)) as S_GoAwayRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_GoAwayRoom create() => S_GoAwayRoom._();
  S_GoAwayRoom createEmptyInstance() => create();
  static $pb.PbList<S_GoAwayRoom> createRepeated() => $pb.PbList<S_GoAwayRoom>();
  @$core.pragma('dart2js:noInline')
  static S_GoAwayRoom getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_GoAwayRoom>(create);
  static S_GoAwayRoom? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get buildingId => $_getI64(0);
  @$pb.TagNumber(1)
  set buildingId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBuildingId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBuildingId() => clearField(1);
}

class C_InFreeMikesArea extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_InFreeMikesArea', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomid')
    ..hasRequiredFields = false
  ;

  C_InFreeMikesArea._() : super();
  factory C_InFreeMikesArea({
    $fixnum.Int64? roomid,
  }) {
    final _result = create();
    if (roomid != null) {
      _result.roomid = roomid;
    }
    return _result;
  }
  factory C_InFreeMikesArea.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_InFreeMikesArea.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_InFreeMikesArea clone() => C_InFreeMikesArea()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_InFreeMikesArea copyWith(void Function(C_InFreeMikesArea) updates) => super.copyWith((message) => updates(message as C_InFreeMikesArea)) as C_InFreeMikesArea; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_InFreeMikesArea create() => C_InFreeMikesArea._();
  C_InFreeMikesArea createEmptyInstance() => create();
  static $pb.PbList<C_InFreeMikesArea> createRepeated() => $pb.PbList<C_InFreeMikesArea>();
  @$core.pragma('dart2js:noInline')
  static C_InFreeMikesArea getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_InFreeMikesArea>(create);
  static C_InFreeMikesArea? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomid => $_getI64(0);
  @$pb.TagNumber(1)
  set roomid($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomid() => clearField(1);
}

class S_InFreeMikesArea extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_InFreeMikesArea', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomid')
    ..hasRequiredFields = false
  ;

  S_InFreeMikesArea._() : super();
  factory S_InFreeMikesArea({
    $fixnum.Int64? roomid,
  }) {
    final _result = create();
    if (roomid != null) {
      _result.roomid = roomid;
    }
    return _result;
  }
  factory S_InFreeMikesArea.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_InFreeMikesArea.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_InFreeMikesArea clone() => S_InFreeMikesArea()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_InFreeMikesArea copyWith(void Function(S_InFreeMikesArea) updates) => super.copyWith((message) => updates(message as S_InFreeMikesArea)) as S_InFreeMikesArea; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_InFreeMikesArea create() => S_InFreeMikesArea._();
  S_InFreeMikesArea createEmptyInstance() => create();
  static $pb.PbList<S_InFreeMikesArea> createRepeated() => $pb.PbList<S_InFreeMikesArea>();
  @$core.pragma('dart2js:noInline')
  static S_InFreeMikesArea getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_InFreeMikesArea>(create);
  static S_InFreeMikesArea? _defaultInstance;

  @$pb.TagNumber(2)
  $fixnum.Int64 get roomid => $_getI64(0);
  @$pb.TagNumber(2)
  set roomid($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoomid() => $_has(0);
  @$pb.TagNumber(2)
  void clearRoomid() => clearField(2);
}

class C_OutFreeMikesArea extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_OutFreeMikesArea', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomid')
    ..hasRequiredFields = false
  ;

  C_OutFreeMikesArea._() : super();
  factory C_OutFreeMikesArea({
    $fixnum.Int64? roomid,
  }) {
    final _result = create();
    if (roomid != null) {
      _result.roomid = roomid;
    }
    return _result;
  }
  factory C_OutFreeMikesArea.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_OutFreeMikesArea.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_OutFreeMikesArea clone() => C_OutFreeMikesArea()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_OutFreeMikesArea copyWith(void Function(C_OutFreeMikesArea) updates) => super.copyWith((message) => updates(message as C_OutFreeMikesArea)) as C_OutFreeMikesArea; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_OutFreeMikesArea create() => C_OutFreeMikesArea._();
  C_OutFreeMikesArea createEmptyInstance() => create();
  static $pb.PbList<C_OutFreeMikesArea> createRepeated() => $pb.PbList<C_OutFreeMikesArea>();
  @$core.pragma('dart2js:noInline')
  static C_OutFreeMikesArea getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_OutFreeMikesArea>(create);
  static C_OutFreeMikesArea? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomid => $_getI64(0);
  @$pb.TagNumber(1)
  set roomid($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomid() => clearField(1);
}

class S_OutFreeMikesArea extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_OutFreeMikesArea', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomid')
    ..hasRequiredFields = false
  ;

  S_OutFreeMikesArea._() : super();
  factory S_OutFreeMikesArea({
    $fixnum.Int64? roomid,
  }) {
    final _result = create();
    if (roomid != null) {
      _result.roomid = roomid;
    }
    return _result;
  }
  factory S_OutFreeMikesArea.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_OutFreeMikesArea.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_OutFreeMikesArea clone() => S_OutFreeMikesArea()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_OutFreeMikesArea copyWith(void Function(S_OutFreeMikesArea) updates) => super.copyWith((message) => updates(message as S_OutFreeMikesArea)) as S_OutFreeMikesArea; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_OutFreeMikesArea create() => S_OutFreeMikesArea._();
  S_OutFreeMikesArea createEmptyInstance() => create();
  static $pb.PbList<S_OutFreeMikesArea> createRepeated() => $pb.PbList<S_OutFreeMikesArea>();
  @$core.pragma('dart2js:noInline')
  static S_OutFreeMikesArea getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_OutFreeMikesArea>(create);
  static S_OutFreeMikesArea? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomid => $_getI64(0);
  @$pb.TagNumber(1)
  set roomid($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomid() => clearField(1);
}

class C_PlazaToRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_PlazaToRoom', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomid')
    ..hasRequiredFields = false
  ;

  C_PlazaToRoom._() : super();
  factory C_PlazaToRoom({
    $fixnum.Int64? roomid,
  }) {
    final _result = create();
    if (roomid != null) {
      _result.roomid = roomid;
    }
    return _result;
  }
  factory C_PlazaToRoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_PlazaToRoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_PlazaToRoom clone() => C_PlazaToRoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_PlazaToRoom copyWith(void Function(C_PlazaToRoom) updates) => super.copyWith((message) => updates(message as C_PlazaToRoom)) as C_PlazaToRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_PlazaToRoom create() => C_PlazaToRoom._();
  C_PlazaToRoom createEmptyInstance() => create();
  static $pb.PbList<C_PlazaToRoom> createRepeated() => $pb.PbList<C_PlazaToRoom>();
  @$core.pragma('dart2js:noInline')
  static C_PlazaToRoom getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_PlazaToRoom>(create);
  static C_PlazaToRoom? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomid => $_getI64(0);
  @$pb.TagNumber(1)
  set roomid($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomid() => clearField(1);
}

class S_PlazaToRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_PlazaToRoom', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomid')
    ..hasRequiredFields = false
  ;

  S_PlazaToRoom._() : super();
  factory S_PlazaToRoom({
    $fixnum.Int64? roomid,
  }) {
    final _result = create();
    if (roomid != null) {
      _result.roomid = roomid;
    }
    return _result;
  }
  factory S_PlazaToRoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_PlazaToRoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_PlazaToRoom clone() => S_PlazaToRoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_PlazaToRoom copyWith(void Function(S_PlazaToRoom) updates) => super.copyWith((message) => updates(message as S_PlazaToRoom)) as S_PlazaToRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_PlazaToRoom create() => S_PlazaToRoom._();
  S_PlazaToRoom createEmptyInstance() => create();
  static $pb.PbList<S_PlazaToRoom> createRepeated() => $pb.PbList<S_PlazaToRoom>();
  @$core.pragma('dart2js:noInline')
  static S_PlazaToRoom getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_PlazaToRoom>(create);
  static S_PlazaToRoom? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomid => $_getI64(0);
  @$pb.TagNumber(1)
  set roomid($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomid() => clearField(1);
}

class C_Robot extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_Robot', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  C_Robot._() : super();
  factory C_Robot({
    $core.int? count,
  }) {
    final _result = create();
    if (count != null) {
      _result.count = count;
    }
    return _result;
  }
  factory C_Robot.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_Robot.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_Robot clone() => C_Robot()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_Robot copyWith(void Function(C_Robot) updates) => super.copyWith((message) => updates(message as C_Robot)) as C_Robot; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_Robot create() => C_Robot._();
  C_Robot createEmptyInstance() => create();
  static $pb.PbList<C_Robot> createRepeated() => $pb.PbList<C_Robot>();
  @$core.pragma('dart2js:noInline')
  static C_Robot getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_Robot>(create);
  static C_Robot? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => clearField(1);
}

class S_Robot extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_Robot', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..pc<$0.RoleSceneInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roles', $pb.PbFieldType.PM, subBuilder: $0.RoleSceneInfo.create)
    ..hasRequiredFields = false
  ;

  S_Robot._() : super();
  factory S_Robot({
    $core.Iterable<$0.RoleSceneInfo>? roles,
  }) {
    final _result = create();
    if (roles != null) {
      _result.roles.addAll(roles);
    }
    return _result;
  }
  factory S_Robot.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_Robot.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_Robot clone() => S_Robot()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_Robot copyWith(void Function(S_Robot) updates) => super.copyWith((message) => updates(message as S_Robot)) as S_Robot; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_Robot create() => S_Robot._();
  S_Robot createEmptyInstance() => create();
  static $pb.PbList<S_Robot> createRepeated() => $pb.PbList<S_Robot>();
  @$core.pragma('dart2js:noInline')
  static S_Robot getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_Robot>(create);
  static S_Robot? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.RoleSceneInfo> get roles => $_getList(0);
}

class C_Test extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_Test', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'usrName')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneId', protoName: 'sceneId')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId', protoName: 'roomId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomPwd', protoName: 'roomPwd')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uniqueId', protoName: 'uniqueId')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'opt', $pb.PbFieldType.O3)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extra')
    ..hasRequiredFields = false
  ;

  C_Test._() : super();
  factory C_Test({
    $core.String? usrName,
    $fixnum.Int64? sceneId,
    $fixnum.Int64? roomId,
    $core.String? roomPwd,
    $core.String? uniqueId,
    $core.int? opt,
    $core.String? extra,
  }) {
    final _result = create();
    if (usrName != null) {
      _result.usrName = usrName;
    }
    if (sceneId != null) {
      _result.sceneId = sceneId;
    }
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (roomPwd != null) {
      _result.roomPwd = roomPwd;
    }
    if (uniqueId != null) {
      _result.uniqueId = uniqueId;
    }
    if (opt != null) {
      _result.opt = opt;
    }
    if (extra != null) {
      _result.extra = extra;
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
  $core.String get usrName => $_getSZ(0);
  @$pb.TagNumber(1)
  set usrName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsrName() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsrName() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get sceneId => $_getI64(1);
  @$pb.TagNumber(2)
  set sceneId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSceneId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSceneId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get roomId => $_getI64(2);
  @$pb.TagNumber(3)
  set roomId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get roomPwd => $_getSZ(3);
  @$pb.TagNumber(4)
  set roomPwd($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRoomPwd() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomPwd() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get uniqueId => $_getSZ(4);
  @$pb.TagNumber(5)
  set uniqueId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUniqueId() => $_has(4);
  @$pb.TagNumber(5)
  void clearUniqueId() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get opt => $_getIZ(5);
  @$pb.TagNumber(6)
  set opt($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOpt() => $_has(5);
  @$pb.TagNumber(6)
  void clearOpt() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get extra => $_getSZ(6);
  @$pb.TagNumber(7)
  set extra($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasExtra() => $_has(6);
  @$pb.TagNumber(7)
  void clearExtra() => clearField(7);
}

class S_Test extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_Test', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..e<$1.ErrorCode>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: $1.ErrorCode.Ok, valueOf: $1.ErrorCode.valueOf, enumValues: $1.ErrorCode.values)
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneId', protoName: 'sceneId')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId', protoName: 'roomId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomPwd', protoName: 'roomPwd')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'opt', $pb.PbFieldType.O3)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extra')
    ..hasRequiredFields = false
  ;

  S_Test._() : super();
  factory S_Test({
    $1.ErrorCode? code,
    $fixnum.Int64? sceneId,
    $fixnum.Int64? roomId,
    $core.String? roomPwd,
    $core.int? opt,
    $core.String? extra,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (sceneId != null) {
      _result.sceneId = sceneId;
    }
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (roomPwd != null) {
      _result.roomPwd = roomPwd;
    }
    if (opt != null) {
      _result.opt = opt;
    }
    if (extra != null) {
      _result.extra = extra;
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
  $1.ErrorCode get code => $_getN(0);
  @$pb.TagNumber(1)
  set code($1.ErrorCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get sceneId => $_getI64(1);
  @$pb.TagNumber(2)
  set sceneId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSceneId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSceneId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get roomId => $_getI64(2);
  @$pb.TagNumber(3)
  set roomId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get roomPwd => $_getSZ(3);
  @$pb.TagNumber(4)
  set roomPwd($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRoomPwd() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomPwd() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get opt => $_getIZ(4);
  @$pb.TagNumber(5)
  set opt($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOpt() => $_has(4);
  @$pb.TagNumber(5)
  void clearOpt() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get extra => $_getSZ(5);
  @$pb.TagNumber(6)
  set extra($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasExtra() => $_has(5);
  @$pb.TagNumber(6)
  void clearExtra() => clearField(6);
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

class C_OptTest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_OptTest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'optCode', $pb.PbFieldType.O3, protoName: 'optCode')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'broadcast', $pb.PbFieldType.O3)
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extra')
    ..hasRequiredFields = false
  ;

  C_OptTest._() : super();
  factory C_OptTest({
    $core.int? optCode,
    $core.int? broadcast,
    $fixnum.Int64? id,
    $core.String? extra,
  }) {
    final _result = create();
    if (optCode != null) {
      _result.optCode = optCode;
    }
    if (broadcast != null) {
      _result.broadcast = broadcast;
    }
    if (id != null) {
      _result.id = id;
    }
    if (extra != null) {
      _result.extra = extra;
    }
    return _result;
  }
  factory C_OptTest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_OptTest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_OptTest clone() => C_OptTest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_OptTest copyWith(void Function(C_OptTest) updates) => super.copyWith((message) => updates(message as C_OptTest)) as C_OptTest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_OptTest create() => C_OptTest._();
  C_OptTest createEmptyInstance() => create();
  static $pb.PbList<C_OptTest> createRepeated() => $pb.PbList<C_OptTest>();
  @$core.pragma('dart2js:noInline')
  static C_OptTest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_OptTest>(create);
  static C_OptTest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get optCode => $_getIZ(0);
  @$pb.TagNumber(1)
  set optCode($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOptCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get broadcast => $_getIZ(1);
  @$pb.TagNumber(2)
  set broadcast($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBroadcast() => $_has(1);
  @$pb.TagNumber(2)
  void clearBroadcast() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get id => $_getI64(2);
  @$pb.TagNumber(3)
  set id($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get extra => $_getSZ(3);
  @$pb.TagNumber(4)
  set extra($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasExtra() => $_has(3);
  @$pb.TagNumber(4)
  void clearExtra() => clearField(4);
}

class S_OptTest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_OptTest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'optCode', $pb.PbFieldType.O3, protoName: 'optCode')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extra')
    ..hasRequiredFields = false
  ;

  S_OptTest._() : super();
  factory S_OptTest({
    $core.int? optCode,
    $fixnum.Int64? id,
    $core.String? extra,
  }) {
    final _result = create();
    if (optCode != null) {
      _result.optCode = optCode;
    }
    if (id != null) {
      _result.id = id;
    }
    if (extra != null) {
      _result.extra = extra;
    }
    return _result;
  }
  factory S_OptTest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_OptTest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_OptTest clone() => S_OptTest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_OptTest copyWith(void Function(S_OptTest) updates) => super.copyWith((message) => updates(message as S_OptTest)) as S_OptTest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_OptTest create() => S_OptTest._();
  S_OptTest createEmptyInstance() => create();
  static $pb.PbList<S_OptTest> createRepeated() => $pb.PbList<S_OptTest>();
  @$core.pragma('dart2js:noInline')
  static S_OptTest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_OptTest>(create);
  static S_OptTest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get optCode => $_getIZ(0);
  @$pb.TagNumber(1)
  set optCode($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOptCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptCode() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get id => $_getI64(1);
  @$pb.TagNumber(2)
  set id($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get extra => $_getSZ(2);
  @$pb.TagNumber(3)
  set extra($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasExtra() => $_has(2);
  @$pb.TagNumber(3)
  void clearExtra() => clearField(3);
}

class C_Verify extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_Verify', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uniqueId', protoName: 'uniqueId')
    ..hasRequiredFields = false
  ;

  C_Verify._() : super();
  factory C_Verify({
    $core.String? uniqueId,
  }) {
    final _result = create();
    if (uniqueId != null) {
      _result.uniqueId = uniqueId;
    }
    return _result;
  }
  factory C_Verify.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_Verify.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_Verify clone() => C_Verify()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_Verify copyWith(void Function(C_Verify) updates) => super.copyWith((message) => updates(message as C_Verify)) as C_Verify; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_Verify create() => C_Verify._();
  C_Verify createEmptyInstance() => create();
  static $pb.PbList<C_Verify> createRepeated() => $pb.PbList<C_Verify>();
  @$core.pragma('dart2js:noInline')
  static C_Verify getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_Verify>(create);
  static C_Verify? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uniqueId => $_getSZ(0);
  @$pb.TagNumber(1)
  set uniqueId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUniqueId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUniqueId() => clearField(1);
}

class G_UFHeart extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'G_UFHeart', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  G_UFHeart._() : super();
  factory G_UFHeart() => create();
  factory G_UFHeart.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory G_UFHeart.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  G_UFHeart clone() => G_UFHeart()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  G_UFHeart copyWith(void Function(G_UFHeart) updates) => super.copyWith((message) => updates(message as G_UFHeart)) as G_UFHeart; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static G_UFHeart create() => G_UFHeart._();
  G_UFHeart createEmptyInstance() => create();
  static $pb.PbList<G_UFHeart> createRepeated() => $pb.PbList<G_UFHeart>();
  @$core.pragma('dart2js:noInline')
  static G_UFHeart getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<G_UFHeart>(create);
  static G_UFHeart? _defaultInstance;
}

class C_UFReLink extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_UFReLink', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId', protoName: 'roleId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..hasRequiredFields = false
  ;

  C_UFReLink._() : super();
  factory C_UFReLink({
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
  factory C_UFReLink.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_UFReLink.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_UFReLink clone() => C_UFReLink()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_UFReLink copyWith(void Function(C_UFReLink) updates) => super.copyWith((message) => updates(message as C_UFReLink)) as C_UFReLink; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_UFReLink create() => C_UFReLink._();
  C_UFReLink createEmptyInstance() => create();
  static $pb.PbList<C_UFReLink> createRepeated() => $pb.PbList<C_UFReLink>();
  @$core.pragma('dart2js:noInline')
  static C_UFReLink getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_UFReLink>(create);
  static C_UFReLink? _defaultInstance;

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

class F_GiftShow extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'F_GiftShow', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'giftId', $pb.PbFieldType.O3, protoName: 'giftId')
    ..hasRequiredFields = false
  ;

  F_GiftShow._() : super();
  factory F_GiftShow({
    $core.int? giftId,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    return _result;
  }
  factory F_GiftShow.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory F_GiftShow.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  F_GiftShow clone() => F_GiftShow()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  F_GiftShow copyWith(void Function(F_GiftShow) updates) => super.copyWith((message) => updates(message as F_GiftShow)) as F_GiftShow; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static F_GiftShow create() => F_GiftShow._();
  F_GiftShow createEmptyInstance() => create();
  static $pb.PbList<F_GiftShow> createRepeated() => $pb.PbList<F_GiftShow>();
  @$core.pragma('dart2js:noInline')
  static F_GiftShow getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<F_GiftShow>(create);
  static F_GiftShow? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get giftId => $_getIZ(0);
  @$pb.TagNumber(1)
  set giftId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftId() => clearField(1);
}

class C_GiveGiftByRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_GiveGiftByRoom', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'giftId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'count', $pb.PbFieldType.O3)
    ..pPS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'acceptUidList')
    ..p<$fixnum.Int64>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'acceptRoleIdList', $pb.PbFieldType.K6)
    ..hasRequiredFields = false
  ;

  C_GiveGiftByRoom._() : super();
  factory C_GiveGiftByRoom({
    $fixnum.Int64? roomId,
    $fixnum.Int64? giftId,
    $core.int? count,
    $core.Iterable<$core.String>? acceptUidList,
    $core.Iterable<$fixnum.Int64>? acceptRoleIdList,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (count != null) {
      _result.count = count;
    }
    if (acceptUidList != null) {
      _result.acceptUidList.addAll(acceptUidList);
    }
    if (acceptRoleIdList != null) {
      _result.acceptRoleIdList.addAll(acceptRoleIdList);
    }
    return _result;
  }
  factory C_GiveGiftByRoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_GiveGiftByRoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_GiveGiftByRoom clone() => C_GiveGiftByRoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_GiveGiftByRoom copyWith(void Function(C_GiveGiftByRoom) updates) => super.copyWith((message) => updates(message as C_GiveGiftByRoom)) as C_GiveGiftByRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_GiveGiftByRoom create() => C_GiveGiftByRoom._();
  C_GiveGiftByRoom createEmptyInstance() => create();
  static $pb.PbList<C_GiveGiftByRoom> createRepeated() => $pb.PbList<C_GiveGiftByRoom>();
  @$core.pragma('dart2js:noInline')
  static C_GiveGiftByRoom getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_GiveGiftByRoom>(create);
  static C_GiveGiftByRoom? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get giftId => $_getI64(1);
  @$pb.TagNumber(2)
  set giftId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGiftId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get count => $_getIZ(2);
  @$pb.TagNumber(3)
  set count($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCount() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get acceptUidList => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$fixnum.Int64> get acceptRoleIdList => $_getList(4);
}

class S_GiveGiftByRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_GiveGiftByRoom', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..e<$1.ErrorCode>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: $1.ErrorCode.Ok, valueOf: $1.ErrorCode.valueOf, enumValues: $1.ErrorCode.values)
    ..hasRequiredFields = false
  ;

  S_GiveGiftByRoom._() : super();
  factory S_GiveGiftByRoom({
    $1.ErrorCode? code,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    return _result;
  }
  factory S_GiveGiftByRoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_GiveGiftByRoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_GiveGiftByRoom clone() => S_GiveGiftByRoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_GiveGiftByRoom copyWith(void Function(S_GiveGiftByRoom) updates) => super.copyWith((message) => updates(message as S_GiveGiftByRoom)) as S_GiveGiftByRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_GiveGiftByRoom create() => S_GiveGiftByRoom._();
  S_GiveGiftByRoom createEmptyInstance() => create();
  static $pb.PbList<S_GiveGiftByRoom> createRepeated() => $pb.PbList<S_GiveGiftByRoom>();
  @$core.pragma('dart2js:noInline')
  static S_GiveGiftByRoom getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_GiveGiftByRoom>(create);
  static S_GiveGiftByRoom? _defaultInstance;

  @$pb.TagNumber(1)
  $1.ErrorCode get code => $_getN(0);
  @$pb.TagNumber(1)
  set code($1.ErrorCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);
}

class C_GiveGiftByDynamic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_GiveGiftByDynamic', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dynamicId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'giftId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  C_GiveGiftByDynamic._() : super();
  factory C_GiveGiftByDynamic({
    $fixnum.Int64? dynamicId,
    $fixnum.Int64? giftId,
    $core.int? count,
  }) {
    final _result = create();
    if (dynamicId != null) {
      _result.dynamicId = dynamicId;
    }
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (count != null) {
      _result.count = count;
    }
    return _result;
  }
  factory C_GiveGiftByDynamic.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_GiveGiftByDynamic.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_GiveGiftByDynamic clone() => C_GiveGiftByDynamic()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_GiveGiftByDynamic copyWith(void Function(C_GiveGiftByDynamic) updates) => super.copyWith((message) => updates(message as C_GiveGiftByDynamic)) as C_GiveGiftByDynamic; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_GiveGiftByDynamic create() => C_GiveGiftByDynamic._();
  C_GiveGiftByDynamic createEmptyInstance() => create();
  static $pb.PbList<C_GiveGiftByDynamic> createRepeated() => $pb.PbList<C_GiveGiftByDynamic>();
  @$core.pragma('dart2js:noInline')
  static C_GiveGiftByDynamic getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_GiveGiftByDynamic>(create);
  static C_GiveGiftByDynamic? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get dynamicId => $_getI64(0);
  @$pb.TagNumber(1)
  set dynamicId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDynamicId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDynamicId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get giftId => $_getI64(1);
  @$pb.TagNumber(2)
  set giftId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGiftId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get count => $_getIZ(2);
  @$pb.TagNumber(3)
  set count($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCount() => clearField(3);
}

class S_GiveGiftByDynamic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_GiveGiftByDynamic', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..e<$1.ErrorCode>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: $1.ErrorCode.Ok, valueOf: $1.ErrorCode.valueOf, enumValues: $1.ErrorCode.values)
    ..hasRequiredFields = false
  ;

  S_GiveGiftByDynamic._() : super();
  factory S_GiveGiftByDynamic({
    $1.ErrorCode? code,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    return _result;
  }
  factory S_GiveGiftByDynamic.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_GiveGiftByDynamic.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_GiveGiftByDynamic clone() => S_GiveGiftByDynamic()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_GiveGiftByDynamic copyWith(void Function(S_GiveGiftByDynamic) updates) => super.copyWith((message) => updates(message as S_GiveGiftByDynamic)) as S_GiveGiftByDynamic; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_GiveGiftByDynamic create() => S_GiveGiftByDynamic._();
  S_GiveGiftByDynamic createEmptyInstance() => create();
  static $pb.PbList<S_GiveGiftByDynamic> createRepeated() => $pb.PbList<S_GiveGiftByDynamic>();
  @$core.pragma('dart2js:noInline')
  static S_GiveGiftByDynamic getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_GiveGiftByDynamic>(create);
  static S_GiveGiftByDynamic? _defaultInstance;

  @$pb.TagNumber(1)
  $1.ErrorCode get code => $_getN(0);
  @$pb.TagNumber(1)
  set code($1.ErrorCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);
}

class C_GiveGiftByIm extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'C_GiveGiftByIm', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'giftId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'acceptUid')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'count', $pb.PbFieldType.O3)
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'acceptRoleId')
    ..hasRequiredFields = false
  ;

  C_GiveGiftByIm._() : super();
  factory C_GiveGiftByIm({
    $fixnum.Int64? giftId,
    $core.String? acceptUid,
    $core.int? count,
    $fixnum.Int64? acceptRoleId,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (acceptUid != null) {
      _result.acceptUid = acceptUid;
    }
    if (count != null) {
      _result.count = count;
    }
    if (acceptRoleId != null) {
      _result.acceptRoleId = acceptRoleId;
    }
    return _result;
  }
  factory C_GiveGiftByIm.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_GiveGiftByIm.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_GiveGiftByIm clone() => C_GiveGiftByIm()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_GiveGiftByIm copyWith(void Function(C_GiveGiftByIm) updates) => super.copyWith((message) => updates(message as C_GiveGiftByIm)) as C_GiveGiftByIm; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static C_GiveGiftByIm create() => C_GiveGiftByIm._();
  C_GiveGiftByIm createEmptyInstance() => create();
  static $pb.PbList<C_GiveGiftByIm> createRepeated() => $pb.PbList<C_GiveGiftByIm>();
  @$core.pragma('dart2js:noInline')
  static C_GiveGiftByIm getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_GiveGiftByIm>(create);
  static C_GiveGiftByIm? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get giftId => $_getI64(0);
  @$pb.TagNumber(1)
  set giftId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get acceptUid => $_getSZ(1);
  @$pb.TagNumber(2)
  set acceptUid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAcceptUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearAcceptUid() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get count => $_getIZ(2);
  @$pb.TagNumber(3)
  set count($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCount() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get acceptRoleId => $_getI64(3);
  @$pb.TagNumber(4)
  set acceptRoleId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAcceptRoleId() => $_has(3);
  @$pb.TagNumber(4)
  void clearAcceptRoleId() => clearField(4);
}

class S_UpdateLevel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_UpdateLevel', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'level')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..hasRequiredFields = false
  ;

  S_UpdateLevel._() : super();
  factory S_UpdateLevel({
    $fixnum.Int64? roleId,
    $fixnum.Int64? level,
    $core.String? uid,
  }) {
    final _result = create();
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (level != null) {
      _result.level = level;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory S_UpdateLevel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_UpdateLevel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_UpdateLevel clone() => S_UpdateLevel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_UpdateLevel copyWith(void Function(S_UpdateLevel) updates) => super.copyWith((message) => updates(message as S_UpdateLevel)) as S_UpdateLevel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_UpdateLevel create() => S_UpdateLevel._();
  S_UpdateLevel createEmptyInstance() => create();
  static $pb.PbList<S_UpdateLevel> createRepeated() => $pb.PbList<S_UpdateLevel>();
  @$core.pragma('dart2js:noInline')
  static S_UpdateLevel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_UpdateLevel>(create);
  static S_UpdateLevel? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roleId => $_getI64(0);
  @$pb.TagNumber(1)
  set roleId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoleId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get level => $_getI64(1);
  @$pb.TagNumber(2)
  set level($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevel() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get uid => $_getSZ(2);
  @$pb.TagNumber(3)
  set uid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);
}

class UpdateCharmLevelItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateCharmLevelItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'charmLevel')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..hasRequiredFields = false
  ;

  UpdateCharmLevelItem._() : super();
  factory UpdateCharmLevelItem({
    $fixnum.Int64? roleId,
    $fixnum.Int64? charmLevel,
    $core.String? uid,
  }) {
    final _result = create();
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (charmLevel != null) {
      _result.charmLevel = charmLevel;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory UpdateCharmLevelItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateCharmLevelItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateCharmLevelItem clone() => UpdateCharmLevelItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateCharmLevelItem copyWith(void Function(UpdateCharmLevelItem) updates) => super.copyWith((message) => updates(message as UpdateCharmLevelItem)) as UpdateCharmLevelItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateCharmLevelItem create() => UpdateCharmLevelItem._();
  UpdateCharmLevelItem createEmptyInstance() => create();
  static $pb.PbList<UpdateCharmLevelItem> createRepeated() => $pb.PbList<UpdateCharmLevelItem>();
  @$core.pragma('dart2js:noInline')
  static UpdateCharmLevelItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateCharmLevelItem>(create);
  static UpdateCharmLevelItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roleId => $_getI64(0);
  @$pb.TagNumber(1)
  set roleId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoleId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get charmLevel => $_getI64(1);
  @$pb.TagNumber(2)
  set charmLevel($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCharmLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearCharmLevel() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get uid => $_getSZ(2);
  @$pb.TagNumber(3)
  set uid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);
}

class S_UpdateCharmLevel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_UpdateCharmLevel', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..pc<UpdateCharmLevelItem>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'items', $pb.PbFieldType.PM, subBuilder: UpdateCharmLevelItem.create)
    ..hasRequiredFields = false
  ;

  S_UpdateCharmLevel._() : super();
  factory S_UpdateCharmLevel({
    $core.Iterable<UpdateCharmLevelItem>? items,
  }) {
    final _result = create();
    if (items != null) {
      _result.items.addAll(items);
    }
    return _result;
  }
  factory S_UpdateCharmLevel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_UpdateCharmLevel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_UpdateCharmLevel clone() => S_UpdateCharmLevel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_UpdateCharmLevel copyWith(void Function(S_UpdateCharmLevel) updates) => super.copyWith((message) => updates(message as S_UpdateCharmLevel)) as S_UpdateCharmLevel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_UpdateCharmLevel create() => S_UpdateCharmLevel._();
  S_UpdateCharmLevel createEmptyInstance() => create();
  static $pb.PbList<S_UpdateCharmLevel> createRepeated() => $pb.PbList<S_UpdateCharmLevel>();
  @$core.pragma('dart2js:noInline')
  static S_UpdateCharmLevel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_UpdateCharmLevel>(create);
  static S_UpdateCharmLevel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<UpdateCharmLevelItem> get items => $_getList(0);
}

class S_GiftPlay extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_GiftPlay', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'giftId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sendEffectUrl')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cover')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currency', $pb.PbFieldType.O3)
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.O3)
    ..aInt64(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt')
    ..aInt64(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aInt64(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sendId')
    ..pPS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'acceptUidList')
    ..p<$fixnum.Int64>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'acceptRoleIdList', $pb.PbFieldType.K6)
    ..a<$core.int>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'count', $pb.PbFieldType.O3)
    ..aInt64(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..aOB(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'portraitScreenShow')
    ..aOB(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'landscapeScreenShow')
    ..hasRequiredFields = false
  ;

  S_GiftPlay._() : super();
  factory S_GiftPlay({
    $fixnum.Int64? giftId,
    $core.String? sendEffectUrl,
    $core.String? cover,
    $fixnum.Int64? price,
    $core.int? currency,
    $core.int? type,
    $fixnum.Int64? createdAt,
    $fixnum.Int64? updatedAt,
    $core.String? name,
    $fixnum.Int64? roleId,
    $core.String? sendId,
    $core.Iterable<$core.String>? acceptUidList,
    $core.Iterable<$fixnum.Int64>? acceptRoleIdList,
    $core.int? count,
    $fixnum.Int64? roomId,
    $core.bool? portraitScreenShow,
    $core.bool? landscapeScreenShow,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (sendEffectUrl != null) {
      _result.sendEffectUrl = sendEffectUrl;
    }
    if (cover != null) {
      _result.cover = cover;
    }
    if (price != null) {
      _result.price = price;
    }
    if (currency != null) {
      _result.currency = currency;
    }
    if (type != null) {
      _result.type = type;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      _result.updatedAt = updatedAt;
    }
    if (name != null) {
      _result.name = name;
    }
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (sendId != null) {
      _result.sendId = sendId;
    }
    if (acceptUidList != null) {
      _result.acceptUidList.addAll(acceptUidList);
    }
    if (acceptRoleIdList != null) {
      _result.acceptRoleIdList.addAll(acceptRoleIdList);
    }
    if (count != null) {
      _result.count = count;
    }
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (portraitScreenShow != null) {
      _result.portraitScreenShow = portraitScreenShow;
    }
    if (landscapeScreenShow != null) {
      _result.landscapeScreenShow = landscapeScreenShow;
    }
    return _result;
  }
  factory S_GiftPlay.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_GiftPlay.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_GiftPlay clone() => S_GiftPlay()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_GiftPlay copyWith(void Function(S_GiftPlay) updates) => super.copyWith((message) => updates(message as S_GiftPlay)) as S_GiftPlay; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_GiftPlay create() => S_GiftPlay._();
  S_GiftPlay createEmptyInstance() => create();
  static $pb.PbList<S_GiftPlay> createRepeated() => $pb.PbList<S_GiftPlay>();
  @$core.pragma('dart2js:noInline')
  static S_GiftPlay getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_GiftPlay>(create);
  static S_GiftPlay? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get giftId => $_getI64(0);
  @$pb.TagNumber(1)
  set giftId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sendEffectUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set sendEffectUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSendEffectUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearSendEffectUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get cover => $_getSZ(2);
  @$pb.TagNumber(3)
  set cover($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCover() => $_has(2);
  @$pb.TagNumber(3)
  void clearCover() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get price => $_getI64(3);
  @$pb.TagNumber(4)
  set price($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrice() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get currency => $_getIZ(4);
  @$pb.TagNumber(5)
  set currency($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCurrency() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrency() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get type => $_getIZ(5);
  @$pb.TagNumber(6)
  set type($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(6)
  void clearType() => clearField(6);

  @$pb.TagNumber(8)
  $fixnum.Int64 get createdAt => $_getI64(6);
  @$pb.TagNumber(8)
  set createdAt($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(8)
  void clearCreatedAt() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get updatedAt => $_getI64(7);
  @$pb.TagNumber(9)
  set updatedAt($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasUpdatedAt() => $_has(7);
  @$pb.TagNumber(9)
  void clearUpdatedAt() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get name => $_getSZ(8);
  @$pb.TagNumber(10)
  set name($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(10)
  $core.bool hasName() => $_has(8);
  @$pb.TagNumber(10)
  void clearName() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get roleId => $_getI64(9);
  @$pb.TagNumber(11)
  set roleId($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(11)
  $core.bool hasRoleId() => $_has(9);
  @$pb.TagNumber(11)
  void clearRoleId() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get sendId => $_getSZ(10);
  @$pb.TagNumber(12)
  set sendId($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(12)
  $core.bool hasSendId() => $_has(10);
  @$pb.TagNumber(12)
  void clearSendId() => clearField(12);

  @$pb.TagNumber(13)
  $core.List<$core.String> get acceptUidList => $_getList(11);

  @$pb.TagNumber(14)
  $core.List<$fixnum.Int64> get acceptRoleIdList => $_getList(12);

  @$pb.TagNumber(15)
  $core.int get count => $_getIZ(13);
  @$pb.TagNumber(15)
  set count($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(15)
  $core.bool hasCount() => $_has(13);
  @$pb.TagNumber(15)
  void clearCount() => clearField(15);

  @$pb.TagNumber(16)
  $fixnum.Int64 get roomId => $_getI64(14);
  @$pb.TagNumber(16)
  set roomId($fixnum.Int64 v) { $_setInt64(14, v); }
  @$pb.TagNumber(16)
  $core.bool hasRoomId() => $_has(14);
  @$pb.TagNumber(16)
  void clearRoomId() => clearField(16);

  @$pb.TagNumber(17)
  $core.bool get portraitScreenShow => $_getBF(15);
  @$pb.TagNumber(17)
  set portraitScreenShow($core.bool v) { $_setBool(15, v); }
  @$pb.TagNumber(17)
  $core.bool hasPortraitScreenShow() => $_has(15);
  @$pb.TagNumber(17)
  void clearPortraitScreenShow() => clearField(17);

  @$pb.TagNumber(18)
  $core.bool get landscapeScreenShow => $_getBF(16);
  @$pb.TagNumber(18)
  set landscapeScreenShow($core.bool v) { $_setBool(16, v); }
  @$pb.TagNumber(18)
  $core.bool hasLandscapeScreenShow() => $_has(16);
  @$pb.TagNumber(18)
  void clearLandscapeScreenShow() => clearField(18);
}

class S_FloatingScreen extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'S_FloatingScreen', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomName')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'giftName')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sendId')
    ..pPS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'acceptUidList')
    ..p<$fixnum.Int64>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'acceptRoleIdList', $pb.PbFieldType.K6)
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cover')
    ..aInt64(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price')
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currency', $pb.PbFieldType.O3)
    ..a<$core.int>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.O3)
    ..a<$core.int>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  S_FloatingScreen._() : super();
  factory S_FloatingScreen({
    $fixnum.Int64? roomId,
    $core.String? roomName,
    $core.String? giftName,
    $fixnum.Int64? roleId,
    $core.String? sendId,
    $core.Iterable<$core.String>? acceptUidList,
    $core.Iterable<$fixnum.Int64>? acceptRoleIdList,
    $core.String? cover,
    $fixnum.Int64? price,
    $core.int? currency,
    $core.int? type,
    $core.int? count,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (roomName != null) {
      _result.roomName = roomName;
    }
    if (giftName != null) {
      _result.giftName = giftName;
    }
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (sendId != null) {
      _result.sendId = sendId;
    }
    if (acceptUidList != null) {
      _result.acceptUidList.addAll(acceptUidList);
    }
    if (acceptRoleIdList != null) {
      _result.acceptRoleIdList.addAll(acceptRoleIdList);
    }
    if (cover != null) {
      _result.cover = cover;
    }
    if (price != null) {
      _result.price = price;
    }
    if (currency != null) {
      _result.currency = currency;
    }
    if (type != null) {
      _result.type = type;
    }
    if (count != null) {
      _result.count = count;
    }
    return _result;
  }
  factory S_FloatingScreen.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_FloatingScreen.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_FloatingScreen clone() => S_FloatingScreen()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_FloatingScreen copyWith(void Function(S_FloatingScreen) updates) => super.copyWith((message) => updates(message as S_FloatingScreen)) as S_FloatingScreen; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static S_FloatingScreen create() => S_FloatingScreen._();
  S_FloatingScreen createEmptyInstance() => create();
  static $pb.PbList<S_FloatingScreen> createRepeated() => $pb.PbList<S_FloatingScreen>();
  @$core.pragma('dart2js:noInline')
  static S_FloatingScreen getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_FloatingScreen>(create);
  static S_FloatingScreen? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomName => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoomName() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get giftName => $_getSZ(2);
  @$pb.TagNumber(3)
  set giftName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGiftName() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftName() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get roleId => $_getI64(3);
  @$pb.TagNumber(4)
  set roleId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRoleId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoleId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get sendId => $_getSZ(4);
  @$pb.TagNumber(5)
  set sendId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSendId() => $_has(4);
  @$pb.TagNumber(5)
  void clearSendId() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.String> get acceptUidList => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$fixnum.Int64> get acceptRoleIdList => $_getList(6);

  @$pb.TagNumber(8)
  $core.String get cover => $_getSZ(7);
  @$pb.TagNumber(8)
  set cover($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCover() => $_has(7);
  @$pb.TagNumber(8)
  void clearCover() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get price => $_getI64(8);
  @$pb.TagNumber(9)
  set price($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPrice() => $_has(8);
  @$pb.TagNumber(9)
  void clearPrice() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get currency => $_getIZ(9);
  @$pb.TagNumber(10)
  set currency($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasCurrency() => $_has(9);
  @$pb.TagNumber(10)
  void clearCurrency() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get type => $_getIZ(10);
  @$pb.TagNumber(11)
  set type($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasType() => $_has(10);
  @$pb.TagNumber(11)
  void clearType() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get count => $_getIZ(11);
  @$pb.TagNumber(12)
  set count($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasCount() => $_has(11);
  @$pb.TagNumber(12)
  void clearCount() => clearField(12);
}

