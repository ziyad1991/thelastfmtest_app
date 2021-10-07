import 'package:json_annotation/json_annotation.dart';

part 'artist.g.dart';

@JsonSerializable()
class TheArtistData {
  String name;

  TheArtistData({required this.name});

  factory TheArtistData.fromJson(Map<String, dynamic> json) =>
      _$ArtistDataFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistDataToJson(this);
}
