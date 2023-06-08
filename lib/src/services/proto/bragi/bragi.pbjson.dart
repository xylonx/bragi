///
//  Generated code. Do not modify.
//  source: bragi/bragi.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use providerDescriptor instead')
const Provider$json = const {
  '1': 'Provider',
  '2': const [
    const {'1': 'PROVIDER_UNSPECIFIED', '2': 0},
    const {'1': 'PROVIDER_SPOTIFY', '2': 1},
    const {'1': 'PROVIDER_NETEASE_MUSIC', '2': 2},
    const {'1': 'PROVIDER_YOUTUBE', '2': 3},
    const {'1': 'PROVIDER_BILIBILI', '2': 4},
  ],
};

/// Descriptor for `Provider`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List providerDescriptor = $convert.base64Decode('CghQcm92aWRlchIYChRQUk9WSURFUl9VTlNQRUNJRklFRBAAEhQKEFBST1ZJREVSX1NQT1RJRlkQARIaChZQUk9WSURFUl9ORVRFQVNFX01VU0lDEAISFAoQUFJPVklERVJfWU9VVFVCRRADEhUKEVBST1ZJREVSX0JJTElCSUxJEAQ=');
@$core.Deprecated('Use searchZoneDescriptor instead')
const SearchZone$json = const {
  '1': 'SearchZone',
  '2': const [
    const {'1': 'SEARCH_ZONE_UNSPECIFIED', '2': 0},
    const {'1': 'SEARCH_ZONE_TRACK', '2': 1},
    const {'1': 'SEARCH_ZONE_ARTIST', '2': 2},
    const {'1': 'SEARCH_ZONE_ALBUM', '2': 3},
    const {'1': 'SEARCH_ZONE_PLAYLIST', '2': 4},
  ],
};

/// Descriptor for `SearchZone`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List searchZoneDescriptor = $convert.base64Decode('CgpTZWFyY2hab25lEhsKF1NFQVJDSF9aT05FX1VOU1BFQ0lGSUVEEAASFQoRU0VBUkNIX1pPTkVfVFJBQ0sQARIWChJTRUFSQ0hfWk9ORV9BUlRJU1QQAhIVChFTRUFSQ0hfWk9ORV9BTEJVTRADEhgKFFNFQVJDSF9aT05FX1BMQVlMSVNUEAQ=');
@$core.Deprecated('Use imageDescriptor instead')
const Image$json = const {
  '1': 'Image',
  '2': const [
    const {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    const {'1': 'width', '3': 2, '4': 1, '5': 3, '9': 0, '10': 'width', '17': true},
    const {'1': 'length', '3': 3, '4': 1, '5': 3, '9': 1, '10': 'length', '17': true},
  ],
  '8': const [
    const {'1': '_width'},
    const {'1': '_length'},
  ],
};

/// Descriptor for `Image`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageDescriptor = $convert.base64Decode('CgVJbWFnZRIQCgN1cmwYASABKAlSA3VybBIZCgV3aWR0aBgCIAEoA0gAUgV3aWR0aIgBARIbCgZsZW5ndGgYAyABKANIAVIGbGVuZ3RoiAEBQggKBl93aWR0aEIJCgdfbGVuZ3Ro');
@$core.Deprecated('Use streamDescriptor instead')
const Stream$json = const {
  '1': 'Stream',
  '2': const [
    const {'1': 'provider', '3': 1, '4': 1, '5': 14, '6': '.bragi.Provider', '10': 'provider'},
    const {'1': 'quality', '3': 2, '4': 1, '5': 9, '10': 'quality'},
    const {'1': 'base_url', '3': 3, '4': 1, '5': 9, '10': 'baseUrl'},
    const {'1': 'backup_url', '3': 4, '4': 3, '5': 9, '10': 'backupUrl'},
  ],
};

/// Descriptor for `Stream`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamDescriptor = $convert.base64Decode('CgZTdHJlYW0SKwoIcHJvdmlkZXIYASABKA4yDy5icmFnaS5Qcm92aWRlclIIcHJvdmlkZXISGAoHcXVhbGl0eRgCIAEoCVIHcXVhbGl0eRIZCghiYXNlX3VybBgDIAEoCVIHYmFzZVVybBIdCgpiYWNrdXBfdXJsGAQgAygJUgliYWNrdXBVcmw=');
@$core.Deprecated('Use userInfoDescriptor instead')
const UserInfo$json = const {
  '1': 'UserInfo',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'provider', '3': 2, '4': 1, '5': 14, '6': '.bragi.Provider', '10': 'provider'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `UserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInfoDescriptor = $convert.base64Decode('CghVc2VySW5mbxIOCgJpZBgBIAEoCVICaWQSKwoIcHJvdmlkZXIYAiABKA4yDy5icmFnaS5Qcm92aWRlclIIcHJvdmlkZXISEgoEbmFtZRgDIAEoCVIEbmFtZQ==');
@$core.Deprecated('Use userDetailDescriptor instead')
const UserDetail$json = const {
  '1': 'UserDetail',
  '2': const [
    const {'1': 'info', '3': 1, '4': 1, '5': 11, '6': '.bragi.UserInfo', '10': 'info'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'description', '17': true},
    const {'1': 'avatar', '3': 3, '4': 1, '5': 11, '6': '.bragi.Image', '10': 'avatar'},
  ],
  '8': const [
    const {'1': '_description'},
  ],
};

/// Descriptor for `UserDetail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDetailDescriptor = $convert.base64Decode('CgpVc2VyRGV0YWlsEiMKBGluZm8YASABKAsyDy5icmFnaS5Vc2VySW5mb1IEaW5mbxIlCgtkZXNjcmlwdGlvbhgCIAEoCUgAUgtkZXNjcmlwdGlvbogBARIkCgZhdmF0YXIYAyABKAsyDC5icmFnaS5JbWFnZVIGYXZhdGFyQg4KDF9kZXNjcmlwdGlvbg==');
@$core.Deprecated('Use trackInfoDescriptor instead')
const TrackInfo$json = const {
  '1': 'TrackInfo',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'provider', '3': 2, '4': 1, '5': 14, '6': '.bragi.Provider', '10': 'provider'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'artists', '3': 4, '4': 3, '5': 11, '6': '.bragi.UserInfo', '10': 'artists'},
    const {'1': 'cover', '3': 5, '4': 1, '5': 11, '6': '.bragi.Image', '10': 'cover'},
  ],
};

/// Descriptor for `TrackInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trackInfoDescriptor = $convert.base64Decode('CglUcmFja0luZm8SDgoCaWQYASABKAlSAmlkEisKCHByb3ZpZGVyGAIgASgOMg8uYnJhZ2kuUHJvdmlkZXJSCHByb3ZpZGVyEhIKBG5hbWUYAyABKAlSBG5hbWUSKQoHYXJ0aXN0cxgEIAMoCzIPLmJyYWdpLlVzZXJJbmZvUgdhcnRpc3RzEiIKBWNvdmVyGAUgASgLMgwuYnJhZ2kuSW1hZ2VSBWNvdmVy');
@$core.Deprecated('Use trackCollectionDescriptor instead')
const TrackCollection$json = const {
  '1': 'TrackCollection',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'provider', '3': 2, '4': 1, '5': 14, '6': '.bragi.Provider', '10': 'provider'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'authors', '3': 4, '4': 3, '5': 11, '6': '.bragi.UserInfo', '10': 'authors'},
    const {'1': 'cover', '3': 5, '4': 1, '5': 11, '6': '.bragi.Image', '10': 'cover'},
  ],
};

/// Descriptor for `TrackCollection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trackCollectionDescriptor = $convert.base64Decode('Cg9UcmFja0NvbGxlY3Rpb24SDgoCaWQYASABKAlSAmlkEisKCHByb3ZpZGVyGAIgASgOMg8uYnJhZ2kuUHJvdmlkZXJSCHByb3ZpZGVyEhIKBG5hbWUYAyABKAlSBG5hbWUSKQoHYXV0aG9ycxgEIAMoCzIPLmJyYWdpLlVzZXJJbmZvUgdhdXRob3JzEiIKBWNvdmVyGAUgASgLMgwuYnJhZ2kuSW1hZ2VSBWNvdmVy');
@$core.Deprecated('Use trackCollectionDetailDescriptor instead')
const TrackCollectionDetail$json = const {
  '1': 'TrackCollectionDetail',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'provider', '3': 2, '4': 1, '5': 14, '6': '.bragi.Provider', '10': 'provider'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'authors', '3': 4, '4': 3, '5': 11, '6': '.bragi.UserDetail', '10': 'authors'},
    const {'1': 'cover', '3': 5, '4': 1, '5': 11, '6': '.bragi.Image', '10': 'cover'},
    const {'1': 'tracks', '3': 6, '4': 3, '5': 11, '6': '.bragi.TrackInfo', '10': 'tracks'},
    const {'1': 'description', '3': 7, '4': 1, '5': 9, '9': 0, '10': 'description', '17': true},
  ],
  '8': const [
    const {'1': '_description'},
  ],
};

/// Descriptor for `TrackCollectionDetail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trackCollectionDetailDescriptor = $convert.base64Decode('ChVUcmFja0NvbGxlY3Rpb25EZXRhaWwSDgoCaWQYASABKAlSAmlkEisKCHByb3ZpZGVyGAIgASgOMg8uYnJhZ2kuUHJvdmlkZXJSCHByb3ZpZGVyEhIKBG5hbWUYAyABKAlSBG5hbWUSKwoHYXV0aG9ycxgEIAMoCzIRLmJyYWdpLlVzZXJEZXRhaWxSB2F1dGhvcnMSIgoFY292ZXIYBSABKAsyDC5icmFnaS5JbWFnZVIFY292ZXISKAoGdHJhY2tzGAYgAygLMhAuYnJhZ2kuVHJhY2tJbmZvUgZ0cmFja3MSJQoLZGVzY3JpcHRpb24YByABKAlIAFILZGVzY3JpcHRpb26IAQFCDgoMX2Rlc2NyaXB0aW9u');
@$core.Deprecated('Use suggestRequestDescriptor instead')
const SuggestRequest$json = const {
  '1': 'SuggestRequest',
  '2': const [
    const {'1': 'providers', '3': 1, '4': 3, '5': 14, '6': '.bragi.Provider', '10': 'providers'},
    const {'1': 'keyword', '3': 2, '4': 1, '5': 9, '10': 'keyword'},
  ],
};

/// Descriptor for `SuggestRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List suggestRequestDescriptor = $convert.base64Decode('Cg5TdWdnZXN0UmVxdWVzdBItCglwcm92aWRlcnMYASADKA4yDy5icmFnaS5Qcm92aWRlclIJcHJvdmlkZXJzEhgKB2tleXdvcmQYAiABKAlSB2tleXdvcmQ=');
@$core.Deprecated('Use suggestReplayDescriptor instead')
const SuggestReplay$json = const {
  '1': 'SuggestReplay',
  '2': const [
    const {'1': 'suggestions', '3': 1, '4': 3, '5': 11, '6': '.bragi.SuggestReplay.Suggestion', '10': 'suggestions'},
  ],
  '3': const [SuggestReplay_Suggestion$json],
};

@$core.Deprecated('Use suggestReplayDescriptor instead')
const SuggestReplay_Suggestion$json = const {
  '1': 'Suggestion',
  '2': const [
    const {'1': 'provider', '3': 1, '4': 1, '5': 14, '6': '.bragi.Provider', '10': 'provider'},
    const {'1': 'suggestion', '3': 2, '4': 1, '5': 9, '10': 'suggestion'},
  ],
};

/// Descriptor for `SuggestReplay`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List suggestReplayDescriptor = $convert.base64Decode('Cg1TdWdnZXN0UmVwbGF5EkEKC3N1Z2dlc3Rpb25zGAEgAygLMh8uYnJhZ2kuU3VnZ2VzdFJlcGxheS5TdWdnZXN0aW9uUgtzdWdnZXN0aW9ucxpZCgpTdWdnZXN0aW9uEisKCHByb3ZpZGVyGAEgASgOMg8uYnJhZ2kuUHJvdmlkZXJSCHByb3ZpZGVyEh4KCnN1Z2dlc3Rpb24YAiABKAlSCnN1Z2dlc3Rpb24=');
@$core.Deprecated('Use searchRequestDescriptor instead')
const SearchRequest$json = const {
  '1': 'SearchRequest',
  '2': const [
    const {'1': 'providers', '3': 1, '4': 3, '5': 14, '6': '.bragi.Provider', '10': 'providers'},
    const {'1': 'keyword', '3': 2, '4': 1, '5': 9, '10': 'keyword'},
    const {'1': 'page', '3': 3, '4': 1, '5': 5, '10': 'page'},
    const {'1': 'fields', '3': 4, '4': 3, '5': 14, '6': '.bragi.SearchZone', '10': 'fields'},
  ],
};

/// Descriptor for `SearchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchRequestDescriptor = $convert.base64Decode('Cg1TZWFyY2hSZXF1ZXN0Ei0KCXByb3ZpZGVycxgBIAMoDjIPLmJyYWdpLlByb3ZpZGVyUglwcm92aWRlcnMSGAoHa2V5d29yZBgCIAEoCVIHa2V5d29yZBISCgRwYWdlGAMgASgFUgRwYWdlEikKBmZpZWxkcxgEIAMoDjIRLmJyYWdpLlNlYXJjaFpvbmVSBmZpZWxkcw==');
@$core.Deprecated('Use searchReplayDescriptor instead')
const SearchReplay$json = const {
  '1': 'SearchReplay',
  '2': const [
    const {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.bragi.SearchReplay.SearchItem', '10': 'items'},
  ],
  '3': const [SearchReplay_SearchItem$json],
};

@$core.Deprecated('Use searchReplayDescriptor instead')
const SearchReplay_SearchItem$json = const {
  '1': 'SearchItem',
  '2': const [
    const {'1': 'track', '3': 1, '4': 1, '5': 11, '6': '.bragi.TrackInfo', '9': 0, '10': 'track'},
    const {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.bragi.UserDetail', '9': 0, '10': 'user'},
    const {'1': 'album', '3': 3, '4': 1, '5': 11, '6': '.bragi.TrackCollection', '9': 0, '10': 'album'},
    const {'1': 'playlist', '3': 4, '4': 1, '5': 11, '6': '.bragi.TrackCollection', '9': 0, '10': 'playlist'},
  ],
  '8': const [
    const {'1': 'Item'},
  ],
};

/// Descriptor for `SearchReplay`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchReplayDescriptor = $convert.base64Decode('CgxTZWFyY2hSZXBsYXkSNAoFaXRlbXMYASADKAsyHi5icmFnaS5TZWFyY2hSZXBsYXkuU2VhcmNoSXRlbVIFaXRlbXMazQEKClNlYXJjaEl0ZW0SKAoFdHJhY2sYASABKAsyEC5icmFnaS5UcmFja0luZm9IAFIFdHJhY2sSJwoEdXNlchgCIAEoCzIRLmJyYWdpLlVzZXJEZXRhaWxIAFIEdXNlchIuCgVhbGJ1bRgDIAEoCzIWLmJyYWdpLlRyYWNrQ29sbGVjdGlvbkgAUgVhbGJ1bRI0CghwbGF5bGlzdBgEIAEoCzIWLmJyYWdpLlRyYWNrQ29sbGVjdGlvbkgAUghwbGF5bGlzdEIGCgRJdGVt');
@$core.Deprecated('Use detailRequestDescriptor instead')
const DetailRequest$json = const {
  '1': 'DetailRequest',
  '2': const [
    const {'1': 'provider', '3': 1, '4': 1, '5': 14, '6': '.bragi.Provider', '10': 'provider'},
    const {'1': 'zone', '3': 2, '4': 1, '5': 14, '6': '.bragi.SearchZone', '10': 'zone'},
    const {'1': 'id', '3': 3, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DetailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List detailRequestDescriptor = $convert.base64Decode('Cg1EZXRhaWxSZXF1ZXN0EisKCHByb3ZpZGVyGAEgASgOMg8uYnJhZ2kuUHJvdmlkZXJSCHByb3ZpZGVyEiUKBHpvbmUYAiABKA4yES5icmFnaS5TZWFyY2hab25lUgR6b25lEg4KAmlkGAMgASgJUgJpZA==');
@$core.Deprecated('Use detailReplayDescriptor instead')
const DetailReplay$json = const {
  '1': 'DetailReplay',
  '2': const [
    const {'1': 'track', '3': 1, '4': 1, '5': 11, '6': '.bragi.TrackInfo', '9': 0, '10': 'track'},
    const {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.bragi.UserDetail', '9': 0, '10': 'user'},
    const {'1': 'album', '3': 3, '4': 1, '5': 11, '6': '.bragi.TrackCollectionDetail', '9': 0, '10': 'album'},
    const {'1': 'playlist', '3': 4, '4': 1, '5': 11, '6': '.bragi.TrackCollectionDetail', '9': 0, '10': 'playlist'},
  ],
  '8': const [
    const {'1': 'Item'},
  ],
};

/// Descriptor for `DetailReplay`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List detailReplayDescriptor = $convert.base64Decode('CgxEZXRhaWxSZXBsYXkSKAoFdHJhY2sYASABKAsyEC5icmFnaS5UcmFja0luZm9IAFIFdHJhY2sSJwoEdXNlchgCIAEoCzIRLmJyYWdpLlVzZXJEZXRhaWxIAFIEdXNlchI0CgVhbGJ1bRgDIAEoCzIcLmJyYWdpLlRyYWNrQ29sbGVjdGlvbkRldGFpbEgAUgVhbGJ1bRI6CghwbGF5bGlzdBgEIAEoCzIcLmJyYWdpLlRyYWNrQ29sbGVjdGlvbkRldGFpbEgAUghwbGF5bGlzdEIGCgRJdGVt');
@$core.Deprecated('Use streamRequestDescriptor instead')
const StreamRequest$json = const {
  '1': 'StreamRequest',
  '2': const [
    const {'1': 'provider', '3': 1, '4': 1, '5': 14, '6': '.bragi.Provider', '10': 'provider'},
    const {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `StreamRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamRequestDescriptor = $convert.base64Decode('Cg1TdHJlYW1SZXF1ZXN0EisKCHByb3ZpZGVyGAEgASgOMg8uYnJhZ2kuUHJvdmlkZXJSCHByb3ZpZGVyEg4KAmlkGAIgASgJUgJpZA==');
@$core.Deprecated('Use streamReplayDescriptor instead')
const StreamReplay$json = const {
  '1': 'StreamReplay',
  '2': const [
    const {'1': 'audios', '3': 1, '4': 3, '5': 11, '6': '.bragi.Stream', '10': 'audios'},
    const {'1': 'videos', '3': 2, '4': 3, '5': 11, '6': '.bragi.Stream', '10': 'videos'},
  ],
};

/// Descriptor for `StreamReplay`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamReplayDescriptor = $convert.base64Decode('CgxTdHJlYW1SZXBsYXkSJQoGYXVkaW9zGAEgAygLMg0uYnJhZ2kuU3RyZWFtUgZhdWRpb3MSJQoGdmlkZW9zGAIgAygLMg0uYnJhZ2kuU3RyZWFtUgZ2aWRlb3M=');
