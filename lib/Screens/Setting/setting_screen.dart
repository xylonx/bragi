import 'package:bragi/Components/gradient_container.dart';
import 'package:bragi/Models/settings.dart';
import 'package:bragi/Utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
                  leading: const SizedBox.square(
                    dimension: 40,
                    child: Icon(Icons.wb_cloudy_rounded),
                  ),
                  title: const Text('Bragi'),
                  subtitle: const Text(
                    'bragi Address and token',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  isThreeLine: false,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => const ChangeBragiConfigDialog());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChangeBragiConfigDialog extends StatefulWidget {
  const ChangeBragiConfigDialog({super.key});

  @override
  State<ChangeBragiConfigDialog> createState() =>
      _ChangeBragiConfigDialogState();
}

class _ChangeBragiConfigDialogState extends State<ChangeBragiConfigDialog> {
  final TextEditingController addrController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();

  @override
  void dispose() {
    addrController.dispose();
    tokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text("Bragi"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                "bragi addr",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              )
            ],
          ),
          TextField(
            autofocus: true,
            controller: addrController,
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Text(
                "bragi token",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              )
            ],
          ),
          TextField(
            autofocus: true,
            controller: tokenController,
          ),
        ],
      ),
      actions: [
        // Cancel
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.grey[700],
          ),
          child: Text(AppLocalizations.of(context)!.cancel),
          onPressed: () => Navigator.pop(context),
        ),

        // Ok
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor:
                Theme.of(context).colorScheme.secondary == Colors.white
                    ? Colors.black
                    : null,
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
          child: Text(AppLocalizations.of(context)!.ok),
          onPressed: () {
            HiveSettings.bragiAddr = addrController.text.trim();
            HiveSettings.bragiToken = tokenController.text.trim();
            Navigator.pop(context);
            Snackbar.show(
                context, "Change Bragi address and token successfully");
          },
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}
