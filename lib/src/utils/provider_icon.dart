import 'package:bragi/src/services/proto/bragi/bragi.pb.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final providerIconMap = {
  Provider.PROVIDER_BILIBILI: FontAwesomeIcons.bilibili,
  Provider.PROVIDER_SPOTIFY: FontAwesomeIcons.spotify,
  Provider.PROVIDER_YOUTUBE: FontAwesomeIcons.youtube,
  // FIXME(xylonx): maybe use svg assert
  // Provider.PROVIDER_NETEASE_MUSIC: FontAwesomeIcons.music,
};

IconData providerIcons(Provider provider) {
  return providerIconMap[provider] ?? FontAwesomeIcons.music;
}
