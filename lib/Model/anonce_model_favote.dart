class FavCategoryItem {
  late int id;
  late String slug;
  late String region;
  late String city;
  late String title;
  late String cover;
  late int apartment;
  late int bedrooms;
  late int bathrooms;
  late int kitchens;
  late String address;
  late String description;
  late String advertiser;
  late String phone1;
  late String area;
  late String quartier;
  late String createdAt;
   List<String>? abilities;
  FavCategoryItem(
      {required this.id,
      required this.slug,
      required this.region,
      required this.city,
      required this.title,
      required this.cover,
      required this.apartment,
      required this.bathrooms,
      required this.bedrooms,
      required this.kitchens,
      required this.address,
      required this.description,
      required this.advertiser,
      required this.phone1,
      required this.area,
      required this.quartier,
      required this.createdAt,
      required this.abilities,
      });
  FavCategoryItem.fromJson(Map<dynamic, dynamic> map) {
    if (map.isEmpty) {
      return;
    }
    id = map["id"];
    slug = map["slug"];
    region = map['region'];
    city = map['city'];
    title = map['title'].toString();
    cover = map['cover'].toString();
    apartment = map['apartment'];
    bedrooms = map['bedrooms'];
    bathrooms = map["bathrooms"];
    kitchens = map["kitchens"];
    address = map["address"];
    description = map["description"];
    advertiser = map["advertiser"];
    phone1 = map["phone1"];
    area = map["area"];
    quartier = map["quartier"];
    createdAt = map["createdAt"];
    abilities = map["abilities"];
  }
  toJson() {
    return {
      'id': id,
      'region': region,
      'city': city,
      'title': title,
      'cover': cover,
      "bedrooms": bedrooms,
      "bathrooms": bathrooms,
      "apartment": apartment,
      "kitchens": kitchens,
      "address": address,
      "description": description,
      "advertiser": advertiser,
      "phone1": phone1,
      "area": area,
      "slug": slug,
      "quartier": quartier,
      "createdAt": createdAt,
    };
  }
}
