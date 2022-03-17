import '../Model/city.dart';

var region_1;

class Region {
  static List<String> region(var data, int x) {
    for (int i = 1; i <= x; i++) {
      region_1.add(data[i]["city_name"]);
    }
    print("Luis");
    print(region_1);
    return region_1;
  }
}
