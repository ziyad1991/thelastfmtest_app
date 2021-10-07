import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';
import '../provider/searchprovider.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late FloatingSearchBarController controller;

  @override
  void initState() {
    controller = FloatingSearchBarController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 350.0,
      child: FloatingSearchBar(
        controller: controller,
        hint: 'Enter an artist , track or album',
        physics: const BouncingScrollPhysics(),
        title: Text(Provider.of<serachdata>(context).searchvalue
            // searchTermEntered ?? 'Enter an artist , track or album',
            ),
        actions: [
          FloatingSearchBarAction.searchToClear(),
        ],
        builder: (context, transition) {
          return const ClipRect(
            child: Material(
              elevation: 4,
              color: Colors.white,
              child: Placeholder(
                fallbackHeight: 200,
              ),
            ),
          );
        },
        onQueryChanged: (query) {
          setState(() {
            if (query.isEmpty) {
              Provider.of<serachdata>(context, listen: false)
                  .changeString('Air');
            } else {
              Provider.of<serachdata>(context, listen: false)
                  .changeString(query);
            }
          });
        },
        onSubmitted: (query) {
          setState(() {
            if (query.isEmpty) {
              Provider.of<serachdata>(context, listen: false)
                  .changeString('Air');
            } else {
              Provider.of<serachdata>(context, listen: false)
                  .changeString(query);
            }
          });
        },
      ),
    );
  }
}
