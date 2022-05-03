// To parse this JSON data, do
//
//     final anonnce = anonnceFromJson(jsonString);

import 'dart:convert';

Anonnce anonnceFromJson(String str) => Anonnce.fromJson(json.decode(str));

String anonnceToJson(Anonnce data) => json.encode(data.toJson());

class Anonnce {
  Anonnce({
    required this.data,
    required this.links,
    required this.meta,
  });

  List<Datum> data;
  Links links;
  Meta meta;

  factory Anonnce.fromJson(Map<String, dynamic> json) => Anonnce(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links.toJson(),
    "meta": meta.toJson(),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.advertiser,
    required  this.region,
    required this.city,
    required this.transaction,
    required  this.propertyType,
    required  this.status,
    required   this.address,
    required  this.quartier,
    required   this.area,
    required  this.price,
    required  this.age,
    required   this.floorType,
    required   this.floor,
    required   this.apartment,
    required   this.bedrooms,
    required  this.bathrooms,
    required  this.kitchens,
    required  this.title,
    required    this.slug,
    required  this.description,
    required this.phone1,
    required  this.phone2,
      this.phone3,
    required  this.validated,
    required this.createdAt,
    required  this.cover,
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
  int area;
  int price;
  String age;
  String floorType;
  int floor;
  int apartment;
  int bedrooms;
  int bathrooms;
  int kitchens;
  String title;
  String slug;
  String description;
  String phone1;
  String phone2;
  dynamic phone3;
  int validated;
  String createdAt;
  String cover;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
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
    floor: json["floor"] == null ? null : json["floor"],
    apartment: json["apartment"] == null ? null : json["apartment"],
    bedrooms: json["bedrooms"],
    bathrooms: json["bathrooms"],
    kitchens: json["kitchens"],
    title: json["title"],
    slug: json["slug"],
    description: json["description"],
    phone1: json["phone1"],
    phone2: json["phone2"] == null ? null : json["phone2"],
    phone3: json["phone3"],
    validated: json["validated"],
    createdAt: json["created_at"],
    cover: json["cover"],
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
    "slug": slug,
    "description": description,
    "phone1": phone1,
    "phone2": phone2,
    "phone3": phone3,
    "validated": validated,
    "created_at": createdAt,
    "cover": cover,
  };
}

class Links {
  Links({
    required this.first,
    required this.last,
    required this.prev,
    this.next,
  });

  String first;
  String last;
  String prev;
  dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  int currentPage;
  int from;
  int lastPage;
  List<Link> links;
  String path;
  int perPage;
  int to;
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
    "path": path,
    "per_page": perPage,
    "to": to,
    "total": total,
  };
}

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  String url;
  String label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"] == null ? null : json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
