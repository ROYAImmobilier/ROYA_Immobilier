import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Langage/CondationLangage/condation_langage.dart';

import '../../Model/repositery.dart';
import '../../variable/variable.dart';
import 'order_details.dart';

class Add_Annonce extends StatefulWidget {
  var data;

  Add_Annonce( {this.data});

  @override
  State<Add_Annonce> createState() => _Add_AnnonceState();
}

class _Add_AnnonceState extends State<Add_Annonce> {
  var adresse = TextEditingController();
  var quartier_ = TextEditingController();
  late int id_region;
  String? _Property_details = "Vente";
  String? _categorie;
  String? _categorie_select;
  String? _statut;
  String? name_rigion;
  var statut;
  String? value;
  String? city_stecte;

  var _keytest = GlobalKey<FormState>();

  @override
  void initState() {
      if(!verify_city)
        ListCity();
      setState(() {
        listCity=[];
      });



    super.initState();
    if (verify_update) {
      getData_m();
      setState(() {
       listCity=CitySelect(region_id(widget.data.region));
      });


      adresse.text = widget.data.address.toString();
      quartier_.text = widget.data.quartier.toString();
      String cat = widget.data.propertyType;
      _categorie = CondationLangage.categorey_put(cat)?.tr;
      _categorie_select = cat;
      String status =widget.data.status.toString();
      name_rigion =widget.data.region;
    //  value = name_rigion;


      //id_region = widget.data.region;
      _statut = status;
      // adresse.text = getData_put["address"].toString();
      // quartier_.text = getData_put["quartier"].toString();
      // String cat = getData_put["property_type"].toString();
      // _categorie = CondationLangage.categorey_put(cat)?.tr;
      // _categorie_select = cat;
      // String status = getData_put["status"].toString();
      // name_rigion = getNameRegion(getData_put["region_id"]);
      // value = name_rigion;
      //
      // city_stecte = getNameCity(getData_put["city_id"]);
      // id_region = getData_put["region_id"];
      // _statut = status;
      // getidCity(city_stecte!);
      // region_id(name_rigion);
      var x = CondationLangage.status_put(status)?.tr;

      if (x != null) {
        statut = x;
      }



      //getName_region_city();

    }

  }

  int region_id(String? value_2) {
    for (int i = 0; i < region!.length; i++) {
      if (region![i].regionName == value_2) {
        id_region = region![i].id;

      }
    }
    return id_region;
  }

  getNameRegion(int id) {
    for (int i = 0; i < region!.length; i++) {
      if (id == region![i].id) {
        return region![i].regionName;
      }
    }
  }

  getNameCity(int id) {
    var cityGet;
    Region_id.Region(name_rigion!);

    for (int i = 0; i < listCity.length; i++) {
      if (id == listCity[i].id) {
        cityGet = listCity[i].cityName;
      }
    }
    return cityGet;
  }
getData_m() async {
  getData_put =
      await ModelAnnonceRepository.getdata(
      id: widget.data
          .id
          .toString());
}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ScreenUtilInit(
        builder: () => Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                title: SvgPicture.asset(
                  'assets/icon/logo-roya.svg',
                  //color: Colors.white,
                  width: 40,
                  height: 40,
                )),
            body: Form(
              key: _keytest,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
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
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Property details".tr,
                              style: TextStyle(
                                  fontSize: 14.sp, color: Color(0xffbfa280)),
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
                                value: '?? location',
                                groupValue: _Property_details,
                                onChanged: (_) {
                                  setState(() {
                                    _Property_details = '?? location';
                                  });
                                },
                              ),
                              Text('?? location'.tr,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                              child: Text('Cat??gorie'.tr,
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.r)),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: DropdownButton<String>(
                                icon:
                                    const Icon(Icons.keyboard_arrow_down_sharp),
                                iconSize: 30,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                elevation: 16,
                                isExpanded: true,
                                underline: Container(
                                  height: 2.h,
                                ),
                                hint: Text(" " + 'select property'.tr),
                                value: _categorie,
                                items: [
                                  "Maison".tr,
                                  "Appartements".tr,
                                  "Chambre".tr,
                                  "Villa".tr,
                                  "Riad".tr,
                                  "Commercial".tr,
                                  "Bureau".tr,
                                  "Terre".tr,
                                  "Fermes".tr,
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text("  $value"),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    _categorie = newValue;
                                    _categorie_select =
                                        CondationLangage.categorey(newValue!);

                                  });
                                },
                              )),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.r)),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: DropdownButton<String>(
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_sharp),
                                  iconSize: 30,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                  elevation: 16,
                                  isExpanded: true,
                                  hint: Text('  ' + 'Select State'.tr),
                                  underline: Container(
                                    height: 2.h,
                                    // color: Colors.deepPurpleAccent,
                                  ),
                                  //  value: dropdownValue,
                                  value: statut,
                                  items: <String>[
                                    'Neuf'.tr,
                                    'Bon ??tat'.tr,
                                    'A besoin de r??paration'.tr
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text("  $value"),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _statut =
                                          CondationLangage.status(newValue!);
                                      statut = newValue;
                                    });
                                  })),
                          SizedBox(
                            height: 25.h,
                          ),
                          Container(
                              child: Text('Location'.tr,
                                  style: TextStyle(
                                      color: Color(0xffbfa280),
                                      fontSize: 14.sp))),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
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
                                hintText: ' ' + 'Adresse'.tr,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 3.w),
                                    borderRadius: BorderRadius.circular(5))),
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
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
                                // decoration: BoxDecoration(
                                //   color: Colors.white,
                                //   // borderRadius:
                                //   // const BorderRadius.all(Radius.circular(5)),
                                //   // border: Border.all(
                                //   //   color: Colors.grey,
                                //   // ),
                                // ),
                                child: DropdownButton<String>(
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_sharp),
                                  elevation: 16,
                                  isExpanded: true,
                                  underline: Container(
                                    height: 2,
                                    // color: Colors.deepPurpleAccent,
                                  ),
                                  hint: Text(" " + "Region".tr),
                                  value: value,
                                  items: region
                                      ?.map<DropdownMenuItem<String>>(
                                          (value) {
                                        return DropdownMenuItem<String>(
                                          value: value.regionName,
                                          child: Text("  " + value.regionName),
                                        );
                                      }).toList(),
                                  onChanged: (value_2) {
                                    setState(() {
                                      city_stecte = null;
                                      listCity = [];
                                      Region_id.Region(value_2!);
                                      value = value_2;
                                      // print(region![12].regionName);

                                      // test(value_2);
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.r)),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: DropdownButton<String>(
                              icon: const Icon(Icons.keyboard_arrow_down_sharp),
                              elevation: 16,
                              isExpanded: true,
                              hint: Text(" " + "Ville".tr),
                              // style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                // color: Colors.deepPurpleAccent,
                              ),
                              value: city_stecte,
                              items: listCity
                                  .map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem<String>(
                                  value: value.cityName,
                                  child: Text("  "+value.cityName),
                                );
                              }).toList(),
                              onChanged: (String? Value) {
                                setState(() {
                                  city_stecte = Value;
                                  // getidCity(city!);
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
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

                          // Container(
                          //   alignment: Alignment.topRight,
                          //   child: TextButton(
                          //     onPressed: (){
                          //       Get.offAll(RoutingScreen());
                          //     },
                          //     child: Container(
                          //       decoration: const BoxDecoration(
                          //           color: Color(0xffbfa280),
                          //           borderRadius:
                          //           BorderRadius.all(Radius.circular(10))),
                          //       padding: EdgeInsets.only(
                          //           top: 10.h, left: 25.w, bottom: 10.h, right: 25.w),
                          //       child: Text("Cnacle".tr,
                          //           style: TextStyle(
                          //             color: Colors.white,
                          //             fontSize: 14.sp,
                          //           )),
                          //     ),
                          //   ),
                          // ),
                          Container(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {
                                // print(_Property_details);
                                // print(_categorie_select);
                                // print(_statut);
                                // print(adresse.text);
                                // print(value);
                                // print(city_stecte);
                                // print(quartier_.text);
                                //  print(city);
                                if (_keytest.currentState!.validate() &&
                                    value != null &&
                                    city_stecte != null) {
                                  //
                                  Get.to(Add_Annonce_2(
                                      Property_details: _Property_details,
                                      categorie: _categorie_select,
                                      statut: _statut,
                                      adress: adresse.text,
                                      region: value,
                                      ville: city_stecte,
                                      data: widget.data,
                                      quartier: quartier_.text));
                                }else {
                                  Get.snackbar("case vide", "replier tout les case",icon: Icon(Icons.error_outline));
                                }
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Color(0xffbfa280),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                padding: EdgeInsets.only(
                                    top: 10.h,
                                    left: 25.w,
                                    bottom: 10.h,
                                    right: 25.w),
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
                  ),
                ]),
              ),
            )),
      ),
    );
  }
}
