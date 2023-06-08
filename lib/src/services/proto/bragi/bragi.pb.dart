///
//  Generated code. Do not modify.
//  source: bragi/bragi.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'bragi.pbenum.dart';

export 'bragi.pbenum.dart';

class Image extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Image', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'url')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'width')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'length')
    ..hasRequiredFields = false
  ;

  Image._() : super();
  factory Image({
    $core.String? url,
    $fixnum.Int64? width,
    $fixnum.Int64? length,
  }) {
    final _result = create();
    if (url != null) {
      _result.url = url;
    }
    if (width != null) {
      _result.width = width;
    }
    if (length != null) {
      _result.length = length;
    }
    return _result;
  }
  factory Image.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Image.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Image clone() => Image()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Image copyWith(void Function(Image) updates) => super.copyWith((message) => updates(message as Image)) as Image; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Image create() => Image._();
  Image createEmptyInstance() => create();
  static $pb.PbList<Image> createRepeated() => $pb.PbList<Image>();
  @$core.pragma('dart2js:noInline')
  static Image getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Image>(create);
  static Image? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get width => $_getI64(1);
  @$pb.TagNumber(2)
  set width($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasWidth() => $_has(1);
  @$pb.TagNumber(2)
  void clearWidth() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get length => $_getI64(2);
  @$pb.TagNumber(3)
  set length($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLength() => $_has(2);
  @$pb.TagNumber(3)
  void clearLength() => clearField(3);
}

class Stream extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Stream', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..e<Provider>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provider', $pb.PbFieldType.OE, defaultOrMaker: Provider.PROVIDER_UNSPECIFIED, valueOf: Provider.valueOf, enumValues: Provider.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'quality')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'baseUrl')
    ..pPS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'backupUrl')
    ..hasRequiredFields = false
  ;

  Stream._() : super();
  factory Stream({
    Provider? provider,
    $core.String? quality,
    $core.String? baseUrl,
    $core.Iterable<$core.String>? backupUrl,
  }) {
    final _result = create();
    if (provider != null) {
      _result.provider = provider;
    }
    if (quality != null) {
      _result.quality = quality;
    }
    if (baseUrl != null) {
      _result.baseUrl = baseUrl;
    }
    if (backupUrl != null) {
      _result.backupUrl.addAll(backupUrl);
    }
    return _result;
  }
  factory Stream.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Stream.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Stream clone() => Stream()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Stream copyWith(void Function(Stream) updates) => super.copyWith((message) => updates(message as Stream)) as Stream; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Stream create() => Stream._();
  Stream createEmptyInstance() => create();
  static $pb.PbList<Stream> createRepeated() => $pb.PbList<Stream>();
  @$core.pragma('dart2js:noInline')
  static Stream getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Stream>(create);
  static Stream? _defaultInstance;

  @$pb.TagNumber(1)
  Provider get provider => $_getN(0);
  @$pb.TagNumber(1)
  set provider(Provider v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasProvider() => $_has(0);
  @$pb.TagNumber(1)
  void clearProvider() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get quality => $_getSZ(1);
  @$pb.TagNumber(2)
  set quality($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasQuality() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuality() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get baseUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set baseUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBaseUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearBaseUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get backupUrl => $_getList(3);
}

class UserInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..e<Provider>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provider', $pb.PbFieldType.OE, defaultOrMaker: Provider.PROVIDER_UNSPECIFIED, valueOf: Provider.valueOf, enumValues: Provider.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  UserInfo._() : super();
  factory UserInfo({
    $core.String? id,
    Provider? provider,
    $core.String? name,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (provider != null) {
      _result.provider = provider;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory UserInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserInfo clone() => UserInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserInfo copyWith(void Function(UserInfo) updates) => super.copyWith((message) => updates(message as UserInfo)) as UserInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserInfo create() => UserInfo._();
  UserInfo createEmptyInstance() => create();
  static $pb.PbList<UserInfo> createRepeated() => $pb.PbList<UserInfo>();
  @$core.pragma('dart2js:noInline')
  static UserInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserInfo>(create);
  static UserInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  Provider get provider => $_getN(1);
  @$pb.TagNumber(2)
  set provider(Provider v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProvider() => $_has(1);
  @$pb.TagNumber(2)
  void clearProvider() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);
}

class UserDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserDetail', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..aOM<UserInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'info', subBuilder: UserInfo.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOM<Image>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatar', subBuilder: Image.create)
    ..hasRequiredFields = false
  ;

  UserDetail._() : super();
  factory UserDetail({
    UserInfo? info,
    $core.String? description,
    Image? avatar,
  }) {
    final _result = create();
    if (info != null) {
      _result.info = info;
    }
    if (description != null) {
      _result.description = description;
    }
    if (avatar != null) {
      _result.avatar = avatar;
    }
    return _result;
  }
  factory UserDetail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserDetail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserDetail clone() => UserDetail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserDetail copyWith(void Function(UserDetail) updates) => super.copyWith((message) => updates(message as UserDetail)) as UserDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserDetail create() => UserDetail._();
  UserDetail createEmptyInstance() => create();
  static $pb.PbList<UserDetail> createRepeated() => $pb.PbList<UserDetail>();
  @$core.pragma('dart2js:noInline')
  static UserDetail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserDetail>(create);
  static UserDetail? _defaultInstance;

  @$pb.TagNumber(1)
  UserInfo get info => $_getN(0);
  @$pb.TagNumber(1)
  set info(UserInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearInfo() => clearField(1);
  @$pb.TagNumber(1)
  UserInfo ensureInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  Image get avatar => $_getN(2);
  @$pb.TagNumber(3)
  set avatar(Image v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatar() => clearField(3);
  @$pb.TagNumber(3)
  Image ensureAvatar() => $_ensure(2);
}

class TrackInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TrackInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..e<Provider>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provider', $pb.PbFieldType.OE, defaultOrMaker: Provider.PROVIDER_UNSPECIFIED, valueOf: Provider.valueOf, enumValues: Provider.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..pc<UserInfo>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'artists', $pb.PbFieldType.PM, subBuilder: UserInfo.create)
    ..aOM<Image>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cover', subBuilder: Image.create)
    ..hasRequiredFields = false
  ;

  TrackInfo._() : super();
  factory TrackInfo({
    $core.String? id,
    Provider? provider,
    $core.String? name,
    $core.Iterable<UserInfo>? artists,
    Image? cover,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (provider != null) {
      _result.provider = provider;
    }
    if (name != null) {
      _result.name = name;
    }
    if (artists != null) {
      _result.artists.addAll(artists);
    }
    if (cover != null) {
      _result.cover = cover;
    }
    return _result;
  }
  factory TrackInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TrackInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TrackInfo clone() => TrackInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TrackInfo copyWith(void Function(TrackInfo) updates) => super.copyWith((message) => updates(message as TrackInfo)) as TrackInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TrackInfo create() => TrackInfo._();
  TrackInfo createEmptyInstance() => create();
  static $pb.PbList<TrackInfo> createRepeated() => $pb.PbList<TrackInfo>();
  @$core.pragma('dart2js:noInline')
  static TrackInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TrackInfo>(create);
  static TrackInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  Provider get provider => $_getN(1);
  @$pb.TagNumber(2)
  set provider(Provider v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProvider() => $_has(1);
  @$pb.TagNumber(2)
  void clearProvider() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<UserInfo> get artists => $_getList(3);

  @$pb.TagNumber(5)
  Image get cover => $_getN(4);
  @$pb.TagNumber(5)
  set cover(Image v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCover() => $_has(4);
  @$pb.TagNumber(5)
  void clearCover() => clearField(5);
  @$pb.TagNumber(5)
  Image ensureCover() => $_ensure(4);
}

class TrackCollection extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TrackCollection', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..e<Provider>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provider', $pb.PbFieldType.OE, defaultOrMaker: Provider.PROVIDER_UNSPECIFIED, valueOf: Provider.valueOf, enumValues: Provider.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..pc<UserInfo>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authors', $pb.PbFieldType.PM, subBuilder: UserInfo.create)
    ..aOM<Image>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cover', subBuilder: Image.create)
    ..hasRequiredFields = false
  ;

  TrackCollection._() : super();
  factory TrackCollection({
    $core.String? id,
    Provider? provider,
    $core.String? name,
    $core.Iterable<UserInfo>? authors,
    Image? cover,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (provider != null) {
      _result.provider = provider;
    }
    if (name != null) {
      _result.name = name;
    }
    if (authors != null) {
      _result.authors.addAll(authors);
    }
    if (cover != null) {
      _result.cover = cover;
    }
    return _result;
  }
  factory TrackCollection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TrackCollection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TrackCollection clone() => TrackCollection()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TrackCollection copyWith(void Function(TrackCollection) updates) => super.copyWith((message) => updates(message as TrackCollection)) as TrackCollection; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TrackCollection create() => TrackCollection._();
  TrackCollection createEmptyInstance() => create();
  static $pb.PbList<TrackCollection> createRepeated() => $pb.PbList<TrackCollection>();
  @$core.pragma('dart2js:noInline')
  static TrackCollection getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TrackCollection>(create);
  static TrackCollection? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  Provider get provider => $_getN(1);
  @$pb.TagNumber(2)
  set provider(Provider v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProvider() => $_has(1);
  @$pb.TagNumber(2)
  void clearProvider() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<UserInfo> get authors => $_getList(3);

  @$pb.TagNumber(5)
  Image get cover => $_getN(4);
  @$pb.TagNumber(5)
  set cover(Image v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCover() => $_has(4);
  @$pb.TagNumber(5)
  void clearCover() => clearField(5);
  @$pb.TagNumber(5)
  Image ensureCover() => $_ensure(4);
}

class TrackCollectionDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TrackCollectionDetail', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..e<Provider>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provider', $pb.PbFieldType.OE, defaultOrMaker: Provider.PROVIDER_UNSPECIFIED, valueOf: Provider.valueOf, enumValues: Provider.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..pc<UserDetail>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authors', $pb.PbFieldType.PM, subBuilder: UserDetail.create)
    ..aOM<Image>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cover', subBuilder: Image.create)
    ..pc<TrackInfo>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tracks', $pb.PbFieldType.PM, subBuilder: TrackInfo.create)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..hasRequiredFields = false
  ;

  TrackCollectionDetail._() : super();
  factory TrackCollectionDetail({
    $core.String? id,
    Provider? provider,
    $core.String? name,
    $core.Iterable<UserDetail>? authors,
    Image? cover,
    $core.Iterable<TrackInfo>? tracks,
    $core.String? description,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (provider != null) {
      _result.provider = provider;
    }
    if (name != null) {
      _result.name = name;
    }
    if (authors != null) {
      _result.authors.addAll(authors);
    }
    if (cover != null) {
      _result.cover = cover;
    }
    if (tracks != null) {
      _result.tracks.addAll(tracks);
    }
    if (description != null) {
      _result.description = description;
    }
    return _result;
  }
  factory TrackCollectionDetail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TrackCollectionDetail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TrackCollectionDetail clone() => TrackCollectionDetail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TrackCollectionDetail copyWith(void Function(TrackCollectionDetail) updates) => super.copyWith((message) => updates(message as TrackCollectionDetail)) as TrackCollectionDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TrackCollectionDetail create() => TrackCollectionDetail._();
  TrackCollectionDetail createEmptyInstance() => create();
  static $pb.PbList<TrackCollectionDetail> createRepeated() => $pb.PbList<TrackCollectionDetail>();
  @$core.pragma('dart2js:noInline')
  static TrackCollectionDetail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TrackCollectionDetail>(create);
  static TrackCollectionDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  Provider get provider => $_getN(1);
  @$pb.TagNumber(2)
  set provider(Provider v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProvider() => $_has(1);
  @$pb.TagNumber(2)
  void clearProvider() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<UserDetail> get authors => $_getList(3);

  @$pb.TagNumber(5)
  Image get cover => $_getN(4);
  @$pb.TagNumber(5)
  set cover(Image v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCover() => $_has(4);
  @$pb.TagNumber(5)
  void clearCover() => clearField(5);
  @$pb.TagNumber(5)
  Image ensureCover() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.List<TrackInfo> get tracks => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get description => $_getSZ(6);
  @$pb.TagNumber(7)
  set description($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDescription() => $_has(6);
  @$pb.TagNumber(7)
  void clearDescription() => clearField(7);
}

class SuggestRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SuggestRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..pc<Provider>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'providers', $pb.PbFieldType.KE, valueOf: Provider.valueOf, enumValues: Provider.values, defaultEnumValue: Provider.PROVIDER_UNSPECIFIED)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'keyword')
    ..hasRequiredFields = false
  ;

  SuggestRequest._() : super();
  factory SuggestRequest({
    $core.Iterable<Provider>? providers,
    $core.String? keyword,
  }) {
    final _result = create();
    if (providers != null) {
      _result.providers.addAll(providers);
    }
    if (keyword != null) {
      _result.keyword = keyword;
    }
    return _result;
  }
  factory SuggestRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SuggestRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SuggestRequest clone() => SuggestRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SuggestRequest copyWith(void Function(SuggestRequest) updates) => super.copyWith((message) => updates(message as SuggestRequest)) as SuggestRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuggestRequest create() => SuggestRequest._();
  SuggestRequest createEmptyInstance() => create();
  static $pb.PbList<SuggestRequest> createRepeated() => $pb.PbList<SuggestRequest>();
  @$core.pragma('dart2js:noInline')
  static SuggestRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SuggestRequest>(create);
  static SuggestRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Provider> get providers => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get keyword => $_getSZ(1);
  @$pb.TagNumber(2)
  set keyword($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasKeyword() => $_has(1);
  @$pb.TagNumber(2)
  void clearKeyword() => clearField(2);
}

class SuggestReplay_Suggestion extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SuggestReplay.Suggestion', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..e<Provider>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provider', $pb.PbFieldType.OE, defaultOrMaker: Provider.PROVIDER_UNSPECIFIED, valueOf: Provider.valueOf, enumValues: Provider.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'suggestion')
    ..hasRequiredFields = false
  ;

  SuggestReplay_Suggestion._() : super();
  factory SuggestReplay_Suggestion({
    Provider? provider,
    $core.String? suggestion,
  }) {
    final _result = create();
    if (provider != null) {
      _result.provider = provider;
    }
    if (suggestion != null) {
      _result.suggestion = suggestion;
    }
    return _result;
  }
  factory SuggestReplay_Suggestion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SuggestReplay_Suggestion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SuggestReplay_Suggestion clone() => SuggestReplay_Suggestion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SuggestReplay_Suggestion copyWith(void Function(SuggestReplay_Suggestion) updates) => super.copyWith((message) => updates(message as SuggestReplay_Suggestion)) as SuggestReplay_Suggestion; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuggestReplay_Suggestion create() => SuggestReplay_Suggestion._();
  SuggestReplay_Suggestion createEmptyInstance() => create();
  static $pb.PbList<SuggestReplay_Suggestion> createRepeated() => $pb.PbList<SuggestReplay_Suggestion>();
  @$core.pragma('dart2js:noInline')
  static SuggestReplay_Suggestion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SuggestReplay_Suggestion>(create);
  static SuggestReplay_Suggestion? _defaultInstance;

  @$pb.TagNumber(1)
  Provider get provider => $_getN(0);
  @$pb.TagNumber(1)
  set provider(Provider v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasProvider() => $_has(0);
  @$pb.TagNumber(1)
  void clearProvider() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get suggestion => $_getSZ(1);
  @$pb.TagNumber(2)
  set suggestion($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuggestion() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuggestion() => clearField(2);
}

class SuggestReplay extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SuggestReplay', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..pc<SuggestReplay_Suggestion>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'suggestions', $pb.PbFieldType.PM, subBuilder: SuggestReplay_Suggestion.create)
    ..hasRequiredFields = false
  ;

  SuggestReplay._() : super();
  factory SuggestReplay({
    $core.Iterable<SuggestReplay_Suggestion>? suggestions,
  }) {
    final _result = create();
    if (suggestions != null) {
      _result.suggestions.addAll(suggestions);
    }
    return _result;
  }
  factory SuggestReplay.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SuggestReplay.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SuggestReplay clone() => SuggestReplay()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SuggestReplay copyWith(void Function(SuggestReplay) updates) => super.copyWith((message) => updates(message as SuggestReplay)) as SuggestReplay; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuggestReplay create() => SuggestReplay._();
  SuggestReplay createEmptyInstance() => create();
  static $pb.PbList<SuggestReplay> createRepeated() => $pb.PbList<SuggestReplay>();
  @$core.pragma('dart2js:noInline')
  static SuggestReplay getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SuggestReplay>(create);
  static SuggestReplay? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SuggestReplay_Suggestion> get suggestions => $_getList(0);
}

class SearchRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SearchRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..pc<Provider>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'providers', $pb.PbFieldType.KE, valueOf: Provider.valueOf, enumValues: Provider.values, defaultEnumValue: Provider.PROVIDER_UNSPECIFIED)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'keyword')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'page', $pb.PbFieldType.O3)
    ..pc<SearchZone>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fields', $pb.PbFieldType.KE, valueOf: SearchZone.valueOf, enumValues: SearchZone.values, defaultEnumValue: SearchZone.SEARCH_ZONE_UNSPECIFIED)
    ..hasRequiredFields = false
  ;

  SearchRequest._() : super();
  factory SearchRequest({
    $core.Iterable<Provider>? providers,
    $core.String? keyword,
    $core.int? page,
    $core.Iterable<SearchZone>? fields,
  }) {
    final _result = create();
    if (providers != null) {
      _result.providers.addAll(providers);
    }
    if (keyword != null) {
      _result.keyword = keyword;
    }
    if (page != null) {
      _result.page = page;
    }
    if (fields != null) {
      _result.fields.addAll(fields);
    }
    return _result;
  }
  factory SearchRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchRequest clone() => SearchRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchRequest copyWith(void Function(SearchRequest) updates) => super.copyWith((message) => updates(message as SearchRequest)) as SearchRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SearchRequest create() => SearchRequest._();
  SearchRequest createEmptyInstance() => create();
  static $pb.PbList<SearchRequest> createRepeated() => $pb.PbList<SearchRequest>();
  @$core.pragma('dart2js:noInline')
  static SearchRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchRequest>(create);
  static SearchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Provider> get providers => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get keyword => $_getSZ(1);
  @$pb.TagNumber(2)
  set keyword($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasKeyword() => $_has(1);
  @$pb.TagNumber(2)
  void clearKeyword() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get page => $_getIZ(2);
  @$pb.TagNumber(3)
  set page($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPage() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<SearchZone> get fields => $_getList(3);
}

enum SearchReplay_SearchItem_Item {
  track, 
  user, 
  album, 
  playlist, 
  notSet
}

class SearchReplay_SearchItem extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, SearchReplay_SearchItem_Item> _SearchReplay_SearchItem_ItemByTag = {
    1 : SearchReplay_SearchItem_Item.track,
    2 : SearchReplay_SearchItem_Item.user,
    3 : SearchReplay_SearchItem_Item.album,
    4 : SearchReplay_SearchItem_Item.playlist,
    0 : SearchReplay_SearchItem_Item.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SearchReplay.SearchItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4])
    ..aOM<TrackInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'track', subBuilder: TrackInfo.create)
    ..aOM<UserDetail>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: UserDetail.create)
    ..aOM<TrackCollection>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'album', subBuilder: TrackCollection.create)
    ..aOM<TrackCollection>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playlist', subBuilder: TrackCollection.create)
    ..hasRequiredFields = false
  ;

  SearchReplay_SearchItem._() : super();
  factory SearchReplay_SearchItem({
    TrackInfo? track,
    UserDetail? user,
    TrackCollection? album,
    TrackCollection? playlist,
  }) {
    final _result = create();
    if (track != null) {
      _result.track = track;
    }
    if (user != null) {
      _result.user = user;
    }
    if (album != null) {
      _result.album = album;
    }
    if (playlist != null) {
      _result.playlist = playlist;
    }
    return _result;
  }
  factory SearchReplay_SearchItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchReplay_SearchItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchReplay_SearchItem clone() => SearchReplay_SearchItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchReplay_SearchItem copyWith(void Function(SearchReplay_SearchItem) updates) => super.copyWith((message) => updates(message as SearchReplay_SearchItem)) as SearchReplay_SearchItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SearchReplay_SearchItem create() => SearchReplay_SearchItem._();
  SearchReplay_SearchItem createEmptyInstance() => create();
  static $pb.PbList<SearchReplay_SearchItem> createRepeated() => $pb.PbList<SearchReplay_SearchItem>();
  @$core.pragma('dart2js:noInline')
  static SearchReplay_SearchItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchReplay_SearchItem>(create);
  static SearchReplay_SearchItem? _defaultInstance;

  SearchReplay_SearchItem_Item whichItem() => _SearchReplay_SearchItem_ItemByTag[$_whichOneof(0)]!;
  void clearItem() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  TrackInfo get track => $_getN(0);
  @$pb.TagNumber(1)
  set track(TrackInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTrack() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrack() => clearField(1);
  @$pb.TagNumber(1)
  TrackInfo ensureTrack() => $_ensure(0);

  @$pb.TagNumber(2)
  UserDetail get user => $_getN(1);
  @$pb.TagNumber(2)
  set user(UserDetail v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);
  @$pb.TagNumber(2)
  UserDetail ensureUser() => $_ensure(1);

  @$pb.TagNumber(3)
  TrackCollection get album => $_getN(2);
  @$pb.TagNumber(3)
  set album(TrackCollection v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAlbum() => $_has(2);
  @$pb.TagNumber(3)
  void clearAlbum() => clearField(3);
  @$pb.TagNumber(3)
  TrackCollection ensureAlbum() => $_ensure(2);

  @$pb.TagNumber(4)
  TrackCollection get playlist => $_getN(3);
  @$pb.TagNumber(4)
  set playlist(TrackCollection v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPlaylist() => $_has(3);
  @$pb.TagNumber(4)
  void clearPlaylist() => clearField(4);
  @$pb.TagNumber(4)
  TrackCollection ensurePlaylist() => $_ensure(3);
}

class SearchReplay extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SearchReplay', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..pc<SearchReplay_SearchItem>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'items', $pb.PbFieldType.PM, subBuilder: SearchReplay_SearchItem.create)
    ..hasRequiredFields = false
  ;

  SearchReplay._() : super();
  factory SearchReplay({
    $core.Iterable<SearchReplay_SearchItem>? items,
  }) {
    final _result = create();
    if (items != null) {
      _result.items.addAll(items);
    }
    return _result;
  }
  factory SearchReplay.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchReplay.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchReplay clone() => SearchReplay()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchReplay copyWith(void Function(SearchReplay) updates) => super.copyWith((message) => updates(message as SearchReplay)) as SearchReplay; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SearchReplay create() => SearchReplay._();
  SearchReplay createEmptyInstance() => create();
  static $pb.PbList<SearchReplay> createRepeated() => $pb.PbList<SearchReplay>();
  @$core.pragma('dart2js:noInline')
  static SearchReplay getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchReplay>(create);
  static SearchReplay? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SearchReplay_SearchItem> get items => $_getList(0);
}

class DetailRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DetailRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..e<Provider>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provider', $pb.PbFieldType.OE, defaultOrMaker: Provider.PROVIDER_UNSPECIFIED, valueOf: Provider.valueOf, enumValues: Provider.values)
    ..e<SearchZone>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'zone', $pb.PbFieldType.OE, defaultOrMaker: SearchZone.SEARCH_ZONE_UNSPECIFIED, valueOf: SearchZone.valueOf, enumValues: SearchZone.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  DetailRequest._() : super();
  factory DetailRequest({
    Provider? provider,
    SearchZone? zone,
    $core.String? id,
  }) {
    final _result = create();
    if (provider != null) {
      _result.provider = provider;
    }
    if (zone != null) {
      _result.zone = zone;
    }
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory DetailRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DetailRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DetailRequest clone() => DetailRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DetailRequest copyWith(void Function(DetailRequest) updates) => super.copyWith((message) => updates(message as DetailRequest)) as DetailRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DetailRequest create() => DetailRequest._();
  DetailRequest createEmptyInstance() => create();
  static $pb.PbList<DetailRequest> createRepeated() => $pb.PbList<DetailRequest>();
  @$core.pragma('dart2js:noInline')
  static DetailRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DetailRequest>(create);
  static DetailRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Provider get provider => $_getN(0);
  @$pb.TagNumber(1)
  set provider(Provider v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasProvider() => $_has(0);
  @$pb.TagNumber(1)
  void clearProvider() => clearField(1);

  @$pb.TagNumber(2)
  SearchZone get zone => $_getN(1);
  @$pb.TagNumber(2)
  set zone(SearchZone v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasZone() => $_has(1);
  @$pb.TagNumber(2)
  void clearZone() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get id => $_getSZ(2);
  @$pb.TagNumber(3)
  set id($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => clearField(3);
}

enum DetailReplay_Item {
  track, 
  user, 
  album, 
  playlist, 
  notSet
}

class DetailReplay extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, DetailReplay_Item> _DetailReplay_ItemByTag = {
    1 : DetailReplay_Item.track,
    2 : DetailReplay_Item.user,
    3 : DetailReplay_Item.album,
    4 : DetailReplay_Item.playlist,
    0 : DetailReplay_Item.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DetailReplay', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4])
    ..aOM<TrackInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'track', subBuilder: TrackInfo.create)
    ..aOM<UserDetail>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: UserDetail.create)
    ..aOM<TrackCollectionDetail>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'album', subBuilder: TrackCollectionDetail.create)
    ..aOM<TrackCollectionDetail>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playlist', subBuilder: TrackCollectionDetail.create)
    ..hasRequiredFields = false
  ;

  DetailReplay._() : super();
  factory DetailReplay({
    TrackInfo? track,
    UserDetail? user,
    TrackCollectionDetail? album,
    TrackCollectionDetail? playlist,
  }) {
    final _result = create();
    if (track != null) {
      _result.track = track;
    }
    if (user != null) {
      _result.user = user;
    }
    if (album != null) {
      _result.album = album;
    }
    if (playlist != null) {
      _result.playlist = playlist;
    }
    return _result;
  }
  factory DetailReplay.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DetailReplay.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DetailReplay clone() => DetailReplay()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DetailReplay copyWith(void Function(DetailReplay) updates) => super.copyWith((message) => updates(message as DetailReplay)) as DetailReplay; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DetailReplay create() => DetailReplay._();
  DetailReplay createEmptyInstance() => create();
  static $pb.PbList<DetailReplay> createRepeated() => $pb.PbList<DetailReplay>();
  @$core.pragma('dart2js:noInline')
  static DetailReplay getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DetailReplay>(create);
  static DetailReplay? _defaultInstance;

  DetailReplay_Item whichItem() => _DetailReplay_ItemByTag[$_whichOneof(0)]!;
  void clearItem() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  TrackInfo get track => $_getN(0);
  @$pb.TagNumber(1)
  set track(TrackInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTrack() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrack() => clearField(1);
  @$pb.TagNumber(1)
  TrackInfo ensureTrack() => $_ensure(0);

  @$pb.TagNumber(2)
  UserDetail get user => $_getN(1);
  @$pb.TagNumber(2)
  set user(UserDetail v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);
  @$pb.TagNumber(2)
  UserDetail ensureUser() => $_ensure(1);

  @$pb.TagNumber(3)
  TrackCollectionDetail get album => $_getN(2);
  @$pb.TagNumber(3)
  set album(TrackCollectionDetail v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAlbum() => $_has(2);
  @$pb.TagNumber(3)
  void clearAlbum() => clearField(3);
  @$pb.TagNumber(3)
  TrackCollectionDetail ensureAlbum() => $_ensure(2);

  @$pb.TagNumber(4)
  TrackCollectionDetail get playlist => $_getN(3);
  @$pb.TagNumber(4)
  set playlist(TrackCollectionDetail v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPlaylist() => $_has(3);
  @$pb.TagNumber(4)
  void clearPlaylist() => clearField(4);
  @$pb.TagNumber(4)
  TrackCollectionDetail ensurePlaylist() => $_ensure(3);
}

class StreamRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StreamRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..e<Provider>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provider', $pb.PbFieldType.OE, defaultOrMaker: Provider.PROVIDER_UNSPECIFIED, valueOf: Provider.valueOf, enumValues: Provider.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  StreamRequest._() : super();
  factory StreamRequest({
    Provider? provider,
    $core.String? id,
  }) {
    final _result = create();
    if (provider != null) {
      _result.provider = provider;
    }
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory StreamRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamRequest clone() => StreamRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamRequest copyWith(void Function(StreamRequest) updates) => super.copyWith((message) => updates(message as StreamRequest)) as StreamRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StreamRequest create() => StreamRequest._();
  StreamRequest createEmptyInstance() => create();
  static $pb.PbList<StreamRequest> createRepeated() => $pb.PbList<StreamRequest>();
  @$core.pragma('dart2js:noInline')
  static StreamRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamRequest>(create);
  static StreamRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Provider get provider => $_getN(0);
  @$pb.TagNumber(1)
  set provider(Provider v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasProvider() => $_has(0);
  @$pb.TagNumber(1)
  void clearProvider() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
}

class StreamReplay extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StreamReplay', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..pc<Stream>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'audios', $pb.PbFieldType.PM, subBuilder: Stream.create)
    ..pc<Stream>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'videos', $pb.PbFieldType.PM, subBuilder: Stream.create)
    ..hasRequiredFields = false
  ;

  StreamReplay._() : super();
  factory StreamReplay({
    $core.Iterable<Stream>? audios,
    $core.Iterable<Stream>? videos,
  }) {
    final _result = create();
    if (audios != null) {
      _result.audios.addAll(audios);
    }
    if (videos != null) {
      _result.videos.addAll(videos);
    }
    return _result;
  }
  factory StreamReplay.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamReplay.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamReplay clone() => StreamReplay()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamReplay copyWith(void Function(StreamReplay) updates) => super.copyWith((message) => updates(message as StreamReplay)) as StreamReplay; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StreamReplay create() => StreamReplay._();
  StreamReplay createEmptyInstance() => create();
  static $pb.PbList<StreamReplay> createRepeated() => $pb.PbList<StreamReplay>();
  @$core.pragma('dart2js:noInline')
  static StreamReplay getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamReplay>(create);
  static StreamReplay? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Stream> get audios => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<Stream> get videos => $_getList(1);
}

