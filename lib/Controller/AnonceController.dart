import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:roya_immobilie/Model/anonce_model.dart';
import 'package:roya_immobilie/Model/repositery.dart';
import '../Model/anonce_model_favote.dart';
import '../Model/joke.dart';
import '../Model/region.dart';
import '../service/database/favorite_database_local.dart';

class AnnonceController extends GetxController {
  ValueNotifier<bool> get loding => _loding;
  ValueNotifier<bool> _loding = ValueNotifier(false);
  AnnonceController() {
    getJokeys();
    getFavoriteBook();
  }

  List<Annonce> ListAnnonce = [];

  var allJokes =<Joke> [].obs;




  getJokeys() async {
    try {
      var jokes = await jokeRepository.featcherJoke();

      if (jokes != null) {
        allJokes.value = jokes;
        print("gg 00 : "+allJokes[0].title.toString());
        print("gg 00 : "+allJokes.length.toString());

      }
    } catch (e) {

    } finally {

    }update();
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
    print('bbbbb' + _favoriteBook.length.toString());
    _loading = false;
    update();
  }

  addBook(FavoriteAnnonceModel fav) async {
    var dbHelper = CordDatabaseHelper.db;
    loding.value = true;
    //for (int i = 0; i < _favoriteBook.length; i++) {
    //  if (_favoriteBook[i].title == fav.title &&
    //      _favoriteBook[i].id == fav.id) {
    //    removebook(
    //      FavoriteAnnonceModel(
    //          id: fav.id,
    //          address: fav.address,
    //          region: fav.region,
    //          city: fav.city,
    //          area: fav.area,
    //          price: fav.price,
    //          bedrooms: fav.bedrooms,
    //          bathrooms: fav.bathrooms,
    //          title: fav.title,
    //          description: fav.description,
    //          phone1: fav.phone1,
    //          cover: fav.cover),
    //    );
    //    return;
    //  }
    //}
    print("fav ; " + fav.title);
    await dbHalper.inser(fav);
    print("db ; " + dbHelper.getAllProdects().toString());

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
          mode["id"] == _favoriteBook[i].id) {
        return true;
      }
    }
    return false;
  }
// var allJokes = <Region>[].obs;
// getRegions() async {
//   try {print("aaa");
//     var jokes = await AnnonceRepository.featcherregion();
//     print("aaa");
//     print(jokes.toString());
//     if (jokes != null) {
//       allJokes.value = jokes;
//     }
//   } catch (e) {
//   } finally {
//   }
  // }
  ///////favorite end
}
