import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin<SearchScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          GestureDetector(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 55,
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).cardColor,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(1.5, 1.5),
                  )
                ],
              ),
              child: Row(
                children: [
                  Transform.rotate(
                    angle: 22 / 7 * 2,
                    child: IconButton(
                      icon: const Icon(Icons.horizontal_split_rounded),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    AppLocalizations.of(context)!.searchText,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).textTheme.bodySmall!.color,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () => Navigator.pushNamed(
              context,
              '/search',
              arguments: {'query': ''},
            ),
          )
        ],
      ),
    );
  }
}
