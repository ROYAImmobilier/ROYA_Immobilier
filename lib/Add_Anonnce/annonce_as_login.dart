import 'dart:convert';

import 'package:http/http.dart' as http;


import '../variable/variable.dart';

class Annonce_As_Login {
  static Future Add_Annonce_As_Login({
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
    required var abilities,
    required var media,
    required phone2,
    required phone3,
  }) async {
    try {
      var response = await http.post(
          Uri.parse('https://dashboard.royaimmo.ma/api/auth/login'),
          body: {
            "email": email,
            "password": password,
          });



      var token = json.decode(response.body);
      token_global = token['data']['token'];

      if (response.statusCode == 200) {


        Map<String, dynamic> lisst = {
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
          "abilities": abilities,
          "media": media,
        };
        var body = json.encode(lisst);

        var response_1 = await http.post(
            Uri.parse('https://dashboard.royaimmo.ma/api/annonce/storeAsLogin'),
            body: body,
            headers: {
              //HttpHeaders.authorizationHeader:token_1.toString(),
              'Content-type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token_global'
            });

        if (response_1.statusCode == 201) {
          isLogin = true;
          //  Get.offAll(RoutingScreen());
          return response_1.statusCode;
        }
        else {
          return response_1.statusCode;
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
    var phone2,
    var phone3,
  }) async {
    try {
      Map<String, dynamic> list = {
        "region_id": region_id,
        "city_id": city_id,
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
      };

      var body = json.encode(list);

      var response_1 = await http.post(
          Uri.parse('https://dashboard.royaimmo.ma/api/annonce/storeAsLogin'),
          body: body,
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token_global'
          });
       // print(response_1.statusCode);
      if (response_1.statusCode == 201) {
        return response_1.statusCode;
      } else {
        return response_1.statusCode;
      }
    } catch (e) {
      print('error ' + e.toString());
    }
  }

  static Future PostContact({required annonce_id, required full_name, required email, required phone, required subject, required message}) async {
    try {
      Map<String, dynamic> list = {
        "annonce_id": annonce_id,
        "full_name": full_name,
        "phone": phone,
        "subject": subject,
        "message": message,
        "email": email
      };

      var body = json.encode(list);

      var response = await http.post(
          Uri.parse("https://dashboard.royaimmo.ma/api/contacts/storeAnnonces"),
          body: body, headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      }
      );

      if (response.statusCode == 200) {
        return response.statusCode;
      }
    }
    catch (e) {
      return 1;
    }
  }
  static Future PostContactidnotexist({ required full_name, required email, required phone, required subject, required message}) async {
    try {
      Map<String, dynamic> list = {

        "full_name": full_name,
        "phone": phone,
        "subject": subject,
        "message": message,
        "email": email
      };

      var body = json.encode(list);

      var response = await http.post(
          Uri.parse("https://dashboard.royaimmo.ma/api/contacts/storeAnnonces"),
          body: body, headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      }
      );

      if (response.statusCode == 200) {
        return response.statusCode;
      }
    }
    catch (e) {
      return null;
    }
  }





}
