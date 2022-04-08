// To parse this JSON data, do
//
//     final getData = getDataFromJson(jsonString);

import 'dart:convert';

GetData getDataFromJson(String str) => GetData.fromJson(json.decode(str));

String getDataToJson(GetData data) => json.encode(data.toJson());



class GetData {
  GetData({
    required this.id,
    required this.advertiser,
    required this.regionId,
    required this.cityId,
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
    this.phone2,
    this.phone3,
    required this.validated,
    required this.createdAt,
   // required this.abilities,
   // required this.media,
  });

  var id;
  var advertiser;
  var regionId;
  var cityId;
  var transaction;
  var propertyType;
  var status;
  var address;
  var quartier;
  var area;
  var price;
  var age;
  var floorType;
  var floor;
  var apartment;
  var bedrooms;
  var bathrooms;
  var kitchens;
  var title;
  var description;
  var phone1;
  dynamic phone2;
  dynamic phone3;
  var validated;
  var createdAt;
 // List<dynamic> abilities;
 // List<dynamic> media;

  factory GetData.fromJson(Map<String, dynamic> json) => GetData(
    id: json["id"],
    advertiser: json["advertiser"],
    regionId: json["region_id"],
    cityId: json["city_id"],
    transaction: json["transaction"],
    propertyType: json["property_type"],
    status: json["status"],
    address: json["address"],
    quartier: json["quartier"],
    area: json["area"],
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
   /// abilities: List<dynamic>.from(json["abilities"].map((x) => x)),
   // media: List<dynamic>.from(json["media"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "advertiser": advertiser,
    "region_id": regionId,
    "city_id": cityId,
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
   // "abilities": List<dynamic>.from(abilities.map((x) => x)),
   // "media": List<dynamic>.from(media.map((x) => x)),
  };
}
