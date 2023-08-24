import 'package:bragi/Components/gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // settingOptions = {};
  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.settingPageTitle,
            style: TextStyle(color: Theme.of(context).iconTheme.color),
          ),
          iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) => ListTile(
                  leading: SizedBox.square(
                    dimension: 40,
                    child: Icon(Icons.wb_cloudy_rounded),
                  ),
                  title: Text('Bragi'),
                  subtitle: Text(
                    'bragi Host, bragi Port',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  isThreeLine: false,
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
