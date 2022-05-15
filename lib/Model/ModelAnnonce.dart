// To parse this JSON data, do
//
//     final ModelAnnonce = ModelAnnonceFromJson(jsonvar);

import 'dart:convert';


List<ModelAnnonce> ModelAnnonceFromJson(var str) =>
    List<ModelAnnonce>.from(json.decode(str).map((x) => ModelAnnonce.fromJson(x)));

String ModelAnnonceToJson(List<ModelAnnonce> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));



class ModelAnnonce {


  ModelAnnonce({
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
    required this.slug,
    required this.validated,
    required this.createdAt,
    required this.cover,
  });

  var id;
  var advertiser;
  var slug;
  var region;
  var city;
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
  var phone2;
  dynamic phone3;
  var validated;
  var createdAt;
  var cover;

  factory ModelAnnonce.fromJson(Map<String, dynamic> json) =>
      ModelAnnonce(
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
        slug: json["slug"],
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

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "advertiser": advertiser,
        "region": region,
        "city": city,
        "transaction": transaction,
        "property_type": propertyType,
        "status": status,
        "address": address,
        "slug": slug,
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