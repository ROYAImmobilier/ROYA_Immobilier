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
    required this.advertiser,
    required this.region,
    required this.city,
    required this.transaction,
    required this.propertyType,
    required this.status,
    required this.address,
    required this.quartier,
    required this.area,
    required this.price,
    required this.age,
    required this.floorType,
    required this.floor,
    required this.apartment,
    required this.bedrooms,
    required this.bathrooms,
    required this.kitchens,
    required this.title,
    required this.description,
    required this.phone1,
    required this.phone2,
    required this.phone3,
    required this.validated,
    required this.createdAt,
    required this.cover,
  });

  int id;
  String advertiser;
  String region;
  String city;
  String transaction;
  String propertyType;
  String status;
  String address;
  String quartier;
  double area;
  int price;
  String age;
  String floorType;
  int floor;
  int apartment;
  int bedrooms;
  int bathrooms;
  int kitchens;
  String title;
  String description;
  String phone1;
  String phone2;
  dynamic phone3;
  int validated;
  String createdAt;
  String cover;

  factory FavoriteAnnonceModel.fromJson(Map<String, dynamic> json) =>
      FavoriteAnnonceModel(
        id: json["id"],
        advertiser: json["advertiser"],
        region: json["region"],
        city: json["city"],
        transaction: json["transaction"],
        propertyType: json["property_type"],
        status: json["status"],
        address: json["address"],
        quartier: json["quartier"],
        area: json["area"].toDouble(),
        price: json["price"],
        age: json["age"],
        floorType: json["floor_type"],
        floor: json["floor"],
        apartment: json["apartment"],
        bedrooms: json["bedrooms"],
        bathrooms: json["bathrooms"],
        kitchens: json["kitchens"],
        title: json["title"],
        description: json["description"],
        phone1: json["phone1"],
        phone2: json["phone2"],
        phone3: json["phone3"],
        validated: json["validated"],
        createdAt: json["created_at"],
        cover: json["cover"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "advertiser": advertiser,
        "region": region,
        "city": city,
        "transaction": transaction,
        "property_type": propertyType,
        "status": status,
        "address": address,
        "quartier": quartier,
        "area": area,
        "price": price,
        "age": age,
        "floor_type": floorType,
        "floor": floor,
        "apartment": apartment,
        "bedrooms": bedrooms,
        "bathrooms": bathrooms,
        "kitchens": kitchens,
        "title": title,
        "description": description,
        "phone1": phone1,
        "phone2": phone2,
        "phone3": phone3,
        "validated": validated,
        "created_at": createdAt,
        "cover": cover,
      };
}
