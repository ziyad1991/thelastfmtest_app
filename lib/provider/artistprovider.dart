import 'dart:convert';
import '../models/artist.dart';
import '../network/lastapi.dart';

Future<List<TheArtistData>> getTheArtistData(String searchTermEntered) async {
  List<TheArtistData> artists = [];

  var jsonData =
      await NetworkHelper.fetchSelectedTabData('artist', searchTermEntered);

  List<dynamic> data =
      jsonDecode(jsonData)['results']['artistmatches']['artist'];

  artists = data.map((teamData) => TheArtistData.fromJson(teamData)).toList();

  return artists;
}
