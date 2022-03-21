import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/Model/repositery.dart';

import '../../Model/city.dart';
import '../../Model/cityrepo.dart';
import '../../Model/region.dart';
import '../../varia_ble/variable.dart';
import '../page/Home/widget/drawerpage.dart';
import 'order_details.dart';

class Add_Annonce extends StatefulWidget {
  @override
  State<Add_Annonce> createState() => _Add_AnnonceState();
}

class _Add_AnnonceState extends State<Add_Annonce> {
  var adresse=TextEditingController();
  var quartier_=TextEditingController();
  late int id_region;

  String? _Property_details = "Vente";
  String? _categorie;
  String? _statut;
  String? _adress;
  String? _region_1;
  String? _ville;
  String? _quartier;

  String? value;
  String? city;
  // String? _categorie;
  String? _typeAvent;
  List<City>? _city;
  List<Region>? _region;
  List<City> listCity = [];
  var _keyVent = GlobalKey<FormState>();
  var _keyLocal = GlobalKey<FormState>();
  var _keyadress = GlobalKey<FormState>();
  var _keyquartier = GlobalKey<FormState>();
  var _keytest = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

    ServicesRgion.getUsers().then((regions) {
      setState(() {
        _region = regions!;
      });
    });
  }

  void test(String? value_2) {
    for (int i = 0; i < _region!.length; i++) {
      if (_region![i].regionName == value_2) {
        id_region = _region![i].id;
        getCity();
      }
    }
  }

  getCity() {
    Services.getCity().then((city) {
      setState(() {
        _city = city!;
        for (int i = 0; i < _city!.length; i++) {
          if (id_region == _city![i].regionId) {
            listCity.add(_city![i]);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: const Text(
              "hh",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: Form(
            key: _keytest,
            child: ListView(children: [
              Container(
                height: 30,
                color: const Color(0xffefefef),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                    top: 15.h, bottom: 15.h, left: 15.w, right: 15.w),
                // margin: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Directionality(
                        textDirection: locale == 'fr'
                            ? TextDirection.ltr
                            : TextDirection.rtl,
                        child: Text(
                          "Property details".tr,
                          style: TextStyle(
                              fontSize: 14.sp, color: Color(0xffbfa280)),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: "Vente",
                          groupValue: _Property_details,
                          onChanged: (value) {
                            setState(() {
                              _Property_details = 'Vente';
                            });
                          },
                        ),
                        Text('Vente'.tr,
                            style: TextStyle(
                              fontSize: 14.sp,
                            )),
                        SizedBox(
                          width: 10.w,
                        ),
                        Radio(
                          value: 'À location',
                          groupValue: _Property_details,
                          onChanged: (value) {
                            setState(() {
                              _Property_details = 'À location';
                            });
                          },
                        ),
                        Text('À location'.tr,
                            style: TextStyle(
                              fontSize: 14.sp,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text('Catégorie'.tr,
                            style: TextStyle(
                              fontSize: 14.sp,
                            ))),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.r)),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: DropdownButton<String>(
                          icon: const Icon(Icons.keyboard_arrow_down_sharp),
                          iconSize: 30,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                          elevation: 16,
                          isExpanded: true,
                          underline: Container(
                            height: 2.h,
                          ),
                          hint: Text('select property'.tr),
                          value: _categorie,
                          items: categorie
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text("  $value"),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              // print(newValue);
                              _categorie = newValue;
                            });
                          },
                        )),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text('Statut'.tr,
                            style: TextStyle(
                              fontSize: 14.sp,
                            ))),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.r)),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: DropdownButton<String>(
                          icon: const Icon(Icons.keyboard_arrow_down_sharp),
                          iconSize: 30,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                          elevation: 16,
                          isExpanded: true,
                          hint: Text('Select State'),
                          underline: Container(
                            height: 2.h,
                            // color: Colors.deepPurpleAccent,
                          ),
                          //  value: dropdownValue,
                          value: _statut,
                          items: <String>['One', 'Two', 'Free', 'Four']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text("  $value"),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            _statut=newValue;
                          },
                        )),
                    SizedBox(
                      height: 25.h,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text('Location'.tr,
                            style: TextStyle(
                                color: Color(0xffbfa280), fontSize: 14.sp))),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text('Adresse'.tr,
                            style: TextStyle(
                              fontSize: 14.sp,
                            ))),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFormField(
                      controller: adresse,
                      cursorColor: Colors.white,
                      validator: (value) {
                        if (value?.length == 0) {
                          return "Entre L \' Adresse";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          isDense: true, // Added this
                          contentPadding: EdgeInsets.all(8),
                          //fillColor: Colors.white,
                          // labelText: "",
                          hintText: 'Adresse'.tr,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 3.w),
                              borderRadius: BorderRadius.circular(5))),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text('Region'.tr,
                            style: TextStyle(
                              fontSize: 14.sp,
                            ))),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      height: 35.h,
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          // Region user = _region![index];
                          return Container(
                            height: 35.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: DropdownButton<String>(
                              icon: const Icon(Icons.keyboard_arrow_down_sharp),
                              elevation: 16,
                              isExpanded: true,
                              underline: Container(
                                height: 2,
                                // color: Colors.deepPurpleAccent,
                              ),
                              hint: Text("test"),
                              value: value,
                              items: _region
                                  ?.map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem<String>(
                                  value: value.regionName,
                                  child: Text("  " + value.regionName),
                                );
                              }).toList(),
                              onChanged: (value_2) {
                                setState(() {
                                  value = value_2;
                                  test(value_2);
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text('Ville'.tr,
                            style: TextStyle(
                              fontSize: 14.sp,
                            ))),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      height: 35.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: DropdownButton<String>(
                        icon: const Icon(Icons.keyboard_arrow_down_sharp),
                        elevation: 16,
                        isExpanded: true,
                        hint: Text("  Ville"),
                        // style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          // color: Colors.deepPurpleAccent,
                        ),
                        value: city,
                        items: listCity.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value.cityName,
                            child: Text(value.cityName),
                          );
                        }).toList(),
                        onChanged: (String? Value) {
                          setState(() {
                            city = Value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text('Quartier'.tr,
                            style: TextStyle(
                              fontSize: 14.sp,
                            ))),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFormField(
                      controller: quartier_,
                      cursorColor: Colors.white,
                      validator: (value) {
                        if (value?.length == 0) {
                          return " Quartier";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(8),
                          //fillColor: Colors.white,
                          // labelText: "",
                          hintText: 'Adresse'.tr,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 3.w),
                              borderRadius: BorderRadius.circular(5.r))),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {

                          print(_Property_details);
                          print(_categorie);
                          print(_statut);
                          print(adresse.text);
                          print(value);
                          print(city);
                          print(quartier_.text);
                        //  print(city);
                          if (_keytest.currentState!.validate() &&
                              value != null &&
                              city != null ) {
                           //
                            Get.to(Add_Annonce_2(
                                Property_details: _Property_details,
                                categorie: _categorie,
                                statut: _statut,
                                adress: adresse.text,
                                region: value,
                                ville: city,
                                quartier: quartier_.text));
                          }
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color(0xffbfa280),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          padding: EdgeInsets.only(
                              top: 10.h, left: 25.w, bottom: 10.h, right: 25.w),
                          child: Text("Suivant".tr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          )),
    );
  }
}
