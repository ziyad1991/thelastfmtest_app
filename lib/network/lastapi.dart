import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';

var apiKey = '31faa2e65903d5b2ac9e21b4c6aa6fb3';

class NetworkHelper {
  final String requiredStats;

  NetworkHelper(this.requiredStats);

  static Future fetchSelectedTabData(String tabData, String searchvalue) async {
    http.Response response = await retry(
      // Make a GET request
      () => http
          .get(
            Uri.parse(
                'https://ws.audioscrobbler.com/2.0/?method=$tabData.search&$tabData=$searchvalue&api_key=$apiKey&format=json'),
          )
          .timeout(const Duration(seconds: 5)),
      // Retry on SocketException or TimeoutException
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw (response.statusCode);
    }
  }

  static Future songData(String songName, String theartist) async {
    http.Response response = await retry(
      // Make a GET request
      () => http
          .get(Uri.parse(
              'https://ws.audioscrobbler.com/2.0/?method=track.getInfo&api_key=$apiKey&artist=$theartist&track=$songName&format=json'))
          .timeout(const Duration(seconds: 5)),
      // Retry on SocketException or TimeoutException
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw (response.statusCode);
    }
  }

  static Future albumData(String thealbumname, String theartist) async {
    http.Response response = await retry(
      // Make a GET request
      () => http
          .get(
            Uri.parse(
                'https://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=$apiKey&artist=$theartist&album=$thealbumname&format=json'),
          )
          .timeout(const Duration(seconds: 5)),
      // Retry on SocketException or TimeoutException
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );

    if (response.statusCode == 200) {
      print("Response is : ${response.body}");
      return response.body;
    } else {
      throw (response.statusCode);
    }
  }

  static Future TheArtistData(String theartist) async {
    http.Response response = await retry(
      // Make a GET request
      () => http
          .get(
            Uri.parse(
                'https://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=$theartist&api_key=$apiKey&format=json'),
          )
          .timeout(const Duration(seconds: 5)),
      // Retry on SocketException or TimeoutException
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw (response.statusCode);
    }
  }
}
