import 'package:flutter/material.dart';
import 'package:thelastfmtest_app/widgets/searchbar.dart';
import '../screens/albumscreen.dart';
import '../screens/artistscreen.dart';
import '../screens/songscreen.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: 'ALBUM'),
              Tab(text: 'ARTIST'),
              Tab(text: 'SONG'),
            ],
          ),
          title: const SearchBar(),
        ),
        body: TabBarView(
          children: [AlbumScreen(), ArtistScreen(), SongScreen()],
        ),
      ),
    );
    ;
  }
}
