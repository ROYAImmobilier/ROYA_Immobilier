import '../Model/city.dart';

var region_1;

final categorie = [
  "Apartement",
  "Maison",
  "Terrain",
  "Bureau",
  "Plateau",
  "Villa",
];

class Region_1 {
  static List<String> region(var data, int x) {
    for (int i = 1; i <= x; i++) {
      region_1.add(data[i]["city_name"]);
    }
    print("Luis");
    print(region_1);
    return region_1;
  }
}

final String tableFavwall = 'favwall';
final String columnId = 'id';
final String columnadvertiser = 'advertiser';
final String columnregion = 'region';
final String columncity = 'city';
final String columntransaction = 'transaction';
final String columnpropertyTyp = 'property_type';
final String columnstatus = 'status';
final String columnaddress = 'address';
final String columnquartier = 'quartier';
final String columnarea = 'area';
final String columnprice = 'price';
final String columnage = 'age';
final String columnfloor_type = 'floor_type';
final String columnfloor = 'floor';
final String columnapartment = 'apartment';
final String columnbedrooms = 'bedrooms';
final String columnbathrooms = 'bathrooms';
final String columnkitchens = 'kitchens';
final String columntitle = 'title';
final String columndescription = 'description';
final String columnphone1 = 'phone1';
final String columnphone2 = 'phone2';
final String columnphone3 = 'phone3';
final String columnvalidated = 'validated';
final String columnvcreated_at = 'created_at';
final String columncover = 'cover';
