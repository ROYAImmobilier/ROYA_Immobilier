

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/Model/joke.dart';

import '../Model/Contact.dart';
import '../Model/login.dart';
import '../Model/city.dart';
import '../Model/cityrepo.dart';
import '../Model/data_list.dart';
import '../Model/region.dart';
import 'data.dart';

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
  var id_city=1;
var id_region_=7;

//Verified Login
var isCamindingfrom=false;

bool progress=false ;
bool progress_modife=false;
//\\
 var icon_apps=SvgPicture.asset('assets/icon/logo-roya.svg',
color: Colors.white,
width: 40,
height: 40,) ;

 //data for modification
var getData_put;
bool verify=false;

///region and city
List<Region>? region;
List<City>? city;
///city
List<City> listCity=[];
List<City> listCity_Region_1=[];
List<City> listCity_Region_2=[];
List<City> listCity_Region_3=[];
List<City> listCity_Region_4=[];
List<City> listCity_Region_5=[];
List<City> listCity_Region_6=[];
List<City> listCity_Region_7=[];
List<City> listCity_Region_8=[];
List<City> listCity_Region_9=[];
List<City> listCity_Region_10=[];
List<City> listCity_Region_11=[];
List<City> listCity_Region_12=[];
///region

class Region_id{
  static Region(String value_2){
    if(value_2==region![0].regionName){
      listCity=listCity_Region_1;
    }else if(value_2==region![1].regionName){
      listCity=listCity_Region_2;
    }else if(value_2==region![2].regionName){
      listCity=listCity_Region_3;
    }else if(value_2==region![3].regionName){
      listCity=listCity_Region_4;
    }else if(value_2==region![4].regionName){
      listCity=listCity_Region_5;
    }else if(value_2==region![5].regionName){
      listCity=listCity_Region_6;
    }else if(value_2==region![6].regionName){
      listCity=listCity_Region_7;
    }else if(value_2==region![7].regionName){
      listCity=listCity_Region_8;
    }else if(value_2==region![8].regionName){
      listCity=listCity_Region_9;
    }else if(value_2==region![9].regionName){
      listCity=listCity_Region_10;
    }else if(value_2==region![10].regionName){
      listCity=listCity_Region_11;
    }else if(value_2==region![11].regionName){
      listCity=listCity_Region_12;
    }

  }
}
///verify region and city uload
bool verify_region_city=false;


//
getidCity(String nameCity){
  Region_id.Region(nameCity);
  for (int i = 0; i < city!.length; i++) {
    if (nameCity == city![i].cityName) {
      id_city=city![i].id;
      // print("id region"+ id_city.toString());
    }
  }

}


///verify update
 bool verify_update=false;

///
//late DataSend data;
ListCity() async{
  await Services.getCity().then((citys) {

      //city=null;
      listCity = [];
      city = citys!;
      for (int i = 0; i < city!.length; i++) {
        if (1==city![i].regionId) {
          // id_city=_city![i].id;
          // print("id region"+ id_city.toString());
          listCity_Region_1.add(city![i]);

        }if (2==city![i].regionId) {
          // id_city=_city![i].id;
          // print("id region"+ id_city.toString());
          listCity_Region_2.add(city![i]);

        }if (3==city![i].regionId) {
          // id_city=_city![i].id;
          // print("id region"+ id_city.toString());
          listCity_Region_3.add(city![i]);
        }if (4==city![i].regionId) {
          // id_city=_city![i].id;
          // print("id region"+ id_city.toString());
          listCity_Region_4.add(city![i]);
        }if (5==city![i].regionId) {
          // id_city=_city![i].id;
          // print("id region"+ id_city.toString());
          listCity_Region_5.add(city![i]);
        }if (6==city![i].regionId) {
          // id_city=_city![i].id;
          // print("id region"+ id_city.toString());
          listCity_Region_6.add(city![i]);
        }if (7==city![i].regionId) {
          // id_city=_city![i].id;
          // print("id region"+ id_city.toString());
          listCity_Region_7.add(city![i]);
        }if (8==city![i].regionId) {
          // id_city=_city![i].id;
          // print("id region"+ id_city.toString());
          listCity_Region_8.add(city![i]);
        }if (9==city![i].regionId) {
          // id_city=_city![i].id;
          // print("id region"+ id_city.toString());
          listCity_Region_9.add(city![i]);
        }if (10==city![i].regionId) {
          // id_city=_city![i].id;
          // print("id region"+ id_city.toString());
          listCity_Region_10.add(city![i]);
        }if (11==city![i].regionId) {
          // id_city=_city![i].id;
          // print("id region"+ id_city.toString());
          listCity_Region_11.add(city![i]);
        }if (12==city![i].regionId) {
          // id_city=_city![i].id;
          // print("id region"+ id_city.toString());
          listCity_Region_12.add(city![i]);
        }
      }
      verify_region_city = true;
    });

}
///get slug
List<Joke> slug_data=[];
///data loaded
bool isLoaded=false;
///get contacs
List<Contacts> contact=[];
///index page in routing screen
bool indexPage=false;
//image slug id
List<String>? slug_image;
//cammen from contact
bool fromContact=false;