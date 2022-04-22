import 'dart:convert';


import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:roya_immobilie/varia_ble/variable.dart';

import '../Model/data_list.dart';
import '../Model/joke.dart';
import '../View/page/auth/Login/components/body.dart';
import '../View/page/auth/Login/login_screen.dart';
import '../View/routing_screen.dart';
class Clinet_Login{

  static Future Add_Annonce_As_Login({
    required String? email,
    required String? password,

  }) async {
    try {
      var response = await http
          .post(Uri.parse('https://dashboard.royaimmo.ma/api/auth/login'), body: {
        "email": email,
        "password": password,
      }
      );
      // print(response.body);
      var token=json.decode(response.body);
      token_global=token['data']['token'];
      print(response.body);
      if(response.statusCode==200){

        isLogin=true;
        print("test" +response.body);
        var response_1 = await http
            .get(Uri.parse('https://dashboard.royaimmo.ma/api/annonces'), headers: {
          //HttpHeaders.authorizationHeader:token_1.toString(),
          'Authorization': 'Bearer $token_global'
        }
        );
        print(response_1.body);



        if(response_1.statusCode==200){

          progress=false;

          isLogin=true;
          print(isLogin);
          final responseJsoon = json.decode(response_1.body);
          final responseJson = responseJsoon["data"];

          for (Map annoncelogin in responseJson) {
            allAnnonceLogin.add(Joke.fromJson(annoncelogin.cast()));
          }

        }else{

          progress=false;

        }
      }
    } catch (e) {
      print('error ' + e.toString());
    }
  }



}

