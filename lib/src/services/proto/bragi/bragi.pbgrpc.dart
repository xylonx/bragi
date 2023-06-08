///
//  Generated code. Do not modify.
//  source: bragi/bragi.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'bragi.pb.dart' as $0;
export 'bragi.pb.dart';

class BragiClient extends $grpc.Client {
  static final _$suggest =
      $grpc.ClientMethod<$0.SuggestRequest, $0.SuggestReplay>(
          '/bragi.Bragi/Suggest',
          ($0.SuggestRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.SuggestReplay.fromBuffer(value));
  static final _$search = $grpc.ClientMethod<$0.SearchRequest, $0.SearchReplay>(
      '/bragi.Bragi/Search',
      ($0.SearchRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SearchReplay.fromBuffer(value));
  static final _$detail = $grpc.ClientMethod<$0.DetailRequest, $0.DetailReplay>(
      '/bragi.Bragi/Detail',
      ($0.DetailRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DetailReplay.fromBuffer(value));
  static final _$stream = $grpc.ClientMethod<$0.StreamRequest, $0.StreamReplay>(
      '/bragi.Bragi/Stream',
      ($0.StreamRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.StreamReplay.fromBuffer(value));

  BragiClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.SuggestReplay> suggest($0.SuggestRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$suggest, request, options: options);
  }

  $grpc.ResponseFuture<$0.SearchReplay> search($0.SearchRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$search, request, options: options);
  }

  $grpc.ResponseFuture<$0.DetailReplay> detail($0.DetailRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$detail, request, options: options);
  }

  $grpc.ResponseFuture<$0.StreamReplay> stream($0.StreamRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$stream, request, options: options);
  }
}

abstract class BragiServiceBase extends $grpc.Service {
  $core.String get $name => 'bragi.Bragi';

  BragiServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SuggestRequest, $0.SuggestReplay>(
        'Suggest',
        suggest_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SuggestRequest.fromBuffer(value),
        ($0.SuggestReplay value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SearchRequest, $0.SearchReplay>(
        'Search',
        search_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SearchRequest.fromBuffer(value),
        ($0.SearchReplay value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DetailRequest, $0.DetailReplay>(
        'Detail',
        detail_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DetailRequest.fromBuffer(value),
        ($0.DetailReplay value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StreamRequest, $0.StreamReplay>(
        'Stream',
        stream_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.StreamRequest.fromBuffer(value),
        ($0.StreamReplay value) => value.writeToBuffer()));
  }

  $async.Future<$0.SuggestReplay> suggest_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SuggestRequest> request) async {
    return suggest(call, await request);
  }

  $async.Future<$0.SearchReplay> search_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SearchRequest> request) async {
    return search(call, await request);
  }

  $async.Future<$0.DetailReplay> detail_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DetailRequest> request) async {
    return detail(call, await request);
  }

  $async.Future<$0.StreamReplay> stream_Pre(
      $grpc.ServiceCall call, $async.Future<$0.StreamRequest> request) async {
    return stream(call, await request);
  }

  $async.Future<$0.SuggestReplay> suggest(
      $grpc.ServiceCall call, $0.SuggestRequest request);
  $async.Future<$0.SearchReplay> search(
      $grpc.ServiceCall call, $0.SearchRequest request);
  $async.Future<$0.DetailReplay> detail(
      $grpc.ServiceCall call, $0.DetailRequest request);
  $async.Future<$0.StreamReplay> stream(
      $grpc.ServiceCall call, $0.StreamRequest request);
}
