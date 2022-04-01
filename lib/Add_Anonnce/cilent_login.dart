import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:roya_immobilie/View/page/home_c.dart';
import 'package:roya_immobilie/varia_ble/variable.dart';
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

      }
    } catch (e) {
      print('error ' + e.toString());
    }
  }

}

