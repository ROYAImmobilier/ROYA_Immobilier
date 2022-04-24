import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/Contact.dart';
import '../View/page/auth/Login/components/body.dart';
import '../variable/variable.dart';
class GetContcts{
 static Future getContacts() async {
print(token_global);
    try {
      var response = await http.get(
          Uri.parse('https://dashboard.royaimmo.ma/api/contacts'),
          headers: {
            //HttpHeaders.authorizationHeader:token_1.toString(),
            'Authorization': 'Bearer $token_global'
          }
         );
     // print(response.body);




      if (response.statusCode == 200) {
          final responseJsoon = json.decode(response.body);
          final responseJson = responseJsoon["data"];
          for (Map annoncelogin in responseJson) {
            contact.add(Contacts.fromJson(annoncelogin.cast()));
          }

          }
       // print(contact[0].email);

    } catch (e) {
 print('error ' + e.toString());
 }
  }}
