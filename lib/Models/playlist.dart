import 'package:bragi/Services/proto/bragi/bragi.pbgrpc.dart';
import 'package:hive/hive.dart';

class PlaylistDetailAdapter extends TypeAdapter<PlaylistDetail> {
  @override
  int get typeId => 1;

  @override
  PlaylistDetail read(BinaryReader reader) {
    return PlaylistDetail.fromJson(reader.readString());
  }

  @override
  void write(BinaryWriter writer, PlaylistDetail obj) {
    writer.writeString(obj.writeToJson());
  }
}

class TrackAdapter extends TypeAdapter<Track> {
  @override
  int get typeId => 2;

  @override
  Track read(BinaryReader reader) {
    return Track.fromJson(reader.readString());
  }

  @override
  void write(BinaryWriter writer, Track obj) {
    writer.writeString(obj.writeToJson());
  }
}

PlaylistDetail defaultPlaylistDetail = PlaylistDetail(
  id: 'PLtrsXT0Azk1lh-F9RxHOlPBhpUcn-x96X',
  provider: Provider.PROVIDER_YOUTUBE,
  name: '早稻叽',
  cover: Image(
    url: 'https://invidious.esmailelbob.xyz/vi/WSQQnwy0uW4/maxresdefault.jpg',
  ),
  description: '',
  artists: [
    ArtistDetail(
      artist: Artist(
        id: 'UC1Gc0YMzVQw1rqd2nLlnX5w',
        provider: Provider.PROVIDER_YOUTUBE,
        name: '呆呆獸',
      ),
      avatar: Image(
        url:
            'https://yt3.ggpht.com/ezrdXlD4FBhBB1oN8TRdMv8iEciN1czl7Jz73Qv6_XSLhKwJr1rqkZQVrSy6_ljleQYGGIXM9g=s48-c-k-c0x00ffffff-no-rj',
      ),
    ),
  ],
  tracks: [
    Track(
      id: 'WSQQnwy0uW4',
      provider: Provider.PROVIDER_YOUTUBE,
      name: '【早稻叽】全网最甜日语版《爱你》连rap也甜到❤️里',
      cover: Image(
        url:
            'https://invidious.esmailelbob.xyz/vi/WSQQnwy0uW4/maxresdefault.jpg',
      ),
      artists: [
        Artist(
          id: 'UCoOR_eK6ZXKRtHw7r0IyEeQ',
          name: '王戈wg',
          provider: Provider.PROVIDER_YOUTUBE,
        ),
      ],
    ),
    Track(
      id: 'Do7fppGiAzQ',
      provider: Provider.PROVIDER_YOUTUBE,
      name: 'アスノヨゾラ哨戒班/早稻叽',
      cover: Image(
        url:
            'https://invidious.esmailelbob.xyz/vi/Do7fppGiAzQ/maxresdefault.jpg',
      ),
      artists: [
        Artist(
          id: 'UCk6oj-RyB58nbdOGs27SpdA',
          name: '拉拉',
          provider: Provider.PROVIDER_YOUTUBE,
        ),
      ],
    ),
  ],
);
