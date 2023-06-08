///
//  Generated code. Do not modify.
//  source: bragi/bragi.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Provider extends $pb.ProtobufEnum {
  static const Provider PROVIDER_UNSPECIFIED = Provider._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PROVIDER_UNSPECIFIED');
  static const Provider PROVIDER_SPOTIFY = Provider._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PROVIDER_SPOTIFY');
  static const Provider PROVIDER_NETEASE_MUSIC = Provider._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PROVIDER_NETEASE_MUSIC');
  static const Provider PROVIDER_YOUTUBE = Provider._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PROVIDER_YOUTUBE');
  static const Provider PROVIDER_BILIBILI = Provider._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PROVIDER_BILIBILI');

  static const $core.List<Provider> values = <Provider> [
    PROVIDER_UNSPECIFIED,
    PROVIDER_SPOTIFY,
    PROVIDER_NETEASE_MUSIC,
    PROVIDER_YOUTUBE,
    PROVIDER_BILIBILI,
  ];

  static final $core.Map<$core.int, Provider> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Provider? valueOf($core.int value) => _byValue[value];

  const Provider._($core.int v, $core.String n) : super(v, n);
}

class SearchZone extends $pb.ProtobufEnum {
  static const SearchZone SEARCH_ZONE_UNSPECIFIED = SearchZone._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SEARCH_ZONE_UNSPECIFIED');
  static const SearchZone SEARCH_ZONE_TRACK = SearchZone._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SEARCH_ZONE_TRACK');
  static const SearchZone SEARCH_ZONE_ARTIST = SearchZone._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SEARCH_ZONE_ARTIST');
  static const SearchZone SEARCH_ZONE_ALBUM = SearchZone._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SEARCH_ZONE_ALBUM');
  static const SearchZone SEARCH_ZONE_PLAYLIST = SearchZone._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SEARCH_ZONE_PLAYLIST');

  static const $core.List<SearchZone> values = <SearchZone> [
    SEARCH_ZONE_UNSPECIFIED,
    SEARCH_ZONE_TRACK,
    SEARCH_ZONE_ARTIST,
    SEARCH_ZONE_ALBUM,
    SEARCH_ZONE_PLAYLIST,
  ];

  static final $core.Map<$core.int, SearchZone> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SearchZone? valueOf($core.int value) => _byValue[value];

  const SearchZone._($core.int v, $core.String n) : super(v, n);
}

