import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:roya_immobilie/Model/category.dart';
import 'package:roya_immobilie/Model/repositery.dart';

import '../Model/anonce_model_favote.dart';
import '../Model/ModelAnnonce.dart';
import '../View/routing_screen.dart';
import '../service/database/favorite_database_local.dart';

class AnnonceController extends GetxController {
  ValueNotifier<bool> get loding => _loding;
  ValueNotifier<bool> _loding = ValueNotifier(false);
  AnnonceController() {
    getModelAnnonceys();
    getAllProducts();
  }
  var allModelAnnonces = <ModelAnnonce>[].obs;

  getModelAnnonceys() async {
    try {
      var ModelAnnonces = await ModelAnnonceRepository.featcherModelAnnonce();

      if (ModelAnnonces != null) {
        allModelAnnonces.value = ModelAnnonces;
      //  print(allModelAnnonces);
      }
    } catch (e) {
    } finally {}
    update();
  }

  ////favorite add / delete
  var dbHalper = CordDatabaseHelper.db;
  bool get loading => _loading;
  bool _loading = false;
  List<FavCategoryItem> _cartProductsModel = [];
  List<FavCategoryItem> get cartProductsModel => _cartProductsModel;
  bool verife = false;

  getAllProducts() async {
    _loading = true;
    var dbHelper = CordDatabaseHelper.db;
    _cartProductsModel =
        (await dbHelper.getAllProdects()).cast<FavCategoryItem>();

    // print(_cartProductsModel[0].toJson());
    update();
  }

  bool FavIcon(ModelAnnonce mode) {
    for (int i = 0; i < _cartProductsModel.length; i++) {
      if (mode.id == _cartProductsModel[i].id) {
        return true;
      }
    }
    return false;
  }

  addProducts(FavCategoryItem data) async {
    for (int i = 0; i < _cartProductsModel.length; i++) {
      if (_cartProductsModel[i].id == data.id) {
        removebook(FavCategoryItem(
          slug: data.slug,
          id: data.id,
          region: data.region,
          city: data.city,
          title: data.title,
          cover: data.cover,
          apartment: data.apartment,
          bedrooms: data.bedrooms,
          bathrooms: data.bathrooms,
          kitchens: data.kitchens,
          address: data.address,
          description: data.description,
          phone1: data.phone1,
          advertiser: data.advertiser,
          area: data.area.toString(),
          quartier: data.quartier,
          createdAt: data.createdAt.toString(), abilities: [],
        ));
        return;
      }
    }
    await dbHalper.inser(data);
    update();
  }

  removebook(FavCategoryItem model) async {
    await dbHalper.removeProducs(model);
    getAllProducts();
    update();
  }


//********************************
 late  List<ModelAnnonce> _select;
    List<ModelAnnonce>get  select =>_select;

  selectCtegory(Category select)
  {
    for(int i=0 ;i<allAnnonce.length;i++){
      if(allAnnonce[i].propertyType.contains(select.name)){
        _select.add(allAnnonce[i]);
      }
    }

    update();
  }


}