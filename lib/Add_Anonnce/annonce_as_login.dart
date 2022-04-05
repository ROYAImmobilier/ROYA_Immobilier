import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:roya_immobilie/View/page/home_c.dart';
import 'package:roya_immobilie/View/routing_screen.dart';
import 'package:roya_immobilie/varia_ble/variable.dart';
class Annonce_As_Login{









 static Future Add_Annonce_As_Login({required String? region_id,
    required String? city_id,
    required String? transaction,
    required String? property_type,
    required String? status,
    required String? address,
    required String ? quartier,
    required String? area,
    required String? price,
    required String? age,
    required String? floor_type,
    required String? floor,
    required String? apartment,
    required String? bedrooms,
    required String? bathrooms,
    required String? kitchens,
    required String? title,
    required String? description,
    required String? phone1,
    required String? email,
    required String? password,
    required var abilities,
    required  var  media,

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
            .post(Uri.parse('https://dashboard.royaimmo.ma/api/annonce/storeAsLogin'), body:{
          "region_id": region_id,
          "city_id": city_id,
          "transaction": transaction,
          "property_type": property_type,
          "transaction": transaction,
          "property_type": property_type,
          "status": status,
          "address": address,
          "quartier": quartier,
          "area": area,
          "price": price,
          "age": age,
          "floor_type": floor_type,
          "floor": floor,
          "apartment": apartment,
          "bedrooms": bedrooms,
          "bathrooms": bathrooms,
          "kitchens": kitchens,
          "title": title,
          "description": description,
          "phone1": phone1,
          "abilities": abilities,
          "media": media,
        },headers: {
          //HttpHeaders.authorizationHeader:token_1.toString(),
          'Authorization': 'Bearer $token_global'
        }
        );
        print(response_1.statusCode);
        if(response_1.statusCode==200){
          Get.to(HomeC());
        }
      }
    } catch (e) {
      print('error ' + e.toString());
    }
  }

  static Future Add_Annonce_As_Aredy_Login({
   required var region_id,
    required var city_id,
    required var transaction,
    required var property_type,
    required var status,
    required var adress,
    required var quartier,
    required var area,
    required var price,
    required var age,
    required var floor_type,
    required var floor,
    required var apartment,
    required var bedrooms,
    required var bathrooms,
    required var kitchens,
    required var title,
    required var description,
    required var phone1,
    required var abilities,
    required var media,

  }) async {
    try {
        var response_1 = await http
            .post(Uri.parse('https://dashboard.royaimmo.ma/api/annonce/storeAsLogin'), body:{
          "region_id": region_id,
          "city_id": city_id,
          "transaction": transaction,
          "property_type": property_type,
          "transaction": transaction,
          "property_type": property_type,
          "status": status,
          "address": adress,
          "quartier": quartier,
          "area": area,
          "price": price,
          "age": age,
          "floor_type": floor_type,
          "floor": floor,
          "apartment": apartment,
          "bedrooms": bedrooms,
          "bathrooms": bathrooms,
          "kitchens": kitchens,
          "title": title,
          "description": description,
          "phone1": phone1,
          "abilities": abilities,
          "media": media,
        },headers: {
          //HttpHeaders.authorizationHeader:token_1.toString(),
          'Authorization': 'Bearer $token_global'
        }
        );
        print(response_1.body);
        print(response_1.statusCode);
        if(response_1.statusCode==500){
          Get.to(const RoutingScreen());
        }
      }
     catch (e) {
      print('error ' + e.toString());
    }
  }

}
