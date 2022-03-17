import 'dart:convert';

import 'package:http/http.dart' as http;
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
  static const String url = 'http://jsonplaceholder.typicode.com/users';
  static Future<List<City>?> getUsers() async {
    try {
      final response =
          await http.get(Uri.parse('https://dashboard.royaimmo.ma/api/cities'));
      if (200 == response.statusCode) {
        final List<City> users = cityFromJson(response.body);
        return users;
      } else {
        return cityFromJson(response.body);
      }
    } catch (e) {
      // return List<City>();
    }
  }
}
