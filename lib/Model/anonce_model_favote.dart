// To parse this JSON data, do
//
//     final annonce = annonceFromJson(jsonString);

import 'dart:convert';

FavoriteAnnonceModel annonceFromJson(String str) =>
    FavoriteAnnonceModel.fromJson(json.decode(str));

String annonceToJson(FavoriteAnnonceModel data) => json.encode(data.toJson());

class FavoriteAnnonceModel {
  FavoriteAnnonceModel({
    required this.id,
    required this.region,
    required this.city,
    required this.title,
    required this.cover,
  });

  late int id;
  late String region;
  late String city;
  late String title = "";
  late String cover;

  FavoriteAnnonceModel.fromJson(Map<dynamic, dynamic> json) {
    id:
    json["id"];
    region:
    json["region"];
    city:
    json["city"];
    title:
    json["title"] ?? "";
    cover:
    json["cover"];
  }

  toJson() => {
        "id": id,
        "region": region,
        "city": city,
        "title": title,
        "cover": cover,
      };
}
