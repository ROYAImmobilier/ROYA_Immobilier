// To parse this JSON data, do
//
//     final ability = abilityFromJson(jsonString);

import 'dart:convert';

List<Ability> abilityFromJson(String str) => List<Ability>.from(json.decode(str).map((x) => Ability.fromJson(x)));

String abilityToJson(List<Ability> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ability {
  Ability({
    required  this.id,
    required  this.name,
    required this.icon,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  int id;
  String name;
  String icon;
  String type;
  DateTime createdAt;
  DateTime updatedAt;
  String deletedAt;

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
    type: json["type"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "icon": icon,
    "type": type,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };

}





