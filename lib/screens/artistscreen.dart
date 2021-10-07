import 'package:flutter/material.dart';
import 'package:thelastfmtest_app/provider/artistprovider.dart';
import '../models/artist.dart';
import '../provider/searchprovider.dart';
import 'package:provider/provider.dart';

class ArtistScreen extends StatefulWidget {
  const ArtistScreen({Key? key}) : super(key: key);

  @override
  _ArtistScreenState createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TheArtistData>>(
      future: getTheArtistData(Provider.of<serachdata>(context).searchvalue),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var artistData = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () => null,
                      child: Card(
                        color: Colors.lightGreen.shade300,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                artistData.name,
                                style: const TextStyle(fontSize: 20.0),
                              ),
                              //Text('by ${artistData.image}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
