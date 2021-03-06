import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:roya_immobilie/Model/ModelAnnonce.dart';

import '../variable/variable.dart';

class ModelAnnonceRepository {
  static var client = http.Client();

  static Future<List<ModelAnnonce>?> featcherModelAnnonce() async {
    var res = await client
        .get(Uri.parse('https://dashboard.royaimmo.ma/api/site/annonces/'));
    var jsoon = res.body;
    //var a = json;
    if (res.statusCode == 200) {
      var b = json.decode(jsoon);
      var a = b["data"];
      var c = json.encode(a);
      // print(a[0]['title']);
      return ModelAnnonceFromJson(c);
    } else {
      return null;
    }
  }

  static Future deleteitem({required id}) async {
    var res = await client
        .delete(Uri.parse(
        'https://dashboard.royaimmo.ma/api/annonces/${id.toString()}'),
        headers: {
          'Authorization': 'Bearer $token_global'
        });


    if (res.statusCode == 200) {
    //  print(res.body);
      return null;
    } else {
      return null;
    }
  }

  static Future getdata({required id}) async {
   // print(id);
    var res = await client
        .get(Uri.parse(
        'https://dashboard.royaimmo.ma/api/annonces/${id.toString()}'),
        headers: {
          'Authorization': 'Bearer $token_global'
        });


    if (res.statusCode == 200) {
      var jsoon = res.body;
      var a = json.decode(jsoon);
      // print(res.statusCode);
      // print(res.body);
      if (a.isEmpty) {
        return null;
      }

      return a["data"][0];
    } else {
      return null;
    }
  }


  static Future GetDetiller({required sug}) async {
    var res = await client.get(
        Uri.parse('https://dashboard.royaimmo.ma/api/site/annonces/$sug'));
    var jsoon = res.body;
    //var a = json;
    // print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    // print(res.body);
    // print(res.statusCode);


    if (res.statusCode == 200) {
      var b = json.decode(jsoon);
    //  var a = b["data"][0]['media'];

      return b["data"][0];
    } else {
      return null;
    }
  }

  static Future GetDetillerLogin({required sug}) async {

    var res = await client.get(
        Uri.parse('https://dashboard.royaimmo.ma/api/annonces/$sug'), headers: {
      // 'Content-type': 'application/json',
      // 'Accept': 'application/json',
      'Authorization': 'Bearer $token_global'
    });
    var jsoon = res.body;
    //var a = json;
 // print(res.body);
    if (res.statusCode == 200) {
      var b = json.decode(jsoon);


      return b["data"][0];
    } else {

      return null;
    }
  }
}