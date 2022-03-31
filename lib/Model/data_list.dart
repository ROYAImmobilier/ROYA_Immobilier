import 'dart:convert';

DataList dataListFromJson(String str) => DataList.fromJson(json.decode(str));

String dataListToJson(DataList data) => json.encode(data.toJson());



class DataList {
  DataList({
    required this.id,
    required this.userId,
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
    this.apartment,
    this.bedrooms,
    this.bathrooms,
    this.kitchens,
    required this.title,
    required this.description,
    required this.phone1,
    this.phone2,
    this.phone3,
    required this.validated,
    required this.createdAt,
    this.cover,
  });

  int id;
  int userId;
  String advertiser;
  String region;
  String city;
  String transaction;
  String propertyType;
  String status;
  String address;
  String quartier;
  int area;
  int price;
  String age;
  String floorType;
  int floor;
  dynamic apartment;
  dynamic bedrooms;
  dynamic bathrooms;
  dynamic kitchens;
  String title;
  String description;
  String phone1;
  dynamic phone2;
  dynamic phone3;
  int validated;
  String createdAt;
  dynamic cover;

  factory DataList.fromJson(Map<String, dynamic> json) => DataList(
    id: json["id"],
    userId: json["user_id"],
    advertiser: json["advertiser"],
    region: json["region"],
    city: json["city"],
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
    cover: json["cover"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
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
