import 'package:json_annotation/json_annotation.dart';

part 'artistdetails.g.dart';

@JsonSerializable()
class ArtistDetailModel {
  String name;

  ArtistDetailModel({
    required this.name,
  });

  factory ArtistDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ArtistDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistDetailModelToJson(this);
}
