import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:roya_immobilie/Model/joke.dart';

import '../variable/variable.dart';

class jokeRepository {
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


    if (res.statusCode == 200) {
      print(res.body);
      return null;
    } else {
      return null;
    }
  }
  static Future getdata( {required  id}) async {
    print(id);
    var res = await client
        .get(Uri.parse('https://dashboard.royaimmo.ma/api/annonces/${id.toString()}'),headers: {
      'Authorization': 'Bearer $token_global'
    });


   if (res.statusCode == 200) {
     var jsoon = res.body;
     var a = json.decode(jsoon);
     print(res.statusCode);
     print(res.body);
     if(a.isEmpty){
       return null;
     }

      return a["data"][0];
    } else {
      return null;
    }
  }


  static Future GetDetiller({required sug})async{
    var res = await client .get(Uri.parse('https://dashboard.royaimmo.ma/api/site/annonces/$sug'));
    var jsoon = res.body;
    //var a = json;
    print(res.body);
    if (res.statusCode == 200) {
      var b = json.decode(jsoon);


      return b["data"][0];
    } else {
      var b = json.decode(jsoon);
      var a = b["data"][0];
      return a;
    }
  }



}
