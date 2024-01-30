import 'package:bragi/Services/bragi/model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: avoid_classes_with_only_static_members
class ProviderIcons {
  static const IconData bilibili = FontAwesomeIcons.bilibili;

  static const IconData youtube = FontAwesomeIcons.youtube;

  static const IconData spotify = FontAwesomeIcons.spotify;

  // static const IconData netease = FontAwesomeIcons.music;
  static const IconData netease =
      IconData(0xe800, fontFamily: "music_provider_icons", fontPackage: null);

  static IconData icons(Provider provider) {
    switch (provider) {
      case Provider.bilibili:
        return ProviderIcons.bilibili;
      case Provider.netEase:
        return ProviderIcons.netease;
      case Provider.spotify:
        return ProviderIcons.spotify;
      case Provider.youtube:
        return ProviderIcons.youtube;
      case Provider.local:
        return Icons.folder_copy_rounded;
    }
  }
}
