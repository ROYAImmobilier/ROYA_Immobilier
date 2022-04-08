

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../Model/city.dart';
import '../Model/data_list.dart';

var region_1;

var categorie = [
  "Appartements".tr,
  "Chambre".tr,
  "Maison".tr,
  "Villa".tr,
  "Riad".tr,
  "Commercial".tr,
  "Bureau".tr,
  "Terre".tr,
  "Fermes".tr,
];

class Region_1 {
  static List<String> region(var data, int x) {
    for (int i = 1; i <= x; i++) {
      region_1.add(data[i]["city_name"]);
    }
    print("Luis");
    print(region_1);
    return region_1;
  }
}

final String tableFavwall = 'favwall';
final String columnId = 'id';
final String columnadvertiser = 'advertiser';
final String columnregion = 'region';
final String columncity = 'city';
final String columntransaction = 'transaction';
final String columnpropertyTyp = 'property_type';
final String columnstatus = 'status';
final String columnaddress = 'address';
final String columnquartier = 'quartier';
final String columnarea = 'area';
final String columnprice = 'price';
final String columnage = 'age';
final String columnfloor_type = 'floor_type';
final String columnfloor = 'floor';
final String columnapartment = 'apartment';
final String columnbedrooms = 'bedrooms';
final String columnbathrooms = 'bathrooms';
final String columnkitchens = 'kitchens';
final String columntitle = 'title';
final String columndescription = 'description';
final String columnphone1 = 'phone1';
final String columnphone2 = 'phone2';
final String columnphone3 = 'phone3';
const String columnvalidated = 'validated';
final String columnvcreated_at = 'created_at';
const String columncover = 'cover';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);

//login
var isLogin=false;
String ?token_global;

//
  var id_city;
late final int id_region_;

//Verified
var isCamindingfrom=false;

bool progress=false ;
//\\
 var icon_apps=SvgPicture.asset('assets/icon/logo-roya.svg',
width: 40,
height: 40,) ;

 //data for modification
