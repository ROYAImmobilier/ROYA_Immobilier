
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:roya_immobilie/Model/joke.dart';

class jokeRepository {
  static var client = http.Client();
  static Future<List<Joke>?> featcherJoke() async {
    var res = await client.get(Uri.parse('https://dashboard.royaimmo.ma/api/site/annonces/'));
    var jsoon = res.body;
    //var a = json;
    if (res.statusCode == 200) {
      var b = json.decode(jsoon);
      var a = b["data"];
      var c=json.encode(a);
     // print(a[0]['title']);
      return jokeFromJson(c);
    } else {
      return null;
    }
  }
}