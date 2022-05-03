import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/Contact.dart';
import '../variable/variable.dart';
class GetContcts{
 static Future getContacts() async {

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
      else
        return null;
       // print(contact[0].email);

    } catch (e) {
 print('error ' + e.toString());
 }
  }}
