// To parse this JSON data, do
//
//     final region = regionFromJson(jsonString);

import 'dart:convert';

List<Region> regionFromJson(String str) =>
    List<Region>.from(json.decode(str).map((x) => Region.fromJson(x)));

String regionToJson(List<Region> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Region {
  Region({
    required this.id,
    required this.regionName,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String regionName;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        id: json["id"],
        regionName: json["region_name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "region_name": regionName,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}
