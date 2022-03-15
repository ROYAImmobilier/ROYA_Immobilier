import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/Model/anonce_model.dart';
import 'package:roya_immobilie/Model/repositery.dart';

class AnnonceController extends GetxController {
  AnnonceController() {
    getAnnonce();
  }

  List<Annonce> ListAnnonce = [];

  getAnnonce() async {
    try {
      var annonce = await AnnonceRepository.featcherAnnonce();

      //print("annonce " + annonce.toString());
      //var d = annonceFromJson(annonce);

      //print("+++ " + annonce.length.toString());
      /* if (annonce != null) {
        ListAnnonce.value = annonce as List<Annonce>;
        print(ListAnnonce.length);
      }*/
    } catch (e) {
    } finally {}
  }
}
