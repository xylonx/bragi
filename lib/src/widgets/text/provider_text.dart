import 'package:bragi/src/services/proto/bragi/bragi.pbenum.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final providerIconMap = {
  Provider.PROVIDER_BILIBILI: FontAwesomeIcons.bilibili,
  Provider.PROVIDER_SPOTIFY: FontAwesomeIcons.spotify,
  Provider.PROVIDER_YOUTUBE: FontAwesomeIcons.youtube,
  // FIXME(xylonx): maybe use svg assert
  // Provider.PROVIDER_NETEASE_MUSIC: FontAwesomeIcons.music,
};

class ProviderIcon extends StatelessWidget {
  const ProviderIcon({super.key, required this.provider});

  final Provider provider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 8, 0),
      child: Icon(providerIconMap[provider] ?? FontAwesomeIcons.music),
    );
  }
}

class ProviderIconText extends StatelessWidget {
  const ProviderIconText(
      {super.key, required this.provider, required this.text});

  final Provider provider;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 8, 0),
          child: Icon(providerIconMap[provider] ?? FontAwesomeIcons.music),
        ),
        Flexible(child: text),
      ],
    );
  }
}
