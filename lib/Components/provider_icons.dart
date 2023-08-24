import 'package:bragi/Services/proto/bragi/bragi.pbgrpc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: avoid_classes_with_only_static_members
class ProviderIcons {
  static const IconData bilibili = FontAwesomeIcons.bilibili;

  static const IconData youtube = FontAwesomeIcons.youtube;

  static const IconData spotify = FontAwesomeIcons.spotify;

  static const IconData netease = FontAwesomeIcons.music;

  static IconData icons(Provider provider) {
    switch (provider) {
      case Provider.PROVIDER_BILIBILI:
        return ProviderIcons.bilibili;
      case Provider.PROVIDER_NETEASE_MUSIC:
        return ProviderIcons.netease;
      case Provider.PROVIDER_SPOTIFY:
        return ProviderIcons.spotify;
      case Provider.PROVIDER_YOUTUBE:
        return ProviderIcons.youtube;
      default:
        return ProviderIcons.netease;
    }
  }
}
