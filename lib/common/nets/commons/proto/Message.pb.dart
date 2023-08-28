//
//  Generated code. Do not modify.
//  source: Message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'Common.pb.dart' as $0;
import 'Common.pbenum.dart' as $0;
import 'ErrorCode.pbenum.dart' as $1;
import 'Message.pbenum.dart';

export 'Message.pbenum.dart';

class S_SysTime extends $pb.GeneratedMessage {
  factory S_SysTime() => create();
  S_SysTime._() : super();
  factory S_SysTime.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_SysTime.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_SysTime', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'time')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_SysTime clone() => S_SysTime()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_SysTime copyWith(void Function(S_SysTime) updates) => super.copyWith((message) => updates(message as S_SysTime)) as S_SysTime;

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
  factory S_Err() => create();
  S_Err._() : super();
  factory S_Err.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_Err.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_Err', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..e<$1.ErrorCode>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: $1.ErrorCode.Ok, valueOf: $1.ErrorCode.valueOf, enumValues: $1.ErrorCode.values)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_Err clone() => S_Err()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_Err copyWith(void Function(S_Err) updates) => super.copyWith((message) => updates(message as S_Err)) as S_Err;

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

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class S_Tips extends $pb.GeneratedMessage {
  factory S_Tips() => create();
  S_Tips._() : super();
  factory S_Tips.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_Tips.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_Tips', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..e<S_Tips_Code>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: S_Tips_Code.MESSAGE, valueOf: S_Tips_Code.valueOf, enumValues: S_Tips_Code.values)
    ..aOS(2, _omitFieldNames ? '' : 'msg')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_Tips clone() => S_Tips()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_Tips copyWith(void Function(S_Tips) updates) => super.copyWith((message) => updates(message as S_Tips)) as S_Tips;

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
  factory S_GM() => create();
  S_GM._() : super();
  factory S_GM.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_GM.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_GM', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..e<S_GM_Code>(2, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: S_GM_Code.KICK, valueOf: S_GM_Code.valueOf, enumValues: S_GM_Code.values)
    ..aOS(3, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_GM clone() => S_GM()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_GM copyWith(void Function(S_GM) updates) => super.copyWith((message) => updates(message as S_GM)) as S_GM;

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
  factory C_Role() => create();
  C_Role._() : super();
  factory C_Role.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_Role.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_Role', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'session')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_Role clone() => C_Role()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_Role copyWith(void Function(C_Role) updates) => super.copyWith((message) => updates(message as C_Role)) as C_Role;

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
  factory S_Role() => create();
  S_Role._() : super();
  factory S_Role.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_Role.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_Role', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOM<$0.RoleInfo>(1, _omitFieldNames ? '' : 'role', subBuilder: $0.RoleInfo.create)
    ..aOS(2, _omitFieldNames ? '' : 'retryToken', protoName: 'retryToken')
    ..aInt64(3, _omitFieldNames ? '' : 'time')
    ..aInt64(4, _omitFieldNames ? '' : 'pkRoomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_Role clone() => S_Role()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_Role copyWith(void Function(S_Role) updates) => super.copyWith((message) => updates(message as S_Role)) as S_Role;

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

  @$pb.TagNumber(4)
  $fixnum.Int64 get pkRoomId => $_getI64(3);
  @$pb.TagNumber(4)
  set pkRoomId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPkRoomId() => $_has(3);
  @$pb.TagNumber(4)
  void clearPkRoomId() => clearField(4);
}

class C_UploadURL extends $pb.GeneratedMessage {
  factory C_UploadURL() => create();
  C_UploadURL._() : super();
  factory C_UploadURL.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_UploadURL.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_UploadURL', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_UploadURL clone() => C_UploadURL()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_UploadURL copyWith(void Function(C_UploadURL) updates) => super.copyWith((message) => updates(message as C_UploadURL)) as C_UploadURL;

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
  factory S_UploadURL() => create();
  S_UploadURL._() : super();
  factory S_UploadURL.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_UploadURL.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_UploadURL', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aOS(2, _omitFieldNames ? '' : 'fileName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_UploadURL clone() => S_UploadURL()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_UploadURL copyWith(void Function(S_UploadURL) updates) => super.copyWith((message) => updates(message as S_UploadURL)) as S_UploadURL;

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
  factory C_MediaId() => create();
  C_MediaId._() : super();
  factory C_MediaId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_MediaId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_MediaId', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fileName')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'extras')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_MediaId clone() => C_MediaId()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_MediaId copyWith(void Function(C_MediaId) updates) => super.copyWith((message) => updates(message as C_MediaId)) as C_MediaId;

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
  factory S_MediaId() => create();
  S_MediaId._() : super();
  factory S_MediaId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_MediaId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_MediaId', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'mediaId', protoName: 'mediaId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_MediaId clone() => S_MediaId()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_MediaId copyWith(void Function(S_MediaId) updates) => super.copyWith((message) => updates(message as S_MediaId)) as S_MediaId;

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
  factory C_CreateRole() => create();
  C_CreateRole._() : super();
  factory C_CreateRole.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_CreateRole.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_CreateRole', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roleId', protoName: 'roleId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'typeId', $pb.PbFieldType.O3, protoName: 'typeId')
    ..aInt64(4, _omitFieldNames ? '' : 'mediaId', protoName: 'mediaId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_CreateRole clone() => C_CreateRole()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_CreateRole copyWith(void Function(C_CreateRole) updates) => super.copyWith((message) => updates(message as C_CreateRole)) as C_CreateRole;

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
  factory S_CreateRole() => create();
  S_CreateRole._() : super();
  factory S_CreateRole.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_CreateRole.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_CreateRole', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roleId', protoName: 'roleId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_CreateRole clone() => S_CreateRole()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_CreateRole copyWith(void Function(S_CreateRole) updates) => super.copyWith((message) => updates(message as S_CreateRole)) as S_CreateRole;

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
  factory G_RemoveRole() => create();
  G_RemoveRole._() : super();
  factory G_RemoveRole.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory G_RemoveRole.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'G_RemoveRole', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roleId', protoName: 'roleId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'state', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  G_RemoveRole clone() => G_RemoveRole()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  G_RemoveRole copyWith(void Function(G_RemoveRole) updates) => super.copyWith((message) => updates(message as G_RemoveRole)) as G_RemoveRole;

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
  factory C_ReLink() => create();
  C_ReLink._() : super();
  factory C_ReLink.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_ReLink.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_ReLink', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roleId', protoName: 'roleId')
    ..aInt64(2, _omitFieldNames ? '' : 'time')
    ..aOS(3, _omitFieldNames ? '' : 'token')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_ReLink clone() => C_ReLink()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_ReLink copyWith(void Function(C_ReLink) updates) => super.copyWith((message) => updates(message as C_ReLink)) as C_ReLink;

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

class C_RoomEnterComplete extends $pb.GeneratedMessage {
  factory C_RoomEnterComplete() => create();
  C_RoomEnterComplete._() : super();
  factory C_RoomEnterComplete.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_RoomEnterComplete.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_RoomEnterComplete', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_RoomEnterComplete clone() => C_RoomEnterComplete()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_RoomEnterComplete copyWith(void Function(C_RoomEnterComplete) updates) => super.copyWith((message) => updates(message as C_RoomEnterComplete)) as C_RoomEnterComplete;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_RoomEnterComplete create() => C_RoomEnterComplete._();
  C_RoomEnterComplete createEmptyInstance() => create();
  static $pb.PbList<C_RoomEnterComplete> createRepeated() => $pb.PbList<C_RoomEnterComplete>();
  @$core.pragma('dart2js:noInline')
  static C_RoomEnterComplete getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_RoomEnterComplete>(create);
  static C_RoomEnterComplete? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);
}

class S_SyncRoomInfo extends $pb.GeneratedMessage {
  factory S_SyncRoomInfo() => create();
  S_SyncRoomInfo._() : super();
  factory S_SyncRoomInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_SyncRoomInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_SyncRoomInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..pc<$0.UserInfo>(1, _omitFieldNames ? '' : 'onlineList', $pb.PbFieldType.PM, subBuilder: $0.UserInfo.create)
    ..pc<$0.MikeInfo>(2, _omitFieldNames ? '' : 'mikes', $pb.PbFieldType.PM, subBuilder: $0.MikeInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_SyncRoomInfo clone() => S_SyncRoomInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_SyncRoomInfo copyWith(void Function(S_SyncRoomInfo) updates) => super.copyWith((message) => updates(message as S_SyncRoomInfo)) as S_SyncRoomInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_SyncRoomInfo create() => S_SyncRoomInfo._();
  S_SyncRoomInfo createEmptyInstance() => create();
  static $pb.PbList<S_SyncRoomInfo> createRepeated() => $pb.PbList<S_SyncRoomInfo>();
  @$core.pragma('dart2js:noInline')
  static S_SyncRoomInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_SyncRoomInfo>(create);
  static S_SyncRoomInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.UserInfo> get onlineList => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$0.MikeInfo> get mikes => $_getList(1);
}

class S_LiveStartBroadcast extends $pb.GeneratedMessage {
  factory S_LiveStartBroadcast() => create();
  S_LiveStartBroadcast._() : super();
  factory S_LiveStartBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_LiveStartBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_LiveStartBroadcast', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_LiveStartBroadcast clone() => S_LiveStartBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_LiveStartBroadcast copyWith(void Function(S_LiveStartBroadcast) updates) => super.copyWith((message) => updates(message as S_LiveStartBroadcast)) as S_LiveStartBroadcast;

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
  factory S_LiveStopBroadcast() => create();
  S_LiveStopBroadcast._() : super();
  factory S_LiveStopBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_LiveStopBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_LiveStopBroadcast', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_LiveStopBroadcast clone() => S_LiveStopBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_LiveStopBroadcast copyWith(void Function(S_LiveStopBroadcast) updates) => super.copyWith((message) => updates(message as S_LiveStopBroadcast)) as S_LiveStopBroadcast;

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
  factory S_JoinBroadcast() => create();
  S_JoinBroadcast._() : super();
  factory S_JoinBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_JoinBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_JoinBroadcast', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aInt64(2, _omitFieldNames ? '' : 'roleId')
    ..aOS(3, _omitFieldNames ? '' : 'uid')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..aInt64(5, _omitFieldNames ? '' : 'pkRoomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_JoinBroadcast clone() => S_JoinBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_JoinBroadcast copyWith(void Function(S_JoinBroadcast) updates) => super.copyWith((message) => updates(message as S_JoinBroadcast)) as S_JoinBroadcast;

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

  @$pb.TagNumber(5)
  $fixnum.Int64 get pkRoomId => $_getI64(4);
  @$pb.TagNumber(5)
  set pkRoomId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPkRoomId() => $_has(4);
  @$pb.TagNumber(5)
  void clearPkRoomId() => clearField(5);
}

class S_LeaveBroadcast extends $pb.GeneratedMessage {
  factory S_LeaveBroadcast() => create();
  S_LeaveBroadcast._() : super();
  factory S_LeaveBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_LeaveBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_LeaveBroadcast', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aInt64(2, _omitFieldNames ? '' : 'roleId')
    ..aOS(3, _omitFieldNames ? '' : 'uid')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_LeaveBroadcast clone() => S_LeaveBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_LeaveBroadcast copyWith(void Function(S_LeaveBroadcast) updates) => super.copyWith((message) => updates(message as S_LeaveBroadcast)) as S_LeaveBroadcast;

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
  factory S_UpMikeBroadcast() => create();
  S_UpMikeBroadcast._() : super();
  factory S_UpMikeBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_UpMikeBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_UpMikeBroadcast', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aInt64(2, _omitFieldNames ? '' : 'roleId')
    ..aOS(3, _omitFieldNames ? '' : 'uid')
    ..aOS(4, _omitFieldNames ? '' : 'mikeNo')
    ..aOS(5, _omitFieldNames ? '' : 'oldMikeNo')
    ..aInt64(6, _omitFieldNames ? '' : 'mikeId')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'number', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_UpMikeBroadcast clone() => S_UpMikeBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_UpMikeBroadcast copyWith(void Function(S_UpMikeBroadcast) updates) => super.copyWith((message) => updates(message as S_UpMikeBroadcast)) as S_UpMikeBroadcast;

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
  factory S_DownMikeBroadcast() => create();
  S_DownMikeBroadcast._() : super();
  factory S_DownMikeBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_DownMikeBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_DownMikeBroadcast', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aInt64(2, _omitFieldNames ? '' : 'roleId')
    ..aOS(3, _omitFieldNames ? '' : 'uid')
    ..aOS(4, _omitFieldNames ? '' : 'mikeNo')
    ..aInt64(6, _omitFieldNames ? '' : 'mikeId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_DownMikeBroadcast clone() => S_DownMikeBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_DownMikeBroadcast copyWith(void Function(S_DownMikeBroadcast) updates) => super.copyWith((message) => updates(message as S_DownMikeBroadcast)) as S_DownMikeBroadcast;

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
  factory S_InviteMikeBroadcast() => create();
  S_InviteMikeBroadcast._() : super();
  factory S_InviteMikeBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_InviteMikeBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_InviteMikeBroadcast', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aInt64(2, _omitFieldNames ? '' : 'roleId')
    ..aOS(3, _omitFieldNames ? '' : 'uid')
    ..aOS(4, _omitFieldNames ? '' : 'mikeNo')
    ..aInt64(5, _omitFieldNames ? '' : 'mikeId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_InviteMikeBroadcast clone() => S_InviteMikeBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_InviteMikeBroadcast copyWith(void Function(S_InviteMikeBroadcast) updates) => super.copyWith((message) => updates(message as S_InviteMikeBroadcast)) as S_InviteMikeBroadcast;

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
  factory S_CloseMikeBroadcast() => create();
  S_CloseMikeBroadcast._() : super();
  factory S_CloseMikeBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_CloseMikeBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_CloseMikeBroadcast', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aInt64(2, _omitFieldNames ? '' : 'roleId')
    ..aOS(3, _omitFieldNames ? '' : 'uid')
    ..aOS(4, _omitFieldNames ? '' : 'mikeNo')
    ..aInt64(5, _omitFieldNames ? '' : 'mikeId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_CloseMikeBroadcast clone() => S_CloseMikeBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_CloseMikeBroadcast copyWith(void Function(S_CloseMikeBroadcast) updates) => super.copyWith((message) => updates(message as S_CloseMikeBroadcast)) as S_CloseMikeBroadcast;

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

  @$pb.TagNumber(5)
  $fixnum.Int64 get mikeId => $_getI64(4);
  @$pb.TagNumber(5)
  set mikeId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMikeId() => $_has(4);
  @$pb.TagNumber(5)
  void clearMikeId() => clearField(5);
}

class S_OpenBroadcast extends $pb.GeneratedMessage {
  factory S_OpenBroadcast() => create();
  S_OpenBroadcast._() : super();
  factory S_OpenBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_OpenBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_OpenBroadcast', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aInt64(2, _omitFieldNames ? '' : 'roleId')
    ..aOS(3, _omitFieldNames ? '' : 'uid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_OpenBroadcast clone() => S_OpenBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_OpenBroadcast copyWith(void Function(S_OpenBroadcast) updates) => super.copyWith((message) => updates(message as S_OpenBroadcast)) as S_OpenBroadcast;

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
  factory S_ApplyUpMikeBroadcast() => create();
  S_ApplyUpMikeBroadcast._() : super();
  factory S_ApplyUpMikeBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_ApplyUpMikeBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_ApplyUpMikeBroadcast', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aInt64(2, _omitFieldNames ? '' : 'roleId')
    ..aOS(3, _omitFieldNames ? '' : 'uid')
    ..aOS(4, _omitFieldNames ? '' : 'mikeNo')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_ApplyUpMikeBroadcast clone() => S_ApplyUpMikeBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_ApplyUpMikeBroadcast copyWith(void Function(S_ApplyUpMikeBroadcast) updates) => super.copyWith((message) => updates(message as S_ApplyUpMikeBroadcast)) as S_ApplyUpMikeBroadcast;

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
  factory S_RefuseUpMikeBroadcast() => create();
  S_RefuseUpMikeBroadcast._() : super();
  factory S_RefuseUpMikeBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_RefuseUpMikeBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_RefuseUpMikeBroadcast', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aInt64(2, _omitFieldNames ? '' : 'roleId')
    ..aOS(3, _omitFieldNames ? '' : 'uid')
    ..aOS(4, _omitFieldNames ? '' : 'mikeNo')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_RefuseUpMikeBroadcast clone() => S_RefuseUpMikeBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_RefuseUpMikeBroadcast copyWith(void Function(S_RefuseUpMikeBroadcast) updates) => super.copyWith((message) => updates(message as S_RefuseUpMikeBroadcast)) as S_RefuseUpMikeBroadcast;

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
  factory S_AccMikeBroadcast() => create();
  S_AccMikeBroadcast._() : super();
  factory S_AccMikeBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_AccMikeBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_AccMikeBroadcast', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aInt64(2, _omitFieldNames ? '' : 'mikeId')
    ..aOS(3, _omitFieldNames ? '' : 'mikeNo')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'number', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_AccMikeBroadcast clone() => S_AccMikeBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_AccMikeBroadcast copyWith(void Function(S_AccMikeBroadcast) updates) => super.copyWith((message) => updates(message as S_AccMikeBroadcast)) as S_AccMikeBroadcast;

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

class S_BanMikeBroadcast extends $pb.GeneratedMessage {
  factory S_BanMikeBroadcast() => create();
  S_BanMikeBroadcast._() : super();
  factory S_BanMikeBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_BanMikeBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_BanMikeBroadcast', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aInt64(2, _omitFieldNames ? '' : 'roleId')
    ..aOS(3, _omitFieldNames ? '' : 'uid')
    ..aOS(4, _omitFieldNames ? '' : 'mikeNo')
    ..aInt64(5, _omitFieldNames ? '' : 'mikeId')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_BanMikeBroadcast clone() => S_BanMikeBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_BanMikeBroadcast copyWith(void Function(S_BanMikeBroadcast) updates) => super.copyWith((message) => updates(message as S_BanMikeBroadcast)) as S_BanMikeBroadcast;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_BanMikeBroadcast create() => S_BanMikeBroadcast._();
  S_BanMikeBroadcast createEmptyInstance() => create();
  static $pb.PbList<S_BanMikeBroadcast> createRepeated() => $pb.PbList<S_BanMikeBroadcast>();
  @$core.pragma('dart2js:noInline')
  static S_BanMikeBroadcast getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_BanMikeBroadcast>(create);
  static S_BanMikeBroadcast? _defaultInstance;

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

  @$pb.TagNumber(6)
  $core.int get status => $_getIZ(5);
  @$pb.TagNumber(6)
  set status($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => clearField(6);
}

class S_NoticeBroadcast extends $pb.GeneratedMessage {
  factory S_NoticeBroadcast() => create();
  S_NoticeBroadcast._() : super();
  factory S_NoticeBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_NoticeBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_NoticeBroadcast', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_NoticeBroadcast clone() => S_NoticeBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_NoticeBroadcast copyWith(void Function(S_NoticeBroadcast) updates) => super.copyWith((message) => updates(message as S_NoticeBroadcast)) as S_NoticeBroadcast;

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
  factory S_BlackBroadcast() => create();
  S_BlackBroadcast._() : super();
  factory S_BlackBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_BlackBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_BlackBroadcast', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aInt64(2, _omitFieldNames ? '' : 'roleId')
    ..aOS(3, _omitFieldNames ? '' : 'uid')
    ..aInt64(4, _omitFieldNames ? '' : 'operatorRoleId')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_BlackBroadcast clone() => S_BlackBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_BlackBroadcast copyWith(void Function(S_BlackBroadcast) updates) => super.copyWith((message) => updates(message as S_BlackBroadcast)) as S_BlackBroadcast;

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
  factory S_AdministratorBroadcast() => create();
  S_AdministratorBroadcast._() : super();
  factory S_AdministratorBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_AdministratorBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_AdministratorBroadcast', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aInt64(2, _omitFieldNames ? '' : 'roleId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'uid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_AdministratorBroadcast clone() => S_AdministratorBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_AdministratorBroadcast copyWith(void Function(S_AdministratorBroadcast) updates) => super.copyWith((message) => updates(message as S_AdministratorBroadcast)) as S_AdministratorBroadcast;

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
  factory S_ChatMessageBroadcast() => create();
  S_ChatMessageBroadcast._() : super();
  factory S_ChatMessageBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_ChatMessageBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_ChatMessageBroadcast', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aInt64(2, _omitFieldNames ? '' : 'roleId')
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..aOS(4, _omitFieldNames ? '' : 'uid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_ChatMessageBroadcast clone() => S_ChatMessageBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_ChatMessageBroadcast copyWith(void Function(S_ChatMessageBroadcast) updates) => super.copyWith((message) => updates(message as S_ChatMessageBroadcast)) as S_ChatMessageBroadcast;

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

class S_BanChatBroadcast extends $pb.GeneratedMessage {
  factory S_BanChatBroadcast() => create();
  S_BanChatBroadcast._() : super();
  factory S_BanChatBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_BanChatBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_BanChatBroadcast', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aInt64(2, _omitFieldNames ? '' : 'roleId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_BanChatBroadcast clone() => S_BanChatBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_BanChatBroadcast copyWith(void Function(S_BanChatBroadcast) updates) => super.copyWith((message) => updates(message as S_BanChatBroadcast)) as S_BanChatBroadcast;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_BanChatBroadcast create() => S_BanChatBroadcast._();
  S_BanChatBroadcast createEmptyInstance() => create();
  static $pb.PbList<S_BanChatBroadcast> createRepeated() => $pb.PbList<S_BanChatBroadcast>();
  @$core.pragma('dart2js:noInline')
  static S_BanChatBroadcast getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_BanChatBroadcast>(create);
  static S_BanChatBroadcast? _defaultInstance;

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
}

class C_CreateScene extends $pb.GeneratedMessage {
  factory C_CreateScene() => create();
  C_CreateScene._() : super();
  factory C_CreateScene.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_CreateScene.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_CreateScene', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'sceneId', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'image')
    ..aOS(4, _omitFieldNames ? '' : 'roomPassword')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'privateStatus', $pb.PbFieldType.O3)
    ..aOS(6, _omitFieldNames ? '' : 'noticeMessage')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'maxNum', $pb.PbFieldType.O3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'mikeStatus', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_CreateScene clone() => C_CreateScene()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_CreateScene copyWith(void Function(C_CreateScene) updates) => super.copyWith((message) => updates(message as C_CreateScene)) as C_CreateScene;

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
  factory S_CreateScene() => create();
  S_CreateScene._() : super();
  factory S_CreateScene.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_CreateScene.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_CreateScene', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'sceneId', $pb.PbFieldType.O3)
    ..aInt64(2, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_CreateScene clone() => S_CreateScene()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_CreateScene copyWith(void Function(S_CreateScene) updates) => super.copyWith((message) => updates(message as S_CreateScene)) as S_CreateScene;

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
  factory S_CloseScene() => create();
  S_CloseScene._() : super();
  factory S_CloseScene.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_CloseScene.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_CloseScene', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOM<S_Err>(1, _omitFieldNames ? '' : 'code', subBuilder: S_Err.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_CloseScene clone() => S_CloseScene()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_CloseScene copyWith(void Function(S_CloseScene) updates) => super.copyWith((message) => updates(message as S_CloseScene)) as S_CloseScene;

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
  factory C_JoinScene() => create();
  C_JoinScene._() : super();
  factory C_JoinScene.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_JoinScene.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_JoinScene', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'roomPassword')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_JoinScene clone() => C_JoinScene()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_JoinScene copyWith(void Function(C_JoinScene) updates) => super.copyWith((message) => updates(message as C_JoinScene)) as C_JoinScene;

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
  factory S_JoinScene() => create();
  S_JoinScene._() : super();
  factory S_JoinScene.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_JoinScene.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_JoinScene', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..e<$1.ErrorCode>(2, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: $1.ErrorCode.Ok, valueOf: $1.ErrorCode.valueOf, enumValues: $1.ErrorCode.values)
    ..aInt64(3, _omitFieldNames ? '' : 'pkRoomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_JoinScene clone() => S_JoinScene()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_JoinScene copyWith(void Function(S_JoinScene) updates) => super.copyWith((message) => updates(message as S_JoinScene)) as S_JoinScene;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_JoinScene create() => S_JoinScene._();
  S_JoinScene createEmptyInstance() => create();
  static $pb.PbList<S_JoinScene> createRepeated() => $pb.PbList<S_JoinScene>();
  @$core.pragma('dart2js:noInline')
  static S_JoinScene getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_JoinScene>(create);
  static S_JoinScene? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $1.ErrorCode get code => $_getN(1);
  @$pb.TagNumber(2)
  set code($1.ErrorCode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get pkRoomId => $_getI64(2);
  @$pb.TagNumber(3)
  set pkRoomId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPkRoomId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPkRoomId() => clearField(3);
}

class C_MikeList extends $pb.GeneratedMessage {
  factory C_MikeList() => create();
  C_MikeList._() : super();
  factory C_MikeList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_MikeList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_MikeList', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_MikeList clone() => C_MikeList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_MikeList copyWith(void Function(C_MikeList) updates) => super.copyWith((message) => updates(message as C_MikeList)) as C_MikeList;

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
  factory S_MikeList_Mike() => create();
  S_MikeList_Mike._() : super();
  factory S_MikeList_Mike.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_MikeList_Mike.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_MikeList.Mike', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roleId')
    ..aInt64(2, _omitFieldNames ? '' : 'mikeId')
    ..aOS(3, _omitFieldNames ? '' : 'mikeNo')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_MikeList_Mike clone() => S_MikeList_Mike()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_MikeList_Mike copyWith(void Function(S_MikeList_Mike) updates) => super.copyWith((message) => updates(message as S_MikeList_Mike)) as S_MikeList_Mike;

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
  factory S_MikeList() => create();
  S_MikeList._() : super();
  factory S_MikeList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_MikeList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_MikeList', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..pc<S_MikeList_Mike>(1, _omitFieldNames ? '' : 'mikes', $pb.PbFieldType.PM, subBuilder: S_MikeList_Mike.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_MikeList clone() => S_MikeList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_MikeList copyWith(void Function(S_MikeList) updates) => super.copyWith((message) => updates(message as S_MikeList)) as S_MikeList;

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
  factory C_UpMike() => create();
  C_UpMike._() : super();
  factory C_UpMike.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_UpMike.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_UpMike', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roleId')
    ..aOS(2, _omitFieldNames ? '' : 'mikeNo')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_UpMike clone() => C_UpMike()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_UpMike copyWith(void Function(C_UpMike) updates) => super.copyWith((message) => updates(message as C_UpMike)) as C_UpMike;

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
  factory S_UpMike() => create();
  S_UpMike._() : super();
  factory S_UpMike.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_UpMike.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_UpMike', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'mikeId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_UpMike clone() => S_UpMike()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_UpMike copyWith(void Function(S_UpMike) updates) => super.copyWith((message) => updates(message as S_UpMike)) as S_UpMike;

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
  factory C_OutMike() => create();
  C_OutMike._() : super();
  factory C_OutMike.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_OutMike.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_OutMike', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roleId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_OutMike clone() => C_OutMike()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_OutMike copyWith(void Function(C_OutMike) updates) => super.copyWith((message) => updates(message as C_OutMike)) as C_OutMike;

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
  factory C_BanMike() => create();
  C_BanMike._() : super();
  factory C_BanMike.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_BanMike.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_BanMike', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(2, _omitFieldNames ? '' : 'roleId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_BanMike clone() => C_BanMike()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_BanMike copyWith(void Function(C_BanMike) updates) => super.copyWith((message) => updates(message as C_BanMike)) as C_BanMike;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_BanMike create() => C_BanMike._();
  C_BanMike createEmptyInstance() => create();
  static $pb.PbList<C_BanMike> createRepeated() => $pb.PbList<C_BanMike>();
  @$core.pragma('dart2js:noInline')
  static C_BanMike getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_BanMike>(create);
  static C_BanMike? _defaultInstance;

  @$pb.TagNumber(2)
  $fixnum.Int64 get roleId => $_getI64(0);
  @$pb.TagNumber(2)
  set roleId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoleId() => $_has(0);
  @$pb.TagNumber(2)
  void clearRoleId() => clearField(2);

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
  factory C_AccMikeClear() => create();
  C_AccMikeClear._() : super();
  factory C_AccMikeClear.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_AccMikeClear.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_AccMikeClear', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'mikeId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_AccMikeClear clone() => C_AccMikeClear()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_AccMikeClear copyWith(void Function(C_AccMikeClear) updates) => super.copyWith((message) => updates(message as C_AccMikeClear)) as C_AccMikeClear;

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
  factory C_SetNoticeMessage() => create();
  C_SetNoticeMessage._() : super();
  factory C_SetNoticeMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_SetNoticeMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_SetNoticeMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_SetNoticeMessage clone() => C_SetNoticeMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_SetNoticeMessage copyWith(void Function(C_SetNoticeMessage) updates) => super.copyWith((message) => updates(message as C_SetNoticeMessage)) as C_SetNoticeMessage;

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
  factory C_SetAdministrator() => create();
  C_SetAdministrator._() : super();
  factory C_SetAdministrator.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_SetAdministrator.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_SetAdministrator', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uid')
    ..aInt64(2, _omitFieldNames ? '' : 'roleId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_SetAdministrator clone() => C_SetAdministrator()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_SetAdministrator copyWith(void Function(C_SetAdministrator) updates) => super.copyWith((message) => updates(message as C_SetAdministrator)) as C_SetAdministrator;

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
  factory C_SetBlack() => create();
  C_SetBlack._() : super();
  factory C_SetBlack.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_SetBlack.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_SetBlack', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uid')
    ..aInt64(2, _omitFieldNames ? '' : 'roleId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_SetBlack clone() => C_SetBlack()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_SetBlack copyWith(void Function(C_SetBlack) updates) => super.copyWith((message) => updates(message as C_SetBlack)) as C_SetBlack;

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
  factory C_ChatMessage() => create();
  C_ChatMessage._() : super();
  factory C_ChatMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_ChatMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_ChatMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_ChatMessage clone() => C_ChatMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_ChatMessage copyWith(void Function(C_ChatMessage) updates) => super.copyWith((message) => updates(message as C_ChatMessage)) as C_ChatMessage;

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

class C_BanChat extends $pb.GeneratedMessage {
  factory C_BanChat() => create();
  C_BanChat._() : super();
  factory C_BanChat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_BanChat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_BanChat', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(2, _omitFieldNames ? '' : 'roleId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_BanChat clone() => C_BanChat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_BanChat copyWith(void Function(C_BanChat) updates) => super.copyWith((message) => updates(message as C_BanChat)) as C_BanChat;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_BanChat create() => C_BanChat._();
  C_BanChat createEmptyInstance() => create();
  static $pb.PbList<C_BanChat> createRepeated() => $pb.PbList<C_BanChat>();
  @$core.pragma('dart2js:noInline')
  static C_BanChat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_BanChat>(create);
  static C_BanChat? _defaultInstance;

  @$pb.TagNumber(2)
  $fixnum.Int64 get roleId => $_getI64(0);
  @$pb.TagNumber(2)
  set roleId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoleId() => $_has(0);
  @$pb.TagNumber(2)
  void clearRoleId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get status => $_getIZ(1);
  @$pb.TagNumber(3)
  set status($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);
}

class G_SwitchScene extends $pb.GeneratedMessage {
  factory G_SwitchScene() => create();
  G_SwitchScene._() : super();
  factory G_SwitchScene.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory G_SwitchScene.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'G_SwitchScene', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'scene')
    ..aInt64(2, _omitFieldNames ? '' : 'room')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  G_SwitchScene clone() => G_SwitchScene()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  G_SwitchScene copyWith(void Function(G_SwitchScene) updates) => super.copyWith((message) => updates(message as G_SwitchScene)) as G_SwitchScene;

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
  factory S_SyncRound() => create();
  S_SyncRound._() : super();
  factory S_SyncRound.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_SyncRound.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_SyncRound', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..pc<$0.RoleSceneInfo>(1, _omitFieldNames ? '' : 'roles', $pb.PbFieldType.PM, subBuilder: $0.RoleSceneInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_SyncRound clone() => S_SyncRound()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_SyncRound copyWith(void Function(S_SyncRound) updates) => super.copyWith((message) => updates(message as S_SyncRound)) as S_SyncRound;

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
  factory S_SyncAttr() => create();
  S_SyncAttr._() : super();
  factory S_SyncAttr.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_SyncAttr.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_SyncAttr', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOM<$0.AttrVO>(2, _omitFieldNames ? '' : 'attr', subBuilder: $0.AttrVO.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_SyncAttr clone() => S_SyncAttr()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_SyncAttr copyWith(void Function(S_SyncAttr) updates) => super.copyWith((message) => updates(message as S_SyncAttr)) as S_SyncAttr;

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
  factory S_SyncAttrs() => create();
  S_SyncAttrs._() : super();
  factory S_SyncAttrs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_SyncAttrs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_SyncAttrs', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOM<$0.AttrInfo>(2, _omitFieldNames ? '' : 'attrs', subBuilder: $0.AttrInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_SyncAttrs clone() => S_SyncAttrs()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_SyncAttrs copyWith(void Function(S_SyncAttrs) updates) => super.copyWith((message) => updates(message as S_SyncAttrs)) as S_SyncAttrs;

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
  factory S_SyncMultiAttr() => create();
  S_SyncMultiAttr._() : super();
  factory S_SyncMultiAttr.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_SyncMultiAttr.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_SyncMultiAttr', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.K6)
    ..pc<$0.AttrVO>(2, _omitFieldNames ? '' : 'attr', $pb.PbFieldType.PM, subBuilder: $0.AttrVO.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_SyncMultiAttr clone() => S_SyncMultiAttr()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_SyncMultiAttr copyWith(void Function(S_SyncMultiAttr) updates) => super.copyWith((message) => updates(message as S_SyncMultiAttr)) as S_SyncMultiAttr;

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
  factory S_SyncMultiAttrs() => create();
  S_SyncMultiAttrs._() : super();
  factory S_SyncMultiAttrs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_SyncMultiAttrs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_SyncMultiAttrs', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.K6)
    ..pc<$0.AttrInfo>(2, _omitFieldNames ? '' : 'attrs', $pb.PbFieldType.PM, subBuilder: $0.AttrInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_SyncMultiAttrs clone() => S_SyncMultiAttrs()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_SyncMultiAttrs copyWith(void Function(S_SyncMultiAttrs) updates) => super.copyWith((message) => updates(message as S_SyncMultiAttrs)) as S_SyncMultiAttrs;

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
  factory C_RoleDetail() => create();
  C_RoleDetail._() : super();
  factory C_RoleDetail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_RoleDetail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_RoleDetail', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roleId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_RoleDetail clone() => C_RoleDetail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_RoleDetail copyWith(void Function(C_RoleDetail) updates) => super.copyWith((message) => updates(message as C_RoleDetail)) as C_RoleDetail;

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
  factory S_RoleDetail() => create();
  S_RoleDetail._() : super();
  factory S_RoleDetail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_RoleDetail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_RoleDetail', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOM<$0.RoleDetailInfo>(1, _omitFieldNames ? '' : 'info', subBuilder: $0.RoleDetailInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_RoleDetail clone() => S_RoleDetail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_RoleDetail copyWith(void Function(S_RoleDetail) updates) => super.copyWith((message) => updates(message as S_RoleDetail)) as S_RoleDetail;

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
  factory S_SyncRole() => create();
  S_SyncRole._() : super();
  factory S_SyncRole.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_SyncRole.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_SyncRole', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOM<$0.RoleInfo>(1, _omitFieldNames ? '' : 'info', subBuilder: $0.RoleInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_SyncRole clone() => S_SyncRole()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_SyncRole copyWith(void Function(S_SyncRole) updates) => super.copyWith((message) => updates(message as S_SyncRole)) as S_SyncRole;

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
  factory C_ToZone() => create();
  C_ToZone._() : super();
  factory C_ToZone.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_ToZone.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_ToZone', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOM<$0.XYZ>(1, _omitFieldNames ? '' : 'xyz', subBuilder: $0.XYZ.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'r', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_ToZone clone() => C_ToZone()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_ToZone copyWith(void Function(C_ToZone) updates) => super.copyWith((message) => updates(message as C_ToZone)) as C_ToZone;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_ToZone create() => C_ToZone._();
  C_ToZone createEmptyInstance() => create();
  static $pb.PbList<C_ToZone> createRepeated() => $pb.PbList<C_ToZone>();
  @$core.pragma('dart2js:noInline')
  static C_ToZone getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_ToZone>(create);
  static C_ToZone? _defaultInstance;

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
  factory S_SyncZone() => create();
  S_SyncZone._() : super();
  factory S_SyncZone.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_SyncZone.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_SyncZone', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOM<$0.XYZ>(2, _omitFieldNames ? '' : 'xyz', subBuilder: $0.XYZ.create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'r', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_SyncZone clone() => S_SyncZone()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_SyncZone copyWith(void Function(S_SyncZone) updates) => super.copyWith((message) => updates(message as S_SyncZone)) as S_SyncZone;

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
  $0.XYZ get xyz => $_getN(1);
  @$pb.TagNumber(2)
  set xyz($0.XYZ v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasXyz() => $_has(1);
  @$pb.TagNumber(2)
  void clearXyz() => clearField(2);
  @$pb.TagNumber(2)
  $0.XYZ ensureXyz() => $_ensure(1);

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
  factory C_EnforceZone() => create();
  C_EnforceZone._() : super();
  factory C_EnforceZone.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_EnforceZone.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_EnforceZone', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOM<$0.XYZ>(1, _omitFieldNames ? '' : 'xyz', subBuilder: $0.XYZ.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'r', $pb.PbFieldType.O3)
    ..e<$0.State>(3, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: $0.State.None, valueOf: $0.State.valueOf, enumValues: $0.State.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_EnforceZone clone() => C_EnforceZone()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_EnforceZone copyWith(void Function(C_EnforceZone) updates) => super.copyWith((message) => updates(message as C_EnforceZone)) as C_EnforceZone;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_EnforceZone create() => C_EnforceZone._();
  C_EnforceZone createEmptyInstance() => create();
  static $pb.PbList<C_EnforceZone> createRepeated() => $pb.PbList<C_EnforceZone>();
  @$core.pragma('dart2js:noInline')
  static C_EnforceZone getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_EnforceZone>(create);
  static C_EnforceZone? _defaultInstance;

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
  factory S_EnforceZone() => create();
  S_EnforceZone._() : super();
  factory S_EnforceZone.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_EnforceZone.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_EnforceZone', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOM<$0.XYZ>(2, _omitFieldNames ? '' : 'xyz', subBuilder: $0.XYZ.create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'r', $pb.PbFieldType.O3)
    ..e<$0.State>(4, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: $0.State.None, valueOf: $0.State.valueOf, enumValues: $0.State.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_EnforceZone clone() => S_EnforceZone()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_EnforceZone copyWith(void Function(S_EnforceZone) updates) => super.copyWith((message) => updates(message as S_EnforceZone)) as S_EnforceZone;

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
  $0.XYZ get xyz => $_getN(1);
  @$pb.TagNumber(2)
  set xyz($0.XYZ v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasXyz() => $_has(1);
  @$pb.TagNumber(2)
  void clearXyz() => clearField(2);
  @$pb.TagNumber(2)
  $0.XYZ ensureXyz() => $_ensure(1);

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
  factory C_StopMove() => create();
  C_StopMove._() : super();
  factory C_StopMove.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_StopMove.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_StopMove', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOM<$0.XYZ>(1, _omitFieldNames ? '' : 'xyz', subBuilder: $0.XYZ.create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'r', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_StopMove clone() => C_StopMove()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_StopMove copyWith(void Function(C_StopMove) updates) => super.copyWith((message) => updates(message as C_StopMove)) as C_StopMove;

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
  factory C_Animate() => create();
  C_Animate._() : super();
  factory C_Animate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_Animate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_Animate', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'val')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_Animate clone() => C_Animate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_Animate copyWith(void Function(C_Animate) updates) => super.copyWith((message) => updates(message as C_Animate)) as C_Animate;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_Animate create() => C_Animate._();
  C_Animate createEmptyInstance() => create();
  static $pb.PbList<C_Animate> createRepeated() => $pb.PbList<C_Animate>();
  @$core.pragma('dart2js:noInline')
  static C_Animate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_Animate>(create);
  static C_Animate? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get val => $_getI64(0);
  @$pb.TagNumber(1)
  set val($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVal() => $_has(0);
  @$pb.TagNumber(1)
  void clearVal() => clearField(1);
}

class C_Stage extends $pb.GeneratedMessage {
  factory C_Stage() => create();
  C_Stage._() : super();
  factory C_Stage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_Stage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_Stage', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'val')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_Stage clone() => C_Stage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_Stage copyWith(void Function(C_Stage) updates) => super.copyWith((message) => updates(message as C_Stage)) as C_Stage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_Stage create() => C_Stage._();
  C_Stage createEmptyInstance() => create();
  static $pb.PbList<C_Stage> createRepeated() => $pb.PbList<C_Stage>();
  @$core.pragma('dart2js:noInline')
  static C_Stage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_Stage>(create);
  static C_Stage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get val => $_getI64(0);
  @$pb.TagNumber(1)
  set val($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVal() => $_has(0);
  @$pb.TagNumber(1)
  void clearVal() => clearField(1);
}

class S_AddRole extends $pb.GeneratedMessage {
  factory S_AddRole() => create();
  S_AddRole._() : super();
  factory S_AddRole.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_AddRole.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_AddRole', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..pc<$0.RoleSceneInfo>(1, _omitFieldNames ? '' : 'roles', $pb.PbFieldType.PM, subBuilder: $0.RoleSceneInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_AddRole clone() => S_AddRole()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_AddRole copyWith(void Function(S_AddRole) updates) => super.copyWith((message) => updates(message as S_AddRole)) as S_AddRole;

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
  factory S_RemoveObj() => create();
  S_RemoveObj._() : super();
  factory S_RemoveObj.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_RemoveObj.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_RemoveObj', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_RemoveObj clone() => S_RemoveObj()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_RemoveObj copyWith(void Function(S_RemoveObj) updates) => super.copyWith((message) => updates(message as S_RemoveObj)) as S_RemoveObj;

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
  factory S_RemoveObjs() => create();
  S_RemoveObjs._() : super();
  factory S_RemoveObjs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_RemoveObjs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_RemoveObjs', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.K6)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_RemoveObjs clone() => S_RemoveObjs()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_RemoveObjs copyWith(void Function(S_RemoveObjs) updates) => super.copyWith((message) => updates(message as S_RemoveObjs)) as S_RemoveObjs;

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
  factory C_State() => create();
  C_State._() : super();
  factory C_State.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_State.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_State', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..e<$0.State>(1, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: $0.State.None, valueOf: $0.State.valueOf, enumValues: $0.State.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_State clone() => C_State()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_State copyWith(void Function(C_State) updates) => super.copyWith((message) => updates(message as C_State)) as C_State;

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
}

class S_State extends $pb.GeneratedMessage {
  factory S_State() => create();
  S_State._() : super();
  factory S_State.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_State.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_State', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..e<$0.State>(2, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: $0.State.None, valueOf: $0.State.valueOf, enumValues: $0.State.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_State clone() => S_State()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_State copyWith(void Function(S_State) updates) => super.copyWith((message) => updates(message as S_State)) as S_State;

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
}

class C_ToSeatInfo extends $pb.GeneratedMessage {
  factory C_ToSeatInfo() => create();
  C_ToSeatInfo._() : super();
  factory C_ToSeatInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_ToSeatInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_ToSeatInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'guid')
    ..aOM<$0.XYZ>(2, _omitFieldNames ? '' : 'xyz', subBuilder: $0.XYZ.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_ToSeatInfo clone() => C_ToSeatInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_ToSeatInfo copyWith(void Function(C_ToSeatInfo) updates) => super.copyWith((message) => updates(message as C_ToSeatInfo)) as C_ToSeatInfo;

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

  @$pb.TagNumber(2)
  $0.XYZ get xyz => $_getN(1);
  @$pb.TagNumber(2)
  set xyz($0.XYZ v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasXyz() => $_has(1);
  @$pb.TagNumber(2)
  void clearXyz() => clearField(2);
  @$pb.TagNumber(2)
  $0.XYZ ensureXyz() => $_ensure(1);
}

class S_SyncSeatInfo extends $pb.GeneratedMessage {
  factory S_SyncSeatInfo() => create();
  S_SyncSeatInfo._() : super();
  factory S_SyncSeatInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_SyncSeatInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_SyncSeatInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'guid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_SyncSeatInfo clone() => S_SyncSeatInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_SyncSeatInfo copyWith(void Function(S_SyncSeatInfo) updates) => super.copyWith((message) => updates(message as S_SyncSeatInfo)) as S_SyncSeatInfo;

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
  factory C_GoToRoom() => create();
  C_GoToRoom._() : super();
  factory C_GoToRoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_GoToRoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_GoToRoom', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'buildingId', protoName: 'buildingId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_GoToRoom clone() => C_GoToRoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_GoToRoom copyWith(void Function(C_GoToRoom) updates) => super.copyWith((message) => updates(message as C_GoToRoom)) as C_GoToRoom;

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
  factory S_GoToRoom() => create();
  S_GoToRoom._() : super();
  factory S_GoToRoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_GoToRoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_GoToRoom', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'available')
    ..aOS(2, _omitFieldNames ? '' : 'banner')
    ..aInt64(3, _omitFieldNames ? '' : 'buildingId', protoName: 'buildingId')
    ..aInt64(4, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_GoToRoom clone() => S_GoToRoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_GoToRoom copyWith(void Function(S_GoToRoom) updates) => super.copyWith((message) => updates(message as S_GoToRoom)) as S_GoToRoom;

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
  factory C_GoAwayRoom() => create();
  C_GoAwayRoom._() : super();
  factory C_GoAwayRoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_GoAwayRoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_GoAwayRoom', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'buildingId', protoName: 'buildingId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_GoAwayRoom clone() => C_GoAwayRoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_GoAwayRoom copyWith(void Function(C_GoAwayRoom) updates) => super.copyWith((message) => updates(message as C_GoAwayRoom)) as C_GoAwayRoom;

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
  factory S_GoAwayRoom() => create();
  S_GoAwayRoom._() : super();
  factory S_GoAwayRoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_GoAwayRoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_GoAwayRoom', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'buildingId', protoName: 'buildingId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_GoAwayRoom clone() => S_GoAwayRoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_GoAwayRoom copyWith(void Function(S_GoAwayRoom) updates) => super.copyWith((message) => updates(message as S_GoAwayRoom)) as S_GoAwayRoom;

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
  factory C_InFreeMikesArea() => create();
  C_InFreeMikesArea._() : super();
  factory C_InFreeMikesArea.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_InFreeMikesArea.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_InFreeMikesArea', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_InFreeMikesArea clone() => C_InFreeMikesArea()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_InFreeMikesArea copyWith(void Function(C_InFreeMikesArea) updates) => super.copyWith((message) => updates(message as C_InFreeMikesArea)) as C_InFreeMikesArea;

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
  factory S_InFreeMikesArea() => create();
  S_InFreeMikesArea._() : super();
  factory S_InFreeMikesArea.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_InFreeMikesArea.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_InFreeMikesArea', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(2, _omitFieldNames ? '' : 'roomid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_InFreeMikesArea clone() => S_InFreeMikesArea()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_InFreeMikesArea copyWith(void Function(S_InFreeMikesArea) updates) => super.copyWith((message) => updates(message as S_InFreeMikesArea)) as S_InFreeMikesArea;

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
  factory C_OutFreeMikesArea() => create();
  C_OutFreeMikesArea._() : super();
  factory C_OutFreeMikesArea.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_OutFreeMikesArea.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_OutFreeMikesArea', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_OutFreeMikesArea clone() => C_OutFreeMikesArea()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_OutFreeMikesArea copyWith(void Function(C_OutFreeMikesArea) updates) => super.copyWith((message) => updates(message as C_OutFreeMikesArea)) as C_OutFreeMikesArea;

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
  factory S_OutFreeMikesArea() => create();
  S_OutFreeMikesArea._() : super();
  factory S_OutFreeMikesArea.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_OutFreeMikesArea.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_OutFreeMikesArea', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_OutFreeMikesArea clone() => S_OutFreeMikesArea()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_OutFreeMikesArea copyWith(void Function(S_OutFreeMikesArea) updates) => super.copyWith((message) => updates(message as S_OutFreeMikesArea)) as S_OutFreeMikesArea;

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
  factory C_PlazaToRoom() => create();
  C_PlazaToRoom._() : super();
  factory C_PlazaToRoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_PlazaToRoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_PlazaToRoom', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_PlazaToRoom clone() => C_PlazaToRoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_PlazaToRoom copyWith(void Function(C_PlazaToRoom) updates) => super.copyWith((message) => updates(message as C_PlazaToRoom)) as C_PlazaToRoom;

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
  factory S_PlazaToRoom() => create();
  S_PlazaToRoom._() : super();
  factory S_PlazaToRoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_PlazaToRoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_PlazaToRoom', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_PlazaToRoom clone() => S_PlazaToRoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_PlazaToRoom copyWith(void Function(S_PlazaToRoom) updates) => super.copyWith((message) => updates(message as S_PlazaToRoom)) as S_PlazaToRoom;

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
  factory C_Robot() => create();
  C_Robot._() : super();
  factory C_Robot.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_Robot.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_Robot', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_Robot clone() => C_Robot()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_Robot copyWith(void Function(C_Robot) updates) => super.copyWith((message) => updates(message as C_Robot)) as C_Robot;

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
  factory S_Robot() => create();
  S_Robot._() : super();
  factory S_Robot.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_Robot.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_Robot', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..pc<$0.RoleSceneInfo>(1, _omitFieldNames ? '' : 'roles', $pb.PbFieldType.PM, subBuilder: $0.RoleSceneInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_Robot clone() => S_Robot()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_Robot copyWith(void Function(S_Robot) updates) => super.copyWith((message) => updates(message as S_Robot)) as S_Robot;

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
  factory C_Test() => create();
  C_Test._() : super();
  factory C_Test.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_Test.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_Test', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'usrName')
    ..aInt64(2, _omitFieldNames ? '' : 'sceneId', protoName: 'sceneId')
    ..aInt64(3, _omitFieldNames ? '' : 'roomId', protoName: 'roomId')
    ..aOS(4, _omitFieldNames ? '' : 'roomPwd', protoName: 'roomPwd')
    ..aOS(5, _omitFieldNames ? '' : 'uniqueId', protoName: 'uniqueId')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'opt', $pb.PbFieldType.O3)
    ..aOS(7, _omitFieldNames ? '' : 'extra')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_Test clone() => C_Test()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_Test copyWith(void Function(C_Test) updates) => super.copyWith((message) => updates(message as C_Test)) as C_Test;

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
  factory S_Test() => create();
  S_Test._() : super();
  factory S_Test.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_Test.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_Test', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..e<$1.ErrorCode>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: $1.ErrorCode.Ok, valueOf: $1.ErrorCode.valueOf, enumValues: $1.ErrorCode.values)
    ..aInt64(2, _omitFieldNames ? '' : 'sceneId', protoName: 'sceneId')
    ..aInt64(3, _omitFieldNames ? '' : 'roomId', protoName: 'roomId')
    ..aOS(4, _omitFieldNames ? '' : 'roomPwd', protoName: 'roomPwd')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'opt', $pb.PbFieldType.O3)
    ..aOS(6, _omitFieldNames ? '' : 'extra')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_Test clone() => S_Test()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_Test copyWith(void Function(S_Test) updates) => super.copyWith((message) => updates(message as S_Test)) as S_Test;

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
  factory S_Debug() => create();
  S_Debug._() : super();
  factory S_Debug.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_Debug.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_Debug', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_Debug clone() => S_Debug()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_Debug copyWith(void Function(S_Debug) updates) => super.copyWith((message) => updates(message as S_Debug)) as S_Debug;

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
  factory C_OptTest() => create();
  C_OptTest._() : super();
  factory C_OptTest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_OptTest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_OptTest', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'optCode', $pb.PbFieldType.O3, protoName: 'optCode')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'broadcast', $pb.PbFieldType.O3)
    ..aInt64(3, _omitFieldNames ? '' : 'id')
    ..aOS(4, _omitFieldNames ? '' : 'extra')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_OptTest clone() => C_OptTest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_OptTest copyWith(void Function(C_OptTest) updates) => super.copyWith((message) => updates(message as C_OptTest)) as C_OptTest;

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
  factory S_OptTest() => create();
  S_OptTest._() : super();
  factory S_OptTest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_OptTest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_OptTest', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'optCode', $pb.PbFieldType.O3, protoName: 'optCode')
    ..aInt64(2, _omitFieldNames ? '' : 'id')
    ..aOS(3, _omitFieldNames ? '' : 'extra')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_OptTest clone() => S_OptTest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_OptTest copyWith(void Function(S_OptTest) updates) => super.copyWith((message) => updates(message as S_OptTest)) as S_OptTest;

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
  factory C_Verify() => create();
  C_Verify._() : super();
  factory C_Verify.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_Verify.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_Verify', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uniqueId', protoName: 'uniqueId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_Verify clone() => C_Verify()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_Verify copyWith(void Function(C_Verify) updates) => super.copyWith((message) => updates(message as C_Verify)) as C_Verify;

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
  factory G_UFHeart() => create();
  G_UFHeart._() : super();
  factory G_UFHeart.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory G_UFHeart.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'G_UFHeart', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  G_UFHeart clone() => G_UFHeart()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  G_UFHeart copyWith(void Function(G_UFHeart) updates) => super.copyWith((message) => updates(message as G_UFHeart)) as G_UFHeart;

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
  factory C_UFReLink() => create();
  C_UFReLink._() : super();
  factory C_UFReLink.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_UFReLink.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_UFReLink', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roleId', protoName: 'roleId')
    ..aInt64(2, _omitFieldNames ? '' : 'time')
    ..aOS(3, _omitFieldNames ? '' : 'token')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_UFReLink clone() => C_UFReLink()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_UFReLink copyWith(void Function(C_UFReLink) updates) => super.copyWith((message) => updates(message as C_UFReLink)) as C_UFReLink;

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
  factory F_GiftShow() => create();
  F_GiftShow._() : super();
  factory F_GiftShow.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory F_GiftShow.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'F_GiftShow', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'giftId', $pb.PbFieldType.O3, protoName: 'giftId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  F_GiftShow clone() => F_GiftShow()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  F_GiftShow copyWith(void Function(F_GiftShow) updates) => super.copyWith((message) => updates(message as F_GiftShow)) as F_GiftShow;

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
  factory C_GiveGiftByRoom() => create();
  C_GiveGiftByRoom._() : super();
  factory C_GiveGiftByRoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_GiveGiftByRoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_GiveGiftByRoom', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aInt64(2, _omitFieldNames ? '' : 'giftId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..pPS(4, _omitFieldNames ? '' : 'acceptUidList')
    ..p<$fixnum.Int64>(5, _omitFieldNames ? '' : 'acceptRoleIdList', $pb.PbFieldType.K6)
    ..aOB(6, _omitFieldNames ? '' : 'isBackpack')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_GiveGiftByRoom clone() => C_GiveGiftByRoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_GiveGiftByRoom copyWith(void Function(C_GiveGiftByRoom) updates) => super.copyWith((message) => updates(message as C_GiveGiftByRoom)) as C_GiveGiftByRoom;

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

  @$pb.TagNumber(6)
  $core.bool get isBackpack => $_getBF(5);
  @$pb.TagNumber(6)
  set isBackpack($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsBackpack() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsBackpack() => clearField(6);
}

class S_GiveGiftByRoom extends $pb.GeneratedMessage {
  factory S_GiveGiftByRoom() => create();
  S_GiveGiftByRoom._() : super();
  factory S_GiveGiftByRoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_GiveGiftByRoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_GiveGiftByRoom', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..e<$1.ErrorCode>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: $1.ErrorCode.Ok, valueOf: $1.ErrorCode.valueOf, enumValues: $1.ErrorCode.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_GiveGiftByRoom clone() => S_GiveGiftByRoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_GiveGiftByRoom copyWith(void Function(S_GiveGiftByRoom) updates) => super.copyWith((message) => updates(message as S_GiveGiftByRoom)) as S_GiveGiftByRoom;

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
  factory C_GiveGiftByDynamic() => create();
  C_GiveGiftByDynamic._() : super();
  factory C_GiveGiftByDynamic.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_GiveGiftByDynamic.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_GiveGiftByDynamic', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'dynamicId')
    ..aInt64(2, _omitFieldNames ? '' : 'giftId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..aOB(6, _omitFieldNames ? '' : 'isBackpack')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_GiveGiftByDynamic clone() => C_GiveGiftByDynamic()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_GiveGiftByDynamic copyWith(void Function(C_GiveGiftByDynamic) updates) => super.copyWith((message) => updates(message as C_GiveGiftByDynamic)) as C_GiveGiftByDynamic;

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

  @$pb.TagNumber(6)
  $core.bool get isBackpack => $_getBF(3);
  @$pb.TagNumber(6)
  set isBackpack($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsBackpack() => $_has(3);
  @$pb.TagNumber(6)
  void clearIsBackpack() => clearField(6);
}

class S_GiveGiftByDynamic extends $pb.GeneratedMessage {
  factory S_GiveGiftByDynamic() => create();
  S_GiveGiftByDynamic._() : super();
  factory S_GiveGiftByDynamic.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_GiveGiftByDynamic.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_GiveGiftByDynamic', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..e<$1.ErrorCode>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: $1.ErrorCode.Ok, valueOf: $1.ErrorCode.valueOf, enumValues: $1.ErrorCode.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_GiveGiftByDynamic clone() => S_GiveGiftByDynamic()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_GiveGiftByDynamic copyWith(void Function(S_GiveGiftByDynamic) updates) => super.copyWith((message) => updates(message as S_GiveGiftByDynamic)) as S_GiveGiftByDynamic;

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

class S_GiveGiftByIm extends $pb.GeneratedMessage {
  factory S_GiveGiftByIm() => create();
  S_GiveGiftByIm._() : super();
  factory S_GiveGiftByIm.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_GiveGiftByIm.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_GiveGiftByIm', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..e<$1.ErrorCode>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: $1.ErrorCode.Ok, valueOf: $1.ErrorCode.valueOf, enumValues: $1.ErrorCode.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_GiveGiftByIm clone() => S_GiveGiftByIm()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_GiveGiftByIm copyWith(void Function(S_GiveGiftByIm) updates) => super.copyWith((message) => updates(message as S_GiveGiftByIm)) as S_GiveGiftByIm;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_GiveGiftByIm create() => S_GiveGiftByIm._();
  S_GiveGiftByIm createEmptyInstance() => create();
  static $pb.PbList<S_GiveGiftByIm> createRepeated() => $pb.PbList<S_GiveGiftByIm>();
  @$core.pragma('dart2js:noInline')
  static S_GiveGiftByIm getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_GiveGiftByIm>(create);
  static S_GiveGiftByIm? _defaultInstance;

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
  factory C_GiveGiftByIm() => create();
  C_GiveGiftByIm._() : super();
  factory C_GiveGiftByIm.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_GiveGiftByIm.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_GiveGiftByIm', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'giftId')
    ..aOS(2, _omitFieldNames ? '' : 'acceptUid')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..aInt64(4, _omitFieldNames ? '' : 'acceptRoleId')
    ..aOB(6, _omitFieldNames ? '' : 'isBackpack')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_GiveGiftByIm clone() => C_GiveGiftByIm()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_GiveGiftByIm copyWith(void Function(C_GiveGiftByIm) updates) => super.copyWith((message) => updates(message as C_GiveGiftByIm)) as C_GiveGiftByIm;

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

  @$pb.TagNumber(6)
  $core.bool get isBackpack => $_getBF(4);
  @$pb.TagNumber(6)
  set isBackpack($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsBackpack() => $_has(4);
  @$pb.TagNumber(6)
  void clearIsBackpack() => clearField(6);
}

class S_UpdateLevel extends $pb.GeneratedMessage {
  factory S_UpdateLevel() => create();
  S_UpdateLevel._() : super();
  factory S_UpdateLevel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_UpdateLevel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_UpdateLevel', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roleId')
    ..aInt64(2, _omitFieldNames ? '' : 'level')
    ..aOS(3, _omitFieldNames ? '' : 'uid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_UpdateLevel clone() => S_UpdateLevel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_UpdateLevel copyWith(void Function(S_UpdateLevel) updates) => super.copyWith((message) => updates(message as S_UpdateLevel)) as S_UpdateLevel;

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
  factory UpdateCharmLevelItem() => create();
  UpdateCharmLevelItem._() : super();
  factory UpdateCharmLevelItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateCharmLevelItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateCharmLevelItem', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roleId')
    ..aInt64(2, _omitFieldNames ? '' : 'charmLevel')
    ..aOS(3, _omitFieldNames ? '' : 'uid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateCharmLevelItem clone() => UpdateCharmLevelItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateCharmLevelItem copyWith(void Function(UpdateCharmLevelItem) updates) => super.copyWith((message) => updates(message as UpdateCharmLevelItem)) as UpdateCharmLevelItem;

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
  factory S_UpdateCharmLevel() => create();
  S_UpdateCharmLevel._() : super();
  factory S_UpdateCharmLevel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_UpdateCharmLevel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_UpdateCharmLevel', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..pc<UpdateCharmLevelItem>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: UpdateCharmLevelItem.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_UpdateCharmLevel clone() => S_UpdateCharmLevel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_UpdateCharmLevel copyWith(void Function(S_UpdateCharmLevel) updates) => super.copyWith((message) => updates(message as S_UpdateCharmLevel)) as S_UpdateCharmLevel;

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
  factory S_GiftPlay() => create();
  S_GiftPlay._() : super();
  factory S_GiftPlay.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_GiftPlay.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_GiftPlay', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'giftId')
    ..aOS(2, _omitFieldNames ? '' : 'sendEffectUrl')
    ..aOS(3, _omitFieldNames ? '' : 'cover')
    ..aInt64(4, _omitFieldNames ? '' : 'price')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'currency', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'type', $pb.PbFieldType.O3)
    ..aInt64(8, _omitFieldNames ? '' : 'createdAt')
    ..aInt64(9, _omitFieldNames ? '' : 'updatedAt')
    ..aOS(10, _omitFieldNames ? '' : 'name')
    ..aInt64(11, _omitFieldNames ? '' : 'roleId')
    ..aOS(12, _omitFieldNames ? '' : 'sendId')
    ..pPS(13, _omitFieldNames ? '' : 'acceptUidList')
    ..p<$fixnum.Int64>(14, _omitFieldNames ? '' : 'acceptRoleIdList', $pb.PbFieldType.K6)
    ..a<$core.int>(15, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..aInt64(16, _omitFieldNames ? '' : 'roomId')
    ..aOB(17, _omitFieldNames ? '' : 'portraitScreenShow')
    ..aOB(18, _omitFieldNames ? '' : 'landscapeScreenShow')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_GiftPlay clone() => S_GiftPlay()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_GiftPlay copyWith(void Function(S_GiftPlay) updates) => super.copyWith((message) => updates(message as S_GiftPlay)) as S_GiftPlay;

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
  factory S_FloatingScreen() => create();
  S_FloatingScreen._() : super();
  factory S_FloatingScreen.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_FloatingScreen.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_FloatingScreen', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'roomName')
    ..aOS(3, _omitFieldNames ? '' : 'giftName')
    ..aInt64(4, _omitFieldNames ? '' : 'roleId')
    ..aOS(5, _omitFieldNames ? '' : 'sendId')
    ..pPS(6, _omitFieldNames ? '' : 'acceptUidList')
    ..p<$fixnum.Int64>(7, _omitFieldNames ? '' : 'acceptRoleIdList', $pb.PbFieldType.K6)
    ..aOS(8, _omitFieldNames ? '' : 'cover')
    ..aInt64(9, _omitFieldNames ? '' : 'price')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'currency', $pb.PbFieldType.O3)
    ..a<$core.int>(11, _omitFieldNames ? '' : 'type', $pb.PbFieldType.O3)
    ..a<$core.int>(12, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_FloatingScreen clone() => S_FloatingScreen()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_FloatingScreen copyWith(void Function(S_FloatingScreen) updates) => super.copyWith((message) => updates(message as S_FloatingScreen)) as S_FloatingScreen;

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

class S_PushPreload extends $pb.GeneratedMessage {
  factory S_PushPreload() => create();
  S_PushPreload._() : super();
  factory S_PushPreload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_PushPreload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_PushPreload', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'clothIds', $pb.PbFieldType.K3, protoName: 'clothIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_PushPreload clone() => S_PushPreload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_PushPreload copyWith(void Function(S_PushPreload) updates) => super.copyWith((message) => updates(message as S_PushPreload)) as S_PushPreload;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_PushPreload create() => S_PushPreload._();
  S_PushPreload createEmptyInstance() => create();
  static $pb.PbList<S_PushPreload> createRepeated() => $pb.PbList<S_PushPreload>();
  @$core.pragma('dart2js:noInline')
  static S_PushPreload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_PushPreload>(create);
  static S_PushPreload? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get clothIds => $_getList(0);
}

class C_UpdateRole extends $pb.GeneratedMessage {
  factory C_UpdateRole() => create();
  C_UpdateRole._() : super();
  factory C_UpdateRole.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_UpdateRole.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_UpdateRole', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'username')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..aInt64(3, _omitFieldNames ? '' : 'dataBirth')
    ..aInt64(4, _omitFieldNames ? '' : 'mediaId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_UpdateRole clone() => C_UpdateRole()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_UpdateRole copyWith(void Function(C_UpdateRole) updates) => super.copyWith((message) => updates(message as C_UpdateRole)) as C_UpdateRole;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_UpdateRole create() => C_UpdateRole._();
  C_UpdateRole createEmptyInstance() => create();
  static $pb.PbList<C_UpdateRole> createRepeated() => $pb.PbList<C_UpdateRole>();
  @$core.pragma('dart2js:noInline')
  static C_UpdateRole getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_UpdateRole>(create);
  static C_UpdateRole? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get dataBirth => $_getI64(2);
  @$pb.TagNumber(3)
  set dataBirth($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDataBirth() => $_has(2);
  @$pb.TagNumber(3)
  void clearDataBirth() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get mediaId => $_getI64(3);
  @$pb.TagNumber(4)
  set mediaId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMediaId() => $_has(3);
  @$pb.TagNumber(4)
  void clearMediaId() => clearField(4);
}

class S_UpdateRole extends $pb.GeneratedMessage {
  factory S_UpdateRole() => create();
  S_UpdateRole._() : super();
  factory S_UpdateRole.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_UpdateRole.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_UpdateRole', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..e<$1.ErrorCode>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: $1.ErrorCode.Ok, valueOf: $1.ErrorCode.valueOf, enumValues: $1.ErrorCode.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_UpdateRole clone() => S_UpdateRole()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_UpdateRole copyWith(void Function(S_UpdateRole) updates) => super.copyWith((message) => updates(message as S_UpdateRole)) as S_UpdateRole;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_UpdateRole create() => S_UpdateRole._();
  S_UpdateRole createEmptyInstance() => create();
  static $pb.PbList<S_UpdateRole> createRepeated() => $pb.PbList<S_UpdateRole>();
  @$core.pragma('dart2js:noInline')
  static S_UpdateRole getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_UpdateRole>(create);
  static S_UpdateRole? _defaultInstance;

  @$pb.TagNumber(1)
  $1.ErrorCode get code => $_getN(0);
  @$pb.TagNumber(1)
  set code($1.ErrorCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);
}

class S_UpdateRoleBroadcast extends $pb.GeneratedMessage {
  factory S_UpdateRoleBroadcast() => create();
  S_UpdateRoleBroadcast._() : super();
  factory S_UpdateRoleBroadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_UpdateRoleBroadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_UpdateRoleBroadcast', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roleId')
    ..aOS(2, _omitFieldNames ? '' : 'username')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aInt64(4, _omitFieldNames ? '' : 'dataBirth')
    ..aOS(8, _omitFieldNames ? '' : 'avatarUrl')
    ..aOS(9, _omitFieldNames ? '' : 'avatarExtra')
    ..aOS(10, _omitFieldNames ? '' : 'uid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_UpdateRoleBroadcast clone() => S_UpdateRoleBroadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_UpdateRoleBroadcast copyWith(void Function(S_UpdateRoleBroadcast) updates) => super.copyWith((message) => updates(message as S_UpdateRoleBroadcast)) as S_UpdateRoleBroadcast;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_UpdateRoleBroadcast create() => S_UpdateRoleBroadcast._();
  S_UpdateRoleBroadcast createEmptyInstance() => create();
  static $pb.PbList<S_UpdateRoleBroadcast> createRepeated() => $pb.PbList<S_UpdateRoleBroadcast>();
  @$core.pragma('dart2js:noInline')
  static S_UpdateRoleBroadcast getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_UpdateRoleBroadcast>(create);
  static S_UpdateRoleBroadcast? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roleId => $_getI64(0);
  @$pb.TagNumber(1)
  set roleId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoleId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get username => $_getSZ(1);
  @$pb.TagNumber(2)
  set username($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsername() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get dataBirth => $_getI64(3);
  @$pb.TagNumber(4)
  set dataBirth($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDataBirth() => $_has(3);
  @$pb.TagNumber(4)
  void clearDataBirth() => clearField(4);

  @$pb.TagNumber(8)
  $core.String get avatarUrl => $_getSZ(4);
  @$pb.TagNumber(8)
  set avatarUrl($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(8)
  $core.bool hasAvatarUrl() => $_has(4);
  @$pb.TagNumber(8)
  void clearAvatarUrl() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get avatarExtra => $_getSZ(5);
  @$pb.TagNumber(9)
  set avatarExtra($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(9)
  $core.bool hasAvatarExtra() => $_has(5);
  @$pb.TagNumber(9)
  void clearAvatarExtra() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get uid => $_getSZ(6);
  @$pb.TagNumber(10)
  set uid($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(10)
  $core.bool hasUid() => $_has(6);
  @$pb.TagNumber(10)
  void clearUid() => clearField(10);
}

class C_SaveUserCurrentDressUp extends $pb.GeneratedMessage {
  factory C_SaveUserCurrentDressUp() => create();
  C_SaveUserCurrentDressUp._() : super();
  factory C_SaveUserCurrentDressUp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_SaveUserCurrentDressUp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_SaveUserCurrentDressUp', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : 'productIdList', $pb.PbFieldType.K6)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_SaveUserCurrentDressUp clone() => C_SaveUserCurrentDressUp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_SaveUserCurrentDressUp copyWith(void Function(C_SaveUserCurrentDressUp) updates) => super.copyWith((message) => updates(message as C_SaveUserCurrentDressUp)) as C_SaveUserCurrentDressUp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_SaveUserCurrentDressUp create() => C_SaveUserCurrentDressUp._();
  C_SaveUserCurrentDressUp createEmptyInstance() => create();
  static $pb.PbList<C_SaveUserCurrentDressUp> createRepeated() => $pb.PbList<C_SaveUserCurrentDressUp>();
  @$core.pragma('dart2js:noInline')
  static C_SaveUserCurrentDressUp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_SaveUserCurrentDressUp>(create);
  static C_SaveUserCurrentDressUp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$fixnum.Int64> get productIdList => $_getList(0);
}

class C_GoBack extends $pb.GeneratedMessage {
  factory C_GoBack() => create();
  C_GoBack._() : super();
  factory C_GoBack.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_GoBack.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_GoBack', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_GoBack clone() => C_GoBack()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_GoBack copyWith(void Function(C_GoBack) updates) => super.copyWith((message) => updates(message as C_GoBack)) as C_GoBack;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_GoBack create() => C_GoBack._();
  C_GoBack createEmptyInstance() => create();
  static $pb.PbList<C_GoBack> createRepeated() => $pb.PbList<C_GoBack>();
  @$core.pragma('dart2js:noInline')
  static C_GoBack getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_GoBack>(create);
  static C_GoBack? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);
}

class LabelItem extends $pb.GeneratedMessage {
  factory LabelItem() => create();
  LabelItem._() : super();
  factory LabelItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LabelItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LabelItem', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'icon')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LabelItem clone() => LabelItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LabelItem copyWith(void Function(LabelItem) updates) => super.copyWith((message) => updates(message as LabelItem)) as LabelItem;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LabelItem create() => LabelItem._();
  LabelItem createEmptyInstance() => create();
  static $pb.PbList<LabelItem> createRepeated() => $pb.PbList<LabelItem>();
  @$core.pragma('dart2js:noInline')
  static LabelItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LabelItem>(create);
  static LabelItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => clearField(2);
}

class ProductItem extends $pb.GeneratedMessage {
  factory ProductItem() => create();
  ProductItem._() : super();
  factory ProductItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProductItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProductItem', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aInt64(2, _omitFieldNames ? '' : 'productNo')
    ..aInt64(3, _omitFieldNames ? '' : 'categoryId')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..aOS(5, _omitFieldNames ? '' : 'image')
    ..aInt64(6, _omitFieldNames ? '' : 'price')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'currency', $pb.PbFieldType.O3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..aInt64(9, _omitFieldNames ? '' : 'createdAt')
    ..aInt64(10, _omitFieldNames ? '' : 'updatedAt')
    ..aInt64(11, _omitFieldNames ? '' : 'sellAt')
    ..a<$core.int>(12, _omitFieldNames ? '' : 'gender', $pb.PbFieldType.O3)
    ..aOS(13, _omitFieldNames ? '' : 'extra')
    ..p<$fixnum.Int64>(14, _omitFieldNames ? '' : 'productPositionIdList', $pb.PbFieldType.K6)
    ..aOS(15, _omitFieldNames ? '' : 'modelId')
    ..aOB(16, _omitFieldNames ? '' : 'initDressUp')
    ..pc<LabelItem>(17, _omitFieldNames ? '' : 'labelList', $pb.PbFieldType.PM, subBuilder: LabelItem.create)
    ..aOS(18, _omitFieldNames ? '' : 'stateName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProductItem clone() => ProductItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProductItem copyWith(void Function(ProductItem) updates) => super.copyWith((message) => updates(message as ProductItem)) as ProductItem;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProductItem create() => ProductItem._();
  ProductItem createEmptyInstance() => create();
  static $pb.PbList<ProductItem> createRepeated() => $pb.PbList<ProductItem>();
  @$core.pragma('dart2js:noInline')
  static ProductItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProductItem>(create);
  static ProductItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get productNo => $_getI64(1);
  @$pb.TagNumber(2)
  set productNo($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProductNo() => $_has(1);
  @$pb.TagNumber(2)
  void clearProductNo() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get categoryId => $_getI64(2);
  @$pb.TagNumber(3)
  set categoryId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCategoryId() => $_has(2);
  @$pb.TagNumber(3)
  void clearCategoryId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get image => $_getSZ(4);
  @$pb.TagNumber(5)
  set image($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasImage() => $_has(4);
  @$pb.TagNumber(5)
  void clearImage() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get price => $_getI64(5);
  @$pb.TagNumber(6)
  set price($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPrice() => $_has(5);
  @$pb.TagNumber(6)
  void clearPrice() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get currency => $_getIZ(6);
  @$pb.TagNumber(7)
  set currency($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCurrency() => $_has(6);
  @$pb.TagNumber(7)
  void clearCurrency() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get status => $_getIZ(7);
  @$pb.TagNumber(8)
  set status($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get createdAt => $_getI64(8);
  @$pb.TagNumber(9)
  set createdAt($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasCreatedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreatedAt() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get updatedAt => $_getI64(9);
  @$pb.TagNumber(10)
  set updatedAt($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasUpdatedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearUpdatedAt() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get sellAt => $_getI64(10);
  @$pb.TagNumber(11)
  set sellAt($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasSellAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearSellAt() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get gender => $_getIZ(11);
  @$pb.TagNumber(12)
  set gender($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasGender() => $_has(11);
  @$pb.TagNumber(12)
  void clearGender() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get extra => $_getSZ(12);
  @$pb.TagNumber(13)
  set extra($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasExtra() => $_has(12);
  @$pb.TagNumber(13)
  void clearExtra() => clearField(13);

  @$pb.TagNumber(14)
  $core.List<$fixnum.Int64> get productPositionIdList => $_getList(13);

  @$pb.TagNumber(15)
  $core.String get modelId => $_getSZ(14);
  @$pb.TagNumber(15)
  set modelId($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasModelId() => $_has(14);
  @$pb.TagNumber(15)
  void clearModelId() => clearField(15);

  @$pb.TagNumber(16)
  $core.bool get initDressUp => $_getBF(15);
  @$pb.TagNumber(16)
  set initDressUp($core.bool v) { $_setBool(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasInitDressUp() => $_has(15);
  @$pb.TagNumber(16)
  void clearInitDressUp() => clearField(16);

  @$pb.TagNumber(17)
  $core.List<LabelItem> get labelList => $_getList(16);

  @$pb.TagNumber(18)
  $core.String get stateName => $_getSZ(17);
  @$pb.TagNumber(18)
  set stateName($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasStateName() => $_has(17);
  @$pb.TagNumber(18)
  void clearStateName() => clearField(18);
}

class S_SaveUserCurrentDressUp extends $pb.GeneratedMessage {
  factory S_SaveUserCurrentDressUp() => create();
  S_SaveUserCurrentDressUp._() : super();
  factory S_SaveUserCurrentDressUp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_SaveUserCurrentDressUp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_SaveUserCurrentDressUp', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..pc<ProductItem>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: ProductItem.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_SaveUserCurrentDressUp clone() => S_SaveUserCurrentDressUp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_SaveUserCurrentDressUp copyWith(void Function(S_SaveUserCurrentDressUp) updates) => super.copyWith((message) => updates(message as S_SaveUserCurrentDressUp)) as S_SaveUserCurrentDressUp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_SaveUserCurrentDressUp create() => S_SaveUserCurrentDressUp._();
  S_SaveUserCurrentDressUp createEmptyInstance() => create();
  static $pb.PbList<S_SaveUserCurrentDressUp> createRepeated() => $pb.PbList<S_SaveUserCurrentDressUp>();
  @$core.pragma('dart2js:noInline')
  static S_SaveUserCurrentDressUp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_SaveUserCurrentDressUp>(create);
  static S_SaveUserCurrentDressUp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ProductItem> get items => $_getList(0);
}

class S_UpdateDressUp extends $pb.GeneratedMessage {
  factory S_UpdateDressUp() => create();
  S_UpdateDressUp._() : super();
  factory S_UpdateDressUp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_UpdateDressUp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_UpdateDressUp', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roleId')
    ..p<$fixnum.Int64>(2, _omitFieldNames ? '' : 'productIdList', $pb.PbFieldType.K6)
    ..aOS(3, _omitFieldNames ? '' : 'uid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_UpdateDressUp clone() => S_UpdateDressUp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_UpdateDressUp copyWith(void Function(S_UpdateDressUp) updates) => super.copyWith((message) => updates(message as S_UpdateDressUp)) as S_UpdateDressUp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_UpdateDressUp create() => S_UpdateDressUp._();
  S_UpdateDressUp createEmptyInstance() => create();
  static $pb.PbList<S_UpdateDressUp> createRepeated() => $pb.PbList<S_UpdateDressUp>();
  @$core.pragma('dart2js:noInline')
  static S_UpdateDressUp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_UpdateDressUp>(create);
  static S_UpdateDressUp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roleId => $_getI64(0);
  @$pb.TagNumber(1)
  set roleId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoleId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$fixnum.Int64> get productIdList => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get uid => $_getSZ(2);
  @$pb.TagNumber(3)
  set uid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);
}

class C_UseProductAndSaveUserCurrentDressUp extends $pb.GeneratedMessage {
  factory C_UseProductAndSaveUserCurrentDressUp() => create();
  C_UseProductAndSaveUserCurrentDressUp._() : super();
  factory C_UseProductAndSaveUserCurrentDressUp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_UseProductAndSaveUserCurrentDressUp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_UseProductAndSaveUserCurrentDressUp', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : 'useProductIdList', $pb.PbFieldType.K6)
    ..p<$fixnum.Int64>(2, _omitFieldNames ? '' : 'saveDressUpProductIdList', $pb.PbFieldType.K6)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_UseProductAndSaveUserCurrentDressUp clone() => C_UseProductAndSaveUserCurrentDressUp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_UseProductAndSaveUserCurrentDressUp copyWith(void Function(C_UseProductAndSaveUserCurrentDressUp) updates) => super.copyWith((message) => updates(message as C_UseProductAndSaveUserCurrentDressUp)) as C_UseProductAndSaveUserCurrentDressUp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_UseProductAndSaveUserCurrentDressUp create() => C_UseProductAndSaveUserCurrentDressUp._();
  C_UseProductAndSaveUserCurrentDressUp createEmptyInstance() => create();
  static $pb.PbList<C_UseProductAndSaveUserCurrentDressUp> createRepeated() => $pb.PbList<C_UseProductAndSaveUserCurrentDressUp>();
  @$core.pragma('dart2js:noInline')
  static C_UseProductAndSaveUserCurrentDressUp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_UseProductAndSaveUserCurrentDressUp>(create);
  static C_UseProductAndSaveUserCurrentDressUp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$fixnum.Int64> get useProductIdList => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$fixnum.Int64> get saveDressUpProductIdList => $_getList(1);
}

class BackpackProductItem extends $pb.GeneratedMessage {
  factory BackpackProductItem() => create();
  BackpackProductItem._() : super();
  factory BackpackProductItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BackpackProductItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BackpackProductItem', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'productId')
    ..aInt64(2, _omitFieldNames ? '' : 'categoryId')
    ..aInt64(3, _omitFieldNames ? '' : 'price')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'currency', $pb.PbFieldType.O3)
    ..aInt64(5, _omitFieldNames ? '' : 'effectiveTime')
    ..aInt64(6, _omitFieldNames ? '' : 'groupId')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..aOS(8, _omitFieldNames ? '' : 'name')
    ..aOS(9, _omitFieldNames ? '' : 'image')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'gender', $pb.PbFieldType.O3)
    ..pc<LabelItem>(11, _omitFieldNames ? '' : 'labelList', $pb.PbFieldType.PM, subBuilder: LabelItem.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BackpackProductItem clone() => BackpackProductItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BackpackProductItem copyWith(void Function(BackpackProductItem) updates) => super.copyWith((message) => updates(message as BackpackProductItem)) as BackpackProductItem;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BackpackProductItem create() => BackpackProductItem._();
  BackpackProductItem createEmptyInstance() => create();
  static $pb.PbList<BackpackProductItem> createRepeated() => $pb.PbList<BackpackProductItem>();
  @$core.pragma('dart2js:noInline')
  static BackpackProductItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BackpackProductItem>(create);
  static BackpackProductItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get productId => $_getI64(0);
  @$pb.TagNumber(1)
  set productId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get categoryId => $_getI64(1);
  @$pb.TagNumber(2)
  set categoryId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCategoryId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCategoryId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get price => $_getI64(2);
  @$pb.TagNumber(3)
  set price($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get currency => $_getIZ(3);
  @$pb.TagNumber(4)
  set currency($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCurrency() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrency() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get effectiveTime => $_getI64(4);
  @$pb.TagNumber(5)
  set effectiveTime($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEffectiveTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearEffectiveTime() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get groupId => $_getI64(5);
  @$pb.TagNumber(6)
  set groupId($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasGroupId() => $_has(5);
  @$pb.TagNumber(6)
  void clearGroupId() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get count => $_getIZ(6);
  @$pb.TagNumber(7)
  set count($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearCount() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get name => $_getSZ(7);
  @$pb.TagNumber(8)
  set name($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasName() => $_has(7);
  @$pb.TagNumber(8)
  void clearName() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get image => $_getSZ(8);
  @$pb.TagNumber(9)
  set image($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasImage() => $_has(8);
  @$pb.TagNumber(9)
  void clearImage() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get gender => $_getIZ(9);
  @$pb.TagNumber(10)
  set gender($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasGender() => $_has(9);
  @$pb.TagNumber(10)
  void clearGender() => clearField(10);

  @$pb.TagNumber(11)
  $core.List<LabelItem> get labelList => $_getList(10);
}

class S_UseProductAndSaveUserCurrentDressUp extends $pb.GeneratedMessage {
  factory S_UseProductAndSaveUserCurrentDressUp() => create();
  S_UseProductAndSaveUserCurrentDressUp._() : super();
  factory S_UseProductAndSaveUserCurrentDressUp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_UseProductAndSaveUserCurrentDressUp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_UseProductAndSaveUserCurrentDressUp', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..pc<ProductItem>(1, _omitFieldNames ? '' : 'userDressUpProductList', $pb.PbFieldType.PM, subBuilder: ProductItem.create)
    ..pc<BackpackProductItem>(2, _omitFieldNames ? '' : 'useProductList', $pb.PbFieldType.PM, subBuilder: BackpackProductItem.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_UseProductAndSaveUserCurrentDressUp clone() => S_UseProductAndSaveUserCurrentDressUp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_UseProductAndSaveUserCurrentDressUp copyWith(void Function(S_UseProductAndSaveUserCurrentDressUp) updates) => super.copyWith((message) => updates(message as S_UseProductAndSaveUserCurrentDressUp)) as S_UseProductAndSaveUserCurrentDressUp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_UseProductAndSaveUserCurrentDressUp create() => S_UseProductAndSaveUserCurrentDressUp._();
  S_UseProductAndSaveUserCurrentDressUp createEmptyInstance() => create();
  static $pb.PbList<S_UseProductAndSaveUserCurrentDressUp> createRepeated() => $pb.PbList<S_UseProductAndSaveUserCurrentDressUp>();
  @$core.pragma('dart2js:noInline')
  static S_UseProductAndSaveUserCurrentDressUp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_UseProductAndSaveUserCurrentDressUp>(create);
  static S_UseProductAndSaveUserCurrentDressUp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ProductItem> get userDressUpProductList => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<BackpackProductItem> get useProductList => $_getList(1);
}

class S_CameraSwitch extends $pb.GeneratedMessage {
  factory S_CameraSwitch() => create();
  S_CameraSwitch._() : super();
  factory S_CameraSwitch.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_CameraSwitch.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_CameraSwitch', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'position', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_CameraSwitch clone() => S_CameraSwitch()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_CameraSwitch copyWith(void Function(S_CameraSwitch) updates) => super.copyWith((message) => updates(message as S_CameraSwitch)) as S_CameraSwitch;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_CameraSwitch create() => S_CameraSwitch._();
  S_CameraSwitch createEmptyInstance() => create();
  static $pb.PbList<S_CameraSwitch> createRepeated() => $pb.PbList<S_CameraSwitch>();
  @$core.pragma('dart2js:noInline')
  static S_CameraSwitch getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_CameraSwitch>(create);
  static S_CameraSwitch? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get position => $_getIZ(0);
  @$pb.TagNumber(1)
  set position($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => clearField(1);
}

class C_PKInvite extends $pb.GeneratedMessage {
  factory C_PKInvite() => create();
  C_PKInvite._() : super();
  factory C_PKInvite.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_PKInvite.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_PKInvite', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'selfGuildId', protoName: 'selfGuildId')
    ..aInt64(2, _omitFieldNames ? '' : 'invitedGuildId', protoName: 'invitedGuildId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_PKInvite clone() => C_PKInvite()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_PKInvite copyWith(void Function(C_PKInvite) updates) => super.copyWith((message) => updates(message as C_PKInvite)) as C_PKInvite;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_PKInvite create() => C_PKInvite._();
  C_PKInvite createEmptyInstance() => create();
  static $pb.PbList<C_PKInvite> createRepeated() => $pb.PbList<C_PKInvite>();
  @$core.pragma('dart2js:noInline')
  static C_PKInvite getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_PKInvite>(create);
  static C_PKInvite? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get selfGuildId => $_getI64(0);
  @$pb.TagNumber(1)
  set selfGuildId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSelfGuildId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelfGuildId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get invitedGuildId => $_getI64(1);
  @$pb.TagNumber(2)
  set invitedGuildId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasInvitedGuildId() => $_has(1);
  @$pb.TagNumber(2)
  void clearInvitedGuildId() => clearField(2);
}

class S_PKInvite extends $pb.GeneratedMessage {
  factory S_PKInvite() => create();
  S_PKInvite._() : super();
  factory S_PKInvite.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_PKInvite.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_PKInvite', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'invitingGuildId', protoName: 'invitingGuildId')
    ..aOS(2, _omitFieldNames ? '' : 'invitingGuildName', protoName: 'invitingGuildName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_PKInvite clone() => S_PKInvite()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_PKInvite copyWith(void Function(S_PKInvite) updates) => super.copyWith((message) => updates(message as S_PKInvite)) as S_PKInvite;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_PKInvite create() => S_PKInvite._();
  S_PKInvite createEmptyInstance() => create();
  static $pb.PbList<S_PKInvite> createRepeated() => $pb.PbList<S_PKInvite>();
  @$core.pragma('dart2js:noInline')
  static S_PKInvite getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_PKInvite>(create);
  static S_PKInvite? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get invitingGuildId => $_getI64(0);
  @$pb.TagNumber(1)
  set invitingGuildId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasInvitingGuildId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInvitingGuildId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get invitingGuildName => $_getSZ(1);
  @$pb.TagNumber(2)
  set invitingGuildName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasInvitingGuildName() => $_has(1);
  @$pb.TagNumber(2)
  void clearInvitingGuildName() => clearField(2);
}

class C_PKAccept extends $pb.GeneratedMessage {
  factory C_PKAccept() => create();
  C_PKAccept._() : super();
  factory C_PKAccept.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_PKAccept.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_PKAccept', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'accept')
    ..aInt64(2, _omitFieldNames ? '' : 'invitingGuildId', protoName: 'invitingGuildId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_PKAccept clone() => C_PKAccept()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_PKAccept copyWith(void Function(C_PKAccept) updates) => super.copyWith((message) => updates(message as C_PKAccept)) as C_PKAccept;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_PKAccept create() => C_PKAccept._();
  C_PKAccept createEmptyInstance() => create();
  static $pb.PbList<C_PKAccept> createRepeated() => $pb.PbList<C_PKAccept>();
  @$core.pragma('dart2js:noInline')
  static C_PKAccept getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_PKAccept>(create);
  static C_PKAccept? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get accept => $_getBF(0);
  @$pb.TagNumber(1)
  set accept($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccept() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccept() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get invitingGuildId => $_getI64(1);
  @$pb.TagNumber(2)
  set invitingGuildId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasInvitingGuildId() => $_has(1);
  @$pb.TagNumber(2)
  void clearInvitingGuildId() => clearField(2);
}

class S_PKInviteResult extends $pb.GeneratedMessage {
  factory S_PKInviteResult() => create();
  S_PKInviteResult._() : super();
  factory S_PKInviteResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_PKInviteResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_PKInviteResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isSuccess', protoName: 'isSuccess')
    ..aInt64(2, _omitFieldNames ? '' : 'pkRoomId', protoName: 'pkRoomId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'countdown', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_PKInviteResult clone() => S_PKInviteResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_PKInviteResult copyWith(void Function(S_PKInviteResult) updates) => super.copyWith((message) => updates(message as S_PKInviteResult)) as S_PKInviteResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_PKInviteResult create() => S_PKInviteResult._();
  S_PKInviteResult createEmptyInstance() => create();
  static $pb.PbList<S_PKInviteResult> createRepeated() => $pb.PbList<S_PKInviteResult>();
  @$core.pragma('dart2js:noInline')
  static S_PKInviteResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_PKInviteResult>(create);
  static S_PKInviteResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isSuccess => $_getBF(0);
  @$pb.TagNumber(1)
  set isSuccess($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get pkRoomId => $_getI64(1);
  @$pb.TagNumber(2)
  set pkRoomId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPkRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPkRoomId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get countdown => $_getIZ(2);
  @$pb.TagNumber(3)
  set countdown($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCountdown() => $_has(2);
  @$pb.TagNumber(3)
  void clearCountdown() => clearField(3);
}

class PKCreateRoleInfo extends $pb.GeneratedMessage {
  factory PKCreateRoleInfo() => create();
  PKCreateRoleInfo._() : super();
  factory PKCreateRoleInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PKCreateRoleInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PKCreateRoleInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOM<$0.PKUserInfo>(1, _omitFieldNames ? '' : 'userInfo', protoName: 'userInfo', subBuilder: $0.PKUserInfo.create)
    ..aOM<$0.PKRoleBattleInfoLF>(2, _omitFieldNames ? '' : 'roleInfoLf', protoName: 'roleInfoLf', subBuilder: $0.PKRoleBattleInfoLF.create)
    ..aOM<$0.PKRoleBattleInfoHF>(3, _omitFieldNames ? '' : 'roleInfoHf', protoName: 'roleInfoHf', subBuilder: $0.PKRoleBattleInfoHF.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PKCreateRoleInfo clone() => PKCreateRoleInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PKCreateRoleInfo copyWith(void Function(PKCreateRoleInfo) updates) => super.copyWith((message) => updates(message as PKCreateRoleInfo)) as PKCreateRoleInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PKCreateRoleInfo create() => PKCreateRoleInfo._();
  PKCreateRoleInfo createEmptyInstance() => create();
  static $pb.PbList<PKCreateRoleInfo> createRepeated() => $pb.PbList<PKCreateRoleInfo>();
  @$core.pragma('dart2js:noInline')
  static PKCreateRoleInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PKCreateRoleInfo>(create);
  static PKCreateRoleInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $0.PKUserInfo get userInfo => $_getN(0);
  @$pb.TagNumber(1)
  set userInfo($0.PKUserInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserInfo() => clearField(1);
  @$pb.TagNumber(1)
  $0.PKUserInfo ensureUserInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.PKRoleBattleInfoLF get roleInfoLf => $_getN(1);
  @$pb.TagNumber(2)
  set roleInfoLf($0.PKRoleBattleInfoLF v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoleInfoLf() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoleInfoLf() => clearField(2);
  @$pb.TagNumber(2)
  $0.PKRoleBattleInfoLF ensureRoleInfoLf() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.PKRoleBattleInfoHF get roleInfoHf => $_getN(2);
  @$pb.TagNumber(3)
  set roleInfoHf($0.PKRoleBattleInfoHF v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoleInfoHf() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoleInfoHf() => clearField(3);
  @$pb.TagNumber(3)
  $0.PKRoleBattleInfoHF ensureRoleInfoHf() => $_ensure(2);
}

class C_PKSceneLoaded extends $pb.GeneratedMessage {
  factory C_PKSceneLoaded() => create();
  C_PKSceneLoaded._() : super();
  factory C_PKSceneLoaded.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_PKSceneLoaded.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_PKSceneLoaded', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'pkRoomId', protoName: 'pkRoomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_PKSceneLoaded clone() => C_PKSceneLoaded()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_PKSceneLoaded copyWith(void Function(C_PKSceneLoaded) updates) => super.copyWith((message) => updates(message as C_PKSceneLoaded)) as C_PKSceneLoaded;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_PKSceneLoaded create() => C_PKSceneLoaded._();
  C_PKSceneLoaded createEmptyInstance() => create();
  static $pb.PbList<C_PKSceneLoaded> createRepeated() => $pb.PbList<C_PKSceneLoaded>();
  @$core.pragma('dart2js:noInline')
  static C_PKSceneLoaded getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_PKSceneLoaded>(create);
  static C_PKSceneLoaded? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get pkRoomId => $_getI64(0);
  @$pb.TagNumber(1)
  set pkRoomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPkRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPkRoomId() => clearField(1);
}

class S_PKGameInfo extends $pb.GeneratedMessage {
  factory S_PKGameInfo() => create();
  S_PKGameInfo._() : super();
  factory S_PKGameInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_PKGameInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_PKGameInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOM<$0.PKGuildInfo>(1, _omitFieldNames ? '' : 'inviterGuild', protoName: 'inviterGuild', subBuilder: $0.PKGuildInfo.create)
    ..aOM<$0.PKGuildInfo>(2, _omitFieldNames ? '' : 'acceptGuild', protoName: 'acceptGuild', subBuilder: $0.PKGuildInfo.create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'weaponShowTotal', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'weaponWidth', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'weaponLength', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'weaponSpeed', $pb.PbFieldType.O3)
    ..aOM<PKCreateRoleInfo>(7, _omitFieldNames ? '' : 'mainRoleInfo', protoName: 'mainRoleInfo', subBuilder: PKCreateRoleInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_PKGameInfo clone() => S_PKGameInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_PKGameInfo copyWith(void Function(S_PKGameInfo) updates) => super.copyWith((message) => updates(message as S_PKGameInfo)) as S_PKGameInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_PKGameInfo create() => S_PKGameInfo._();
  S_PKGameInfo createEmptyInstance() => create();
  static $pb.PbList<S_PKGameInfo> createRepeated() => $pb.PbList<S_PKGameInfo>();
  @$core.pragma('dart2js:noInline')
  static S_PKGameInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_PKGameInfo>(create);
  static S_PKGameInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $0.PKGuildInfo get inviterGuild => $_getN(0);
  @$pb.TagNumber(1)
  set inviterGuild($0.PKGuildInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInviterGuild() => $_has(0);
  @$pb.TagNumber(1)
  void clearInviterGuild() => clearField(1);
  @$pb.TagNumber(1)
  $0.PKGuildInfo ensureInviterGuild() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.PKGuildInfo get acceptGuild => $_getN(1);
  @$pb.TagNumber(2)
  set acceptGuild($0.PKGuildInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAcceptGuild() => $_has(1);
  @$pb.TagNumber(2)
  void clearAcceptGuild() => clearField(2);
  @$pb.TagNumber(2)
  $0.PKGuildInfo ensureAcceptGuild() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get weaponShowTotal => $_getIZ(2);
  @$pb.TagNumber(3)
  set weaponShowTotal($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWeaponShowTotal() => $_has(2);
  @$pb.TagNumber(3)
  void clearWeaponShowTotal() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get weaponWidth => $_getIZ(3);
  @$pb.TagNumber(4)
  set weaponWidth($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasWeaponWidth() => $_has(3);
  @$pb.TagNumber(4)
  void clearWeaponWidth() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get weaponLength => $_getIZ(4);
  @$pb.TagNumber(5)
  set weaponLength($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasWeaponLength() => $_has(4);
  @$pb.TagNumber(5)
  void clearWeaponLength() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get weaponSpeed => $_getIZ(5);
  @$pb.TagNumber(6)
  set weaponSpeed($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasWeaponSpeed() => $_has(5);
  @$pb.TagNumber(6)
  void clearWeaponSpeed() => clearField(6);

  @$pb.TagNumber(7)
  PKCreateRoleInfo get mainRoleInfo => $_getN(6);
  @$pb.TagNumber(7)
  set mainRoleInfo(PKCreateRoleInfo v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasMainRoleInfo() => $_has(6);
  @$pb.TagNumber(7)
  void clearMainRoleInfo() => clearField(7);
  @$pb.TagNumber(7)
  PKCreateRoleInfo ensureMainRoleInfo() => $_ensure(6);
}

class S_PKUserEnter extends $pb.GeneratedMessage {
  factory S_PKUserEnter() => create();
  S_PKUserEnter._() : super();
  factory S_PKUserEnter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_PKUserEnter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_PKUserEnter', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOM<$0.PKUserInfo>(1, _omitFieldNames ? '' : 'userInfo', protoName: 'userInfo', subBuilder: $0.PKUserInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_PKUserEnter clone() => S_PKUserEnter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_PKUserEnter copyWith(void Function(S_PKUserEnter) updates) => super.copyWith((message) => updates(message as S_PKUserEnter)) as S_PKUserEnter;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_PKUserEnter create() => S_PKUserEnter._();
  S_PKUserEnter createEmptyInstance() => create();
  static $pb.PbList<S_PKUserEnter> createRepeated() => $pb.PbList<S_PKUserEnter>();
  @$core.pragma('dart2js:noInline')
  static S_PKUserEnter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_PKUserEnter>(create);
  static S_PKUserEnter? _defaultInstance;

  @$pb.TagNumber(1)
  $0.PKUserInfo get userInfo => $_getN(0);
  @$pb.TagNumber(1)
  set userInfo($0.PKUserInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserInfo() => clearField(1);
  @$pb.TagNumber(1)
  $0.PKUserInfo ensureUserInfo() => $_ensure(0);
}

class S_PKSyncRoles extends $pb.GeneratedMessage {
  factory S_PKSyncRoles() => create();
  S_PKSyncRoles._() : super();
  factory S_PKSyncRoles.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_PKSyncRoles.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_PKSyncRoles', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..pc<PKCreateRoleInfo>(1, _omitFieldNames ? '' : 'createdRoles', $pb.PbFieldType.PM, protoName: 'createdRoles', subBuilder: PKCreateRoleInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_PKSyncRoles clone() => S_PKSyncRoles()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_PKSyncRoles copyWith(void Function(S_PKSyncRoles) updates) => super.copyWith((message) => updates(message as S_PKSyncRoles)) as S_PKSyncRoles;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_PKSyncRoles create() => S_PKSyncRoles._();
  S_PKSyncRoles createEmptyInstance() => create();
  static $pb.PbList<S_PKSyncRoles> createRepeated() => $pb.PbList<S_PKSyncRoles>();
  @$core.pragma('dart2js:noInline')
  static S_PKSyncRoles getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_PKSyncRoles>(create);
  static S_PKSyncRoles? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PKCreateRoleInfo> get createdRoles => $_getList(0);
}

class C_PKBattleReady extends $pb.GeneratedMessage {
  factory C_PKBattleReady() => create();
  C_PKBattleReady._() : super();
  factory C_PKBattleReady.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_PKBattleReady.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_PKBattleReady', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'pkRoomId', protoName: 'pkRoomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_PKBattleReady clone() => C_PKBattleReady()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_PKBattleReady copyWith(void Function(C_PKBattleReady) updates) => super.copyWith((message) => updates(message as C_PKBattleReady)) as C_PKBattleReady;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_PKBattleReady create() => C_PKBattleReady._();
  C_PKBattleReady createEmptyInstance() => create();
  static $pb.PbList<C_PKBattleReady> createRepeated() => $pb.PbList<C_PKBattleReady>();
  @$core.pragma('dart2js:noInline')
  static C_PKBattleReady getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_PKBattleReady>(create);
  static C_PKBattleReady? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get pkRoomId => $_getI64(0);
  @$pb.TagNumber(1)
  set pkRoomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPkRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPkRoomId() => clearField(1);
}

class C_PKMove extends $pb.GeneratedMessage {
  factory C_PKMove() => create();
  C_PKMove._() : super();
  factory C_PKMove.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_PKMove.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_PKMove', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'rotation', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_PKMove clone() => C_PKMove()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_PKMove copyWith(void Function(C_PKMove) updates) => super.copyWith((message) => updates(message as C_PKMove)) as C_PKMove;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_PKMove create() => C_PKMove._();
  C_PKMove createEmptyInstance() => create();
  static $pb.PbList<C_PKMove> createRepeated() => $pb.PbList<C_PKMove>();
  @$core.pragma('dart2js:noInline')
  static C_PKMove getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_PKMove>(create);
  static C_PKMove? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rotation => $_getIZ(0);
  @$pb.TagNumber(1)
  set rotation($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRotation() => $_has(0);
  @$pb.TagNumber(1)
  void clearRotation() => clearField(1);
}

class S_PKSyncRoleAttsLF extends $pb.GeneratedMessage {
  factory S_PKSyncRoleAttsLF() => create();
  S_PKSyncRoleAttsLF._() : super();
  factory S_PKSyncRoleAttsLF.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_PKSyncRoleAttsLF.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_PKSyncRoleAttsLF', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..pc<$0.PKRoleBattleInfoLF>(1, _omitFieldNames ? '' : 'roleInfos', $pb.PbFieldType.PM, protoName: 'roleInfos', subBuilder: $0.PKRoleBattleInfoLF.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_PKSyncRoleAttsLF clone() => S_PKSyncRoleAttsLF()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_PKSyncRoleAttsLF copyWith(void Function(S_PKSyncRoleAttsLF) updates) => super.copyWith((message) => updates(message as S_PKSyncRoleAttsLF)) as S_PKSyncRoleAttsLF;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_PKSyncRoleAttsLF create() => S_PKSyncRoleAttsLF._();
  S_PKSyncRoleAttsLF createEmptyInstance() => create();
  static $pb.PbList<S_PKSyncRoleAttsLF> createRepeated() => $pb.PbList<S_PKSyncRoleAttsLF>();
  @$core.pragma('dart2js:noInline')
  static S_PKSyncRoleAttsLF getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_PKSyncRoleAttsLF>(create);
  static S_PKSyncRoleAttsLF? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.PKRoleBattleInfoLF> get roleInfos => $_getList(0);
}

class S_PKSyncRoleAttsHF extends $pb.GeneratedMessage {
  factory S_PKSyncRoleAttsHF() => create();
  S_PKSyncRoleAttsHF._() : super();
  factory S_PKSyncRoleAttsHF.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_PKSyncRoleAttsHF.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_PKSyncRoleAttsHF', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..pc<$0.PKRoleBattleInfoHF>(1, _omitFieldNames ? '' : 'roleInfos', $pb.PbFieldType.PM, protoName: 'roleInfos', subBuilder: $0.PKRoleBattleInfoHF.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_PKSyncRoleAttsHF clone() => S_PKSyncRoleAttsHF()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_PKSyncRoleAttsHF copyWith(void Function(S_PKSyncRoleAttsHF) updates) => super.copyWith((message) => updates(message as S_PKSyncRoleAttsHF)) as S_PKSyncRoleAttsHF;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_PKSyncRoleAttsHF create() => S_PKSyncRoleAttsHF._();
  S_PKSyncRoleAttsHF createEmptyInstance() => create();
  static $pb.PbList<S_PKSyncRoleAttsHF> createRepeated() => $pb.PbList<S_PKSyncRoleAttsHF>();
  @$core.pragma('dart2js:noInline')
  static S_PKSyncRoleAttsHF getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_PKSyncRoleAttsHF>(create);
  static S_PKSyncRoleAttsHF? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.PKRoleBattleInfoHF> get roleInfos => $_getList(0);
}

class S_PKSceneToxic extends $pb.GeneratedMessage {
  factory S_PKSceneToxic() => create();
  S_PKSceneToxic._() : super();
  factory S_PKSceneToxic.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_PKSceneToxic.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_PKSceneToxic', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'safeRadius', $pb.PbFieldType.O3, protoName: 'safeRadius')
    ..aInt64(2, _omitFieldNames ? '' : 'takeEffectTime', protoName: 'takeEffectTime')
    ..aOM<$0.XYZ>(3, _omitFieldNames ? '' : 'safePosition', protoName: 'safePosition', subBuilder: $0.XYZ.create)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'toxicFogSpeed', $pb.PbFieldType.O3, protoName: 'toxicFogSpeed')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_PKSceneToxic clone() => S_PKSceneToxic()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_PKSceneToxic copyWith(void Function(S_PKSceneToxic) updates) => super.copyWith((message) => updates(message as S_PKSceneToxic)) as S_PKSceneToxic;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_PKSceneToxic create() => S_PKSceneToxic._();
  S_PKSceneToxic createEmptyInstance() => create();
  static $pb.PbList<S_PKSceneToxic> createRepeated() => $pb.PbList<S_PKSceneToxic>();
  @$core.pragma('dart2js:noInline')
  static S_PKSceneToxic getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_PKSceneToxic>(create);
  static S_PKSceneToxic? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get safeRadius => $_getIZ(0);
  @$pb.TagNumber(1)
  set safeRadius($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSafeRadius() => $_has(0);
  @$pb.TagNumber(1)
  void clearSafeRadius() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get takeEffectTime => $_getI64(1);
  @$pb.TagNumber(2)
  set takeEffectTime($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTakeEffectTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearTakeEffectTime() => clearField(2);

  @$pb.TagNumber(3)
  $0.XYZ get safePosition => $_getN(2);
  @$pb.TagNumber(3)
  set safePosition($0.XYZ v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSafePosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearSafePosition() => clearField(3);
  @$pb.TagNumber(3)
  $0.XYZ ensureSafePosition() => $_ensure(2);

  @$pb.TagNumber(5)
  $core.int get toxicFogSpeed => $_getIZ(3);
  @$pb.TagNumber(5)
  set toxicFogSpeed($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasToxicFogSpeed() => $_has(3);
  @$pb.TagNumber(5)
  void clearToxicFogSpeed() => clearField(5);
}

class S_PKSceneGift extends $pb.GeneratedMessage {
  factory S_PKSceneGift() => create();
  S_PKSceneGift._() : super();
  factory S_PKSceneGift.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_PKSceneGift.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_PKSceneGift', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..pc<$0.PKGift>(4, _omitFieldNames ? '' : 'gifts', $pb.PbFieldType.PM, subBuilder: $0.PKGift.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_PKSceneGift clone() => S_PKSceneGift()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_PKSceneGift copyWith(void Function(S_PKSceneGift) updates) => super.copyWith((message) => updates(message as S_PKSceneGift)) as S_PKSceneGift;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_PKSceneGift create() => S_PKSceneGift._();
  S_PKSceneGift createEmptyInstance() => create();
  static $pb.PbList<S_PKSceneGift> createRepeated() => $pb.PbList<S_PKSceneGift>();
  @$core.pragma('dart2js:noInline')
  static S_PKSceneGift getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_PKSceneGift>(create);
  static S_PKSceneGift? _defaultInstance;

  @$pb.TagNumber(4)
  $core.List<$0.PKGift> get gifts => $_getList(0);
}

class S_PKBattleEnd extends $pb.GeneratedMessage {
  factory S_PKBattleEnd() => create();
  S_PKBattleEnd._() : super();
  factory S_PKBattleEnd.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_PKBattleEnd.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_PKBattleEnd', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'winGuildId', protoName: 'winGuildId')
    ..pc<$0.PKRoleSummary>(2, _omitFieldNames ? '' : 'roleInfos', $pb.PbFieldType.PM, protoName: 'roleInfos', subBuilder: $0.PKRoleSummary.create)
    ..pc<$0.PKPresenterInfo>(3, _omitFieldNames ? '' : 'presenterInfo', $pb.PbFieldType.PM, protoName: 'presenterInfo', subBuilder: $0.PKPresenterInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_PKBattleEnd clone() => S_PKBattleEnd()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_PKBattleEnd copyWith(void Function(S_PKBattleEnd) updates) => super.copyWith((message) => updates(message as S_PKBattleEnd)) as S_PKBattleEnd;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_PKBattleEnd create() => S_PKBattleEnd._();
  S_PKBattleEnd createEmptyInstance() => create();
  static $pb.PbList<S_PKBattleEnd> createRepeated() => $pb.PbList<S_PKBattleEnd>();
  @$core.pragma('dart2js:noInline')
  static S_PKBattleEnd getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_PKBattleEnd>(create);
  static S_PKBattleEnd? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get winGuildId => $_getI64(0);
  @$pb.TagNumber(1)
  set winGuildId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWinGuildId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWinGuildId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$0.PKRoleSummary> get roleInfos => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$0.PKPresenterInfo> get presenterInfo => $_getList(2);
}

class C_PKContinue extends $pb.GeneratedMessage {
  factory C_PKContinue() => create();
  C_PKContinue._() : super();
  factory C_PKContinue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_PKContinue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_PKContinue', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'isContinue', $pb.PbFieldType.O3, protoName: 'isContinue')
    ..aInt64(2, _omitFieldNames ? '' : 'pkRoomId', protoName: 'pkRoomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_PKContinue clone() => C_PKContinue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_PKContinue copyWith(void Function(C_PKContinue) updates) => super.copyWith((message) => updates(message as C_PKContinue)) as C_PKContinue;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_PKContinue create() => C_PKContinue._();
  C_PKContinue createEmptyInstance() => create();
  static $pb.PbList<C_PKContinue> createRepeated() => $pb.PbList<C_PKContinue>();
  @$core.pragma('dart2js:noInline')
  static C_PKContinue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_PKContinue>(create);
  static C_PKContinue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get isContinue => $_getIZ(0);
  @$pb.TagNumber(1)
  set isContinue($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsContinue() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsContinue() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get pkRoomId => $_getI64(1);
  @$pb.TagNumber(2)
  set pkRoomId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPkRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPkRoomId() => clearField(2);
}

class S_PKContinue extends $pb.GeneratedMessage {
  factory S_PKContinue() => create();
  S_PKContinue._() : super();
  factory S_PKContinue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_PKContinue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_PKContinue', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'isContinue', $pb.PbFieldType.O3, protoName: 'isContinue')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_PKContinue clone() => S_PKContinue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_PKContinue copyWith(void Function(S_PKContinue) updates) => super.copyWith((message) => updates(message as S_PKContinue)) as S_PKContinue;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_PKContinue create() => S_PKContinue._();
  S_PKContinue createEmptyInstance() => create();
  static $pb.PbList<S_PKContinue> createRepeated() => $pb.PbList<S_PKContinue>();
  @$core.pragma('dart2js:noInline')
  static S_PKContinue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_PKContinue>(create);
  static S_PKContinue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get isContinue => $_getIZ(0);
  @$pb.TagNumber(1)
  set isContinue($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsContinue() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsContinue() => clearField(1);
}

class C_PKRoomList extends $pb.GeneratedMessage {
  factory C_PKRoomList() => create();
  C_PKRoomList._() : super();
  factory C_PKRoomList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory C_PKRoomList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'C_PKRoomList', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'offset')
    ..aInt64(2, _omitFieldNames ? '' : 'limit')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  C_PKRoomList clone() => C_PKRoomList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  C_PKRoomList copyWith(void Function(C_PKRoomList) updates) => super.copyWith((message) => updates(message as C_PKRoomList)) as C_PKRoomList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static C_PKRoomList create() => C_PKRoomList._();
  C_PKRoomList createEmptyInstance() => create();
  static $pb.PbList<C_PKRoomList> createRepeated() => $pb.PbList<C_PKRoomList>();
  @$core.pragma('dart2js:noInline')
  static C_PKRoomList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<C_PKRoomList>(create);
  static C_PKRoomList? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get offset => $_getI64(0);
  @$pb.TagNumber(1)
  set offset($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOffset() => $_has(0);
  @$pb.TagNumber(1)
  void clearOffset() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get limit => $_getI64(1);
  @$pb.TagNumber(2)
  set limit($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);
}

class S_PKRoomList extends $pb.GeneratedMessage {
  factory S_PKRoomList() => create();
  S_PKRoomList._() : super();
  factory S_PKRoomList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory S_PKRoomList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'S_PKRoomList', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..pc<$0.PkRoomInfo>(2, _omitFieldNames ? '' : 'roomList', $pb.PbFieldType.PM, subBuilder: $0.PkRoomInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  S_PKRoomList clone() => S_PKRoomList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  S_PKRoomList copyWith(void Function(S_PKRoomList) updates) => super.copyWith((message) => updates(message as S_PKRoomList)) as S_PKRoomList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static S_PKRoomList create() => S_PKRoomList._();
  S_PKRoomList createEmptyInstance() => create();
  static $pb.PbList<S_PKRoomList> createRepeated() => $pb.PbList<S_PKRoomList>();
  @$core.pragma('dart2js:noInline')
  static S_PKRoomList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<S_PKRoomList>(create);
  static S_PKRoomList? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<$0.PkRoomInfo> get roomList => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
