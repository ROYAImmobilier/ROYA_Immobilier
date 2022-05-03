import 'dart:convert';

import 'package:http/http.dart' as http;


class Annonce_As_SingUp {
  static Future Add_Annonce_SingUp({
    required String? region_id,
    required String? city_id,
    required String? transaction,
    required String? property_type,
    required String? status,
    required String? address,
    required String? quartier,
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
    required String? password_confimation,
    required String? name,
    required List<dynamic> abilities,
    required List<String> media, phone2,
  }) async {
    try {
      Map<String, dynamic> list = {
        "region_id": region_id,
        "city_id": city_id,
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
        "phone2": phone2,
        "abilities": abilities,
        "media": media,
        "name": name,
        "email": email,
        "password": password,
        "confirmation_password": password_confimation,
      };
    var body=json.encode(list);
      var response = await http.post(
          Uri.parse(
              'https://dashboard.royaimmo.ma/api/annonce/storeWithRegister'),headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
          body: body
          //{
          //  "region_id": region_id,
          //  "city_id": city_id,
          //  "transaction": transaction,
          //  "property_type": property_type,
          // // "transaction": transaction,
          // // "property_type": property_type,
          //  "status": status,
          //  "address": address,
          //  "quartier": quartier,
          //  "area": area,
          //  "price": price,
          //  "age": age,
          //  "floor_type": floor_type,
          //  "floor": floor,
          //  "apartment": apartment,
          //  "bedrooms": bedrooms,
          //  "bathrooms": bathrooms,
          //  "kitchens": kitchens,
          //  "title": title,
          //  "description": description,
          //  "phone1": phone1,
          //  "ability_id": [1,2,3].toString(),
          //  "media[image base64]": '',
          //  " confirmation_password":password_confimation,
          //  "name":name,
          //  "email": email,
          //  "password": password,

          // }

          // print(response.body)

          );


      if (response.statusCode == 201) {
        //Get.to( RoutingScreen());
        return response.statusCode;
      }else{
        return response.statusCode;
      }
    } catch (e) {
      print('error ' + e.toString());
    }
  }
}
