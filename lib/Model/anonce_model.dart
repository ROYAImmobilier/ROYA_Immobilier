// To parse this JSON data, do
//
//     final annonce = annonceFromJson(jsonString);

import 'dart:convert';

Annonce annonceFromJson(String str) => Annonce.fromJson(json.decode(str));

String annonceToJson(Annonce data) => json.encode(data.toJson());

class Annonce {
  Annonce({
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
  String phone3;
  int validated;
  String createdAt;
  String cover;

  factory Annonce.fromJson(Map<String, dynamic> json) => Annonce(
        id: json["id"],
        advertiser: json["advertiser"]??'null',
        region: json["region"]??'null',
        city: json["city"]??'null',
        transaction: json["transaction"]??'null',
        propertyType: json["property_type"]??'null',
        status: json["status"]??'null',
        address: json["address"]??'null',
        quartier: json["quartier"]??'null',
        area: json["area"].toDouble()??0.0,
        price: json["price"]??'null',
        age: json["age"]??'null',
        floorType: json["floor_type"]??'null',
        floor: json["floor"]??0,
        apartment: json["apartment"]??0,
        bedrooms: json["bedrooms"]??0,
        bathrooms: json["bathrooms"]??0,
        kitchens: json["kitchens"]??0,
        title: json["title"]??'null',
        description: json["description"]??'null',
        phone1: json["phone1"]??'null',
        phone2: json["phone2"]??'null',
        phone3: json["phone3"]??'null',
        validated: json["validated"]??0,
        createdAt: json["created_at"]??'null',
        cover: json["cover"]??'null',
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
