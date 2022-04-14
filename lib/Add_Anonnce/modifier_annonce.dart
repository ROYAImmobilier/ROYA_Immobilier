import 'dart:convert';

import 'package:http/http.dart' as http;

import '../varia_ble/variable.dart';

class Modifier_Annonce {
  static Future Modifier({
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

      Map<String, dynamic> list = {
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
        "media":'',
      };
      var body = json.encode(list);
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      print(body);
      var response_1 = await http.put(
          Uri.parse(
              'https://dashboard.royaimmo.ma/api/annonces/${getData_put["id"]}'),
          body: body,
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            //HttpHeaders.authorizationHeader:token_1.toString(),
            'Authorization': 'Bearer $token_global'
          });

      if (response_1.statusCode == 200) {
        verify_update=false;
        // Get.to(const RoutingScreen());
      }
    } catch (e) {

    }
  }
}
