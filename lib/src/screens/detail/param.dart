import 'package:bragi/src/services/proto/bragi/bragi.pb.dart';

class PlaylistDetailParameter {
  final Provider provider;
  final String id;
  const PlaylistDetailParameter({required this.provider, required this.id});
}

class ArtistDetailParameter {
  final Provider provider;
  final String id;
  const ArtistDetailParameter({required this.provider, required this.id});
}
