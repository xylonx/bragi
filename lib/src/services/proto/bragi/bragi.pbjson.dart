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
@$core.Deprecated('Use zoneDescriptor instead')
const Zone$json = const {
  '1': 'Zone',
  '2': const [
    const {'1': 'ZONE_UNSPECIFIED', '2': 0},
    const {'1': 'ZONE_TRACK', '2': 1},
    const {'1': 'ZONE_ARTIST', '2': 2},
    const {'1': 'ZONE_PLAYLIST', '2': 3},
  ],
};

/// Descriptor for `Zone`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List zoneDescriptor = $convert.base64Decode('CgRab25lEhQKEFpPTkVfVU5TUEVDSUZJRUQQABIOCgpaT05FX1RSQUNLEAESDwoLWk9ORV9BUlRJU1QQAhIRCg1aT05FX1BMQVlMSVNUEAM=');
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
@$core.Deprecated('Use artistDescriptor instead')
const Artist$json = const {
  '1': 'Artist',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'provider', '3': 2, '4': 1, '5': 14, '6': '.bragi.Provider', '10': 'provider'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Artist`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List artistDescriptor = $convert.base64Decode('CgZBcnRpc3QSDgoCaWQYASABKAlSAmlkEisKCHByb3ZpZGVyGAIgASgOMg8uYnJhZ2kuUHJvdmlkZXJSCHByb3ZpZGVyEhIKBG5hbWUYAyABKAlSBG5hbWU=');
@$core.Deprecated('Use artistDetailDescriptor instead')
const ArtistDetail$json = const {
  '1': 'ArtistDetail',
  '2': const [
    const {'1': 'artist', '3': 1, '4': 1, '5': 11, '6': '.bragi.Artist', '10': 'artist'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'description', '17': true},
    const {'1': 'avatar', '3': 3, '4': 1, '5': 11, '6': '.bragi.Image', '10': 'avatar'},
  ],
  '8': const [
    const {'1': '_description'},
  ],
};

/// Descriptor for `ArtistDetail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List artistDetailDescriptor = $convert.base64Decode('CgxBcnRpc3REZXRhaWwSJQoGYXJ0aXN0GAEgASgLMg0uYnJhZ2kuQXJ0aXN0UgZhcnRpc3QSJQoLZGVzY3JpcHRpb24YAiABKAlIAFILZGVzY3JpcHRpb26IAQESJAoGYXZhdGFyGAMgASgLMgwuYnJhZ2kuSW1hZ2VSBmF2YXRhckIOCgxfZGVzY3JpcHRpb24=');
@$core.Deprecated('Use trackDescriptor instead')
const Track$json = const {
  '1': 'Track',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'provider', '3': 2, '4': 1, '5': 14, '6': '.bragi.Provider', '10': 'provider'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'artists', '3': 4, '4': 3, '5': 11, '6': '.bragi.Artist', '10': 'artists'},
    const {'1': 'cover', '3': 5, '4': 1, '5': 11, '6': '.bragi.Image', '10': 'cover'},
  ],
};

/// Descriptor for `Track`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trackDescriptor = $convert.base64Decode('CgVUcmFjaxIOCgJpZBgBIAEoCVICaWQSKwoIcHJvdmlkZXIYAiABKA4yDy5icmFnaS5Qcm92aWRlclIIcHJvdmlkZXISEgoEbmFtZRgDIAEoCVIEbmFtZRInCgdhcnRpc3RzGAQgAygLMg0uYnJhZ2kuQXJ0aXN0UgdhcnRpc3RzEiIKBWNvdmVyGAUgASgLMgwuYnJhZ2kuSW1hZ2VSBWNvdmVy');
@$core.Deprecated('Use playlistDescriptor instead')
const Playlist$json = const {
  '1': 'Playlist',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'provider', '3': 2, '4': 1, '5': 14, '6': '.bragi.Provider', '10': 'provider'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'artists', '3': 4, '4': 3, '5': 11, '6': '.bragi.Artist', '10': 'artists'},
    const {'1': 'cover', '3': 5, '4': 1, '5': 11, '6': '.bragi.Image', '10': 'cover'},
  ],
};

/// Descriptor for `Playlist`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playlistDescriptor = $convert.base64Decode('CghQbGF5bGlzdBIOCgJpZBgBIAEoCVICaWQSKwoIcHJvdmlkZXIYAiABKA4yDy5icmFnaS5Qcm92aWRlclIIcHJvdmlkZXISEgoEbmFtZRgDIAEoCVIEbmFtZRInCgdhcnRpc3RzGAQgAygLMg0uYnJhZ2kuQXJ0aXN0UgdhcnRpc3RzEiIKBWNvdmVyGAUgASgLMgwuYnJhZ2kuSW1hZ2VSBWNvdmVy');
@$core.Deprecated('Use playlistDetailDescriptor instead')
const PlaylistDetail$json = const {
  '1': 'PlaylistDetail',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'provider', '3': 2, '4': 1, '5': 14, '6': '.bragi.Provider', '10': 'provider'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'artists', '3': 4, '4': 3, '5': 11, '6': '.bragi.ArtistDetail', '10': 'artists'},
    const {'1': 'cover', '3': 5, '4': 1, '5': 11, '6': '.bragi.Image', '10': 'cover'},
    const {'1': 'description', '3': 6, '4': 1, '5': 9, '9': 0, '10': 'description', '17': true},
    const {'1': 'tracks', '3': 7, '4': 3, '5': 11, '6': '.bragi.Track', '10': 'tracks'},
  ],
  '8': const [
    const {'1': '_description'},
  ],
};

/// Descriptor for `PlaylistDetail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playlistDetailDescriptor = $convert.base64Decode('Cg5QbGF5bGlzdERldGFpbBIOCgJpZBgBIAEoCVICaWQSKwoIcHJvdmlkZXIYAiABKA4yDy5icmFnaS5Qcm92aWRlclIIcHJvdmlkZXISEgoEbmFtZRgDIAEoCVIEbmFtZRItCgdhcnRpc3RzGAQgAygLMhMuYnJhZ2kuQXJ0aXN0RGV0YWlsUgdhcnRpc3RzEiIKBWNvdmVyGAUgASgLMgwuYnJhZ2kuSW1hZ2VSBWNvdmVyEiUKC2Rlc2NyaXB0aW9uGAYgASgJSABSC2Rlc2NyaXB0aW9uiAEBEiQKBnRyYWNrcxgHIAMoCzIMLmJyYWdpLlRyYWNrUgZ0cmFja3NCDgoMX2Rlc2NyaXB0aW9u');
@$core.Deprecated('Use streamDescriptor instead')
const Stream$json = const {
  '1': 'Stream',
  '2': const [
    const {'1': 'provider', '3': 1, '4': 1, '5': 14, '6': '.bragi.Provider', '10': 'provider'},
    const {'1': 'quality', '3': 2, '4': 1, '5': 9, '10': 'quality'},
    const {'1': 'url', '3': 3, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `Stream`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamDescriptor = $convert.base64Decode('CgZTdHJlYW0SKwoIcHJvdmlkZXIYASABKA4yDy5icmFnaS5Qcm92aWRlclIIcHJvdmlkZXISGAoHcXVhbGl0eRgCIAEoCVIHcXVhbGl0eRIQCgN1cmwYAyABKAlSA3VybA==');
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
@$core.Deprecated('Use suggestResponseDescriptor instead')
const SuggestResponse$json = const {
  '1': 'SuggestResponse',
  '2': const [
    const {'1': 'suggestions', '3': 1, '4': 3, '5': 11, '6': '.bragi.SuggestResponse.Suggestion', '10': 'suggestions'},
  ],
  '3': const [SuggestResponse_Suggestion$json],
};

@$core.Deprecated('Use suggestResponseDescriptor instead')
const SuggestResponse_Suggestion$json = const {
  '1': 'Suggestion',
  '2': const [
    const {'1': 'provider', '3': 1, '4': 1, '5': 14, '6': '.bragi.Provider', '10': 'provider'},
    const {'1': 'suggestion', '3': 2, '4': 1, '5': 9, '10': 'suggestion'},
  ],
};

/// Descriptor for `SuggestResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List suggestResponseDescriptor = $convert.base64Decode('Cg9TdWdnZXN0UmVzcG9uc2USQwoLc3VnZ2VzdGlvbnMYASADKAsyIS5icmFnaS5TdWdnZXN0UmVzcG9uc2UuU3VnZ2VzdGlvblILc3VnZ2VzdGlvbnMaWQoKU3VnZ2VzdGlvbhIrCghwcm92aWRlchgBIAEoDjIPLmJyYWdpLlByb3ZpZGVyUghwcm92aWRlchIeCgpzdWdnZXN0aW9uGAIgASgJUgpzdWdnZXN0aW9u');
@$core.Deprecated('Use searchRequestDescriptor instead')
const SearchRequest$json = const {
  '1': 'SearchRequest',
  '2': const [
    const {'1': 'providers', '3': 1, '4': 3, '5': 14, '6': '.bragi.Provider', '10': 'providers'},
    const {'1': 'keyword', '3': 2, '4': 1, '5': 9, '10': 'keyword'},
    const {'1': 'page', '3': 3, '4': 1, '5': 5, '10': 'page'},
    const {'1': 'fields', '3': 4, '4': 3, '5': 14, '6': '.bragi.Zone', '10': 'fields'},
  ],
};

/// Descriptor for `SearchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchRequestDescriptor = $convert.base64Decode('Cg1TZWFyY2hSZXF1ZXN0Ei0KCXByb3ZpZGVycxgBIAMoDjIPLmJyYWdpLlByb3ZpZGVyUglwcm92aWRlcnMSGAoHa2V5d29yZBgCIAEoCVIHa2V5d29yZBISCgRwYWdlGAMgASgFUgRwYWdlEiMKBmZpZWxkcxgEIAMoDjILLmJyYWdpLlpvbmVSBmZpZWxkcw==');
@$core.Deprecated('Use searchResponseDescriptor instead')
const SearchResponse$json = const {
  '1': 'SearchResponse',
  '2': const [
    const {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.bragi.SearchResponse.SearchItem', '10': 'items'},
  ],
  '3': const [SearchResponse_SearchItem$json],
};

@$core.Deprecated('Use searchResponseDescriptor instead')
const SearchResponse_SearchItem$json = const {
  '1': 'SearchItem',
  '2': const [
    const {'1': 'track', '3': 1, '4': 1, '5': 11, '6': '.bragi.Track', '9': 0, '10': 'track'},
    const {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.bragi.ArtistDetail', '9': 0, '10': 'user'},
    const {'1': 'playlist', '3': 3, '4': 1, '5': 11, '6': '.bragi.Playlist', '9': 0, '10': 'playlist'},
  ],
  '8': const [
    const {'1': 'item'},
  ],
};

/// Descriptor for `SearchResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchResponseDescriptor = $convert.base64Decode('Cg5TZWFyY2hSZXNwb25zZRI2CgVpdGVtcxgBIAMoCzIgLmJyYWdpLlNlYXJjaFJlc3BvbnNlLlNlYXJjaEl0ZW1SBWl0ZW1zGpQBCgpTZWFyY2hJdGVtEiQKBXRyYWNrGAEgASgLMgwuYnJhZ2kuVHJhY2tIAFIFdHJhY2sSKQoEdXNlchgCIAEoCzITLmJyYWdpLkFydGlzdERldGFpbEgAUgR1c2VyEi0KCHBsYXlsaXN0GAMgASgLMg8uYnJhZ2kuUGxheWxpc3RIAFIIcGxheWxpc3RCBgoEaXRlbQ==');
@$core.Deprecated('Use detailRequestDescriptor instead')
const DetailRequest$json = const {
  '1': 'DetailRequest',
  '2': const [
    const {'1': 'provider', '3': 1, '4': 1, '5': 14, '6': '.bragi.Provider', '10': 'provider'},
    const {'1': 'zone', '3': 2, '4': 1, '5': 14, '6': '.bragi.Zone', '10': 'zone'},
    const {'1': 'id', '3': 3, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'page', '3': 4, '4': 1, '5': 5, '10': 'page'},
  ],
};

/// Descriptor for `DetailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List detailRequestDescriptor = $convert.base64Decode('Cg1EZXRhaWxSZXF1ZXN0EisKCHByb3ZpZGVyGAEgASgOMg8uYnJhZ2kuUHJvdmlkZXJSCHByb3ZpZGVyEh8KBHpvbmUYAiABKA4yCy5icmFnaS5ab25lUgR6b25lEg4KAmlkGAMgASgJUgJpZBISCgRwYWdlGAQgASgFUgRwYWdl');
@$core.Deprecated('Use detailResponseDescriptor instead')
const DetailResponse$json = const {
  '1': 'DetailResponse',
  '2': const [
    const {'1': 'item', '3': 1, '4': 1, '5': 11, '6': '.bragi.DetailResponse.DetailItem', '10': 'item'},
  ],
  '3': const [DetailResponse_DetailItem$json],
};

@$core.Deprecated('Use detailResponseDescriptor instead')
const DetailResponse_DetailItem$json = const {
  '1': 'DetailItem',
  '2': const [
    const {'1': 'playlist', '3': 1, '4': 1, '5': 11, '6': '.bragi.PlaylistDetail', '9': 0, '10': 'playlist'},
  ],
  '8': const [
    const {'1': 'item'},
  ],
};

/// Descriptor for `DetailResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List detailResponseDescriptor = $convert.base64Decode('Cg5EZXRhaWxSZXNwb25zZRI0CgRpdGVtGAEgASgLMiAuYnJhZ2kuRGV0YWlsUmVzcG9uc2UuRGV0YWlsSXRlbVIEaXRlbRpJCgpEZXRhaWxJdGVtEjMKCHBsYXlsaXN0GAEgASgLMhUuYnJhZ2kuUGxheWxpc3REZXRhaWxIAFIIcGxheWxpc3RCBgoEaXRlbQ==');
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
@$core.Deprecated('Use streamResponseDescriptor instead')
const StreamResponse$json = const {
  '1': 'StreamResponse',
  '2': const [
    const {'1': 'streams', '3': 1, '4': 3, '5': 11, '6': '.bragi.StreamResponse.StreamItem', '10': 'streams'},
  ],
  '3': const [StreamResponse_StreamItem$json],
};

@$core.Deprecated('Use streamResponseDescriptor instead')
const StreamResponse_StreamItem$json = const {
  '1': 'StreamItem',
  '2': const [
    const {'1': 'audio', '3': 1, '4': 1, '5': 11, '6': '.bragi.Stream', '10': 'audio'},
    const {'1': 'video', '3': 2, '4': 1, '5': 11, '6': '.bragi.Stream', '9': 0, '10': 'video', '17': true},
  ],
  '8': const [
    const {'1': '_video'},
  ],
};

/// Descriptor for `StreamResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamResponseDescriptor = $convert.base64Decode('Cg5TdHJlYW1SZXNwb25zZRI6CgdzdHJlYW1zGAEgAygLMiAuYnJhZ2kuU3RyZWFtUmVzcG9uc2UuU3RyZWFtSXRlbVIHc3RyZWFtcxplCgpTdHJlYW1JdGVtEiMKBWF1ZGlvGAEgASgLMg0uYnJhZ2kuU3RyZWFtUgVhdWRpbxIoCgV2aWRlbxgCIAEoCzINLmJyYWdpLlN0cmVhbUgAUgV2aWRlb4gBAUIICgZfdmlkZW8=');
