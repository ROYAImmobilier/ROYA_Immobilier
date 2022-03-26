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
  String createdAt;
  String updatedAt;
  String deletedAt;

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
    type: json["type"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "icon": icon,
    "type": type,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };

}





