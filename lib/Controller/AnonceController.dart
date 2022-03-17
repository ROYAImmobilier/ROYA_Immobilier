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

import '../Model/anonce_model_favote.dart';
import '../service/database/favorite_database_local.dart';

class AnnonceController extends GetxController {
  ValueNotifier<bool> get loding => _loding;
  ValueNotifier<bool> _loding = ValueNotifier(false);
  AnnonceController() {
    getFavoriteBook();
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

  // Local database Favorite book ***********************************

  var dbHalper = CordDatabaseHelper.db;
  bool get loading => _loading;
  bool _loading = false;

  List<FavoriteAnnonceModel> _favoriteBook = [];
  List<FavoriteAnnonceModel> get favoriteBook => _favoriteBook;

  getFavoriteBook() async {
    _loading = true;
    var dbHelper = CordDatabaseHelper.db;
    _favoriteBook = await dbHelper.getAllProdects();
    _loading = false;
    update();
  }

  addBook(FavoriteAnnonceModel fav) async {
    loding.value = true;
    for (int i = 0; i < _favoriteBook.length; i++) {
      if (_favoriteBook[i].title == fav.title &&
          _favoriteBook[i].id == fav.id) {
        removebook(
          FavoriteAnnonceModel(
              id: fav.id,
              advertiser: fav.advertiser,
              region: fav.region,
              city: fav.city,
              transaction: fav.transaction,
              propertyType: fav.propertyType,
              status: fav.status,
              address: fav.address,
              quartier: fav.quartier,
              area: fav.area,
              price: fav.price,
              age: fav.age,
              floorType: fav.floorType,
              floor: fav.floor,
              apartment: fav.apartment,
              bedrooms: fav.bedrooms,
              bathrooms: fav.bathrooms,
              kitchens: fav.kitchens,
              title: fav.title,
              description: fav.description,
              phone1: fav.phone1,
              phone2: fav.phone2,
              phone3: fav.phone3,
              validated: fav.validated,
              createdAt: fav.createdAt,
              cover: fav.cover),
        );
        return;
      }
    }
    await dbHalper.inser(fav);
    loding.value = false;
    update();
  }

  removebook(FavoriteAnnonceModel model) async {
    await dbHalper.removeProducs(model);
    getFavoriteBook();
    update();
  }

  FavIcon(mode) {
    for (int i = 0; i < _favoriteBook.length; i++) {
      if (mode["title"] == _favoriteBook[i].title &&
          mode["id"] == _favoriteBook[i].id &&
          mode['address'] == _favoriteBook[i].address) {
        return true;
      }
    }

    return false;
  }

  ///////favorite end
}
