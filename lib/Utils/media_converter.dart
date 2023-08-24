import 'package:audio_service/audio_service.dart';
import 'package:bragi/Services/proto/bragi/bragi.pbgrpc.dart';

// ignore: avoid_classes_with_only_static_members
class MediaConverter {
  static MediaItem track2MediaItem(Track track, List<Stream> streams) {
    return MediaItem(
      id: track.id,
      title: track.name,
      artist: track.artists.first.name,
      displayTitle: track.name,
      displaySubtitle: track.artists.map((e) => e.name).join(', '),
      artUri: Uri.parse(track.cover.url),
      duration: const Duration(minutes: 3),
      extras: {
        'uri': streams.first.url,
      },
    );
  }
}
