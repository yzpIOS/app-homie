///
//  Generated code. Do not modify.
//  source: Common.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'Common.pbenum.dart';

export 'Common.pbenum.dart';

class AttrVO extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AttrVO', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..e<AttrCode>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: AttrCode.none, valueOf: AttrCode.valueOf, enumValues: AttrCode.values)
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'val')
    ..hasRequiredFields = false
  ;

  AttrVO._() : super();
  factory AttrVO({
    AttrCode? code,
    $fixnum.Int64? val,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (val != null) {
      _result.val = val;
    }
    return _result;
  }
  factory AttrVO.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AttrVO.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AttrVO clone() => AttrVO()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AttrVO copyWith(void Function(AttrVO) updates) => super.copyWith((message) => updates(message as AttrVO)) as AttrVO; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AttrVO create() => AttrVO._();
  AttrVO createEmptyInstance() => create();
  static $pb.PbList<AttrVO> createRepeated() => $pb.PbList<AttrVO>();
  @$core.pragma('dart2js:noInline')
  static AttrVO getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AttrVO>(create);
  static AttrVO? _defaultInstance;

  @$pb.TagNumber(1)
  AttrCode get code => $_getN(0);
  @$pb.TagNumber(1)
  set code(AttrCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get val => $_getI64(1);
  @$pb.TagNumber(2)
  set val($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVal() => $_has(1);
  @$pb.TagNumber(2)
  void clearVal() => clearField(2);
}

class KV32 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'KV32', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'key', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'val', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  KV32._() : super();
  factory KV32({
    $core.int? key,
    $core.int? val,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (val != null) {
      _result.val = val;
    }
    return _result;
  }
  factory KV32.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KV32.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KV32 clone() => KV32()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KV32 copyWith(void Function(KV32) updates) => super.copyWith((message) => updates(message as KV32)) as KV32; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KV32 create() => KV32._();
  KV32 createEmptyInstance() => create();
  static $pb.PbList<KV32> createRepeated() => $pb.PbList<KV32>();
  @$core.pragma('dart2js:noInline')
  static KV32 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KV32>(create);
  static KV32? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get key => $_getIZ(0);
  @$pb.TagNumber(1)
  set key($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get val => $_getIZ(1);
  @$pb.TagNumber(2)
  set val($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVal() => $_has(1);
  @$pb.TagNumber(2)
  void clearVal() => clearField(2);
}

class KV64 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'KV64', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'key', $pb.PbFieldType.O3)
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'val')
    ..hasRequiredFields = false
  ;

  KV64._() : super();
  factory KV64({
    $core.int? key,
    $fixnum.Int64? val,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (val != null) {
      _result.val = val;
    }
    return _result;
  }
  factory KV64.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KV64.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KV64 clone() => KV64()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KV64 copyWith(void Function(KV64) updates) => super.copyWith((message) => updates(message as KV64)) as KV64; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KV64 create() => KV64._();
  KV64 createEmptyInstance() => create();
  static $pb.PbList<KV64> createRepeated() => $pb.PbList<KV64>();
  @$core.pragma('dart2js:noInline')
  static KV64 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KV64>(create);
  static KV64? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get key => $_getIZ(0);
  @$pb.TagNumber(1)
  set key($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get val => $_getI64(1);
  @$pb.TagNumber(2)
  set val($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVal() => $_has(1);
  @$pb.TagNumber(2)
  void clearVal() => clearField(2);
}

class KVStr extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'KVStr', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'key', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'val')
    ..hasRequiredFields = false
  ;

  KVStr._() : super();
  factory KVStr({
    $core.int? key,
    $core.String? val,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (val != null) {
      _result.val = val;
    }
    return _result;
  }
  factory KVStr.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KVStr.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KVStr clone() => KVStr()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KVStr copyWith(void Function(KVStr) updates) => super.copyWith((message) => updates(message as KVStr)) as KVStr; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KVStr create() => KVStr._();
  KVStr createEmptyInstance() => create();
  static $pb.PbList<KVStr> createRepeated() => $pb.PbList<KVStr>();
  @$core.pragma('dart2js:noInline')
  static KVStr getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KVStr>(create);
  static KVStr? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get key => $_getIZ(0);
  @$pb.TagNumber(1)
  set key($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get val => $_getSZ(1);
  @$pb.TagNumber(2)
  set val($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVal() => $_has(1);
  @$pb.TagNumber(2)
  void clearVal() => clearField(2);
}

class SuitVO extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SuitVO', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'positionId', protoName: 'positionId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'goodsId', protoName: 'goodsId')
    ..hasRequiredFields = false
  ;

  SuitVO._() : super();
  factory SuitVO({
    $fixnum.Int64? positionId,
    $fixnum.Int64? goodsId,
  }) {
    final _result = create();
    if (positionId != null) {
      _result.positionId = positionId;
    }
    if (goodsId != null) {
      _result.goodsId = goodsId;
    }
    return _result;
  }
  factory SuitVO.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SuitVO.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SuitVO clone() => SuitVO()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SuitVO copyWith(void Function(SuitVO) updates) => super.copyWith((message) => updates(message as SuitVO)) as SuitVO; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuitVO create() => SuitVO._();
  SuitVO createEmptyInstance() => create();
  static $pb.PbList<SuitVO> createRepeated() => $pb.PbList<SuitVO>();
  @$core.pragma('dart2js:noInline')
  static SuitVO getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SuitVO>(create);
  static SuitVO? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get positionId => $_getI64(0);
  @$pb.TagNumber(1)
  set positionId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPositionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPositionId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get goodsId => $_getI64(1);
  @$pb.TagNumber(2)
  set goodsId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGoodsId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGoodsId() => clearField(2);
}

class KVState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'KVState', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId', protoName: 'roleId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state')
    ..hasRequiredFields = false
  ;

  KVState._() : super();
  factory KVState({
    $fixnum.Int64? roleId,
    $core.String? state,
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
  factory KVState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KVState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KVState clone() => KVState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KVState copyWith(void Function(KVState) updates) => super.copyWith((message) => updates(message as KVState)) as KVState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KVState create() => KVState._();
  KVState createEmptyInstance() => create();
  static $pb.PbList<KVState> createRepeated() => $pb.PbList<KVState>();
  @$core.pragma('dart2js:noInline')
  static KVState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KVState>(create);
  static KVState? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roleId => $_getI64(0);
  @$pb.TagNumber(1)
  set roleId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoleId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get state => $_getSZ(1);
  @$pb.TagNumber(2)
  set state($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);
}

class AttrInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AttrInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..pc<AttrVO>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attrs', $pb.PbFieldType.PM, subBuilder: AttrVO.create)
    ..hasRequiredFields = false
  ;

  AttrInfo._() : super();
  factory AttrInfo({
    $core.Iterable<AttrVO>? attrs,
  }) {
    final _result = create();
    if (attrs != null) {
      _result.attrs.addAll(attrs);
    }
    return _result;
  }
  factory AttrInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AttrInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AttrInfo clone() => AttrInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AttrInfo copyWith(void Function(AttrInfo) updates) => super.copyWith((message) => updates(message as AttrInfo)) as AttrInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AttrInfo create() => AttrInfo._();
  AttrInfo createEmptyInstance() => create();
  static $pb.PbList<AttrInfo> createRepeated() => $pb.PbList<AttrInfo>();
  @$core.pragma('dart2js:noInline')
  static AttrInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AttrInfo>(create);
  static AttrInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AttrVO> get attrs => $_getList(0);
}

class SuitInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SuitInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..pc<SuitVO>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'suits', $pb.PbFieldType.PM, subBuilder: SuitVO.create)
    ..hasRequiredFields = false
  ;

  SuitInfo._() : super();
  factory SuitInfo({
    $core.Iterable<SuitVO>? suits,
  }) {
    final _result = create();
    if (suits != null) {
      _result.suits.addAll(suits);
    }
    return _result;
  }
  factory SuitInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SuitInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SuitInfo clone() => SuitInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SuitInfo copyWith(void Function(SuitInfo) updates) => super.copyWith((message) => updates(message as SuitInfo)) as SuitInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuitInfo create() => SuitInfo._();
  SuitInfo createEmptyInstance() => create();
  static $pb.PbList<SuitInfo> createRepeated() => $pb.PbList<SuitInfo>();
  @$core.pragma('dart2js:noInline')
  static SuitInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SuitInfo>(create);
  static SuitInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SuitVO> get suits => $_getList(0);
}

class StateInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StateInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..e<State>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: State.None, valueOf: State.valueOf, enumValues: State.values)
    ..aOM<XYZ>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'xyz', subBuilder: XYZ.create)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  StateInfo._() : super();
  factory StateInfo({
    $fixnum.Int64? id,
    State? state,
    XYZ? xyz,
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
  factory StateInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StateInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StateInfo clone() => StateInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StateInfo copyWith(void Function(StateInfo) updates) => super.copyWith((message) => updates(message as StateInfo)) as StateInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StateInfo create() => StateInfo._();
  StateInfo createEmptyInstance() => create();
  static $pb.PbList<StateInfo> createRepeated() => $pb.PbList<StateInfo>();
  @$core.pragma('dart2js:noInline')
  static StateInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StateInfo>(create);
  static StateInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  State get state => $_getN(1);
  @$pb.TagNumber(2)
  set state(State v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);

  @$pb.TagNumber(3)
  XYZ get xyz => $_getN(2);
  @$pb.TagNumber(3)
  set xyz(XYZ v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasXyz() => $_has(2);
  @$pb.TagNumber(3)
  void clearXyz() => clearField(3);
  @$pb.TagNumber(3)
  XYZ ensureXyz() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get r => $_getIZ(3);
  @$pb.TagNumber(4)
  set r($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasR() => $_has(3);
  @$pb.TagNumber(4)
  void clearR() => clearField(4);
}

class XYZ extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'XYZ', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'x', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'y', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'z', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  XYZ._() : super();
  factory XYZ({
    $core.int? x,
    $core.int? y,
    $core.int? z,
  }) {
    final _result = create();
    if (x != null) {
      _result.x = x;
    }
    if (y != null) {
      _result.y = y;
    }
    if (z != null) {
      _result.z = z;
    }
    return _result;
  }
  factory XYZ.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory XYZ.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  XYZ clone() => XYZ()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  XYZ copyWith(void Function(XYZ) updates) => super.copyWith((message) => updates(message as XYZ)) as XYZ; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static XYZ create() => XYZ._();
  XYZ createEmptyInstance() => create();
  static $pb.PbList<XYZ> createRepeated() => $pb.PbList<XYZ>();
  @$core.pragma('dart2js:noInline')
  static XYZ getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<XYZ>(create);
  static XYZ? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get x => $_getIZ(0);
  @$pb.TagNumber(1)
  set x($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get y => $_getIZ(1);
  @$pb.TagNumber(2)
  set y($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get z => $_getIZ(2);
  @$pb.TagNumber(3)
  set z($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasZ() => $_has(2);
  @$pb.TagNumber(3)
  void clearZ() => clearField(3);
}

class RoleInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RoleInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId', protoName: 'roleId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mark', $pb.PbFieldType.O3)
    ..aOM<AttrInfo>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attrInfo', protoName: 'attrInfo', subBuilder: AttrInfo.create)
    ..aOM<SuitInfo>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'suitInfo', protoName: 'suitInfo', subBuilder: SuitInfo.create)
    ..e<State>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: State.None, valueOf: State.valueOf, enumValues: State.values)
    ..hasRequiredFields = false
  ;

  RoleInfo._() : super();
  factory RoleInfo({
    $fixnum.Int64? roleId,
    $core.String? name,
    $core.int? mark,
    AttrInfo? attrInfo,
    SuitInfo? suitInfo,
    State? state,
  }) {
    final _result = create();
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (mark != null) {
      _result.mark = mark;
    }
    if (attrInfo != null) {
      _result.attrInfo = attrInfo;
    }
    if (suitInfo != null) {
      _result.suitInfo = suitInfo;
    }
    if (state != null) {
      _result.state = state;
    }
    return _result;
  }
  factory RoleInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoleInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoleInfo clone() => RoleInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoleInfo copyWith(void Function(RoleInfo) updates) => super.copyWith((message) => updates(message as RoleInfo)) as RoleInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoleInfo create() => RoleInfo._();
  RoleInfo createEmptyInstance() => create();
  static $pb.PbList<RoleInfo> createRepeated() => $pb.PbList<RoleInfo>();
  @$core.pragma('dart2js:noInline')
  static RoleInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoleInfo>(create);
  static RoleInfo? _defaultInstance;

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
  $core.int get mark => $_getIZ(2);
  @$pb.TagNumber(3)
  set mark($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMark() => $_has(2);
  @$pb.TagNumber(3)
  void clearMark() => clearField(3);

  @$pb.TagNumber(4)
  AttrInfo get attrInfo => $_getN(3);
  @$pb.TagNumber(4)
  set attrInfo(AttrInfo v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAttrInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearAttrInfo() => clearField(4);
  @$pb.TagNumber(4)
  AttrInfo ensureAttrInfo() => $_ensure(3);

  @$pb.TagNumber(5)
  SuitInfo get suitInfo => $_getN(4);
  @$pb.TagNumber(5)
  set suitInfo(SuitInfo v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasSuitInfo() => $_has(4);
  @$pb.TagNumber(5)
  void clearSuitInfo() => clearField(5);
  @$pb.TagNumber(5)
  SuitInfo ensureSuitInfo() => $_ensure(4);

  @$pb.TagNumber(6)
  State get state => $_getN(5);
  @$pb.TagNumber(6)
  set state(State v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasState() => $_has(5);
  @$pb.TagNumber(6)
  void clearState() => clearField(6);
}

class RoleDetailInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RoleDetailInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId', protoName: 'roleId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOM<AttrInfo>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attrInfo', protoName: 'attrInfo', subBuilder: AttrInfo.create)
    ..aOM<SuitInfo>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'suitInfo', protoName: 'suitInfo', subBuilder: SuitInfo.create)
    ..e<State>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: State.None, valueOf: State.valueOf, enumValues: State.values)
    ..hasRequiredFields = false
  ;

  RoleDetailInfo._() : super();
  factory RoleDetailInfo({
    $fixnum.Int64? roleId,
    $core.String? name,
    AttrInfo? attrInfo,
    SuitInfo? suitInfo,
    State? state,
  }) {
    final _result = create();
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (attrInfo != null) {
      _result.attrInfo = attrInfo;
    }
    if (suitInfo != null) {
      _result.suitInfo = suitInfo;
    }
    if (state != null) {
      _result.state = state;
    }
    return _result;
  }
  factory RoleDetailInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoleDetailInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoleDetailInfo clone() => RoleDetailInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoleDetailInfo copyWith(void Function(RoleDetailInfo) updates) => super.copyWith((message) => updates(message as RoleDetailInfo)) as RoleDetailInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoleDetailInfo create() => RoleDetailInfo._();
  RoleDetailInfo createEmptyInstance() => create();
  static $pb.PbList<RoleDetailInfo> createRepeated() => $pb.PbList<RoleDetailInfo>();
  @$core.pragma('dart2js:noInline')
  static RoleDetailInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoleDetailInfo>(create);
  static RoleDetailInfo? _defaultInstance;

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
  AttrInfo get attrInfo => $_getN(2);
  @$pb.TagNumber(3)
  set attrInfo(AttrInfo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAttrInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearAttrInfo() => clearField(3);
  @$pb.TagNumber(3)
  AttrInfo ensureAttrInfo() => $_ensure(2);

  @$pb.TagNumber(4)
  SuitInfo get suitInfo => $_getN(3);
  @$pb.TagNumber(4)
  set suitInfo(SuitInfo v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSuitInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearSuitInfo() => clearField(4);
  @$pb.TagNumber(4)
  SuitInfo ensureSuitInfo() => $_ensure(3);

  @$pb.TagNumber(5)
  State get state => $_getN(4);
  @$pb.TagNumber(5)
  set state(State v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasState() => $_has(4);
  @$pb.TagNumber(5)
  void clearState() => clearField(5);
}

class RoleSceneInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RoleSceneInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roleId', protoName: 'roleId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOM<AttrInfo>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attrInfo', protoName: 'attrInfo', subBuilder: AttrInfo.create)
    ..aOM<SuitInfo>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'suitInfo', protoName: 'suitInfo', subBuilder: SuitInfo.create)
    ..aOM<StateInfo>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stateInfo', protoName: 'stateInfo', subBuilder: StateInfo.create)
    ..hasRequiredFields = false
  ;

  RoleSceneInfo._() : super();
  factory RoleSceneInfo({
    $fixnum.Int64? roleId,
    $core.String? name,
    AttrInfo? attrInfo,
    SuitInfo? suitInfo,
    StateInfo? stateInfo,
  }) {
    final _result = create();
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (attrInfo != null) {
      _result.attrInfo = attrInfo;
    }
    if (suitInfo != null) {
      _result.suitInfo = suitInfo;
    }
    if (stateInfo != null) {
      _result.stateInfo = stateInfo;
    }
    return _result;
  }
  factory RoleSceneInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoleSceneInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoleSceneInfo clone() => RoleSceneInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoleSceneInfo copyWith(void Function(RoleSceneInfo) updates) => super.copyWith((message) => updates(message as RoleSceneInfo)) as RoleSceneInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoleSceneInfo create() => RoleSceneInfo._();
  RoleSceneInfo createEmptyInstance() => create();
  static $pb.PbList<RoleSceneInfo> createRepeated() => $pb.PbList<RoleSceneInfo>();
  @$core.pragma('dart2js:noInline')
  static RoleSceneInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoleSceneInfo>(create);
  static RoleSceneInfo? _defaultInstance;

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
  AttrInfo get attrInfo => $_getN(2);
  @$pb.TagNumber(3)
  set attrInfo(AttrInfo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAttrInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearAttrInfo() => clearField(3);
  @$pb.TagNumber(3)
  AttrInfo ensureAttrInfo() => $_ensure(2);

  @$pb.TagNumber(4)
  SuitInfo get suitInfo => $_getN(3);
  @$pb.TagNumber(4)
  set suitInfo(SuitInfo v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSuitInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearSuitInfo() => clearField(4);
  @$pb.TagNumber(4)
  SuitInfo ensureSuitInfo() => $_ensure(3);

  @$pb.TagNumber(5)
  StateInfo get stateInfo => $_getN(4);
  @$pb.TagNumber(5)
  set stateInfo(StateInfo v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasStateInfo() => $_has(4);
  @$pb.TagNumber(5)
  void clearStateInfo() => clearField(5);
  @$pb.TagNumber(5)
  StateInfo ensureStateInfo() => $_ensure(4);
}

class RoleData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RoleData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOM<AttrInfo>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attrInfo', protoName: 'attrInfo', subBuilder: AttrInfo.create)
    ..aOM<SuitInfo>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'suitInfo', protoName: 'suitInfo', subBuilder: SuitInfo.create)
    ..aOM<StateInfo>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stateInfo', protoName: 'stateInfo', subBuilder: StateInfo.create)
    ..hasRequiredFields = false
  ;

  RoleData._() : super();
  factory RoleData({
    $fixnum.Int64? id,
    AttrInfo? attrInfo,
    SuitInfo? suitInfo,
    StateInfo? stateInfo,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (attrInfo != null) {
      _result.attrInfo = attrInfo;
    }
    if (suitInfo != null) {
      _result.suitInfo = suitInfo;
    }
    if (stateInfo != null) {
      _result.stateInfo = stateInfo;
    }
    return _result;
  }
  factory RoleData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoleData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoleData clone() => RoleData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoleData copyWith(void Function(RoleData) updates) => super.copyWith((message) => updates(message as RoleData)) as RoleData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoleData create() => RoleData._();
  RoleData createEmptyInstance() => create();
  static $pb.PbList<RoleData> createRepeated() => $pb.PbList<RoleData>();
  @$core.pragma('dart2js:noInline')
  static RoleData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoleData>(create);
  static RoleData? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  AttrInfo get attrInfo => $_getN(1);
  @$pb.TagNumber(2)
  set attrInfo(AttrInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAttrInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearAttrInfo() => clearField(2);
  @$pb.TagNumber(2)
  AttrInfo ensureAttrInfo() => $_ensure(1);

  @$pb.TagNumber(3)
  SuitInfo get suitInfo => $_getN(2);
  @$pb.TagNumber(3)
  set suitInfo(SuitInfo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSuitInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuitInfo() => clearField(3);
  @$pb.TagNumber(3)
  SuitInfo ensureSuitInfo() => $_ensure(2);

  @$pb.TagNumber(4)
  StateInfo get stateInfo => $_getN(3);
  @$pb.TagNumber(4)
  set stateInfo(StateInfo v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStateInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearStateInfo() => clearField(4);
  @$pb.TagNumber(4)
  StateInfo ensureStateInfo() => $_ensure(3);
}

class SeatInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SeatInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'guid')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'canSit', protoName: 'canSit')
    ..hasRequiredFields = false
  ;

  SeatInfo._() : super();
  factory SeatInfo({
    $core.String? guid,
    $core.bool? canSit,
  }) {
    final _result = create();
    if (guid != null) {
      _result.guid = guid;
    }
    if (canSit != null) {
      _result.canSit = canSit;
    }
    return _result;
  }
  factory SeatInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SeatInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SeatInfo clone() => SeatInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SeatInfo copyWith(void Function(SeatInfo) updates) => super.copyWith((message) => updates(message as SeatInfo)) as SeatInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SeatInfo create() => SeatInfo._();
  SeatInfo createEmptyInstance() => create();
  static $pb.PbList<SeatInfo> createRepeated() => $pb.PbList<SeatInfo>();
  @$core.pragma('dart2js:noInline')
  static SeatInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SeatInfo>(create);
  static SeatInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get guid => $_getSZ(0);
  @$pb.TagNumber(1)
  set guid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearGuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get canSit => $_getBF(1);
  @$pb.TagNumber(2)
  set canSit($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCanSit() => $_has(1);
  @$pb.TagNumber(2)
  void clearCanSit() => clearField(2);
}

