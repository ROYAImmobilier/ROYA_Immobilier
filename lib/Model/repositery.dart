import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:roya_immobilie/Model/joke.dart';

import '../varia_ble/variable.dart';
import 'data_list.dart';
import 'getdata_annonce.dart';

class AnnonceRepository {
  static var client = http.Client();
  static Future<List<Joke>?> featcherJoke() async {
    var res = await client
        .get(Uri.parse('https://dashboard.royaimmo.ma/api/site/annonces/'));
    var jsoon = res.body;
    //var a = json;
    if (res.statusCode == 200) {
      var b = json.decode(jsoon);
      var a = b["data"];
      var c = json.encode(a);
     // print(a[0]['title']);
      return jokeFromJson(c);
    } else {
      return null;
    }
  }

  static Future deleteitem( {required  id}) async {
    var res = await client

        .delete(Uri.parse('https://dashboard.royaimmo.ma/api/annonces/${id.toString()}'),headers: {
      'Authorization': 'Bearer $token_global'
    });
    var jsoon = res.body;
    //var a = json;

    if (res.statusCode == 200) {
      print(res.body);
      var b = json.decode(jsoon);
      var c = json.encode(b);
      // print(a[0]['title']);
      return null;
    } else {
      return null;
    }
  }
  static Future getdata( {required  id}) async {
    var res = await client

        .get(Uri.parse('https://dashboard.royaimmo.ma/api/annonces/${id.toString()}'),headers: {
      'Authorization': 'Bearer $token_global'
    });
    var jsoon = res.body;
    var a = json.decode(jsoon);

    if (res.statusCode == 200) {
      print(res.body);
      
      // print(a[0]['title']);
      return a["data"][0];
    } else {
      return getDataFromJson(jsoon);
    }
  }



}
