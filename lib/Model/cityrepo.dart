import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:roya_immobilie/Model/region.dart';
import '../varia_ble/variable.dart';
import 'city.dart';

class CityRepo {
  static var client = http.Client();
  static fetchCity() async {
    //   var response =
    //       await http.get(Uri.parse("https://dashboard.royaimmo.ma/api/cities"));
    //   if (response.statusCode == 200) {
    //     var data = response.body;
    //     return cityFromJson(data);
    //   } else {
    //     // throw Exception();
    //     var data = response.body;
    //     return cityFromJson(data);
    //   }
    // }

    // static featcherAnnonce() async {
    var res =
        await client.get(Uri.parse('https://dashboard.royaimmo.ma/api/cities'));
    var jsoon = res.body;
    var a = json.decode(jsoon);

    print("city");
    print(a);
    //List<Annonce> dataa = a["data"];

    return a;
  }
}

class Services {
  //

  static Future<List<City>?> getCity() async {
    try {
      final response =
          await http.get(Uri.parse('https://dashboard.royaimmo.ma/api/cities'));
      if (200 == response.statusCode) {
        //final List<City> citys = cityFromJson(response.body);

        return cityFromJson(response.body);
      } else {
        return cityFromJson(response.body);
      }
    } catch (e) {
      // return List<City>();
    }
  }
}

class ServicesRgion {
  //

  static Future<List<Region>?> getUsers() async {
    try {
      final response = await http
          .get(Uri.parse('https://dashboard.royaimmo.ma/api/regions'));
      if (200 == response.statusCode) {
        final List<Region> region = regionFromJson(response.body);
        return region;
      } else {
        return regionFromJson(response.body);
      }
    } catch (e) {
      // return List<City>();
    }
  }
}
