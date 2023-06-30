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

class Artist extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Artist', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..e<Provider>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provider', $pb.PbFieldType.OE, defaultOrMaker: Provider.PROVIDER_UNSPECIFIED, valueOf: Provider.valueOf, enumValues: Provider.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  Artist._() : super();
  factory Artist({
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
  factory Artist.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Artist.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Artist clone() => Artist()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Artist copyWith(void Function(Artist) updates) => super.copyWith((message) => updates(message as Artist)) as Artist; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Artist create() => Artist._();
  Artist createEmptyInstance() => create();
  static $pb.PbList<Artist> createRepeated() => $pb.PbList<Artist>();
  @$core.pragma('dart2js:noInline')
  static Artist getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Artist>(create);
  static Artist? _defaultInstance;

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

class ArtistDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ArtistDetail', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..aOM<Artist>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'artist', subBuilder: Artist.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOM<Image>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatar', subBuilder: Image.create)
    ..hasRequiredFields = false
  ;

  ArtistDetail._() : super();
  factory ArtistDetail({
    Artist? artist,
    $core.String? description,
    Image? avatar,
  }) {
    final _result = create();
    if (artist != null) {
      _result.artist = artist;
    }
    if (description != null) {
      _result.description = description;
    }
    if (avatar != null) {
      _result.avatar = avatar;
    }
    return _result;
  }
  factory ArtistDetail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ArtistDetail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ArtistDetail clone() => ArtistDetail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ArtistDetail copyWith(void Function(ArtistDetail) updates) => super.copyWith((message) => updates(message as ArtistDetail)) as ArtistDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ArtistDetail create() => ArtistDetail._();
  ArtistDetail createEmptyInstance() => create();
  static $pb.PbList<ArtistDetail> createRepeated() => $pb.PbList<ArtistDetail>();
  @$core.pragma('dart2js:noInline')
  static ArtistDetail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ArtistDetail>(create);
  static ArtistDetail? _defaultInstance;

  @$pb.TagNumber(1)
  Artist get artist => $_getN(0);
  @$pb.TagNumber(1)
  set artist(Artist v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasArtist() => $_has(0);
  @$pb.TagNumber(1)
  void clearArtist() => clearField(1);
  @$pb.TagNumber(1)
  Artist ensureArtist() => $_ensure(0);

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

class Track extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Track', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..e<Provider>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provider', $pb.PbFieldType.OE, defaultOrMaker: Provider.PROVIDER_UNSPECIFIED, valueOf: Provider.valueOf, enumValues: Provider.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..pc<Artist>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'artists', $pb.PbFieldType.PM, subBuilder: Artist.create)
    ..aOM<Image>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cover', subBuilder: Image.create)
    ..hasRequiredFields = false
  ;

  Track._() : super();
  factory Track({
    $core.String? id,
    Provider? provider,
    $core.String? name,
    $core.Iterable<Artist>? artists,
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
  factory Track.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Track.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Track clone() => Track()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Track copyWith(void Function(Track) updates) => super.copyWith((message) => updates(message as Track)) as Track; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Track create() => Track._();
  Track createEmptyInstance() => create();
  static $pb.PbList<Track> createRepeated() => $pb.PbList<Track>();
  @$core.pragma('dart2js:noInline')
  static Track getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Track>(create);
  static Track? _defaultInstance;

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
  $core.List<Artist> get artists => $_getList(3);

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

class Playlist extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Playlist', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..e<Provider>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provider', $pb.PbFieldType.OE, defaultOrMaker: Provider.PROVIDER_UNSPECIFIED, valueOf: Provider.valueOf, enumValues: Provider.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..pc<Artist>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'artists', $pb.PbFieldType.PM, subBuilder: Artist.create)
    ..aOM<Image>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cover', subBuilder: Image.create)
    ..hasRequiredFields = false
  ;

  Playlist._() : super();
  factory Playlist({
    $core.String? id,
    Provider? provider,
    $core.String? name,
    $core.Iterable<Artist>? artists,
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
  factory Playlist.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Playlist.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Playlist clone() => Playlist()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Playlist copyWith(void Function(Playlist) updates) => super.copyWith((message) => updates(message as Playlist)) as Playlist; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Playlist create() => Playlist._();
  Playlist createEmptyInstance() => create();
  static $pb.PbList<Playlist> createRepeated() => $pb.PbList<Playlist>();
  @$core.pragma('dart2js:noInline')
  static Playlist getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Playlist>(create);
  static Playlist? _defaultInstance;

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
  $core.List<Artist> get artists => $_getList(3);

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

class PlaylistDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PlaylistDetail', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..e<Provider>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provider', $pb.PbFieldType.OE, defaultOrMaker: Provider.PROVIDER_UNSPECIFIED, valueOf: Provider.valueOf, enumValues: Provider.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..pc<ArtistDetail>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'artists', $pb.PbFieldType.PM, subBuilder: ArtistDetail.create)
    ..aOM<Image>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cover', subBuilder: Image.create)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..pc<Track>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tracks', $pb.PbFieldType.PM, subBuilder: Track.create)
    ..hasRequiredFields = false
  ;

  PlaylistDetail._() : super();
  factory PlaylistDetail({
    $core.String? id,
    Provider? provider,
    $core.String? name,
    $core.Iterable<ArtistDetail>? artists,
    Image? cover,
    $core.String? description,
    $core.Iterable<Track>? tracks,
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
    if (description != null) {
      _result.description = description;
    }
    if (tracks != null) {
      _result.tracks.addAll(tracks);
    }
    return _result;
  }
  factory PlaylistDetail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlaylistDetail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlaylistDetail clone() => PlaylistDetail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlaylistDetail copyWith(void Function(PlaylistDetail) updates) => super.copyWith((message) => updates(message as PlaylistDetail)) as PlaylistDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlaylistDetail create() => PlaylistDetail._();
  PlaylistDetail createEmptyInstance() => create();
  static $pb.PbList<PlaylistDetail> createRepeated() => $pb.PbList<PlaylistDetail>();
  @$core.pragma('dart2js:noInline')
  static PlaylistDetail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlaylistDetail>(create);
  static PlaylistDetail? _defaultInstance;

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
  $core.List<ArtistDetail> get artists => $_getList(3);

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
  $core.String get description => $_getSZ(5);
  @$pb.TagNumber(6)
  set description($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescription() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<Track> get tracks => $_getList(6);
}

class Stream extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Stream', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..e<Provider>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provider', $pb.PbFieldType.OE, defaultOrMaker: Provider.PROVIDER_UNSPECIFIED, valueOf: Provider.valueOf, enumValues: Provider.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'quality')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'url')
    ..hasRequiredFields = false
  ;

  Stream._() : super();
  factory Stream({
    Provider? provider,
    $core.String? quality,
    $core.String? url,
  }) {
    final _result = create();
    if (provider != null) {
      _result.provider = provider;
    }
    if (quality != null) {
      _result.quality = quality;
    }
    if (url != null) {
      _result.url = url;
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
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => clearField(3);
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

class SuggestResponse_Suggestion extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SuggestResponse.Suggestion', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..e<Provider>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provider', $pb.PbFieldType.OE, defaultOrMaker: Provider.PROVIDER_UNSPECIFIED, valueOf: Provider.valueOf, enumValues: Provider.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'suggestion')
    ..hasRequiredFields = false
  ;

  SuggestResponse_Suggestion._() : super();
  factory SuggestResponse_Suggestion({
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
  factory SuggestResponse_Suggestion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SuggestResponse_Suggestion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SuggestResponse_Suggestion clone() => SuggestResponse_Suggestion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SuggestResponse_Suggestion copyWith(void Function(SuggestResponse_Suggestion) updates) => super.copyWith((message) => updates(message as SuggestResponse_Suggestion)) as SuggestResponse_Suggestion; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuggestResponse_Suggestion create() => SuggestResponse_Suggestion._();
  SuggestResponse_Suggestion createEmptyInstance() => create();
  static $pb.PbList<SuggestResponse_Suggestion> createRepeated() => $pb.PbList<SuggestResponse_Suggestion>();
  @$core.pragma('dart2js:noInline')
  static SuggestResponse_Suggestion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SuggestResponse_Suggestion>(create);
  static SuggestResponse_Suggestion? _defaultInstance;

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

class SuggestResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SuggestResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..pc<SuggestResponse_Suggestion>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'suggestions', $pb.PbFieldType.PM, subBuilder: SuggestResponse_Suggestion.create)
    ..hasRequiredFields = false
  ;

  SuggestResponse._() : super();
  factory SuggestResponse({
    $core.Iterable<SuggestResponse_Suggestion>? suggestions,
  }) {
    final _result = create();
    if (suggestions != null) {
      _result.suggestions.addAll(suggestions);
    }
    return _result;
  }
  factory SuggestResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SuggestResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SuggestResponse clone() => SuggestResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SuggestResponse copyWith(void Function(SuggestResponse) updates) => super.copyWith((message) => updates(message as SuggestResponse)) as SuggestResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuggestResponse create() => SuggestResponse._();
  SuggestResponse createEmptyInstance() => create();
  static $pb.PbList<SuggestResponse> createRepeated() => $pb.PbList<SuggestResponse>();
  @$core.pragma('dart2js:noInline')
  static SuggestResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SuggestResponse>(create);
  static SuggestResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SuggestResponse_Suggestion> get suggestions => $_getList(0);
}

class SearchRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SearchRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..pc<Provider>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'providers', $pb.PbFieldType.KE, valueOf: Provider.valueOf, enumValues: Provider.values, defaultEnumValue: Provider.PROVIDER_UNSPECIFIED)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'keyword')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'page', $pb.PbFieldType.O3)
    ..pc<Zone>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fields', $pb.PbFieldType.KE, valueOf: Zone.valueOf, enumValues: Zone.values, defaultEnumValue: Zone.ZONE_UNSPECIFIED)
    ..hasRequiredFields = false
  ;

  SearchRequest._() : super();
  factory SearchRequest({
    $core.Iterable<Provider>? providers,
    $core.String? keyword,
    $core.int? page,
    $core.Iterable<Zone>? fields,
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
  $core.List<Zone> get fields => $_getList(3);
}

enum SearchResponse_SearchItem_Item {
  track, 
  user, 
  playlist, 
  notSet
}

class SearchResponse_SearchItem extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, SearchResponse_SearchItem_Item> _SearchResponse_SearchItem_ItemByTag = {
    1 : SearchResponse_SearchItem_Item.track,
    2 : SearchResponse_SearchItem_Item.user,
    3 : SearchResponse_SearchItem_Item.playlist,
    0 : SearchResponse_SearchItem_Item.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SearchResponse.SearchItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<Track>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'track', subBuilder: Track.create)
    ..aOM<ArtistDetail>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: ArtistDetail.create)
    ..aOM<Playlist>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playlist', subBuilder: Playlist.create)
    ..hasRequiredFields = false
  ;

  SearchResponse_SearchItem._() : super();
  factory SearchResponse_SearchItem({
    Track? track,
    ArtistDetail? user,
    Playlist? playlist,
  }) {
    final _result = create();
    if (track != null) {
      _result.track = track;
    }
    if (user != null) {
      _result.user = user;
    }
    if (playlist != null) {
      _result.playlist = playlist;
    }
    return _result;
  }
  factory SearchResponse_SearchItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchResponse_SearchItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchResponse_SearchItem clone() => SearchResponse_SearchItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchResponse_SearchItem copyWith(void Function(SearchResponse_SearchItem) updates) => super.copyWith((message) => updates(message as SearchResponse_SearchItem)) as SearchResponse_SearchItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SearchResponse_SearchItem create() => SearchResponse_SearchItem._();
  SearchResponse_SearchItem createEmptyInstance() => create();
  static $pb.PbList<SearchResponse_SearchItem> createRepeated() => $pb.PbList<SearchResponse_SearchItem>();
  @$core.pragma('dart2js:noInline')
  static SearchResponse_SearchItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchResponse_SearchItem>(create);
  static SearchResponse_SearchItem? _defaultInstance;

  SearchResponse_SearchItem_Item whichItem() => _SearchResponse_SearchItem_ItemByTag[$_whichOneof(0)]!;
  void clearItem() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Track get track => $_getN(0);
  @$pb.TagNumber(1)
  set track(Track v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTrack() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrack() => clearField(1);
  @$pb.TagNumber(1)
  Track ensureTrack() => $_ensure(0);

  @$pb.TagNumber(2)
  ArtistDetail get user => $_getN(1);
  @$pb.TagNumber(2)
  set user(ArtistDetail v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);
  @$pb.TagNumber(2)
  ArtistDetail ensureUser() => $_ensure(1);

  @$pb.TagNumber(3)
  Playlist get playlist => $_getN(2);
  @$pb.TagNumber(3)
  set playlist(Playlist v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPlaylist() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlaylist() => clearField(3);
  @$pb.TagNumber(3)
  Playlist ensurePlaylist() => $_ensure(2);
}

class SearchResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SearchResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..pc<SearchResponse_SearchItem>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'items', $pb.PbFieldType.PM, subBuilder: SearchResponse_SearchItem.create)
    ..hasRequiredFields = false
  ;

  SearchResponse._() : super();
  factory SearchResponse({
    $core.Iterable<SearchResponse_SearchItem>? items,
  }) {
    final _result = create();
    if (items != null) {
      _result.items.addAll(items);
    }
    return _result;
  }
  factory SearchResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchResponse clone() => SearchResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchResponse copyWith(void Function(SearchResponse) updates) => super.copyWith((message) => updates(message as SearchResponse)) as SearchResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SearchResponse create() => SearchResponse._();
  SearchResponse createEmptyInstance() => create();
  static $pb.PbList<SearchResponse> createRepeated() => $pb.PbList<SearchResponse>();
  @$core.pragma('dart2js:noInline')
  static SearchResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchResponse>(create);
  static SearchResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SearchResponse_SearchItem> get items => $_getList(0);
}

class DetailRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DetailRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..e<Provider>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provider', $pb.PbFieldType.OE, defaultOrMaker: Provider.PROVIDER_UNSPECIFIED, valueOf: Provider.valueOf, enumValues: Provider.values)
    ..e<Zone>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'zone', $pb.PbFieldType.OE, defaultOrMaker: Zone.ZONE_UNSPECIFIED, valueOf: Zone.valueOf, enumValues: Zone.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'page', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  DetailRequest._() : super();
  factory DetailRequest({
    Provider? provider,
    Zone? zone,
    $core.String? id,
    $core.int? page,
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
    if (page != null) {
      _result.page = page;
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
  Zone get zone => $_getN(1);
  @$pb.TagNumber(2)
  set zone(Zone v) { setField(2, v); }
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

  @$pb.TagNumber(4)
  $core.int get page => $_getIZ(3);
  @$pb.TagNumber(4)
  set page($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPage() => $_has(3);
  @$pb.TagNumber(4)
  void clearPage() => clearField(4);
}

enum DetailResponse_DetailItem_Item {
  playlist, 
  notSet
}

class DetailResponse_DetailItem extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, DetailResponse_DetailItem_Item> _DetailResponse_DetailItem_ItemByTag = {
    1 : DetailResponse_DetailItem_Item.playlist,
    0 : DetailResponse_DetailItem_Item.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DetailResponse.DetailItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<PlaylistDetail>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playlist', subBuilder: PlaylistDetail.create)
    ..hasRequiredFields = false
  ;

  DetailResponse_DetailItem._() : super();
  factory DetailResponse_DetailItem({
    PlaylistDetail? playlist,
  }) {
    final _result = create();
    if (playlist != null) {
      _result.playlist = playlist;
    }
    return _result;
  }
  factory DetailResponse_DetailItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DetailResponse_DetailItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DetailResponse_DetailItem clone() => DetailResponse_DetailItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DetailResponse_DetailItem copyWith(void Function(DetailResponse_DetailItem) updates) => super.copyWith((message) => updates(message as DetailResponse_DetailItem)) as DetailResponse_DetailItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DetailResponse_DetailItem create() => DetailResponse_DetailItem._();
  DetailResponse_DetailItem createEmptyInstance() => create();
  static $pb.PbList<DetailResponse_DetailItem> createRepeated() => $pb.PbList<DetailResponse_DetailItem>();
  @$core.pragma('dart2js:noInline')
  static DetailResponse_DetailItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DetailResponse_DetailItem>(create);
  static DetailResponse_DetailItem? _defaultInstance;

  DetailResponse_DetailItem_Item whichItem() => _DetailResponse_DetailItem_ItemByTag[$_whichOneof(0)]!;
  void clearItem() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  PlaylistDetail get playlist => $_getN(0);
  @$pb.TagNumber(1)
  set playlist(PlaylistDetail v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlaylist() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlaylist() => clearField(1);
  @$pb.TagNumber(1)
  PlaylistDetail ensurePlaylist() => $_ensure(0);
}

class DetailResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DetailResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..aOM<DetailResponse_DetailItem>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'item', subBuilder: DetailResponse_DetailItem.create)
    ..hasRequiredFields = false
  ;

  DetailResponse._() : super();
  factory DetailResponse({
    DetailResponse_DetailItem? item,
  }) {
    final _result = create();
    if (item != null) {
      _result.item = item;
    }
    return _result;
  }
  factory DetailResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DetailResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DetailResponse clone() => DetailResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DetailResponse copyWith(void Function(DetailResponse) updates) => super.copyWith((message) => updates(message as DetailResponse)) as DetailResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DetailResponse create() => DetailResponse._();
  DetailResponse createEmptyInstance() => create();
  static $pb.PbList<DetailResponse> createRepeated() => $pb.PbList<DetailResponse>();
  @$core.pragma('dart2js:noInline')
  static DetailResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DetailResponse>(create);
  static DetailResponse? _defaultInstance;

  @$pb.TagNumber(1)
  DetailResponse_DetailItem get item => $_getN(0);
  @$pb.TagNumber(1)
  set item(DetailResponse_DetailItem v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasItem() => $_has(0);
  @$pb.TagNumber(1)
  void clearItem() => clearField(1);
  @$pb.TagNumber(1)
  DetailResponse_DetailItem ensureItem() => $_ensure(0);
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

class StreamResponse_StreamItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StreamResponse.StreamItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..aOM<Stream>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'audio', subBuilder: Stream.create)
    ..aOM<Stream>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'video', subBuilder: Stream.create)
    ..hasRequiredFields = false
  ;

  StreamResponse_StreamItem._() : super();
  factory StreamResponse_StreamItem({
    Stream? audio,
    Stream? video,
  }) {
    final _result = create();
    if (audio != null) {
      _result.audio = audio;
    }
    if (video != null) {
      _result.video = video;
    }
    return _result;
  }
  factory StreamResponse_StreamItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamResponse_StreamItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamResponse_StreamItem clone() => StreamResponse_StreamItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamResponse_StreamItem copyWith(void Function(StreamResponse_StreamItem) updates) => super.copyWith((message) => updates(message as StreamResponse_StreamItem)) as StreamResponse_StreamItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StreamResponse_StreamItem create() => StreamResponse_StreamItem._();
  StreamResponse_StreamItem createEmptyInstance() => create();
  static $pb.PbList<StreamResponse_StreamItem> createRepeated() => $pb.PbList<StreamResponse_StreamItem>();
  @$core.pragma('dart2js:noInline')
  static StreamResponse_StreamItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamResponse_StreamItem>(create);
  static StreamResponse_StreamItem? _defaultInstance;

  @$pb.TagNumber(1)
  Stream get audio => $_getN(0);
  @$pb.TagNumber(1)
  set audio(Stream v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAudio() => $_has(0);
  @$pb.TagNumber(1)
  void clearAudio() => clearField(1);
  @$pb.TagNumber(1)
  Stream ensureAudio() => $_ensure(0);

  @$pb.TagNumber(2)
  Stream get video => $_getN(1);
  @$pb.TagNumber(2)
  set video(Stream v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasVideo() => $_has(1);
  @$pb.TagNumber(2)
  void clearVideo() => clearField(2);
  @$pb.TagNumber(2)
  Stream ensureVideo() => $_ensure(1);
}

class StreamResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StreamResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bragi'), createEmptyInstance: create)
    ..pc<StreamResponse_StreamItem>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'streams', $pb.PbFieldType.PM, subBuilder: StreamResponse_StreamItem.create)
    ..hasRequiredFields = false
  ;

  StreamResponse._() : super();
  factory StreamResponse({
    $core.Iterable<StreamResponse_StreamItem>? streams,
  }) {
    final _result = create();
    if (streams != null) {
      _result.streams.addAll(streams);
    }
    return _result;
  }
  factory StreamResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamResponse clone() => StreamResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamResponse copyWith(void Function(StreamResponse) updates) => super.copyWith((message) => updates(message as StreamResponse)) as StreamResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StreamResponse create() => StreamResponse._();
  StreamResponse createEmptyInstance() => create();
  static $pb.PbList<StreamResponse> createRepeated() => $pb.PbList<StreamResponse>();
  @$core.pragma('dart2js:noInline')
  static StreamResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamResponse>(create);
  static StreamResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<StreamResponse_StreamItem> get streams => $_getList(0);
}

