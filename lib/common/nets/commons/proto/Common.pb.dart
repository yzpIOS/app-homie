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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'Common.pbenum.dart';

export 'Common.pbenum.dart';

class AttrVO extends $pb.GeneratedMessage {
  factory AttrVO() => create();
  AttrVO._() : super();
  factory AttrVO.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AttrVO.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AttrVO', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..e<AttrCode>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: AttrCode.none, valueOf: AttrCode.valueOf, enumValues: AttrCode.values)
    ..aInt64(2, _omitFieldNames ? '' : 'val')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AttrVO clone() => AttrVO()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AttrVO copyWith(void Function(AttrVO) updates) => super.copyWith((message) => updates(message as AttrVO)) as AttrVO;

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
  factory KV32() => create();
  KV32._() : super();
  factory KV32.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KV32.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'KV32', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'key', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'val', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KV32 clone() => KV32()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KV32 copyWith(void Function(KV32) updates) => super.copyWith((message) => updates(message as KV32)) as KV32;

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
  factory KV64() => create();
  KV64._() : super();
  factory KV64.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KV64.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'KV64', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'key', $pb.PbFieldType.O3)
    ..aInt64(2, _omitFieldNames ? '' : 'val')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KV64 clone() => KV64()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KV64 copyWith(void Function(KV64) updates) => super.copyWith((message) => updates(message as KV64)) as KV64;

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
  factory KVStr() => create();
  KVStr._() : super();
  factory KVStr.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KVStr.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'KVStr', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'key', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'val')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KVStr clone() => KVStr()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KVStr copyWith(void Function(KVStr) updates) => super.copyWith((message) => updates(message as KVStr)) as KVStr;

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
  factory SuitVO() => create();
  SuitVO._() : super();
  factory SuitVO.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SuitVO.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SuitVO', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'positionId', protoName: 'positionId')
    ..aInt64(2, _omitFieldNames ? '' : 'goodsId', protoName: 'goodsId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SuitVO clone() => SuitVO()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SuitVO copyWith(void Function(SuitVO) updates) => super.copyWith((message) => updates(message as SuitVO)) as SuitVO;

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
  factory KVState() => create();
  KVState._() : super();
  factory KVState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KVState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'KVState', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roleId', protoName: 'roleId')
    ..aOS(2, _omitFieldNames ? '' : 'state')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KVState clone() => KVState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KVState copyWith(void Function(KVState) updates) => super.copyWith((message) => updates(message as KVState)) as KVState;

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
  factory AttrInfo() => create();
  AttrInfo._() : super();
  factory AttrInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AttrInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AttrInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..pc<AttrVO>(1, _omitFieldNames ? '' : 'attrs', $pb.PbFieldType.PM, subBuilder: AttrVO.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AttrInfo clone() => AttrInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AttrInfo copyWith(void Function(AttrInfo) updates) => super.copyWith((message) => updates(message as AttrInfo)) as AttrInfo;

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
  factory SuitInfo() => create();
  SuitInfo._() : super();
  factory SuitInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SuitInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SuitInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..pc<SuitVO>(1, _omitFieldNames ? '' : 'suits', $pb.PbFieldType.PM, subBuilder: SuitVO.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SuitInfo clone() => SuitInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SuitInfo copyWith(void Function(SuitInfo) updates) => super.copyWith((message) => updates(message as SuitInfo)) as SuitInfo;

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
  factory StateInfo() => create();
  StateInfo._() : super();
  factory StateInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StateInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StateInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..e<State>(2, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: State.None, valueOf: State.valueOf, enumValues: State.values)
    ..aOM<XYZ>(3, _omitFieldNames ? '' : 'xyz', subBuilder: XYZ.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'r', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StateInfo clone() => StateInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StateInfo copyWith(void Function(StateInfo) updates) => super.copyWith((message) => updates(message as StateInfo)) as StateInfo;

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
  factory XYZ() => create();
  XYZ._() : super();
  factory XYZ.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory XYZ.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'XYZ', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'x', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'y', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'z', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  XYZ clone() => XYZ()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  XYZ copyWith(void Function(XYZ) updates) => super.copyWith((message) => updates(message as XYZ)) as XYZ;

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
  factory RoleInfo() => create();
  RoleInfo._() : super();
  factory RoleInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoleInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoleInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roleId', protoName: 'roleId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'mark', $pb.PbFieldType.O3)
    ..aOM<AttrInfo>(4, _omitFieldNames ? '' : 'attrInfo', protoName: 'attrInfo', subBuilder: AttrInfo.create)
    ..aOM<SuitInfo>(5, _omitFieldNames ? '' : 'suitInfo', protoName: 'suitInfo', subBuilder: SuitInfo.create)
    ..e<State>(6, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: State.None, valueOf: State.valueOf, enumValues: State.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoleInfo clone() => RoleInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoleInfo copyWith(void Function(RoleInfo) updates) => super.copyWith((message) => updates(message as RoleInfo)) as RoleInfo;

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
  factory RoleDetailInfo() => create();
  RoleDetailInfo._() : super();
  factory RoleDetailInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoleDetailInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoleDetailInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roleId', protoName: 'roleId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOM<AttrInfo>(3, _omitFieldNames ? '' : 'attrInfo', protoName: 'attrInfo', subBuilder: AttrInfo.create)
    ..aOM<SuitInfo>(4, _omitFieldNames ? '' : 'suitInfo', protoName: 'suitInfo', subBuilder: SuitInfo.create)
    ..e<State>(5, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: State.None, valueOf: State.valueOf, enumValues: State.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoleDetailInfo clone() => RoleDetailInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoleDetailInfo copyWith(void Function(RoleDetailInfo) updates) => super.copyWith((message) => updates(message as RoleDetailInfo)) as RoleDetailInfo;

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
  factory RoleSceneInfo() => create();
  RoleSceneInfo._() : super();
  factory RoleSceneInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoleSceneInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoleSceneInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roleId', protoName: 'roleId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOM<AttrInfo>(3, _omitFieldNames ? '' : 'attrInfo', protoName: 'attrInfo', subBuilder: AttrInfo.create)
    ..aOM<SuitInfo>(4, _omitFieldNames ? '' : 'suitInfo', protoName: 'suitInfo', subBuilder: SuitInfo.create)
    ..aOM<StateInfo>(5, _omitFieldNames ? '' : 'stateInfo', protoName: 'stateInfo', subBuilder: StateInfo.create)
    ..aOS(6, _omitFieldNames ? '' : 'seatGuid', protoName: 'seatGuid')
    ..aInt64(7, _omitFieldNames ? '' : 'roomId', protoName: 'roomId')
    ..aOS(8, _omitFieldNames ? '' : 'uid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoleSceneInfo clone() => RoleSceneInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoleSceneInfo copyWith(void Function(RoleSceneInfo) updates) => super.copyWith((message) => updates(message as RoleSceneInfo)) as RoleSceneInfo;

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

  @$pb.TagNumber(6)
  $core.String get seatGuid => $_getSZ(5);
  @$pb.TagNumber(6)
  set seatGuid($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSeatGuid() => $_has(5);
  @$pb.TagNumber(6)
  void clearSeatGuid() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get roomId => $_getI64(6);
  @$pb.TagNumber(7)
  set roomId($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRoomId() => $_has(6);
  @$pb.TagNumber(7)
  void clearRoomId() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get uid => $_getSZ(7);
  @$pb.TagNumber(8)
  set uid($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasUid() => $_has(7);
  @$pb.TagNumber(8)
  void clearUid() => clearField(8);
}

class RoleData extends $pb.GeneratedMessage {
  factory RoleData() => create();
  RoleData._() : super();
  factory RoleData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoleData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoleData', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOM<AttrInfo>(2, _omitFieldNames ? '' : 'attrInfo', protoName: 'attrInfo', subBuilder: AttrInfo.create)
    ..aOM<SuitInfo>(3, _omitFieldNames ? '' : 'suitInfo', protoName: 'suitInfo', subBuilder: SuitInfo.create)
    ..aOM<StateInfo>(4, _omitFieldNames ? '' : 'stateInfo', protoName: 'stateInfo', subBuilder: StateInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoleData clone() => RoleData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoleData copyWith(void Function(RoleData) updates) => super.copyWith((message) => updates(message as RoleData)) as RoleData;

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

class UserInfo extends $pb.GeneratedMessage {
  factory UserInfo() => create();
  UserInfo._() : super();
  factory UserInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uid')
    ..aInt64(2, _omitFieldNames ? '' : 'roleId')
    ..aOS(3, _omitFieldNames ? '' : 'username')
    ..aOS(4, _omitFieldNames ? '' : 'avatarUrl')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'type', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'adminType', $pb.PbFieldType.O3)
    ..aOS(7, _omitFieldNames ? '' : 'level')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserInfo clone() => UserInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserInfo copyWith(void Function(UserInfo) updates) => super.copyWith((message) => updates(message as UserInfo)) as UserInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserInfo create() => UserInfo._();
  UserInfo createEmptyInstance() => create();
  static $pb.PbList<UserInfo> createRepeated() => $pb.PbList<UserInfo>();
  @$core.pragma('dart2js:noInline')
  static UserInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserInfo>(create);
  static UserInfo? _defaultInstance;

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
  $core.String get username => $_getSZ(2);
  @$pb.TagNumber(3)
  set username($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUsername() => $_has(2);
  @$pb.TagNumber(3)
  void clearUsername() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get avatarUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set avatarUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAvatarUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearAvatarUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get type => $_getIZ(4);
  @$pb.TagNumber(5)
  set type($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get adminType => $_getIZ(5);
  @$pb.TagNumber(6)
  set adminType($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAdminType() => $_has(5);
  @$pb.TagNumber(6)
  void clearAdminType() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get level => $_getSZ(6);
  @$pb.TagNumber(7)
  set level($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLevel() => $_has(6);
  @$pb.TagNumber(7)
  void clearLevel() => clearField(7);
}

class MikeInfo extends $pb.GeneratedMessage {
  factory MikeInfo() => create();
  MikeInfo._() : super();
  factory MikeInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MikeInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MikeInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aInt64(2, _omitFieldNames ? '' : 'mikeId')
    ..aOS(3, _omitFieldNames ? '' : 'mikeNo')
    ..aOS(4, _omitFieldNames ? '' : 'uid')
    ..aInt64(6, _omitFieldNames ? '' : 'roleId')
    ..aInt64(7, _omitFieldNames ? '' : 'number')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MikeInfo clone() => MikeInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MikeInfo copyWith(void Function(MikeInfo) updates) => super.copyWith((message) => updates(message as MikeInfo)) as MikeInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MikeInfo create() => MikeInfo._();
  MikeInfo createEmptyInstance() => create();
  static $pb.PbList<MikeInfo> createRepeated() => $pb.PbList<MikeInfo>();
  @$core.pragma('dart2js:noInline')
  static MikeInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MikeInfo>(create);
  static MikeInfo? _defaultInstance;

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
  $core.String get uid => $_getSZ(3);
  @$pb.TagNumber(4)
  set uid($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearUid() => clearField(4);

  @$pb.TagNumber(6)
  $fixnum.Int64 get roleId => $_getI64(4);
  @$pb.TagNumber(6)
  set roleId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasRoleId() => $_has(4);
  @$pb.TagNumber(6)
  void clearRoleId() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get number => $_getI64(5);
  @$pb.TagNumber(7)
  set number($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasNumber() => $_has(5);
  @$pb.TagNumber(7)
  void clearNumber() => clearField(7);
}

class PKGuildInfo extends $pb.GeneratedMessage {
  factory PKGuildInfo() => create();
  PKGuildInfo._() : super();
  factory PKGuildInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PKGuildInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PKGuildInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'guildId', protoName: 'guildId')
    ..aOS(2, _omitFieldNames ? '' : 'guildName', protoName: 'guildName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PKGuildInfo clone() => PKGuildInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PKGuildInfo copyWith(void Function(PKGuildInfo) updates) => super.copyWith((message) => updates(message as PKGuildInfo)) as PKGuildInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PKGuildInfo create() => PKGuildInfo._();
  PKGuildInfo createEmptyInstance() => create();
  static $pb.PbList<PKGuildInfo> createRepeated() => $pb.PbList<PKGuildInfo>();
  @$core.pragma('dart2js:noInline')
  static PKGuildInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PKGuildInfo>(create);
  static PKGuildInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get guildId => $_getI64(0);
  @$pb.TagNumber(1)
  set guildId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGuildId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGuildId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get guildName => $_getSZ(1);
  @$pb.TagNumber(2)
  set guildName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGuildName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGuildName() => clearField(2);
}

class PKUserInfo extends $pb.GeneratedMessage {
  factory PKUserInfo() => create();
  PKUserInfo._() : super();
  factory PKUserInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PKUserInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PKUserInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aInt64(2, _omitFieldNames ? '' : 'gender')
    ..aOS(3, _omitFieldNames ? '' : 'userName', protoName: 'userName')
    ..aInt64(4, _omitFieldNames ? '' : 'guildId', protoName: 'guildId')
    ..aOB(5, _omitFieldNames ? '' : 'isManager', protoName: 'isManager')
    ..aOS(6, _omitFieldNames ? '' : 'avatarUrl', protoName: 'avatarUrl')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'mikeId', $pb.PbFieldType.O3, protoName: 'mikeId')
    ..p<$fixnum.Int64>(8, _omitFieldNames ? '' : 'clothingIds', $pb.PbFieldType.K6, protoName: 'clothingIds')
    ..aInt64(9, _omitFieldNames ? '' : 'pkRoomId', protoName: 'pkRoomId')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'BattleStatus', $pb.PbFieldType.O3, protoName: 'BattleStatus')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PKUserInfo clone() => PKUserInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PKUserInfo copyWith(void Function(PKUserInfo) updates) => super.copyWith((message) => updates(message as PKUserInfo)) as PKUserInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PKUserInfo create() => PKUserInfo._();
  PKUserInfo createEmptyInstance() => create();
  static $pb.PbList<PKUserInfo> createRepeated() => $pb.PbList<PKUserInfo>();
  @$core.pragma('dart2js:noInline')
  static PKUserInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PKUserInfo>(create);
  static PKUserInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get gender => $_getI64(1);
  @$pb.TagNumber(2)
  set gender($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGender() => $_has(1);
  @$pb.TagNumber(2)
  void clearGender() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userName => $_getSZ(2);
  @$pb.TagNumber(3)
  set userName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserName() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserName() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get guildId => $_getI64(3);
  @$pb.TagNumber(4)
  set guildId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGuildId() => $_has(3);
  @$pb.TagNumber(4)
  void clearGuildId() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isManager => $_getBF(4);
  @$pb.TagNumber(5)
  set isManager($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsManager() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsManager() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get avatarUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set avatarUrl($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAvatarUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearAvatarUrl() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get mikeId => $_getIZ(6);
  @$pb.TagNumber(7)
  set mikeId($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMikeId() => $_has(6);
  @$pb.TagNumber(7)
  void clearMikeId() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<$fixnum.Int64> get clothingIds => $_getList(7);

  @$pb.TagNumber(9)
  $fixnum.Int64 get pkRoomId => $_getI64(8);
  @$pb.TagNumber(9)
  set pkRoomId($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPkRoomId() => $_has(8);
  @$pb.TagNumber(9)
  void clearPkRoomId() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get battleStatus => $_getIZ(9);
  @$pb.TagNumber(10)
  set battleStatus($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasBattleStatus() => $_has(9);
  @$pb.TagNumber(10)
  void clearBattleStatus() => clearField(10);
}

class PKRoleBattleInfoLF extends $pb.GeneratedMessage {
  factory PKRoleBattleInfoLF() => create();
  PKRoleBattleInfoLF._() : super();
  factory PKRoleBattleInfoLF.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PKRoleBattleInfoLF.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PKRoleBattleInfoLF', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'currentBlood', $pb.PbFieldType.O3, protoName: 'currentBlood')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'totalBlood', $pb.PbFieldType.O3, protoName: 'totalBlood')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'shield', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'attack', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'speed', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'swordCount', $pb.PbFieldType.O3, protoName: 'swordCount')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PKRoleBattleInfoLF clone() => PKRoleBattleInfoLF()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PKRoleBattleInfoLF copyWith(void Function(PKRoleBattleInfoLF) updates) => super.copyWith((message) => updates(message as PKRoleBattleInfoLF)) as PKRoleBattleInfoLF;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PKRoleBattleInfoLF create() => PKRoleBattleInfoLF._();
  PKRoleBattleInfoLF createEmptyInstance() => create();
  static $pb.PbList<PKRoleBattleInfoLF> createRepeated() => $pb.PbList<PKRoleBattleInfoLF>();
  @$core.pragma('dart2js:noInline')
  static PKRoleBattleInfoLF getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PKRoleBattleInfoLF>(create);
  static PKRoleBattleInfoLF? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get currentBlood => $_getIZ(1);
  @$pb.TagNumber(2)
  set currentBlood($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurrentBlood() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentBlood() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get totalBlood => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalBlood($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTotalBlood() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalBlood() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get shield => $_getIZ(3);
  @$pb.TagNumber(4)
  set shield($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasShield() => $_has(3);
  @$pb.TagNumber(4)
  void clearShield() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get attack => $_getIZ(4);
  @$pb.TagNumber(5)
  set attack($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAttack() => $_has(4);
  @$pb.TagNumber(5)
  void clearAttack() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get speed => $_getIZ(5);
  @$pb.TagNumber(6)
  set speed($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSpeed() => $_has(5);
  @$pb.TagNumber(6)
  void clearSpeed() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get swordCount => $_getIZ(6);
  @$pb.TagNumber(7)
  set swordCount($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSwordCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearSwordCount() => clearField(7);
}

class PKRoleBattleInfoHF extends $pb.GeneratedMessage {
  factory PKRoleBattleInfoHF() => create();
  PKRoleBattleInfoHF._() : super();
  factory PKRoleBattleInfoHF.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PKRoleBattleInfoHF.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PKRoleBattleInfoHF', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOM<XYZ>(2, _omitFieldNames ? '' : 'position', subBuilder: XYZ.create)
    ..aInt64(3, _omitFieldNames ? '' : 'rotation')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PKRoleBattleInfoHF clone() => PKRoleBattleInfoHF()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PKRoleBattleInfoHF copyWith(void Function(PKRoleBattleInfoHF) updates) => super.copyWith((message) => updates(message as PKRoleBattleInfoHF)) as PKRoleBattleInfoHF;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PKRoleBattleInfoHF create() => PKRoleBattleInfoHF._();
  PKRoleBattleInfoHF createEmptyInstance() => create();
  static $pb.PbList<PKRoleBattleInfoHF> createRepeated() => $pb.PbList<PKRoleBattleInfoHF>();
  @$core.pragma('dart2js:noInline')
  static PKRoleBattleInfoHF getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PKRoleBattleInfoHF>(create);
  static PKRoleBattleInfoHF? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  XYZ get position => $_getN(1);
  @$pb.TagNumber(2)
  set position(XYZ v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => clearField(2);
  @$pb.TagNumber(2)
  XYZ ensurePosition() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get rotation => $_getI64(2);
  @$pb.TagNumber(3)
  set rotation($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRotation() => $_has(2);
  @$pb.TagNumber(3)
  void clearRotation() => clearField(3);
}

class PKRoleSummary extends $pb.GeneratedMessage {
  factory PKRoleSummary() => create();
  PKRoleSummary._() : super();
  factory PKRoleSummary.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PKRoleSummary.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PKRoleSummary', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'totalDamage', $pb.PbFieldType.O3, protoName: 'totalDamage')
    ..aInt64(3, _omitFieldNames ? '' : 'survivedTime', protoName: 'survivedTime')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'attackedCount', $pb.PbFieldType.O3, protoName: 'attackedCount')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'outBlood', $pb.PbFieldType.O3, protoName: 'outBlood')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PKRoleSummary clone() => PKRoleSummary()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PKRoleSummary copyWith(void Function(PKRoleSummary) updates) => super.copyWith((message) => updates(message as PKRoleSummary)) as PKRoleSummary;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PKRoleSummary create() => PKRoleSummary._();
  PKRoleSummary createEmptyInstance() => create();
  static $pb.PbList<PKRoleSummary> createRepeated() => $pb.PbList<PKRoleSummary>();
  @$core.pragma('dart2js:noInline')
  static PKRoleSummary getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PKRoleSummary>(create);
  static PKRoleSummary? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get totalDamage => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalDamage($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalDamage() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalDamage() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get survivedTime => $_getI64(2);
  @$pb.TagNumber(3)
  set survivedTime($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSurvivedTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearSurvivedTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get attackedCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set attackedCount($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAttackedCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAttackedCount() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get outBlood => $_getIZ(4);
  @$pb.TagNumber(5)
  set outBlood($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOutBlood() => $_has(4);
  @$pb.TagNumber(5)
  void clearOutBlood() => clearField(5);
}

class PKPresenterInfo extends $pb.GeneratedMessage {
  factory PKPresenterInfo() => create();
  PKPresenterInfo._() : super();
  factory PKPresenterInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PKPresenterInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PKPresenterInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'userName', protoName: 'userName')
    ..aOS(3, _omitFieldNames ? '' : 'avatarUrl', protoName: 'avatarUrl')
    ..aInt64(4, _omitFieldNames ? '' : 'guildId', protoName: 'guildId')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'contribution', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PKPresenterInfo clone() => PKPresenterInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PKPresenterInfo copyWith(void Function(PKPresenterInfo) updates) => super.copyWith((message) => updates(message as PKPresenterInfo)) as PKPresenterInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PKPresenterInfo create() => PKPresenterInfo._();
  PKPresenterInfo createEmptyInstance() => create();
  static $pb.PbList<PKPresenterInfo> createRepeated() => $pb.PbList<PKPresenterInfo>();
  @$core.pragma('dart2js:noInline')
  static PKPresenterInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PKPresenterInfo>(create);
  static PKPresenterInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userName => $_getSZ(1);
  @$pb.TagNumber(2)
  set userName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserName() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatarUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatarUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAvatarUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatarUrl() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get guildId => $_getI64(3);
  @$pb.TagNumber(4)
  set guildId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGuildId() => $_has(3);
  @$pb.TagNumber(4)
  void clearGuildId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get contribution => $_getIZ(4);
  @$pb.TagNumber(5)
  set contribution($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasContribution() => $_has(4);
  @$pb.TagNumber(5)
  void clearContribution() => clearField(5);
}

class PKGift extends $pb.GeneratedMessage {
  factory PKGift() => create();
  PKGift._() : super();
  factory PKGift.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PKGift.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PKGift', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'giftId', protoName: 'giftId')
    ..aOM<XYZ>(2, _omitFieldNames ? '' : 'position', subBuilder: XYZ.create)
    ..e<PKGiftState>(3, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: PKGiftState.Available, valueOf: PKGiftState.valueOf, enumValues: PKGiftState.values)
    ..aOS(4, _omitFieldNames ? '' : 'modelId', protoName: 'modelId')
    ..aInt64(6, _omitFieldNames ? '' : 'pickUserId', protoName: 'pickUserId')
    ..aInt64(7, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PKGift clone() => PKGift()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PKGift copyWith(void Function(PKGift) updates) => super.copyWith((message) => updates(message as PKGift)) as PKGift;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PKGift create() => PKGift._();
  PKGift createEmptyInstance() => create();
  static $pb.PbList<PKGift> createRepeated() => $pb.PbList<PKGift>();
  @$core.pragma('dart2js:noInline')
  static PKGift getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PKGift>(create);
  static PKGift? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get giftId => $_getI64(0);
  @$pb.TagNumber(1)
  set giftId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftId() => clearField(1);

  @$pb.TagNumber(2)
  XYZ get position => $_getN(1);
  @$pb.TagNumber(2)
  set position(XYZ v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => clearField(2);
  @$pb.TagNumber(2)
  XYZ ensurePosition() => $_ensure(1);

  @$pb.TagNumber(3)
  PKGiftState get state => $_getN(2);
  @$pb.TagNumber(3)
  set state(PKGiftState v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasState() => $_has(2);
  @$pb.TagNumber(3)
  void clearState() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get modelId => $_getSZ(3);
  @$pb.TagNumber(4)
  set modelId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasModelId() => $_has(3);
  @$pb.TagNumber(4)
  void clearModelId() => clearField(4);

  @$pb.TagNumber(6)
  $fixnum.Int64 get pickUserId => $_getI64(4);
  @$pb.TagNumber(6)
  set pickUserId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasPickUserId() => $_has(4);
  @$pb.TagNumber(6)
  void clearPickUserId() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get id => $_getI64(5);
  @$pb.TagNumber(7)
  set id($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasId() => $_has(5);
  @$pb.TagNumber(7)
  void clearId() => clearField(7);
}

class PKSceneToxic extends $pb.GeneratedMessage {
  factory PKSceneToxic() => create();
  PKSceneToxic._() : super();
  factory PKSceneToxic.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PKSceneToxic.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PKSceneToxic', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'safeRadius', $pb.PbFieldType.O3, protoName: 'safeRadius')
    ..aInt64(2, _omitFieldNames ? '' : 'takeEffectTime', protoName: 'takeEffectTime')
    ..aOM<XYZ>(3, _omitFieldNames ? '' : 'safePosition', protoName: 'safePosition', subBuilder: XYZ.create)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'toxicFogSpeed', $pb.PbFieldType.O3, protoName: 'toxicFogSpeed')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PKSceneToxic clone() => PKSceneToxic()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PKSceneToxic copyWith(void Function(PKSceneToxic) updates) => super.copyWith((message) => updates(message as PKSceneToxic)) as PKSceneToxic;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PKSceneToxic create() => PKSceneToxic._();
  PKSceneToxic createEmptyInstance() => create();
  static $pb.PbList<PKSceneToxic> createRepeated() => $pb.PbList<PKSceneToxic>();
  @$core.pragma('dart2js:noInline')
  static PKSceneToxic getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PKSceneToxic>(create);
  static PKSceneToxic? _defaultInstance;

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
  XYZ get safePosition => $_getN(2);
  @$pb.TagNumber(3)
  set safePosition(XYZ v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSafePosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearSafePosition() => clearField(3);
  @$pb.TagNumber(3)
  XYZ ensureSafePosition() => $_ensure(2);

  @$pb.TagNumber(5)
  $core.int get toxicFogSpeed => $_getIZ(3);
  @$pb.TagNumber(5)
  set toxicFogSpeed($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasToxicFogSpeed() => $_has(3);
  @$pb.TagNumber(5)
  void clearToxicFogSpeed() => clearField(5);
}

class PkRoomInfo extends $pb.GeneratedMessage {
  factory PkRoomInfo() => create();
  PkRoomInfo._() : super();
  factory PkRoomInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PkRoomInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PkRoomInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'roomName')
    ..aOS(3, _omitFieldNames ? '' : 'roomImage')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'hotValue', $pb.PbFieldType.O3)
    ..aOB(5, _omitFieldNames ? '' : 'isInvite')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PkRoomInfo clone() => PkRoomInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PkRoomInfo copyWith(void Function(PkRoomInfo) updates) => super.copyWith((message) => updates(message as PkRoomInfo)) as PkRoomInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PkRoomInfo create() => PkRoomInfo._();
  PkRoomInfo createEmptyInstance() => create();
  static $pb.PbList<PkRoomInfo> createRepeated() => $pb.PbList<PkRoomInfo>();
  @$core.pragma('dart2js:noInline')
  static PkRoomInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PkRoomInfo>(create);
  static PkRoomInfo? _defaultInstance;

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
  $core.String get roomImage => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomImage($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomImage() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get hotValue => $_getIZ(3);
  @$pb.TagNumber(4)
  set hotValue($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHotValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearHotValue() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isInvite => $_getBF(4);
  @$pb.TagNumber(5)
  set isInvite($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsInvite() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsInvite() => clearField(5);
}

class PkRoleDefaultConfiguration extends $pb.GeneratedMessage {
  factory PkRoleDefaultConfiguration() => create();
  PkRoleDefaultConfiguration._() : super();
  factory PkRoleDefaultConfiguration.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PkRoleDefaultConfiguration.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PkRoleDefaultConfiguration', package: const $pb.PackageName(_omitMessageNames ? '' : 'com.savvy.proto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'roleRadius', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'speed', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'weaponLength', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'weaponSpeed', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'maxWeaponNum', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'blood', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'TotalBlood', $pb.PbFieldType.O3, protoName: 'TotalBlood')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'Shield', $pb.PbFieldType.O3, protoName: 'Shield')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'Attack', $pb.PbFieldType.O3, protoName: 'Attack')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'countdown', $pb.PbFieldType.O3)
    ..a<$core.int>(11, _omitFieldNames ? '' : 'swordCount', $pb.PbFieldType.O3)
    ..a<$core.int>(12, _omitFieldNames ? '' : 'maxSpeed', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PkRoleDefaultConfiguration clone() => PkRoleDefaultConfiguration()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PkRoleDefaultConfiguration copyWith(void Function(PkRoleDefaultConfiguration) updates) => super.copyWith((message) => updates(message as PkRoleDefaultConfiguration)) as PkRoleDefaultConfiguration;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PkRoleDefaultConfiguration create() => PkRoleDefaultConfiguration._();
  PkRoleDefaultConfiguration createEmptyInstance() => create();
  static $pb.PbList<PkRoleDefaultConfiguration> createRepeated() => $pb.PbList<PkRoleDefaultConfiguration>();
  @$core.pragma('dart2js:noInline')
  static PkRoleDefaultConfiguration getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PkRoleDefaultConfiguration>(create);
  static PkRoleDefaultConfiguration? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get roleRadius => $_getIZ(0);
  @$pb.TagNumber(1)
  set roleRadius($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoleRadius() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoleRadius() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get speed => $_getIZ(1);
  @$pb.TagNumber(2)
  set speed($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSpeed() => $_has(1);
  @$pb.TagNumber(2)
  void clearSpeed() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get weaponLength => $_getIZ(2);
  @$pb.TagNumber(3)
  set weaponLength($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWeaponLength() => $_has(2);
  @$pb.TagNumber(3)
  void clearWeaponLength() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get weaponSpeed => $_getIZ(3);
  @$pb.TagNumber(4)
  set weaponSpeed($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasWeaponSpeed() => $_has(3);
  @$pb.TagNumber(4)
  void clearWeaponSpeed() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get maxWeaponNum => $_getIZ(4);
  @$pb.TagNumber(5)
  set maxWeaponNum($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMaxWeaponNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxWeaponNum() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get blood => $_getIZ(5);
  @$pb.TagNumber(6)
  set blood($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasBlood() => $_has(5);
  @$pb.TagNumber(6)
  void clearBlood() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get totalBlood => $_getIZ(6);
  @$pb.TagNumber(7)
  set totalBlood($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTotalBlood() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalBlood() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get shield => $_getIZ(7);
  @$pb.TagNumber(8)
  set shield($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasShield() => $_has(7);
  @$pb.TagNumber(8)
  void clearShield() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get attack => $_getIZ(8);
  @$pb.TagNumber(9)
  set attack($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasAttack() => $_has(8);
  @$pb.TagNumber(9)
  void clearAttack() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get countdown => $_getIZ(9);
  @$pb.TagNumber(10)
  set countdown($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasCountdown() => $_has(9);
  @$pb.TagNumber(10)
  void clearCountdown() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get swordCount => $_getIZ(10);
  @$pb.TagNumber(11)
  set swordCount($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasSwordCount() => $_has(10);
  @$pb.TagNumber(11)
  void clearSwordCount() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get maxSpeed => $_getIZ(11);
  @$pb.TagNumber(12)
  set maxSpeed($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasMaxSpeed() => $_has(11);
  @$pb.TagNumber(12)
  void clearMaxSpeed() => clearField(12);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
