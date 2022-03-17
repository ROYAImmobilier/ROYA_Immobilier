// To parse this JSON data, do
//
//     final city = cityFromJson(jsonString);

import 'dart:convert';

List<City> cityFromJson(String str) =>
    List<City>.from(json.decode(str).map((x) => City.fromJson(x)));

String cityToJson(List<City> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class City {
  City({
    required this.id,
    required this.regionId,
    required this.cityName,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int regionId;
  String cityName;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        regionId: json["region_id"],
        cityName: json["city_name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "region_id": regionId,
        "city_name": cityName,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}
