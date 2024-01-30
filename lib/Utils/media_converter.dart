import 'package:audio_service/audio_service.dart';
import 'package:bragi/Services/bragi/model.dart';

// ignore: avoid_classes_with_only_static_members
class MediaConverter {
  static MediaItem track2MediaItem(Song song, List<AudioStream> streams) {
    return MediaItem(
      id: song.id,
      title: song.name,
      artist: song.artists.first.name,
      displayTitle: song.name,
      displaySubtitle: song.artists.map((e) => e.name).join(', '),
      artUri: Uri.parse(song.cover ?? ''),
      duration: Duration(seconds: song.duration ?? 3 * 60),
      extras: {
        'uri': streams.first.url,
        'streams': streams,
      },
    );
  }

  static String extractUriFromMediaItem(MediaItem mediaItem) {
    return mediaItem.extras!['uri'] as String;
  }

  static List<AudioStream> extractStreamsFromMediaItem(MediaItem mediaItem) {
    return mediaItem.extras!['streams'] as List<AudioStream>;
  }

  static MediaItem changeMediaSource(MediaItem mediaItem, AudioStream stream) {
    // mediaItem.extras!['uri'] = stream.url;
    MediaItem item = mediaItem.copyWith();
    item.extras!['uri'] = stream.url;
    return item;
  }
}
