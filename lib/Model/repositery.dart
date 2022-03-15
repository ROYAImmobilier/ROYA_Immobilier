import 'dart:convert';

import 'package:http/http.dart' as http;

import 'anonce_model.dart';

class AnnonceRepository {
  static var client = http.Client();

  static featcherAnnonce() async {
    var res = await client
        .get(Uri.parse('https://dashboard.royaimmo.ma/api/site/annonces'));
    var jsoon = res.body;
    var a = json.decode(jsoon);
    print(a["data"]);
    // ListAnnonce.value = a["data"];
    //  print("aaaaaaaaaaaaaa bbbbbbbbbb " + dataa.length.toString());
    return a["data"];
  }
}
